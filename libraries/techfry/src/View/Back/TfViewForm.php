<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library\View\Back;

\defined('_JEXEC') or die;

use Joomla\CMS\Factory;
use Joomla\CMS\HTML\HTMLHelper;
use Joomla\CMS\Language\Text;
use Joomla\CMS\MVC\View\GenericDataException;
use Joomla\CMS\MVC\View\HtmlView as BaseHtmlView;
use Joomla\CMS\Toolbar\Toolbar;
use Joomla\CMS\Toolbar\ToolbarHelper;

class TfViewForm extends TfView
{
    // View class for backend forms
    protected $form;
  	protected $item;
  	protected $state;
  
    // Define in view
    public $main_fields = array('title', 'alias');
    public $loadData = true;
    public $fileUpload = false;
    
    public $fieldsets;
    
    public $first_fieldset;
    
    public $is_new;
    
    public $childbar;
    
    public $icon = 'fas fa-edit';

    public function display($tpl = null)
    {
        $this->initiate_form();

		// Display the template
		parent::display($tpl);
    }
    
    public function initiate_form()
    {
        parent::initiate_view();
        
        // Get data from model
        $this->form = $this->get('Form');
        
        if ($this->loadData)
        {
            $this->item = $this->get('Item');
        }
      	// $this->state = $this->get('State');
        
        $this->fieldsets = $this->form->getFieldsets();
        $this->first_fieldset = array_keys($this->fieldsets)[0];
    }
    
    protected function addToolbar()
    {
      	Factory::getApplication()->getInput()->set('hidemainmenu', true);
      	$this->is_new = ($this->loadData) ? ($this->item->id == 0) : 0;
		$this->toolbar = Toolbar::getInstance();
      
      	// 01. Title
      	ToolbarHelper::title(Text::_(strtoupper($this->option) . '_' . strtoupper($this->view_name) . '_' . ($this->is_new ? 'ADD' : 'EDIT')), $this->icon);
		
      	// 02. Back
      	if (in_array('back', $this->toolbar_buttons))
        {
            ToolbarHelper::back();
        }
      
      	// 03. Dashboard
		if (in_array('dashboard', $this->toolbar_buttons))
        {
            $this->toolbar->linkButton('Dashboard')
                ->text('COM_TF_DASHBOARD')
                ->url('index.php?option=' . $this->option . '&view=dashboard')
                ->icon('fas fa-th');
        }
        
        $toolbarButtons = array();
        
        if ($this->layout == 'edit')
        { 
          	if (in_array('apply', $this->toolbar_buttons))
            {
                $this->toolbar->apply($this->view_name . '.apply');
            }
          
          	if (in_array('save', $this->toolbar_buttons))
            {
                $toolbarButtons[] = ['save', $this->view_name . '.save'];
            }
          
          	if (in_array('save2new', $this->toolbar_buttons))
            {
                $toolbarButtons[] = ['save2new', $this->view_name . '.save2new'];
            }
          
          	if (in_array('save2copy', $this->toolbar_buttons))
            {
                $toolbarButtons[] = ['save2copy', $this->view_name . '.save2copy'];
            }
          
          	// To Do: Add save to menu button
          
            ToolbarHelper::saveGroup($toolbarButtons, 'btn-success');
        }
        
        if (in_array('cancel', $this->toolbar_buttons))
        {
            $this->toolbar->cancel($this->view_name . '.cancel', $this->is_new ? 'JTOOLBAR_CANCEL' : 'JTOOLBAR_CLOSE');
        }
        
        if (in_array('preview', $this->toolbar_buttons))
        {
            ToolbarHelper::custom($this->view_name . '.preview', 'eye', 'eye', 'COM_TF_TOOLBAR_PREVIEW', false);
        }
        
        if (in_array('process', $this->toolbar_buttons))
        {
            ToolbarHelper::custom($this->view_name . '.process', 'refresh', 'refresh', 'COM_TF_TOOLBAR_PROCESS', false);
        }
        
        $this->custom_toolbar_buttons();
      	
      	$this->toolbar->divider();
      
        $this->toolbar->inlinehelp();
        if ($this->help_url)
        {
        	$this->toolbar->help('', false, $this->help_url);  
        }
    }
    
    // Placeholder function to add custom toolbar buttons in view file
    public function custom_toolbar_buttons()
    {
        
    }
    
