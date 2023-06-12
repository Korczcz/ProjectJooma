<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library;

defined('_JEXEC') or die;

use Joomla\CMS\Factory;

class TfNotify
{
    // 1. 
  	public static function send_emails($emails = array(), $data = array())
    {
     	foreach ($emails as $email)
        {
        	self::send_email($email, $data);  
        }
    }
  
  	// 2. 
  	public static function send_email($email = array(), $data = array())
    {
     	// $email - from_email, from_name, reply_to_email, to_email, subject, message
      	$mailer = Factory::getMailer();
      
      	// Reply to email
      	if ($email['reply_to_email'])
        {
        	$mailer->addReplyTo($email['reply_to_email']);  
        }
      
      	// From
      	$email['from_email'] = TfDynamic::config($email['from_email']);
      	$email['from_name'] = TfDynamic::config($email['from_name']);
      
      	$mailer->setFrom($email['from_email'], $email['from_name']);
      
      	// Recipient
      	$email['to_email'] = TfDynamic::config($email['to_email']);
      	$email['to_email'] = TfDynamic::fields($email['to_email'], $data);
      
      	$mailer->addRecipient($email['to_email']);
      	
      	// Subject
      	$email['subject'] = TfDynamic::fields($email['subject'], $data);
      
	    $mailer->setSubject($email['subject']);
      
      	// Message
      	$email['message'] = TfDynamic::dates($email['message']);
      	$email['message'] = TfDynamic::config($email['message']);
      	$email['message'] = TfDynamic::fields($email['message'], $data);
      
      	$mailer->setBody($email['message']);
	    
	    $mailer->isHtml(true);
        $mailer->Encoding = 'base64';
	    
	    $mailer->send();
    }
  
  	// 3. Send emmail notification to admin
    public static function notify_admin($subject, $body, $options = array())
	{
	    // $body can be string, array or object
	    
	    if (is_object($body))
	    {
	        $body = (array) $body;
	    }
	    
	    $mailer = Factory::getMailer();
		
		// Recipient
		if (isset($options['to_address']))
		{
		    $mailer->addRecipient($options['to_address']);
		}
		else
		{
		    $config = Factory::getConfig();
	        $to_name = $config->get('fromname');
	        $to_address = $config->get('mailfrom');
		    $mailer->addRecipient($to_address, $to_name);
		}
	    
	    // Subject
	    $mailer->setSubject($subject);
	    
	    // Reply to email
	    if (isset($options['reply_to']))
	    {
	        $mailer->addReplyTo($options['reply_to']);
	    }
	    
	    // Body
	    $email_body = ''; 
	    if (is_array($body))
	    {
	        foreach ($body as $k => $v)
	        {
	            $email_body .= '<p><strong>' . $k . '</strong>: ' . $v . '</p>';
	        }
	    }
	    else
	    {
	        $email_body = $body;
	    }
	    
	    $mailer->setBody($email_body);
	    
	    $mailer->isHtml(true);
        $mailer->Encoding = 'base64';
	    
	    $mailer->send();
	}
}