<?php
 /*
 * @package		TF Mail Component
 * @license		GNU General Public License version 2 or later; see LICENSE.txt
 */

namespace TechFry\Component\TfMail\Administrator\Model;

defined('_JEXEC') or die;

use Joomla\CMS\Factory;
use Joomla\CMS\Plugin\PluginHelper;
use Joomla\CMS\Language\Text;
use Joomla\CMS\Table\Table;
use TechFry\Library\Model\Back\TfModelForm;
use TechFry\Library\TfUser;
use TechFry\Library\TfAlpha;
use TechFry\Library\TfDb;

class UserModel extends TfModelForm
{
    public function __construct($config = array())
	{
	    $this->table_name = 'users';
	    
	    parent::__construct($config);
	}
    
    public function getTable($type = 'User', $prefix = 'Joomla\\CMS\\Table\\', $config = array())
	{
		$table = Table::getInstance($type, $prefix, $config);

		return $table;
	}
	
// *****************************************************************************
	
	public function getForm($data = array(), $loadData = true)
    {
        parent::getForm();
        
        // Custom Fields
        $field_groups = TfUser::get_fields(true);
        foreach ($field_groups as $group_id => $fields)
        {
            $grp = TfDb::get_item('fields_groups', $group_id);
            if ($grp)
            {
                $this->add_fieldset('fields-' . $grp->id, $grp->title, strip_tags($grp->description));
                
                $elements = TfAlpha::display_fields($fields, true);
                $this->set_fields($elements, 'fields-' . $grp->id);
            }
        }
        $this->bind_form();
        
        // User Groups
        $id = $this->getItem()->id;
        if ($id)
        {
            $user = Factory::getUser($id);
            $user_groups = $user->groups;
        }
        else
        {
            $user_groups = array(2);
        }
        $this->form->setValue('groups', null, $user_groups);

        return $this->form;
    }
    
    public function getItem($pk = null)
    {
        $item = parent::getItem($pk);
        
        if ($item->id)
        {
            // Get custom fields
            $fields = TfUser::get_fields();
        
            foreach ($fields as $field)
            {
                $field_name = $field->name;
                $item->$field_name = TfUser::get_custom_field($field->id, $item->id);
            }
        }
        
        return $item;
    }
    
    public function publish(&$pks, $value = 1)
    {
        $pks = (array) $pks;

        // Check if there are items to change
        if (!count($pks))
        {
            return true;
        }
        
        // Check for self or current logged in user
		$user = Factory::getUser();
		if (in_array($user->id, $pks))
		{
			$this->setError(Text::_('COM_USERS_USERS_ERROR_CANNOT_BLOCK_SELF'));

			return false;
		}
        
        // Iterate the items
        foreach ($pks as $pk)
        {
            $user = Factory::getUser($pk);
		
		    $userdata = array();
		
		    $userdata['block'] = $value ? 0 : 1;
		    $userdata['requireReset'] = 0;
        
            $user->bind($userdata);
        
            $user->save();
        }
        
        return true;
    }
    
    public function delete(&$pks)
	{
		$pks = (array) $pks;
		
		// Check for self or current logged in user
		$user = Factory::getUser();
		if (in_array($user->id, $pks))
		{
			$this->setError(Text::_('COM_USERS_USERS_ERROR_CANNOT_DELETE_SELF'));

			return false;
		}
        
        // Iterate the items to delete each one
        foreach ($pks as $i => $pk)
		{
			TfUser::delete_user($pk);
		}

		return true;
	}
    
    // Get User Statistics (Used by View)
    public function get_user_stats($user_id)
    {
        $conditions = array(
            array('a.user_id', '=', $user_id)
            );
            
        $joins = array(
            array('table' => 'tfm_mail', 'on' => 'mail_id')
            );
        
        $stats = TfDb::get_records('tfm_statistics', 'a.*, b.title', $conditions, 'a.send_date DESC', null, $joins);
        
        return $stats;
    }
    
    // Get User Campaigns (Used by View)
    public function get_user_camps($user_id)
    {
        $conditions = array(
            array('a.user_id', '=', $user_id)
            );
            
        $joins = array(
            array('table' => 'tfm_campaign', 'on' => 'camp_id')
            );
        
        $camps = TfDb::get_records('tfm_campsub', 'a.*, b.title', $conditions, 'a.created DESC', null, $joins);
        
        return $camps;
    }
}