    // Fucntion to start displaying list layout
    public function start_form_layout()
    {
        $wa = $this->document->getWebAssetManager();
        $wa->useScript('keepalive')
            ->useScript('form.validate');
        
        echo '<form action="index.php?option=' . $this->option . '&view=' . $this->view_name . '&layout=edit&id=';
        echo ($this->loadData) ? $this->item->id : 0;
        echo '" method="post"';
        if ($this->fileUpload)
        {
            echo ' enctype="multipart/form-data"';
        }
        echo ' name="adminForm" id="item-form" class="form-validate">';
        
        // Title and Alias
        if (!empty($this->main_fields))
        {
            echo '<div class="row title-alias form-vertical mb-3">';
                foreach ($this->main_fields as $main_field)
                {
                    echo '<div class="col-12 col-md-6">';
                        echo $this->form->renderField($main_field);
                    echo '</div>';
                }
            echo '</div>';
        }
        
        echo '<div class="main-card">';
        echo HTMLHelper::_('uitab.startTabSet', 'myTab', array('active' => $this->first_fieldset));
    }
    
    // Function to finisy displaying list layout
    public function end_form_layout()
    {
        echo HTMLHelper::_('uitab.endTabSet');
        
        echo '<input type="hidden" name="task" value="' . $this->view_name . '.edit" />';

        echo HTMLHelper::_('form.token');
        
        echo '</div>';

        echo '</form>';
    }
    
    // Add tab in edit layout with form fieldset
    public function add_tab_form($name, $text = '')
    {
       	// $name - fieldset name; $text - depreciated (fieldset label is used)
      
      	echo HTMLHelper::_('uitab.addTab', 'myTab', $name, Text::_($this->fieldsets[$name]->label));
            
            $this->render_fieldset($this->fieldsets[$name]);
        
        echo HTMLHelper::_('uitab.endTab');
    }
    
    // Add tab in edit layout with sub template file
    public function add_tab_tmpl($name, $text)
    {
        echo HTMLHelper::_('uitab.addTab', 'myTab', $name, Text::_($text));
            
            echo $this->loadTemplate($name);
            
        echo HTMLHelper::_('uitab.endTab');
    }
    
    // Add tab in edit layout with two fieldsets
    public function add_tab_forms($names, $text, $cols = array(9, 3))
    {
        echo HTMLHelper::_('uitab.addTab', 'myTab', $names[0], Text::_($text));
        
        echo '<div class="row">';
        
            foreach ($names as $key => $name)
            {
                echo '<div class="col-lg-' . $cols[$key] . '">';
                
                    $this->render_fieldset($this->fieldsets[$name]);
                
                echo '</div>';
            }
		
	    echo '</div>';
        
        echo HTMLHelper::_('uitab.endTab');
    }
    
    // Function to add all form fieldsets
    public function add_fieldsets()
    {
        foreach ($this->fieldsets as $name => $fieldSet)
        {
            echo HTMLHelper::_('uitab.addTab', 'myTab', $name, Text::_($fieldSet->label));

                $this->render_fieldset($fieldSet);
            
            echo HTMLHelper::_('uitab.endTab');
        }
    }
    
    // Renders fieldset legend (label), description and all fields
    public function render_fieldset($fieldset)
    {
            if (isset($fieldset->label) && !empty($fieldset->label))
            {
                echo '<fieldset class="options-form">';
                echo '<legend>' . Text::_($fieldset->label) . '</legend>';
            }
            
            if (isset($fieldset->description) && !empty($fieldset->description))
            {
                echo '<div class="alert alert-info">';
                    echo '<span class="icon-info-circle" aria-hidden="true"></span> ' . Text::_($fieldset->description);
                echo '</div>';
            }
            
            echo '<div class="form-horizontal">';
                echo $this->form->renderFieldset($fieldset->name);
            echo '</div>';
        
        if (isset($fieldset->label) && !empty($fieldset->label))
        {
            echo '</fieldset>';   
        }
    }
    
    // Display table
    public function get_table($heads, $rows)
    {
        echo '<table class="table table-striped table-hover">';
            echo '<thead><tr>';
                foreach ($heads as $head)
                {
                    echo '<th>' . Text::_($head) . '</th>';
                }
            echo '</tr></thead>';
            echo '<tbody>';
            
                foreach ($rows as $row)
                {
                    echo '<tr>';
                    foreach ($row as $td)
                    {
                        echo '<td>' . $td . '</td>';
                    }
                    echo '</tr>';
                }
    
            echo '</tbody>';    
        echo '</table>';
    }
}