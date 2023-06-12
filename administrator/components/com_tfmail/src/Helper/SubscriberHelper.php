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

class SubscriberHelper
{
    // 01. Check if user is subscribed
    public static function subscriber($user_id)
    {
        $conditions = array(
            array('camp_id', '=', '0'),
            array('user_id', '=', $user_id)
            );
        
        $result = TfDb::get_record('tfm_campsub', $conditions);
        
        if ($result)
        {
            return false;
        }
        
        return true;
    }
    
    // 02. Get all unsubscribers
    public static function all_unsubscribers()
    {
        $records = array();
        
        $conditions = array(
            array('camp_id', '=', '0')
            );
            
        $records = TfDb::get_items('tfm_campsub', $conditions, null, null, 'user_id');
        
        return $records;
    }
    
    // 03. Resubscribe user
    public static function resubscribe($user_id)
    {
        $conditions = array(
            array('camp_id', '=', '0'),
            array('user_id', '=', $user_id)
            );
        
        TfDb::delete_items('tfm_campsub', $conditions);
    }
}