<?php
 /*
 * @package		TF Mail Component
 * @license		GNU General Public License version 2 or later; see LICENSE.txt
 */

namespace TechFry\Component\TfMail\Site\Controller;

defined('_JEXEC') or die;

use Joomla\CMS\Factory;
use Joomla\CMS\MVC\Controller\BaseController;
use TechFry\Component\TfMail\Administrator\Helper\CampaignHelper;
use TechFry\Component\TfMail\Administrator\Helper\QueueHelper;
use TechFry\Library\TfDb;

class TrackController extends BaseController
{
    // 01. Track email opens
    public function open()
    {
        $statistic = array();
        
        $mailid = $this->input->get('mailid', 0, 'INT');
        
        $userid = $this->input->get('userid', 0, 'INT');
        
        if ($mailid && $userid)
        {
            // Get record from statistics table (record is added after sending email)
            $stat = TfDb::get_record('tfm_statistics', array(array('mail_id', '=', $mailid), array('user_id', '=', $userid), array('type', '!=', 'click')));
        
            if ($stat)
            {
                $statistic['type'] = 'open';
                $statistic['open_date'] = Factory::getDate()->toSql();
                $statistic['opens'] = $stat->opens + 1;
                $statistic['id'] = $stat->id;
                
                TfDb::insert_update('tfm_statistics', $statistic);
            }
            
            // Trigger email or campaign based on email open
            $mail = TfDb::get_item('tfm_mail', $mailid);
            if ($mail->params)
            {
                $params = json_decode($mail->params, true);
                
                if ($params['trigger_email'])
                {
                    $send_date = Factory::getDate()->modify('+' . $params['email_delay'] . ' days')->toSql();
                    
                    QueueHelper::user2queue($params['trigger_email'], $userid, $send_date);
                }
                
                if ($params['trigger_campaign'])
                {
                    CampaignHelper::user2camp($userid, $params['trigger_campaign']);
                }
            }
        }
    }
    
    // 02. Track link clicks
    public function click()
    {
        $statistic = array();
        
        $mailid = $this->input->get('mailid', 0, 'INT');
        
        $userid = $this->input->get('userid', 0, 'INT');
        
        $redirect = $this->input->get('redirect', '');
        $url = base64_decode($redirect);
        
        // 1. Find link id from URL / Create new link if not found
        $link = TfDb::get_record('tfm_links', array(array('link_url', '=', $url)));
        
        if (!$link)
        {
            $new_link = array(
                'link_url' => $url,
                'title' => $url,
                'link_text' => $url,
                'published' => 1
                );
                
            $link = TfDb::insert_update('tfm_links', $new_link);
        }
        else
        {
            // If link is found, check for triggering campaign or email based on link click
            if ($link->campaign_id)
            {
                CampaignHelper::user2camp($userid, $link->campaign_id);
            }
            
            if ($link->mail_id)
            {
                $send_date = Factory::getDate()->modify('+' . $link->email_delay . ' days')->toSql();
                    
                QueueHelper::user2queue($link->mail_id, $userid, $send_date);
            }
            
            // Set message
            if ($link->message)
            {
                $this->SetMessage($link->message);
            }
        }
        
        // 2. Add click statistic
        if ($link->id && $userid && $mailid)
        {
            // Check whether record exists in statistics table
            $stat = TfDb::get_record('tfm_statistics', array(array('link_id', '=', $link->id), array('user_id', '=', $userid), array('mail_id', '=', $mailid)));
            
            if ($stat)
            {
                $statistic['click_date'] = Factory::getDate()->toSql();
                $statistic['clicks'] = $stat->clicks + 1;
                $statistic['id'] = $stat->id;
            }
            else
            {
                $statistic['type'] = 'click';
                $statistic['link_id'] = $link->id;
                $statistic['user_id'] = $userid;
                $statistic['mail_id'] = $mailid;
                $statistic['click_date'] = Factory::getDate()->toSql();
                $statistic['clicks'] = 1;
                $statistic['id'] = 0;
            }
            
            TfDb::insert_update('tfm_statistics', $statistic);
        }
        
        $this->setRedirect($url);
    }
}