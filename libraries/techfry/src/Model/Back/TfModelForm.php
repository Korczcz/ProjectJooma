<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library\Model\Back;

defined('_JEXEC') or die;

use Joomla\CMS\Factory;
use Joomla\CMS\Language\Associations;
use Joomla\CMS\Language\LanguageHelper;
use Joomla\CMS\MVC\Model\AdminModel;
use Joomla\CMS\Form\Form;
use Joomla\Registry\Registry;
use Joomla\CMS\Form\FormFactoryInterface;
use Joomla\CMS\MVC\Factory\MVCFactoryInterface;
use Joomla\CMS\Language\Text;
use TechFry\Library\Model\TfModelTrait;
use TechFry\Library\TfDb;

class TfModelForm extends AdminModel
{
    use TfModelTrait;
    
    public $form;
    
    public $table;
    
    public $loadData = true;
    
    public $basic_fields = array();
    
    public $date_fields = array();
    
    // Fields saved as JSON in the database
    public $subform_fields = array();
    
    public $multiple_fields = array();
    
    public $pro_fields = array();
    
    public $is_ml = false;
    
    public $app;
    
    public function __construct($config = array(), MVCFactoryInterface $factory = null, FormFactoryInterface $formFactory = null)
	{
		parent::__construct($config, $factory, $formFactory);
		
		if ($this->table_name)
		{
		    $this->table_columns = TfDb::get_table_columns($this->table_name);    
		}
		
		$this->set_basic_fields();
		
		$this->app = Factory::getApplication();
		
		$this->input = $this->app->input;
	}
	
	public function getTable($name = '', $prefix = 'Table', $options = array())
    {
        if (empty($name))
        {
            if (empty($this->table))
            {
                $name = ucwords($this->getName());
            }
            else
            {
                $name = $this->table;
            }
        }
        
        if ($table = $this->_createTable($name, $prefix, $options))
        {
            return $table;
        }

        throw new \Exception(Text::sprintf('JLIB_APPLICATION_ERROR_TABLE_NAME_NOT_SUPPORTED', $name), 0);
    }
    
    public function getForm($data = array(), $loadData = true)
    {
        // Get the form
        $this->form = $this->loadForm($this->option . '.' . $this->getName(), $this->getName(), array('control' => 'jform', 'load_data' => $this->loadData));
        
        if (empty($this->form))
        {
            return false;
        }
        
        // Change pro fields type
        if (!$this->is_pro())
        {
          	foreach ($this->pro_fields as $group => $fields)
            {
                foreach ($fields as $field_name)
                {
                    $group = ($group == 'default') ? '' : $group;
                  
                  	$current_type = $this->form->getFieldAttribute($field_name, 'type', '', $group);
                  	
                  	$new_type = $current_type . 'pro';
                  	
                  	$this->form->setFieldAttribute($field_name, 'type', $new_type, $group);
                }
            }
        }
        
        $this->complete_form();
        
        $this->bind_form();
        
        return $this->form;
    }
    
    protected function loadFormData()
    {
        // Check the session for previously entered form data.
        $app  = Factory::getApplication();
        $data = $app->getUserState($this->option . '.edit.' . $this->getName() . '.data', array());
        
        if (empty($data))
        {
            $data = $this->getItem();
        }
        
        return $data;
    }
    
