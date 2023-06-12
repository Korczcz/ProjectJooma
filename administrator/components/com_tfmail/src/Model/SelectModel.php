<?php
 /*
 * @package		TF Mail Component
 * @license		GNU General Public License version 2 or later; see LICENSE.txt
 */

namespace TechFry\Component\TfMail\Administrator\Model;

defined('_JEXEC') or die;

use TechFry\Library\Model\Back\TfModelSelect;

class SelectModel extends TfModelSelect
{
    // 1. Export
    public function get_select_types_export()
    {
        $array = array(
            array('title' => 'Joomla Users', 'value' => 'users'),
            array('title' => 'Newsletters', 'value' => 'tfm_mail'),
            array('title' => 'Campaigns', 'value' => 'tfm_campaigns'),
            array('title' => 'Links', 'value' => 'tfm_links'),
            array('title' => 'Statistics', 'value' => 'tfm_statistics')
            );
        
        return $array;
    }
    
    // 2. Import
    public function get_select_types_import()
    {
        $array = array(
            array('title' => 'Joomla Users', 'value' => 'users'),
            array('title' => 'Newsletters', 'value' => 'tfm_mail'),
            array('title' => 'Campaigns', 'value' => 'tfm_campaigns'),
            array('title' => 'Links', 'value' => 'tfm_links')
            );
        
        return $array;
    }
    
    // 3. Query
    public function get_select_types_query()
    {
        $array = array(
            array('title' => 'Joomla Users', 'value' => 'users'),
            array('title' => 'Newsletters', 'value' => 'tfm_mail'),
            array('title' => 'Campaigns', 'value' => 'tfm_campaigns'),
            array('title' => 'Links', 'value' => 'tfm_links'),
            array('title' => 'Statistics', 'value' => 'tfm_statistics'),
            array('title' => 'Queue', 'value' => 'tfm_queue')
            );
        
        return $array;
    }
    
    // 4. Mails
    public function get_select_types_mail()
    {
        $array = array(
            array('title' => 'Newsletter', 'value' => 'newsletter', 'desc' => 'Create and schedule a simple newsletter to send once'),
            array('title' => 'Campaign', 'value' => 'campaign', 'desc' => 'Create a newsletter to be used by campaigns'),
            array('title' => 'Automation', 'value' => 'automation', 'desc' => 'Create automated newsletter to send at a set frequency'),
            array('title' => 'Other', 'value' => 'other', 'desc' => 'Create newsleter to be used by other components')
            );
        
        return $array;
    }
}