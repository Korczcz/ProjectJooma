<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library;

defined('_JEXEC') or die;

use Joomla\CMS\Authentication\Authentication;
use Joomla\CMS\Authentication\AuthenticationResponse;
use Joomla\CMS\Application\ApplicationHelper;
use Joomla\CMS\Component\ComponentHelper;
use Joomla\CMS\Factory;
use Joomla\CMS\User\User;
use Joomla\CMS\User\UserHelper;
use Joomla\Component\Fields\Administrator\Helper\FieldsHelper;

class TfUser
{
    // 01. Returns user id from user email
    public static function find_user($email)
    {
        $db = Factory::getDbo();
        $query = $db->getQuery(true);
        
        $query->select($db->quoteName('id'))
            ->from($db->quoteName('#__users'))
            ->where('LOWER(' . $db->quoteName('email') . ') = LOWER(' . $db->quote($email) . ')');
            
        $db->setQuery($query);
        
        $user_id = $db->loadResult();
        
        return $user_id ? $user_id : false;
    }
    
    // 02. Create new joomla user
    public static function create_user($data)
    {
		$data['email'] = strtolower($data['email']);
      
      	// Check if user exists
      	if ($user_id = self::find_user($data['email']))
        {
         	return Factory::getUser($user_id);
        }
		
      	$params = ComponentHelper::getParams('com_users');
		$user = new User();
		$userdata = array();
      
		// Set username
		if (!isset($data['username']) || empty($data['username']))
        {
            $data['username'] = $data['email'];
        }
        
        // Set name
        if (!isset($data['name']) || empty($data['name']))
        {
            $data['name'] = strstr($data['email'], '@', true);
        }
        
        // Set password for new users
        if (!isset($data['password']) || empty($data['password']))
        {
            $data['password'] = UserHelper::genRandomPassword();
        }
        
        // Set require password reset
        if (isset($data['requireReset']))
        {
            $userdata['requireReset'] = $data['requireReset'];
        }
        else
        {
            $userdata['requireReset'] = 0;
        }
		
		$userdata['username'] = $data['username'];
		$userdata['name'] = $data['name'];
		$userdata['email'] = $data['email'];
      	$userdata['password'] = $data['password'];
      	$userdata['password2'] = $data['password'];
		
		// User activation
		$useractivation = $params->get('useractivation');
		if (($useractivation == 1) || ($useractivation == 2))
		{
			$userdata['activation'] = ApplicationHelper::getHash(UserHelper::genRandomPassword());
			$userdata['block'] = 1;
		}
		else
		{
		    $userdata['block'] = 0;
		}
		
		// Set user groups
		if (!isset($data['groups']) || empty($data['groups']))
		{
		    $user_group = $params->get('new_usertype', 2);
		    $data['groups'] = array($user_group);
		}
      	elseif (!is_array($data['groups']))
        {
        	$data['groups'] = (array) $data['groups'];  
        }
      
		$userdata['groups'] = $data['groups'];
		
		// Set custom fields
		if (isset($data['com_fields']) && !empty($data['com_fields']))
		{
		    $userdata['com_fields'] = $data['com_fields'];
		}
		
        // Bind the data
		if (!$user->bind($userdata))
		{
			Factory::getApplication()->enqueueMessage($user->getError());

			return false;
		}
      	
		// Store the data
		if (!$user->save())
		{
            Factory::getApplication()->enqueueMessage($user->getError());
            
			return false;
		}
        
        return $user;
    }
    
