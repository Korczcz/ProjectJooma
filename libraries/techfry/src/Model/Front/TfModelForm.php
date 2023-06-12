<?php
 /*
 * @package		TF Components
 * @license		GNU General Public License version 2 or later; see LICENSE.txt
 */

namespace TechFry\Library\Model\Front;

defined('_JEXEC') or die;

use Joomla\CMS\Factory;
use Joomla\CMS\MVC\Factory\MVCFactoryInterface;
use Joomla\CMS\Form\FormFactoryInterface;
use Joomla\CMS\Language\Text;
use Joomla\CMS\MVC\Model\AdminModel;
use Joomla\Registry\Registry;
use TechFry\Library\TfUser;
use TechFry\Library\Model\TfModelTrait;
use TechFry\Library\TfDb;

class TfModelForm extends AdminModel
{
    use TfModelTrait;
    
    public $form;
    
    public $loadData = true;
    
    public $basic_fields = array();
    
    public $date_fields = array();
    
    public $subform_fields = array();
  
  	public $file_fields = array();
  
  	public $upload_options = array();
    
    public $user;
  
  	public $last_id;
  
  	public $created_by;
    
    public function __construct($config = array(), MVCFactoryInterface $factory = null, FormFactoryInterface $formFactory = null)
    {
        parent::__construct($config, $factory);
        
        $this->app = Factory::getApplication();
        
        $this->input = $this->app->input;
        
        $this->today = Factory::getDate()->toSQL();
        
        $this->user = Factory::getUser();
        
        $this->table_columns = TfDb::get_table_columns($this->table_name);
    }
    
    public function getForm($data = array(), $loadData = true)
    {
        // Get the form
        $this->form = $this->loadForm($this->option . '.' . $this->getName(), $this->getName(), array('control' => 'jform', 'load_data' => $loadData));
        
        if (empty($this->form))
        {
            return false;
        }
        
        $this->complete_form();
        
        $this->bind_form();
        
        return $this->form;
    }
    
    protected function loadFormData()
    {
        // Check the session for previously entered form data.
        $app = Factory::getApplication();
        $data = $app->getUserState($this->option . '.edit.' . $this->getName() . '.data', array());

        if (empty($data) && ($this->loadData))
        {
            $data = $this->getItem();
        }
        
        return $data;
    }
    
    public function complete_form()
    {
        $this->add_fieldset('details');
        
        $this->add_fieldset('captcha', 'Captcha');
        
        $fieldset = 'details';
        $element = '<field name="custom_redirect" type="hidden" />';
        $this->set_field($element, $fieldset);
                
        $fieldset = 'details';
        $element = '<field name="custom_message" type="hidden" />';
        $this->set_field($element, $fieldset);
        
        $fieldset = 'captcha';
        $element = '<field name="captcha" type="number" label="' . strtoupper($this->option) . '_CAPTCHA" />';
        $this->set_field($element, $fieldset);
        
        if (array_key_exists('id', $this->table_columns))
        {
            $fieldset = 'details';
            $element = '<field name="id" type="hidden" default="0" />';
            $this->set_field($element, $fieldset);
        }
        
        foreach ($this->basic_fields as $field)
        {
            switch ($field)
            {
                case 'published' :
                    $fieldset = 'details';
                    $element = '<field name="published" type="hidden" />';
                    break;
                    
                /* 
                case 'id' :
                    $fieldset = 'details';
                    $element = '<field name="id" type="hidden" default="0" />';
                    break;
                
                case 'custom_redirect' :
                    $fieldset = 'details';
                    $element = '<field name="custom_redirect" type="hidden" />';
                    break;
                
                case 'custom_message' :
                    $fieldset = 'details';
                    $element = '<field name="custom_message" type="hidden" />';
                    break;
                    
                case 'captcha' :
                    $fieldset = 'captcha';
                    $element = '<field name="captcha" type="number" label="' . strtoupper($this->option) . '_CAPTCHA" />';
                    break;
                */
                
                case 'created' :
                    $fieldset = 'details';
                    $element = '<field name="created" type="hidden" />';
                    break;
                    
                case 'modified' :
                    $fieldset = 'details';
                    $element = '<field name="modified" type="hidden" />';
                    break;
                    
                case 'created_by' :
                    $fieldset = 'details';
                    $element = '<field name="created_by" type="hidden" />';
                    break;
                    
                case 'alias' :
                    $fieldset = 'details';
                    $element = '<field name="alias" type="hidden" />';
                    break;
                    
                case 'hits' :
                    $fieldset = 'details';
                    $element = '<field name="hits" type="hidden" />';
                    break;
                    
                case 'access' :
                    $fieldset = 'details';
                    $element = '<field name="access" type="hidden" />';
            }
            
            $this->set_field($element, $fieldset);
        }
    }
    
    public function save($data)
    {
        // A. Check for captcha
        if (isset($data['answer']))
        {
            if ($data['answer'] != $data['captcha'])
            {
                Factory::getApplication()->enqueueMessage('<strong>' . Text::_('COM_TF_ERROR_INCORRECT_CAPTCHA') . '</strong>', 'error');
                
                return false;
            }
            
            unset($data['captcha']);
            unset($data['answer']);
        }
        
        // B. Check for valid email
        if (isset($data['email']))
        {
            $data['email'] = strtolower($data['email']);
            if (!filter_var($data['email'], FILTER_VALIDATE_EMAIL))
            {
                Factory::getApplication()->enqueueMessage('<strong>' . Text::_('COM_TF_ERROR_INVALID_EMAIL') . '</strong>', 'error');
                   
                return false;
            }
            
            if (!$data['created_by'])
            {
                $data['created_by'] = TfUser::find_user($data['email']);
                if (!$data['created_by'])
                {
                    $juser = TfUser::create_user($data);
                    $data['created_by'] = $juser->id;
                }
            }
        }
        
        $data = $this->prepare_data($data, $this->table_name, $this->date_fields, $this->subform_fields);
      
      	$return = parent::save($data);
      
      	// Set created by
      	$this->created_by = $data['created_by'];
      
      	// Get ID of last inserted row
      	if (array_key_exists('id', $this->table_columns) && !$data['id'])
        {
        	$last_record = TfDb::get_record($this->table_name, array(), 'id DESC', 'id');
          	$this->last_id = $last_record->id;
        }
        
        return $return;
    }
    
    public function set_field($element, $fieldset = 'default', $group = null, $replace = false)
    {
        $xml = new \SimpleXMLElement($element);
        
        $this->form->setField($xml, $group, $replace, $fieldset);
    }
    
    public function set_fields($elements, $fieldset = 'default', $group = null, $replace = false)
    {
        foreach ($elements as $element)
        {
            $this->set_field($element, $fieldset, $group, $replace);
        }
    }
    
    // Add fieldset to the form
    public function add_fieldset($name, $label = '', $description = '', $group = '')
    {
        $element = '<form>';
        if ($group != '')
        {
            $element .= '<fields name="' . $group . '">';
        }
        
        $element .= '<fieldset name="' . $name . '"';
        if ($label != '')
        {
            $element .= ' label="' . $label . '"';
        }
        if ($description != '')
        {
            $element .= ' description="' . $description . '"';
        }
        $element .= '></fieldset>';
        
        if ($group != '')
        {
            $element .= '</fields>';
        }
        
        $element .= '</form>';
        
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
}