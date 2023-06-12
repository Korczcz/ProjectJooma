<?php
 /*
 * @package		TF Mail Component
 * @license		GNU General Public License version 2 or later; see LICENSE.txt
 */

namespace TechFry\Component\TfMail\Site\Model;

defined('_JEXEC') or die;

use Joomla\CMS\Factory;
use Joomla\CMS\MVC\Factory\MVCFactoryInterface;
use Joomla\CMS\Form\FormFactoryInterface;
use Joomla\CMS\Language\Text;
use Joomla\CMS\Plugin\PluginHelper;
use Joomla\Component\Fields\Administrator\Helper\FieldsHelper;
use TechFry\Library\Model\Front\TfModelForm;
use TechFry\Library\TfDb;
use TechFry\Library\TfUser;
use TechFry\Library\TfAlpha;
use TechFry\Component\TfMail\Administrator\Helper\SubscriberHelper;

class SubscribeModel extends TfModelForm
{
    public function __construct($config = array(), MVCFactoryInterface $factory = null, FormFactoryInterface $formFactory = null)
    {
        $this->table_name = 'users';
        
        $this->loadData = false;
	    
	    parent::__construct($config, $factory, $formFactory);
    }
  	
  	// 01. Get Form
  	public function getForm($data = array(), $loadData = true)
    {
     	parent::getForm($data, $loadData);
      
      	// Name field
      	if (!$this->get_menu_param('show_name_field', 1))
		{
    		$this->form->removeField('name');
		}
      	
      	// Usernane field
      	if (!$this->get_menu_param('show_username_field', 1))
		{
    		$this->form->removeField('username');
		}
      
      	// Password field
      	if (!$this->get_menu_param('show_password_field', 1))
		{
    		$this->form->removeField('password1');
          	$this->form->removeField('password2');
		}
      
      	// User group field
		if (!$this->get_menu_param('show_group_field', 1))
		{
          	$user_groups = $this->get_menu_param('user_groups', array());
          
          	$this->form->setFieldAttribute('groups', 'type', 'hidden');
          	$this->form->setFieldAttribute('groups', 'default', implode(',', $user_groups));
		}
      	else
      	{
        	$show_user_groups = $this->get_menu_param('show_user_groups', array());
          	$groups_field = $this->form->getField('groups');
          	foreach ($show_user_groups as $group)
            {
            	$group_title = TfDb::get_single('usergroups', $group, 'title');
              	$groups_field->addOption($group_title, array('value' => $group));
            }
      	}
      
      	// Add custom fields to form
		$display_fields = $this->get_menu_param('display_fields', array()); // Array of Custom Field IDs
      	$elements = $this->custom_fields($display_fields);
      	
      	foreach ($elements as $group_id => $element)
		{
    		$grp = TfDb::get_item('fields_groups', $group_id);
    		if ($grp)
    		{
        		$this->add_fieldset('fields-' . $grp->id, $grp->title, strip_tags($grp->description), 'com_fields');
        		$this->set_fields($element, 'fields-' . $grp->id, 'com_fields');
    		}
		}
      
      	// Case 1: For non-logged in user, find user through id and otp
      	if ($this->user->guest)
        {
        	$this->user = $this->find_user_otp();
        }
      
      	// Bind user data and disable email field
		if ($this->user->id)
		{
    		$userdata = $this->get_user_data($display_fields);
          
          	$this->form->bind($userdata);
          
          	$this->form->setFieldAttribute('email', 'disabled', 'true');
		}
      
      	return $this->form;
    }
	
  	// 02. Save
	public function save($data)
	{
      	$app = Factory::getApplication();
	    $input = $app->input;
        
        // Convert email to lowercase
        $data['email'] = strtolower($data['email']);
        
        // Check for captcha
        if (isset($data['answer']))
        {
            if ($data['answer'] != $data['captcha'])
            {
                $app->enqueueMessage('<strong>' . Text::_('COM_TFMAIL_ERROR_INCORRECT_CAPTCHA') . '</strong>', 'error');
                
                return false;
            }
            unset($data['captcha'], $data['answer']);
        }
      
      	// Check for password matching
      	if (isset($data['password1']) && !empty($data['password1']) || isset($data['password2']) && !empty($data['password2']))
        {
         	if ($data['password1'] != $data['password2'])
            {
            	$app->enqueueMessage('<strong>' . Text::_('COM_TFMAIL_ERROR_PASSWORD_MISMATCH') . '</strong>', 'error');
                
               	return false;  
            }
          	$data['password'] = $data['password1'];
        }
        
        // Check if user email already exists (only for new subscribers)
        if ($data['id'] == 0)
        {
            $user_id = TfUser::find_user($data['email']);
            if ($user_id !== false)
            {
                $user = Factory::getUser($user_id);
                if ($user->block == 0 && SubscriberHelper::subscriber($user_id))
                {
                    $app->enqueueMessage('<strong>' . Text::_('COM_TFMAIL_ERROR_SUBSCRIBER_EXISTS') . $data['email'] . '</strong>', 'error');
               
                    return false;
                }
                else
                {
                    SubscriberHelper::resubscribe($user_id);
                    
                    $data['id'] = $user_id;
                }
            }
        }
        
        // Case 1: New Subscriber - Create Joomla User
        if ($data['id'] == 0)
        {
            $juser = TfUser::create_user($data);
            if (!$juser->id)
            {
                $app->enqueueMessage('<strong>' . Text::_('COM_TFMAIL_ERROR_SUBSCRIBER_NOT_SAVED') . '</strong>', 'error');
               
                return false;
            }
        }
      	// Case 2: Update Joomla User
        elseif ($data['id'])
        {
            $juser = TfUser::update_user($data);
        }
        
        // TfUser::login_user($juser->id);
	    return true;
	}
	
// *****************************************************************************
    
    // 01.
    public function custom_fields($field_ids = array())
    {
        $elements = array();
        
        if (empty($field_ids))
        {
            return $elements;
        }
        
        $field_groups = TfUser::get_fields(true);
        foreach ($field_groups as $group_id => $fields)
        {
            foreach ($fields as $k => $field)
            {
                if (!in_array($field->id, $field_ids) || !FieldsHelper::canEditFieldValue($field))
                {
                    unset($fields[$k]);
                }
            }
            
            $elements[$group_id] = TfAlpha::display_fields($fields, true);
        }

        return $elements;
    }
    
    // 02. Check if user id and otp match; Returns user details
    public function find_user_otp()
    {
        $input = Factory::getApplication()->input;

        $otpkey = $input->get('otpkey', '0', 'INT');
        $user_id = $input->get('id', '0', 'INT');
        
        $user = TfUser::check_otp($user_id, $otpkey);
        
        return $user;
    }
    
    // 03. Get custom field values and group for current user
    public function get_user_data($fields)
    {
        $userdata = array(
        	'id' => $this->user->id,
          	'email' => $this->user->email,
        	'name' => $this->user->name,
          	'username' => $this->user->username,
          	'groups' => $this->user->groups,
        	);
      
      	$fieldModel = Factory::getApplication()->bootComponent('com_fields')->getMVCFactory()->createModel('Field', 'Administrator', ['ignore_request' => true]);
        
        foreach ($fields as $field)
        {
            $field_data = $fieldModel->getItem($field);
            $field_name = $field_data->name;
          	$userdata['com_fields'][$field_name] = $fieldModel->getFieldValue($field, $this->user->id);
        }
      
      	return $userdata;
    }
}