    // 03. Updates existing joomla user
    public static function update_user($data, $updates = array(), $block = 0)
    {
        $user = Factory::getUser($data['id']);
		
		$userdata = array();
        
      	// Specific updates
        foreach ($updates as $update)
        {
            if (!empty($data[$update]))
            {
                $userdata[$update] = $data[$update];
            }
        }
		
		if (!in_array('block', $updates))
		{
		    $userdata['block'] = $block;
		}
      
      	// Name
		if (isset($data['name']) && !empty($data['name']))
		{
		    $userdata['name'] = $data['name'];
		}
      
      	// Username
		if (isset($data['username']) && !empty($data['username']))
		{
		    $userdata['username'] = $data['username'];
		}
      	
      	// Password
      	if (isset($data['password']) && !empty($data['password']))
		{
		    $userdata['password'] = $data['password'];
          	$userdata['password2'] = $data['password'];
		}
      
      	// Groups
      	if (isset($data['groups']) && !empty($data['groups']))
		{
		    if (!is_array($data['groups']))
        	{
        		$data['groups'] = (array) $data['groups'];  
        	}
          	$userdata['groups'] = $data['groups'];
		}
      
		// Set custom fields
		if (isset($data['com_fields']) && !empty($data['com_fields']))
		{
		    $userdata['com_fields'] = $data['com_fields'];
		}
        
        // Bind the data
		if (!$user->bind($userdata))
		{
			Factory::getApplication()->enqueueMessage($user->getError());

			return false;
		}
		
		// Store the data
		if (!$user->save())
		{
            Factory::getApplication()->enqueueMessage($user->getError());
            
			return false;
		}
        
        return $user;
    }
    
    // 04. Save user custom field
    public static function save_custom_field($field_id, $user_id, $value)
    {
        $fieldModel = Factory::getApplication()->bootComponent('com_fields')->getMVCFactory()->createModel('Field', 'Administrator', ['ignore_request' => true]);
        
      	// Custom field value will not be saved if user is not authorized to change it
       	$result = $fieldModel->setFieldValue($field_id, $user_id, $value);      
        
        return $result;
    }
    
    // 05. Get user custom field
    public static function get_custom_field($field_id, $user_id)
    {
        $fieldModel = Factory::getApplication()->bootComponent('com_fields')->getMVCFactory()->createModel('Field', 'Administrator', ['ignore_request' => true]);
        
        $value = $fieldModel->getFieldValue($field_id, $user_id);
        
        return $value;
    }
    
    // 06. Filter users
    public static function filter_users($filters, $userfilters, $email = null)
    {
        $db = Factory::getDbo();
        $query = $db->getQuery(true);
        
        $query
            ->select($db->quoteName(array('a.id')))
            ->from($db->quoteName('#__users', 'a'))
            ->where($db->quoteName('a.block') . ' = ' . $db->quote(0))
            ->order('a.id ASC');
        
        // Joomla Users Table
        if (is_string($filters))
        {
            $filters = json_decode($filters);
        }
        $filters_arr = (array) $filters;
            
        if (!empty($filters_arr))
        {
            foreach ($filters_arr as $filter_obj)
            {
                $filter = (array) $filter_obj;
                
                // Case 1: Filter value is given
                if (($filter['where_field'] != '') && ($filter['where_value'] != ''))
                {
                    if ($filter['isDate'])
                    {
                        $date = Factory::getDate('now -' . $filter['where_value'] . ' day');
                        $filter['where_value'] = $date->toSQL();
                    }
                    
                    $query->andWhere($db->quoteName('a.' . $filter['where_field']) . ' ' . $filter['where_operator'] . ' ' . $db->quote($filter['where_value']));
                }
                // Case 2: Filter value is not given (Example: IS NULL)
                elseif (!empty($filter['where_field']) && empty($filter['where_value']))
                {
                    $query->andWhere($db->quoteName('a.' . $filter['where_field']) . ' ' . $filter['where_operator']);
                }
            }
        }
        
        // Users Custom Fields
        if (is_string($filters))
        {
            $userfilters = json_decode($userfilters);
        }
        $userfilters_arr = (array) $userfilters;
        
        if (!empty($userfilters_arr))
        {
            foreach ($userfilters_arr as $filter_obj)
            {
                $filter = (array) $filter_obj;
                
                // Case 1: Filter is for Joomla User Group
                if ($filter['where_field'] == 'group_id')
                {
                    $query->join('INNER', $db->quoteName('#__user_usergroup_map', 'd') . ' ON (' . $db->quoteName('a.id') . ' = ' . $db->quoteName('d.user_id') . ')')
                            ->andWhere($db->quoteName('d.group_id') . ' ' . $filter['where_operator'] . ' ' . $db->quote($filter['where_value']));
                }
                // Case 2: When filter is for Joomla Users Custom Fields
                elseif (is_numeric($filter['where_field']))
                {
                    $query->join('INNER', $db->quoteName('#__fields_values', 'c') . ' ON (' . $db->quoteName('a.id') . ' = ' . $db->quoteName('c.item_id') . ')')
                            ->andWhere($db->quoteName('c.field_id') . ' = ' . $db->quote($filter['where_field']))
                            ->andWhere($db->quoteName('c.value') . ' ' . $filter['where_operator'] . ' ' . $db->quote($filter['where_value']));
                }
            }
        }
        
        if ($email != null)
        {
            $query->andWhere($db->quoteName('a.email') . ' = ' . $db->quote($email));
            $query->setLimit('1');
        }
    
        $db->setQuery($query);
        
        $users = $db->loadColumn();
        
        return $users;
    }
    
