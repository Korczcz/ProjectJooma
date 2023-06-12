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
use TechFry\Library\Model\Back\TfModelForm;
use TechFry\Library\TfDb;

class TfModelExport extends TfModelForm
{
    public function __construct($config = array(), MVCFactoryInterface $factory = null, FormFactoryInterface $formFactory = null)
	{
	    parent::__construct($config, $factory, $formFactory);
	    
	    $this->basic_fields = array();
	    
	    $this->loadData = false;
	}
	
	public function get_export_form()
	{
	    // Get table type from URL
	    $app = Factory::getApplication();
	    $input = $app->input;
        $type = $input->get('type', '');
        
        if (!$type)
        {
            $app->enqueueMessage('Table type not found.', 'error');
            
            return;
        }
	    
	    // 1. Set type field
	    $element = '<field name="type" type="text" label="COM_TF_TYPE" default="' . $type . '" readonly="true" />';
	    $this->set_field($element, 'general');
        
        // 2. Set columns field
        $this->set_select_field($type);
        
        // 3. Set custom fields for Joomla articles
        if ($type == 'content')
        {
            $element = '<field name="articles_cf" type="sql" label="COM_TF_CUSTOM_FIELDS" 
                    query="SELECT id, name FROM #__fields WHERE state=1 AND context=\'com_content.article\'"
                    key_field="id" value_field="name" multiple="true" layout="joomla.form.field.list-fancy-select">
                        <option value="image_intro">image_intro</option>
                        <option value="image_fulltext">image_fulltext</option>
                        <option value="full_article">full_article</option>
                    </field>';
                    
            $this->set_field($element, 'general');
        }
        
        // 4. Set user custom field filter
        if ($type == 'users')
        {
            $element = '<field name="note02" type="note" label="COM_TF_CUSTOM_FIELDS" class="text-muted" />';
            $this->set_field($element, 'filters');
            
            $element = '<field name="filterusers" type="subform" label="COM_TF_CUSTOM_FIELDS" multiple="true"
                layout="joomla.form.field.subform.repeatable-table" hiddenLabel="true" filter="raw" />';
            $this->set_field($element, 'filters');
            
            $this->form->setFieldAttribute('filterusers', 'formsource', 'libraries/techfry/forms/subform_filterusers.xml');
        }
	}
	
	public function set_select_field($type)
    {
        $table_name = '#__' . $type;
        
        $db = Factory::getDbo();
        $cols = $db->getTableColumns($table_name);
        
        $element = '<field name="export_select" type="list" label="COM_TF_COLUMNS" layout="joomla.form.field.list-fancy-select" multiple="true">';
        
        foreach ($cols as $col_name => $col_type)
        {
            $element .= '<option value="' . $col_name . '">' . $col_name . '</option>';
        }
        
        if ($type == 'users')
        {
            $element .= '<option value="group_id">group_id</option>';
            $cfs = TfDb::get_items('fields', array(array('context', '=', 'com_users.user')));
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
        
        $this->get_export_form();
        
        return $this->form;
    }
}