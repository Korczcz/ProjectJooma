<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library\Model;

defined('_JEXEC') or die;

use Joomla\CMS\Factory;
use Joomla\CMS\Form\FormFactoryInterface;
use Joomla\CMS\MVC\Factory\MVCFactoryInterface;
use Joomla\Registry\Registry;
use Joomla\CMS\Form\Form;
use TechFry\Library\TfDb;
use TechFry\Library\Model\Back\TfModelForm;

class TfModelQuery extends TfModelForm
{
    public function __construct($config = array(), MVCFactoryInterface $factory = null, FormFactoryInterface $formFactory = null)
	{
	    parent::__construct($config, $factory, $formFactory);
	    
	    $this->basic_fields = array();
	    
	    $this->loadData = false;
	}

    public function get_query_form()
    {
        // Get table type from URL
	    $app = Factory::getApplication();
	    $input = $app->input;
        $type = $input->get('type', '');
        
        // 1. Set type field
        $element = '<field name="type" type="text" label="COM_TF_TYPE" default="' . $type . '" readonly="true" />';
	    $this->set_field($element, 'general');
        
        // 2. Set column field
        $this->set_column_field($type, 'column_field', 'COM_TF_COLUMN', 'update,find,find_duplicates,replace,string,date,numeric');
        
        // 3. Set column to save field
        $this->set_column_field($type, 'column_save', 'COM_TF_COLUMN_SAVE', 'string,date,numeric');
        
        // 4. Set user custom field filter
        if ($type == 'users')
        {
            $element = '<field name="note01" type="note" label="Custom Fields" showon="query_type:users[AND]tool:update,replace,delete,string,date,numeric" />';
            $this->set_field($element, 'filters');
            
            $element = '<field name="filterusers" type="subform" label="COM_TF_CUSTOM_FIELDS" multiple="true" 
                layout="joomla.form.field.subform.repeatable-table" filter="raw" hiddenLabel="true" showon="query_type:users[AND]tool:update,replace,delete,string,date,numeric" />';
            $this->set_field($element, 'filters');
            
            $this->form->setFieldAttribute('filterusers', 'formsource', 'libraries/techfry/forms/subform_filterusers.xml');
        }
        
        // 5. Set content custom field filter
        if ($type == 'content')
        {
            $element = '<field name="note02" type="note" label="Custom Fields" showon="query_type:content[AND]tool:update,replace,delete,string,date,numeric" />';
            $this->set_field($element, 'filters');
            
            $element = '<field name="filterarticles" type="subform" label="COM_TF_CUSTOM_FIELDS" multiple="true" 
                layout="joomla.form.field.subform.repeatable-table" filter="raw" hiddenLabel="true" showon="query_type:content[AND]tool:update,replace,delete,string,date,numeric" />';
            $this->set_field($element, 'filters');

            $this->form->setFieldAttribute('filterarticles', 'formsource', 'libraries/techfry/forms/subform_filterarticles.xml');
        }
    }
    
    public function set_column_field($type, $name, $label, $showon)
    {
        $table_name = '#__' . $type;
        
        $db = Factory::getDbo();
        $cols = $db->getTableColumns($table_name);
        
        $element = '<field name="' . $name . '" type="list" label="' . $label . '" showon="tool:' . $showon . '">';
        $element .= '<option value="">JSELECT</option>';
        foreach ($cols as $col_name => $col_type)
        {
            $element .= '<option value="' . $col_name . '">' . $col_name . '</option>';
        }
        
        // Add custom fields and group for users
        if ($type == 'users')
        {
            $element .= '<option value="group_id">group_id</option>';
            $cfs = TfDb::get_items('fields', array(array('context', '=', 'com_users.user')));
            foreach ($cfs as $cf)
            {
                $element .= '<option value="' . $cf->id . '">' . $cf->title . '</option>';
            }
        }
        
        // Add custom fields for joomla content
        if ($type == 'content')
        {
            $cfs = TfDb::get_items('fields', array(array('context', '=', 'com_content.article')));
            foreach ($cfs as $cf)
            {
                $element .= '<option value="' . $cf->id . '">' . $cf->title . '</option>';
            }
        }
        
        $element .= '</field>';
	    
        $this->set_field($element, 'general');
    }
    
    public function getForm($data = array(), $loadData = true)
    {
        $this->form = Form::getInstance($this->option . '.' . $this->getName(), JPATH_LIBRARIES . '/techfry/forms/' . $this->getName() . '.xml', array("control" => "jform"));
        
        if (empty($this->form))
        {
            return false;
        }
        
        $this->get_query_form();
        
        return $this->form;
    }
}