    // 07. 
    public static function check_otp($user_id, $otpkey)
    {
        $db = Factory::getDbo();
        $query = $db->getQuery(true);
        
        $query
            ->select($db->quoteName('registerDate'))
            ->from($db->quoteName('#__users'))
            ->where($db->quoteName('id') . ' = ' . $db->quote($user_id))
            ->setLimit('1');
            
        $db->setQuery($query);
        
        $register_date = $db->loadResult();
        
        $date = Factory::getDate($register_date);
        $user_otpkey = $date->toUnix();
        
        return ($user_otpkey == $otpkey) ? Factory::getUser($user_id) : false;
    }
    
    // 08. Get User Groups
    public static function get_user_groups($user_id)
    {
	    $ugs = UserHelper::getUserGroups($user_id);
	    
	    $arr = array();
	    
	    foreach ($ugs as $ug)
	    {
	        $db = Factory::getDbo();
		    $query = $db->getQuery(true);
		
		    $query->select($db->quoteName('title'))
		        ->from($db->quoteName('#__usergroups'))
		        ->where($db->quoteName('id') . ' = ' . $db->quote($ug));
		        
	        $db->setQuery($query);
	    
	        $group = $db->loadResult();

	        $arr[] = $group;
	    }
	    
	    return $arr;
    }
	
	// 09. Delete user
	public static function delete_user($user_id)
	{
	    $user = Factory::getUser($user_id);
        
        $user->delete();
	}
	
	// 10. Add user to group
	public static function add_user_to_group($user_id, $group_id)
	{
	    return UserHelper::addUserToGroup($user_id, $group_id);
	}
	
	// 11. Remove user from group
	public static function remove_user_from_group($user_id, $group_id)
	{
	    return UserHelper::removeUserFromGroup($user_id, $group_id);
	}
	
	// 12. Get user fields
	public static function get_fields($grouped = false)
	{
	    $fields = FieldsHelper::getFields('com_users.user');
	    
	    if ($grouped)
	    {
    	    // Organizing fields according to their group
    		$fieldsPerGroup = array(0 => array());
    		
    		foreach ($fields as $field)
    		{
    		    if (!array_key_exists($field->group_id, $fieldsPerGroup))
    			{
    				$fieldsPerGroup[$field->group_id] = array();
    			}
    			
    			$fieldsPerGroup[$field->group_id][] = $field;
    		}
    	    
    	    return $fieldsPerGroup;
	    }
	    else
	    {
	        return $fields;
	    }
	}
	
	// 13. Block user
	public static function block_user_email($email)
	{
	    $user_id = self::find_user($email);
	    
	    if (!$user_id)
	    {
	        return false;
	    }
	    
	    $user = Factory::getUser($user_id);
	    if ($user->block)
	    {
	        return false;
	    }
	    
	    $userdata = array();
		
		$userdata['id'] = $user_id;
		$userdata['block'] = 1;
		$userdata['requireReset'] = 0;
        
        $user = self::update_user($userdata, array('block', 'requireReset'));
        
        return $user;
	}
	
