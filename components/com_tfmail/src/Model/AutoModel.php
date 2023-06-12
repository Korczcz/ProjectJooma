<?php
 /*
 * @package		TF Mail Component
 * @license		GNU General Public License version 2 or later; see LICENSE.txt
 */

namespace TechFry\Component\TfMail\Site\Model;

defined('_JEXEC') or die;

use Joomla\CMS\Factory;
use TechFry\Library\Model\TfModel;
use TechFry\Library\TfDb;
use TechFry\Library\TfUser;
use TechFry\Component\TfMail\Administrator\Helper\SendHelper;
use TechFry\Component\TfMail\Administrator\Helper\BounceHelper;

class AutoModel extends TfModel
{
    public $msgs = array();
    
    // 01.
    public function cron()
    {
        $processed = 0;
        
        // A. Process queue to send mails
        $result = $this->process_queue();
        
        $processed = ($result == true) ? 1 : 0;
        
        // B. Process auto mails to add in queue
        if (!$processed)
        {
            $result = $this->send_auto_mails();
        
            $processed = ($result == true) ? 1 : 0;
        }
        
        // C. Bounce handling
        if (!$processed && $this->get_param('bounces_auto', 0))
        {
            $result = $this->bounce_handling();
            
            $processed = ($result == true) ? 1 : 0;
        }
        
        // D. Birthday mail
        if (!$processed && $this->get_param('enable_bday', 0))
        {
            $this->bday_mail();
        }
        
        return $this->msgs;
    }
    
    // 01.
    protected function process_queue()
    {
        $today = Factory::getDate();
        $queue_limit = $this->get_param('queue_limit', 5);
        
        // 1. Get email in queue
        $conditions = array(array('send_date', '<', $today));
        $order = 'priority ASC, send_date ASC, user_id ASC';
        $qs = TfDb::get_records('tfm_queue', 'mail_id, user_id', $conditions, $order, $queue_limit);
        
        if (empty($qs))
        {
            $this->msgs[] = 'No email in queue';
		    
		    return false;
        }
        
        // 2. Send email
        foreach ($qs as $q)
        {
            $send = SendHelper::send_mail($q->mail_id, $q->user_id);
            if (!$send)
            {
                $this->msgs[] = 'Error sending email';
    		    
    		    return false;
            }
            $this->msgs[] = 'Newsletter ' . $q->mail_id . ' sent to ' . $q->user_id;
        
            // 3. Delete email from queue
            TfDb::delete_items('tfm_queue', array(array('user_id', '=', $q->user_id), array('mail_id', '=', $q->mail_id)));
            
            // 4. Add to statistics
            $stats = array(
            'type' => 'send',
            'mail_id' => $q->mail_id,
            'user_id' => $q->user_id,
            'send_date' => $today->toSql(),
            'opens' => 0
            );
        
            TfDb::insert_update('tfm_statistics', $stats);
        }
        
        return true;
    }
    
    // 02. 
    protected function send_auto_mails()
    {
        $today = Factory::getDate();
		
		// 1. Get email
        $conditions = array(array('send_date', '<', $today), array('published', '=', 1), array('schedule', '=', 1));
        $m = TfDb::get_record('tfm_mail', $conditions, 'send_date ASC');
        
        if (!$m)
        {
            $this->msgs[] = 'No newsletter ready';
		    
		    return false;
        }
        
        // 2. Add to queue
        $m->filter = json_decode($m->filter, true);
        $filter = $m->filter['filter'];
        $filterusers = $m->filter['filterusers'];
        $filterstats = $m->filter['filterstats'];
        $filterstats_aggr = $m->filter['filterstats_aggr'];
        
        // $users = TfUser::get_users($filter, $filterusers, $filterstats, $filterstats_aggr); // Array with user IDs
        $users = TfUser::filter_users($filter, $filterusers); // Array with user IDs
        
        $count = 0;
        foreach ($users as $user)
        {
            $q = array(
                'mail_id' => $m->id,
                'user_id' => $user,
                'send_date' => $m->send_date,
                'priority' => $m->priority
                );
            
            TfDb::insert_update('tfm_queue', $q, false);
            
            $count++;
        }
        
        // 3. Update mail
        $new_mail = array(
            'id' => $m->id,
            'schedule' => 0
            );
        
        if ($m->mail_type == 'automation')
        {
            $frequency = new \DateInterval('P' . $m->frequency . 'D');
            $date = Factory::getDate();
            
            $date->add($frequency);
            $new_mail['send_date'] = $date->toSql();
            
            $new_mail['schedule'] = 1;
        }
        
        TfDb::insert_update('tfm_mail', $new_mail);
        
        $this->msgs[] = $count . ' emails added in queue';
        
        return true;
    }
    
    // 03. Bounce handling
    protected function bounce_handling()
    {
        $email = array(
	        'server' => $this->get_param('bounces_server'),
            'port' => $this->get_param('bounces_port'),
            'username' => $this->get_param('bounces_username'),
            'password' => $this->get_param('bounces_password')
            );
	    
        $messages = BounceHelper::handle($email);
        
        $this->msgs[] = $messages . ' messages in mailbox';
        
        if (!$messages)
        {
            return false;
        }
        
        if ($messages)
        {
            $count = BounceHelper::read($email, $this->get_param('bounces_limit'));
                
            $this->msgs[] = $count['total_messages'] . ' messages processed. ' . $count['total_bounces'] . ' emails found. ' . $count['total_users'] . ' users unpublished';
            
            return true;
        }
    }
    
    // 04. Send birthday newsletter
    protected function bday_mail()
    {
        // A. Get birthday newsletter
        $bday_mail = $this->get_param('bday_mail');
        
        // B. Get users
        $bday_field = $this->get_param('bday_field');
        $users = $this->get_bday_users($bday_field); // Array of user IDs
        
        // C. For each user, set q and then insert q
        $today = Factory::getDate();
        foreach ($users as $user_id)
        {
            $q = array(
            'mail_id' => $bday_mail,
            'user_id' => $user_id,
            'priority' => 2,
            'send_date' => $today->toSQL()
            );
            
            TfDb::insert_update('tfm_queue', $q, false);
            
            $data = array();
        }
    }
    
    // Used by bday_mail function
    protected function get_bday_users($bday_field)
    {
        // Get today month and date
        $today = Factory::getDate();
        $month = $today->format('m');
        $date = $today->format('d');
        
        $db = Factory::getDbo();
        $query = $db->getQuery(true);
        
        $query = "SELECT item_id FROM #__fields_values WHERE field_id = $bday_field AND DAYOFMONTH(value) = $date AND MONTH(value) = $month";
        
        $db->setQuery($query);
        
        $users = $db->loadColumn();
        
        return $users;
    }
}