    public function complete_form()
    {
        foreach ($this->basic_fields as $field)
        {
            switch ($field)
            {
                case 'title' :
                    $fieldset = '';
                    $element = '<field name="title" type="text" label="JGLOBAL_TITLE" required="true" />';
                    break;
                    
                case 'alias' :
                    $fieldset = '';
                    $element = '<field name="alias" type="text" label="JFIELD_ALIAS_LABEL" hint="JFIELD_ALIAS_PLACEHOLDER" />';
                    break;
                
                case 'description' :
                    $fieldset = 'description';
                    $element = '<field name="description" type="editor" label="JGLOBAL_DESCRIPTION" hiddenLabel="true" buttons="true" filter="JComponentHelper::filterText" />';
                    break;
            
                case 'note' : 
                    $fieldset = 'options';
                    $element = '<field name="note" type="text" label="COM_TF_NOTE" />';
                    break;
                    
                case 'published' :
                    $fieldset = 'options';
                    $element = '<field name="published" type="list" label="JSTATUS" default="1"';
                    $element .= ' class="form-select-color-state">';
                    $element .= '<option value="1">JPUBLISHED</option><option value="0">JUNPUBLISHED</option>';
                    $element .= '<option value="2">JARCHIVED</option><option value="-2">JTRASHED</option></field>';
                    break;
                    
                case 'access' :
                    $fieldset = 'options';
                    $element = '<field name="access" type="accesslevel" label="JFIELD_ACCESS_LABEL" description="JFIELD_ACCESS_DESC" default="1" />';
                    break;
                    
                case 'language' :
                    $fieldset = 'options';
                    $element = '<field name="language" type="contentlanguage" label="JFIELD_LANGUAGE_LABEL"><option value="*">JALL</option></field>';
                    break;
                    
                case 'ordering' :
                    $fieldset = 'options';
                    $element = '<field name="ordering" type="number" label="COM_TF_ORDERING" default="0" min="0" />';
                    break;
                    
                case 'id' :
                    $fieldset = 'details';
                    $element = '<field name="id" type="text" label="JGLOBAL_FIELD_ID_LABEL" description="JGLOBAL_FIELD_ID_DESC"';
                    $element .= ' class="readonly" size="10" default="0" readonly="true" />';
                    break;
                
                case 'created' :
                    $fieldset = 'details';
                    $element = '<field name="created" type="calendar" label="JGLOBAL_CREATED_DATE" translateformat="true" showtime="true" filter="none" readonly="true" />';
                    break;
                    
                case 'modified' :
                    $fieldset = 'details';
                    $element = '<field name="modified" type="calendar" label="JGLOBAL_FIELD_MODIFIED_LABEL" translateformat="true" showtime="true" filter="none" readonly="true" />';
                    break;
                    
                case 'created_by' :
                    $fieldset = 'details';
                    $element = '<field name="created_by" type="user" label="COM_TF_CREATED_BY" />';
                    break;
                    
                case 'hits' :
                    $fieldset = 'details';
                    $element = '<field name="hits" type="number" label="JGLOBAL_HITS" readonly="true" default="0" />';
                    break;
            }
            
            $this->set_field($element, $fieldset);
        }
    }
    
    public function save($data)
    {
        if (!$this->is_pro() && isset($this->db_limit))
        {
            $total_rows = TfDb::total_rows($this->table_name);
            
            if ($total_rows > $this->db_limit)
            {
                $this->setError(Text::sprintf('COM_TF_PRO_DB_MESSAGE', $this->db_limit));
            
                return;
            }
        }
        
        $data = $this->prepare_data($data, $this->table_name, $this->date_fields, $this->subform_fields, $this->multiple_fields);
        
        return parent::save($data);
    }
    
    public function validate($form, $data, $group = null)
    {
        return $data;
    }
    
    public function getItem($pk = null)
    {
        $item = parent::getItem($pk);
        
        // Convert JSON string to array
        foreach ($this->multiple_fields as $k => $v)
        {
            if ($item && property_exists($item, $v))
            {
                $registry = new Registry($item->$v);
                
                $item->$v = $registry->toArray();
            }
        }
        
        // Load associated content items
        $assoc = Associations::isEnabled();
		if ($assoc && $this->is_ml)
		{
			$item->associations = array();
			if ($item->id != null)
			{
				$associations = Associations::getAssociations($this->option, '#__' . $this->table_name, $this->associationsContext, $item->id,  'id', 'alias', '');

				foreach ($associations as $tag => $association)
				{
					$item->associations[$tag] = $association->id;
				}
			}
		}
        
        return $item; 
    }
    