	// 14. Login user
	public static function login_user($user_id)
	{
	    $app = Factory::getApplication();
	    
	    $user = Factory::getUser($user_id);
	    
	    if (!empty($user->activation))
	    {
	        return false;
	    }
	    
	    if ($user->block)
	    {
	        return false;
	    }
	    
	    $status_success = Authentication::STATUS_SUCCESS;
	    
	    $response = new AuthenticationResponse();
	    
	    $response->status = $status_success;
	    $response->error_message = '';
	    $response->email = $user->email;
	    $response->type = 'tf-login';
	    
	    /*
	    // Run the user plugins
	    $options = array(
			'remember' => true,
			'action'   => 'core.login.site',
		    );
	    PluginHelper::importPlugin('user');
	    $results = Joomla::runPlugins('onUserLogin', [(array) $response, $options], $app);
	    
	    if (in_array(false, $results, true) == false)
		{
			// Set the user in the session, letting Joomla! know that we are logged in.
			Factory::getApplication()->getSession()->set('user', $user);

			// Trigger the onUserAfterLogin event
			$options['user']         = $user;
			$options['responseType'] = $response->type;

			// The user is successfully logged in. Run the after login events
			Joomla::runPlugins('onUserAfterLogin', [$options], $app);

			return;
		}
	    */
	    
	    Factory::getApplication()->getSession()->set('user', $user);
	}
  
  	// 15. Get users by group
  	public static function get_users_by_group($group_id)
    {
      	$db = Factory::getDbo();
        $query = $db->getQuery(true);
        
        $query->select($db->quoteName(array('a.id')))
            ->from($db->quoteName('#__users', 'a'))
            ->where($db->quoteName('a.block') . ' = ' . $db->quote(0))
            ->order('a.id ASC');
      
      	if ($group_id)
        {
        	$query->join('INNER', $db->quoteName('#__user_usergroup_map', 'd') . ' ON (' . $db->quoteName('a.id') . ' = ' . $db->quoteName('d.user_id') . ')')
            	->andWhere($db->quoteName('d.group_id') . ' = ' . $group_id);  
        }
      
      	$db->setQuery($query);
        
        $users = $db->loadColumn();

        return $users;
    }
	
	// 16. Get total users in a group
	public static function total_users_by_group($group_id)
    {
        $db = Factory::getDbo();
		$query = $db->getQuery(true);
		    
		$query->select('COUNT(DISTINCT map.user_id)')
			->from($db->quoteName('#__user_usergroup_map', 'map'))
			->join('LEFT', $db->quoteName('#__users', 'u') . ' ON ' . $db->quoteName('u.id') . ' = ' . $db->quoteName('map.user_id'))
			->where($db->quoteName('map.group_id') . ' = ' . $db->quote($group_id))
			->where($db->quoteName('u.block') . ' = 0');
		    
	    $db->setQuery($query);
	    
        $total = $db->loadResult();
        
        return $total;
    }
  
  	// 17. Get label of custom field from id
  	public static function get_custom_field_label($id)
    {
    	return TfDb::get_single('fields', $id, 'label');
    }
  	
  	// Special method to save user custom fields (used by multiple extensions)
  	public static function handle_fields($user_cfs = array(), $user_id = null)
    {
    	if (!$user_id)
        {
        	$user_id = Factory::getUser()->id;  
        }
      
      	foreach ($user_cfs as $user_cf)
        {
          	$user_cf = (array) $user_cf;
          
          	if ($user_cf['cf_type'] == 2) // Increment current value
            {
            	$old_value = self::get_custom_field($user_cf['cf'], $user_id);
              	$new_value = $old_value ? $old_value + $user_cf['val'] : $user_cf['val'];
              	self::save_custom_field($user_cf['cf'], $user_id, $new_value);
            }
          	else
            {
            	self::save_custom_field($user_cf['cf'], $user_id, $user_cf['val']);
            }
        }
    }
}