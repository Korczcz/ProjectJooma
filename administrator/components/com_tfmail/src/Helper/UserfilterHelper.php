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

class UserfilterHelper
{
    // Filter users
    public static function filter_users($filter, $filterusers, $filterstats, $filterstats_aggr, $subscribers = false)
    {
        // Filter users based on user fields and custom fields
        $users = TfUser::filter_users($filter, $filterusers);
        
        // Filter users based on statistics
        if (!empty($filterstats))
        {
            $temp_users = self::filter_users_stats($filterstats);
            
            $users = array_intersect($users, $temp_users);
        }
        
        // Filter users based on aggregate statistics
        if (!empty($filterstats_aggr))
        {
            $temp_users = self::filter_users_aggr_stats($filterstats_aggr);
            
            $users = array_intersect($users, $temp_users);
        }
        
        // Filter by subscribers / Remove all unsubscribers
        if ($subscribers)
        {
            $temp_users = SubscriberHelper::all_unsubscribers();
            
            $users = array_diff($users, $temp_users);
        }
        
        return $users;
    }
	
	// Return users based on oprn_date, send_date
	public static function filter_users_stats($filterstats)
	{
	    $filterstats_arr = (array) $filterstats;
        
        $conditions = array();
            
        foreach ($filterstats_arr as $filterstat)
        {
            $filterstat_arr = (array) $filterstat;
                
            // Set where values for date fields
            if (($filterstat_arr['stat_type'] == 'open_date' || $filterstat_arr['stat_type'] == 'send_date') && !empty($filterstat_arr['where_value']))
            {
                $date = Factory::getDate('now -' . $filterstat_arr['where_value'] . ' day');
                $filterstat_arr['where_value'] = $date->toSQL();
            }
                
            $conditions[] = array($filterstat_arr['stat_type'], $filterstat_arr['where_operator'], $filterstat_arr['where_value']);
        }
        
        $rows = TfDb::get_items('tfm_statistics', $conditions);
            
        $users = array();
        foreach ($rows as $row)
        {
            $users[] = $row->user_id;
        }
            
        return $users;
	}
	
	// Return users based on total send, open, click
	public static function filter_users_aggr_stats($filterstats_aggr)
	{
	    $filterstats_aggr_arr = (array) $filterstats_aggr;
            
        foreach ($filterstats_aggr_arr as $filter)
        {
            $filter_arr = (array) $filter;
                
            $db = Factory::getDbo();
		    $query = $db->getQuery(true);
		
		    $query->select('user_id')
		        ->from('#__tfm_statistics')
		        ->group('user_id')
		        ->having('COUNT(*) ' . $filter_arr['where_operator'] . ' ' . $filter_arr['where_value']);
                
            if ($filter_arr['stat_type'] == 'total_sent')
            {
                $query->where('type = ' . $db->quote('send'));
                $query->where('type = ' . $db->quote('open'), 'OR');
            }
            elseif ($filter_arr['stat_type'] == 'total_opens')
            {
                $query->where('type = ' . $db->quote('open'));
            }
            elseif ($filter_arr['stat_type'] == 'total_clicks')
            {
                $query->where('type = ' . $db->quote('click'));
            }
                
            $db->setQuery($query);
	            
	        $users = $db->loadColumn();
        }
        
        return $users;
	}
}