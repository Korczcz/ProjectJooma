<?php
 /*
 * @package		TF Mail Component
 * @license		GNU General Public License version 2 or later; see LICENSE.txt
 */

namespace TechFry\Component\TfMail\Administrator\Helper;

defined('_JEXEC') or die;

use Joomla\CMS\Factory;
use Joomla\CMS\Table\Table;
use Joomla\CMS\Language\Text;
use TechFry\Library\TfUser;
use TechFry\Library\TfDb;

class BounceHelper
{
	// 01. Returns total messages in mailbox
	public static function handle($email = array())
	{
	    $imap = EmailHelper::connection($email);
        
        $messages = EmailHelper::check($imap);
        
        EmailHelper::close($imap);

        return $messages;
	}
	
	// 02. Reads mailbox and handle bounces
	public static function read($email = array(), $bounces_limit = 1)
	{
        $imap = EmailHelper::connection($email);
        
        $messages = EmailHelper::check($imap);
        
        $emails = EmailHelper::read($imap);
        
        $bounces_limit = min($bounces_limit, $messages);
        $count = array('total_messages' => 0, 'total_bounces' => 0, 'total_users' => 0);
        
        for ($i = 0; $i < $bounces_limit; $i++)
        {
            $count['total_messages']++;
            $message = EmailHelper::analyse($imap, $emails, $i);

            $data = array();
                
            $data['message'] = $message['html_msg'];
            $data['message_plain'] = $message['plain_msg'];
            
            // Remove unicode characters
            $data['message'] = preg_replace('/[\x00-\x1F\x80-\xFF]/', '', $data['message']);
            $data['message_plain'] = preg_replace('/[\x00-\x1F\x80-\xFF]/', '', $data['message_plain']);
                
            $found = 0;
            $words = array('Undelivered Mail', 'Undeliverable', 'Mail delivery failed', 'Warning');
            foreach ($words as $word)
            {
                if (strpos($message['header']->subject, $word) !== false)
                {
                    $found = 1;
                    break;
                }
            }
            
            // 1. Process emails for rules
            $bounce_email = '';
            if ($found)
            {
                $pattern = '/Final-Recipient: rfc822;\s?(.*)/';
                $matches = array();
                preg_match($pattern, $message['plain_msg'], $matches);
                $bounce_email = $matches[1];
            }
            
            // 2. Find and mark user as unpublished, Delete any mails in queue
            if ($bounce_email != '')
            {
                $bounce_email = str_replace(array("\n", "\t", "\r"), '', $bounce_email);
                
                $count['total_bounces']++;
                $result = TfUser::block_user_email($bounce_email);
                if ($result)
                {
                    $count['total_users']++;
                    $data['published'] = 0;
                    // $this->deletefromq($bounce_email);
                }
            }

            // 3. Save in database
            $data['subject'] = $message['header']->subject;
            $data['emailDate'] = $message['header']->date;
            $data['size'] = $message['header']->Size;
            $data['bounce_email'] = $bounce_email;
                
            $from = $message['header']->from;
            foreach ($from as $id => $object) 
            {
                $fromname = $object->personal;
                $fromaddress = $object->mailbox . "@" . $object->host;
            }
                
            $data['fromaddress'] = $fromaddress;
            $data['fromname'] = $fromname;
                
            $date = Factory::getDate();
			$data['created'] = $date->toSql();
                
            if (!isset($data['published']))
            {
                $data['published'] = 1;
            }
                
            TfDb::insert_update('tfm_bounces', $data);
        }
        
        EmailHelper::del($imap);
        
        // close the connection
        EmailHelper::close($imap);
        
        return $count;
	}
}