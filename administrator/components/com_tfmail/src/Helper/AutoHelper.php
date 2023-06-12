<?php
 /*
 * @package		TF Mail Component
 * @license		GNU General Public License version 2 or later; see LICENSE.txt
 */

namespace TechFry\Component\TfMail\Administrator\Helper;

defined('_JEXEC') or die;

use Joomla\CMS\Component\ComponentHelper;
use Joomla\CMS\Date\Date;
use Joomla\CMS\Factory;
use TechFry\Library\TfDb;
use TechFry\Library\TfUser;
use TechFry\Library\TfLog;

class AutoHelper
{
	// Task 01 - Process queue to send emails
  	public static function process_queue()
    {				
		$today = Factory::getDate();
        $queue_limit = ComponentHelper::getParams('com_tfmail')->get('queue_limit', 1);
      
        // A. Get email in queue
        $conditions = array(array('send_date', '<', $today));
        $order = 'priority ASC, send_date ASC, user_id ASC';
        $qs = TfDb::get_records('tfm_queue', 'mail_id, user_id', $conditions, $order, $queue_limit);
        
        if (empty($qs))
        {		    
		    TfLog::add_entry('No Email in Queue', 'tfmail_auto');
          	return false;
        }
        
        // B. Send email
        foreach ($qs as $q)
        {
            $send = SendHelper::send_mail($q->mail_id, $q->user_id);
            if (!$send)
            {   
    		    TfLog::add_error('Error Sending Email', 'tfmail_auto');
              	return false;
            }
          
          	TfLog::add_entry('Newsletter ' . $q->mail_id . ' Sent to ' . $q->user_id, 'tfmail_auto');
        
            // C. Delete email from queue
            TfDb::delete_items('tfm_queue', array(array('user_id', '=', $q->user_id), array('mail_id', '=', $q->mail_id)));
            
            // D. Add to statistics
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
    
    // Task 02 - Add automatic mails to queue
    public static function send_auto_mails()
    {		
		$today = Factory::getDate();
		
		// A. Get email
        $conditions = array(array('send_date', '<', $today), array('published', '=', 1), array('schedule', '=', 1));
        $m = TfDb::get_record('tfm_mail', $conditions, 'send_date ASC');
        
        if (!$m)
        {    
		    TfLog::add_entry('No Newsletter Ready', 'tfmail_auto');
          	return false;
        }
        
        // B. Check if new article is published before last newsletter
        if ($m->check_for_new)
        {
            $frequency = new \DateInterval('P' . $m->frequency . 'D');
            $check_date = Factory::getDate()->sub($frequency);
            $conditions = array(array('publish_up', '>', $check_date), array('state', '=', 1));
            $article = TfDb::get_record('content', $conditions, 'publish_up DESC');
            if (!$article)
            {   
    		    TfLog::add_entry('No Joomla Article Published', 'tfmail_auto');
              	return false;
            }
        }
        
        // C. Add to queue
        $m->filter = json_decode($m->filter, true);
        $filter = $m->filter['filter'];
        $filterusers = $m->filter['filterusers'];
        
        $users = TfUser::filter_users($filter, $filterusers); // Array with user IDs
        
        $count = 0;
        foreach ($users as $user_id)
        {
            $q = array(
                'mail_id' => $m->id,
                'user_id' => $user_id,
                'send_date' => $m->send_date,
                'priority' => $m->priority
                );
            
            TfDb::insert_update('tfm_queue', $q, false);
            
            $count++;
        }
      
      	TfLog::add_entry($count . ' Emails Added in Queue', 'tfmail_auto');
      
        // D. Update mail
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
        
        return true;
    }
    
    // Task 03 - Automatic bounce handling
    public static function bounce_handling()
    {
      	$params = ComponentHelper::getParams('com_tfmail');
            
        $email = array(
	        'server' => $params->get('bounces_server'),
            'port' => $params->get('bounces_port'),
            'username' => $params->get('bounces_username'),
            'password' => $params->get('bounces_password')
            );
	    
        $messages = BounceHelper::handle($email);
        
        // To Do: Add Log
        
        if ($messages)
        {
            $bounces_limit = $params->get('bounces_limit');
          	$count = BounceHelper::read($email, $bounces_limit);
             
            $msg = $count['total_messages'] . ' messages processed. ' . $count['total_bounces'] . ' emails found. ' . $count['total_users'] . ' users unpublished';
            
            // To Do: Add Log
        }
      
      	return true;
    }
    
    // Task 04 - Send birthday newsletter
    public static function bday_mail()
    {        
        // A. Get birthday newsletter
        $bday_mail = ComponentHelper::getParams('com_tfmail')->get('bday_mail');
            
        // B. Get users
        $users = $this->get_bday_users(); // Array of user IDs
        
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
        }
         
        return true;
    }
    
    public static function get_bday_users()
    {
        // Custom field for birthday
      	$bday_field = ComponentHelper::getParams('com_tfmail')->get('bday_field');
      
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
  	
  	// Process all tasks
  	public static function process_tasks()
    {
      	$params = ComponentHelper::getParams('com_tfmail');
      
      	$today = Factory::getDate();
      	$hours = $today->format('G'); // 0 to 23
      	$minutes = (int) $today->format('i');
      	
      	$enable_bday = $params->get('enable_bday', 0);
      	$hour = $params->get('bday_hour', 0);
      	$minute = $params->get('bday_minute', 0);
      	if ($enable_bday && $hours == $hour && $minutes == $minute)
        {
        	if (self::bday_mail() == true)
            {
            	TfLog::add_entry('Birthday Mail', 'tfmail_auto');
              	return;
            }
        }
      	
       	if (self::send_auto_mails() == true)
        {
           	TfLog::add_entry('Send Auto Mails', 'tfmail_auto');
          	return;
        }
      	
      	if (self::process_queue() == true)
        {
           	TfLog::add_entry('Process Queue', 'tfmail_auto');
           	return;
        }
  
      	$bounces_auto = $params->get('bounces_auto', 0);
      	if ($bounces_auto)
        {
        	if (self::bounce_handling() == true)
            {
              	TfLog::add_entry('Bounce Handling', 'tfmail_auto');
              	return;
            }
        }
    }
}