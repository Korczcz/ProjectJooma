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

class StatisticsHelper
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
	
	// Return users based on open_date, send_date
	public static function users_date($type, $operator, $relative_days)
	{
	    // $type - send, open, register, lastvisit
        
        $conditions = array();
      
      	if ($type == 'send')
        {
        	$column = 'send_date';
          	$table = 'tfm_statistics';
          	$select = 'DISTINCT user_id';
        }
      	elseif ($type == 'open')
        {
         	$column = 'open_date';
          	$table = 'tfm_statistics';
          	$select = 'DISTINCT user_id';
        }
      	elseif ($type == 'register')
        {
        	$column = 'registerDate';
          	$table = 'users';
          	$select = 'id';
        }
      	elseif ($type == 'lastvisit')
        {
        	$column = 'lastvisitDate';
          	$table = 'users';
          	$select = 'id';
        }
      
      	$date = Factory::getDate('now -' . $relative_days . ' day');
      
      	$conditions[] = array($column, $operator, $date->toSQL());
        
        $rows = TfDb::get_records($table, $select, $conditions);
            
        $users = array();
        foreach ($rows as $row)
        {
            $users[] = $row->user_id ?? $row->id;
        }
            
        return $users;
	}
	
	// Return users based on total send, open, click
	public static function users_aggregate($type, $operator, $value)
	{
      	// $type - send, open, click
      	
      	// Get users with zero send, zero opens or zero clicks
      	$users_with_no_stats = array();
      	if ($operator == '<' || $operator == '<=')
      	{
      	    $all_users = self::get_all();
      	    $users_with_stats = self::get_users_with_stats($type);
      	    $users_with_no_stats = array_diff($all_users, $users_with_stats);
      	}

      	$db = Factory::getDbo();
      	$query = $db->getQuery(true);

      	$query->select('user_id')
        	->from('#__tfm_statistics')
        	->group('user_id')
        	->having('COUNT(*) ' . $operator .  ' ' . $db->quote($value));

      	if ($type == 'send')
      	{
        	$query->where('type = ' . $db->quote('send'));
        	$query->orWhere('type = ' . $db->quote('open'));
      	}
      	elseif ($type == 'open')
      	{
        	$query->where('type = ' . $db->quote('open'));
        	
        	
      	}
      	elseif ($type == 'click')
      	{
        	$query->where('type = ' . $db->quote('click'));
      	}

      	$db->setQuery($query);

      	$users = array_merge($users_with_no_stats, $db->loadColumn());
        
        return $users;
	}
	
	public static function get_all()
	{
	    $db = Factory::getDbo();
      	$query = $db->getQuery(true);
      	
      	$query->select('id')
      	    ->from('#__users')
      	    ->where('block = 0');
      	    
        $db->setQuery($query);

      	return $db->loadColumn();
	}
	
	public static function get_users_with_stats($type)
	{
	    $db = Factory::getDbo();
      	$query = $db->getQuery(true);

      	$query->select('DISTINCT user_id')
        	->from('#__tfm_statistics');

      	if ($type == 'send')
      	{
        	$query->where('type = ' . $db->quote('send'));
        	$query->orWhere('type = ' . $db->quote('open'));
      	}
      	elseif ($type == 'open')
      	{
        	$query->where('type = ' . $db->quote('open'));
      	}
      	elseif ($type == 'click')
      	{
        	$query->where('type = ' . $db->quote('click'));
      	}

      	$db->setQuery($query);

      	return $db->loadColumn();
	}
}