    protected function preprocessForm(Form $form, $data, $group = 'content')
	{
        $str = ucwords(substr($this->option, 6));
		
		// Association content items
		if (Associations::isEnabled() && $this->is_ml)
		{
			$languages = LanguageHelper::getContentLanguages(false, false, null, 'ordering', 'asc');

			if (count($languages) > 1)
			{
				$addform = new \SimpleXMLElement('<form />');
				$fields = $addform->addChild('fields');
				$fields->addAttribute('name', 'associations');
				$fieldset = $fields->addChild('fieldset');
				$fieldset->addAttribute('name', 'item_associations');
				$fieldset->addAttribute('addfieldprefix', 'TechFry\Component\Tf' . $str . '\Administrator\Field');

				foreach ($languages as $language)
				{
					$field = $fieldset->addChild('field');
					$field->addAttribute('name', $language->lang_code);
					$field->addAttribute('type', 'modal_' . $this->name);
					$field->addAttribute('language', $language->lang_code);
					$field->addAttribute('label', $language->title);
					$field->addAttribute('translate_label', 'false');
					
					$field->addAttribute('select', 'true');
					// $field->addAttribute('new', 'true');
					// $field->addAttribute('edit', 'true');
					$field->addAttribute('clear', 'true');
					// $field->addAttribute('propagate', 'true');
				}

				$form->load($addform, false);
			}
		}
		
		parent::preprocessForm($form, $data);
	}
    
    // Add field to fieldset
    public function set_field($element, $fieldset)
    {
        $xml = new \SimpleXMLElement($element);
        $this->form->setField($xml, null, false, $fieldset);
    }
    
    // Add fields to fieldset
    public function set_fields($elements, $fieldset)
    {
        foreach ($elements as $element)
        {
            $this->set_field($element, $fieldset);
        }
    }
    
    // Add fieldset to the form
    public function add_fieldset($name, $label = '', $description = '')
    {
        $element = '<form><fieldset name="' . $name . '"';
        if ($label != '')
        {
            $element .= ' label="' . $label . '"';
        }
        if ($description != '')
        {
            $element .= ' description="' . $description . '"';
        }
        $element .= '></fieldset></form>';
        
        $xml = new \SimpleXMLElement($element);
        $this->form->load($xml);
    }
    
    public function bind_form()
    {
        if ($this->loadData)
        {
            $this->form->bind($this->getItem());
        }
    }
    
    // Save data in junction table - new method
    public function save_injunction($table_name, $conditions = array(), $column_name = 'label_id', $ids = array())
    {
        // First, delete all current ids
        $db = Factory::getDbo();
        $query = $db->getQuery(true);
        
        foreach ($conditions as $k => $v)
        {
            $where[] = $db->quoteName($k) . ' = ' . $db->quote($v);
        }

        $query->delete($db->quoteName('#__' . $table_name));
        $query->where($where);
        
        $db->setQuery($query);
        $db->execute();
        
        // Then, add labels or ids
        foreach ($ids as $id)
        {
            $data_obj = new \stdClass;
            foreach ($conditions as $k => $v)
            {
                $data_obj->$k = $v;
            }
            
            $data_obj->$column_name = $id;
            
            Factory::getDbo()->insertObject('#__' . $table_name, $data_obj);
        }
    }
    
    // Get data from junction table - new method
    public function get_injunction($table_name, $conditions = array(), $column_name = 'label_id')
    {
        $db = Factory::getDbo();
        $query = $db->getQuery(true);
        
        $query->select($column_name)
            ->from($db->quoteName('#__' . $table_name));
        
        foreach ($conditions as $k => $v)
        {
            $query->where($db->quoteName($k) . ' = ' . $db->quote($v));
        }
            
        $db->setQuery($query);

		$column_arr = $db->loadColumn();

	    return $column_arr;
    }
    
    public function set_basic_fields()
    {
        $temps = array('title', 'description', 'alias', 'published', 'access', 'language', 'ordering', 'note', 'id', 'created', 'modified', 'created_by', 'hits');
        foreach ($temps as $temp)
        {
            if (array_key_exists($temp, $this->table_columns))
            {
                $this->basic_fields[] = $temp;
            }
        }
    }
}