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

class CampaignHelper
{
	// 01. Get users for single campaign based on filters
	public static function get_users_campaign($camp_id)
	{
	    $camp = TfDb::get_item('tfm_campaign', $camp_id);
	    
	    $camp_filters = json_decode($camp->filter, true);
	    
	    $filter = $camp_filters['filter'];
        $filterusers = $camp_filters['filterusers'];
        $filterstats = $camp_filters['filterstats'];
        $filterstats_aggr = $camp_filters['filterstats_aggr'];
        
        $users = UserfilterHelper::filter_users($filter, $filterusers, $filterstats, $filterstats_aggr, true); // Array with user IDs
        
        return $users;
	}
	
	// 02. Get campaigns for user based on filters and trigger
	public static function get_campaigns_user($email, $trigger = null)
	{
	    $campaigns = array();
	    
	    $conditions = array(array('published', '=', 1));
        if ($trigger == 1)
	    {
	        $conditions[] = array('onregister', '=', 1);
	    }
	    
	    if ($trigger == 2)
	    {
	        $conditions[] = array('onmodify', '=', 1);
	    }
	    
	    $camps = TfDb::get_items('tfm_campaign', $conditions);
	    
	    foreach ($camps as $camp)
	    {
	        $filter = json_decode($camp->filter, true);
            $user = TfUser::filter_users($filter['filter'], $filter['filterusers'], $email); // Array
            
            if ($user)
            {
                $campaigns[] = $camp->id;
            }
	    }
	    
	    return $campaigns;
	}
	
	// 03. Add user to campaign
	public static function user2camp($user_id, $camp_id)
	{
	    // 1. Check if user is already subscribed
	    $conditions = array(array('camp_id', '=', $camp_id), array('user_id', '=', $user_id));
        $record = TfDb::get_record('tfm_campsub', $conditions);
        if ($record)
        {
            return;
        }
        
        // 2. Add record in campsub
        $date = Factory::getDate();
        TfDb::insert_update('tfm_campsub', array('camp_id' => $camp_id, 'user_id' => $user_id, 'created' => $date->toSql()), false);
	    
	    // 3. Add campaign emails to queue
	    $camp = TfDb::get_item('tfm_campaign', $camp_id);
	    $mails = json_decode($camp->mails, true);
	    
	    foreach ($mails as $mail)
        {
            $date = Factory::getDate();
            $interval = new \DateInterval('P' . $mail['delay'] . 'D');
            $date->add($interval);
        
            $q = array(
                'mail_id' => $mail['mail_id'],
                'user_id' => $user_id,
                'send_date' => $date->toSql(),
                'priority' => $camp->priority
                );
            
            QueueHelper::insert_q($q);
        }
	}
}