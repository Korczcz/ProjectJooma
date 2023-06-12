<?php
 /*
 * @package		TF Mail Component
 * @license		GNU General Public License version 2 or later; see LICENSE.txt
 */

namespace TechFry\Component\TfMail\Administrator\Helper;

defined('_JEXEC') or die;

use Joomla\CMS\Factory;
use TechFry\Library\TfUser;
use TechFry\Library\TfDb;

class QueueHelper
{
	// 01. Add newsletter to queue
	public static function add2queue($mail_id)
	{
	    $m = TfDb::get_item('tfm_mail', $mail_id);
        
        $m->filter = json_decode($m->filter, true);
        
        $filter = $m->filter['filter'];
        $filterusers = $m->filter['filterusers'];
        $filterstats = $m->filter['filterstats'];
        $filterstats_aggr = $m->filter['filterstats_aggr'];
        
        $users = UserfilterHelper::filter_users($filter, $filterusers, $filterstats, $filterstats_aggr);
        
        $count = 0;
        foreach ($users as $user_id)
        {
            if (SubscriberHelper::subscriber($user_id))
            {
                $data = array(
                    'mail_id' => $m->id,
                    'user_id' => $user_id,
                    'send_date' => $m->send_date,
                    'priority' => $m->priority
                    );
                    
                self::insert_q($data);
                
                $count++;
            }
        }
        
        self::update_mail($mail_id);
        
        return $count;
	}
	
	// 02. Add email for user in queue
	public static function user2queue($mail_id, $user_id, $send_date = null, $priority = 0)
	{
	    if (!SubscriberHelper::subscriber($user_id))
	    {
	        return;
	    }
	    
	    $user = Factory::getUser($user_id);
	    if (!$user->email)
	    {
	        return;
	    }
        
        $data = array(
            'mail_id' => $mail_id,
            'user_id' => $user_id,
            'send_date' => $send_date,
            'priority' => $priority
            );
            
        self::insert_q($data);
	}
	
	// 03. Update newsletter after adding to queue
	public static function update_mail($mail_id)
    {
        $m = TfDb::get_item('tfm_mail', $mail_id);
        
        $data = array('id' => $mail_id, 'schedule' => 0);
        
        $date = Factory::getDate();
        
        if ($m->mail_type == 'automation')
        {
            $frequency = new \DateInterval('P' . $m->frequency . 'D');
            $date->add($frequency);
            $data['send_date'] = $date->toSql();
            
            $data['schedule'] = 1;
        }
        
        TfDb::insert_update('tfm_mail', $data);
    }
  
  	// 04. Insert message in queue
  	public static function insert_q($data)
    {
     	// $data - user_id, mail_id; optional - priority, send_date
      	
      	// Check if newsletter already exists in queue
      	$exists = TfDb::get_record('tfm_queue', array(array('mail_id', '=', $data['mail_id']), array('user_id', '=', $data['user_id'])));
      	if ($exists)
        {
            return;
        }
      	
      	if (!isset($data['priority']) && !$data['priority'])
        {
        	$data['priority'] = TfDb::get_single('tfm_mail', $data['mail_id'], 'priority');
        }
      
      	if (!isset($data['send_date']) && !$data['send_date'])
        {
          	$data['send_date'] = Factory::getDate()->toSql();
        }

      	TfDb::insert_update('tfm_queue', $data, false);
      
      	// Save user custom fields set in newsletter
      	$mail_params = TfDb::get_single('tfm_mail', $data['mail_id'], 'params');
      	$mail_params = json_decode($mail_params, true);
      	if ($mail_params['save_user_cf'])
        {
        	TfUser::handle_fields($mail_params['user_cfs'], $data['user_id']); 
        }
    }
    
    // 05. Delete mails from queue for user
    public static function delete_q($user_id, $mail_id = null)
    {
        $conditions = array();
        $conditions[] = array('user_id' , '=', $user_id);
        if ($mail_id != null)
        {
            $conditions[] = array('mail_id', '=', $mail_id);
        }
        
        $num = TfDb::delete_items('tfm_queue', $conditions);
	    
	    return $num;
    }
}