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

class TfModelImport extends TfModelForm
{
    public function __construct($config = array(), MVCFactoryInterface $factory = null, FormFactoryInterface $formFactory = null)
	{
	    parent::__construct($config, $factory, $formFactory);
	    
	    $this->basic_fields = array();
	    
	    $this->loadData = false;
	}

    public function get_import_form()
    {
        // Get table type from URL
	    $app = Factory::getApplication();
	    $input = $app->input;
        $type = $input->get('type', '');
        
        // 1. Set type field
        $element = '<field name="type" type="text" label="COM_TF_TYPE" default="' . $type . '" readonly="true" />';
	    $this->set_field($element, 'general');
	    
	    // 2. Set columns field
        $this->set_columns_field($type);
        
        // 3. Articles custom fields
        if ($type == 'content')
        {
            $element = '<field name="articles_cf" type="sql" label="COM_TF_CUSTOM_FIELDS" multiple="true" 
                query="SELECT id, name FROM #__fields WHERE state=1 AND context=\'com_content.articles\'" 
                layout="joomla.form.field.list-fancy-select" key_field="id" value_field="name" />';
            
            $this->set_field($element, 'general');
        }
        
        // 4. User custom fields 
        if ($type == 'users')
        {
            $element = '<field name="users_cf" type="sql" label="COM_TF_CUSTOM_FIELDS" multiple="true" 
                query="SELECT id, name FROM #__fields WHERE state=1 AND context=\'com_users.user\'" 
                layout="joomla.form.field.list-fancy-select" key_field="id" value_field="name" />';
            
            $this->set_field($element, 'general');
        }
    }
    
    public function set_columns_field($type)
    {
        $table_name = '#__' . $type;
        
        $db = Factory::getDbo();
        $cols = $db->getTableColumns($table_name);
        
        $element = '<field name="import_columns" type="list" label="COM_TF_COLUMNS" layout="joomla.form.field.list-fancy-select" multiple="true">';
        
        foreach ($cols as $col_name => $col_type)
        {
            $element .= '<option value="' . $col_name . '">' . $col_name . '</option>';
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
        
        $this->get_import_form();
        
        return $this->form;
    }
}