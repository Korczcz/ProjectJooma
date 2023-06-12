<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library\View\Front;

defined('_JEXEC') or die;

use Joomla\CMS\Factory;
use Joomla\CMS\HTML\HTMLHelper;
use Joomla\CMS\Language\Text;
use Joomla\CMS\Router\Route;
use Joomla\CMS\Uri\Uri;
use TechFry\Library\View\Air\Button;
use TechFry\Library\View\JForm\TfField;

class TfViewForm extends TfView
{
    // View class for frontend forms
    
    public $form;
  
    public $item;
  
    public $loadData = true;
  
    public $fileUpload = false;
  
    public $is_new;
  
    public $button;
  
  	public $buttons = array();
  
  	public $form_task = 'save';
  
    public $f_layout; // Form Layout

    public function initiate_form()
    {
        // Get data from model
        $this->form = $this->get('Form');
        if ($this->loadData)
        {
            $this->item = $this->get('Item');
        }
        
        $this->initiate_view();
    }
    
    // Function to start displaying form layout
    public function start_form_layout()
    {
        $wa = $this->document->getWebAssetManager();
		$wa->useScript('keepalive')
    		->useScript('form.validate');
      
      	$link = Route::_('index.php?option=' . $this->option . '&view=' . $this->view_name);
        
        echo '<form action="' . $link . '" method="post"';
        if ($this->fileUpload)
        {
            echo ' enctype="multipart/form-data"';
        }
        echo '>';
    }
    
    // Function to finish displaying form layout
    public function end_form_layout()
    {
        // Captcha Field
        if ($this->params->get('show_captcha', 0) && !$this->user->id)
        {
            $num1 = rand(1, 9);  
            $num2 = rand(1, 9);
            $answer = $num1 + $num2;
        
            $math = $num1 . ' + ' . $num2 . ' = ?';
            $hint = Text::_(strtoupper($this->option) . '_CAPTCHA') . ': ' . $num1 . ' + ' . $num2 . ' equals to';
        
            $this->form->setFieldAttribute('captcha', 'label', Text::_(strtoupper($this->option) . '_CAPTCHA') . ': ' . $math);
            $this->form->setFieldAttribute('captcha', 'hint', $hint);
            $this->form->setFieldAttribute('captcha', 'required', 'true');
          	$this->form->setFieldAttribute('captcha', 'min', 2);
          	$this->form->setFieldAttribute('captcha', 'max', 18);
          
          	$captcha_field = $this->form->getField('captcha');
          	if ($captcha_field)
            {
              	echo TfField::get_output($captcha_field, $this->framework, array('show_label' => true));
            }

            echo '<input type="hidden" name="jform[answer]" value="' . $answer . '" />';
        }
        
        // Custom Redirect
        if (!empty($this->params->get('custom_redirect', '')))
        {
            $this->form->setValue('custom_redirect', null, $this->params->get('custom_redirect'));
        }
        else
        {
            $this->form->setValue('custom_redirect', null, Uri::getInstance());
        }
        
        // Custom Message
        if (!empty($this->params->get('custom_message', '')))
        {
            $this->form->setValue('custom_message', null, $this->params->get('custom_message'));
        }
        
        echo $this->form->renderFieldset('details');
        
        echo '<input type="hidden" name="option" value="' . $this->option . '" />';
        
        echo '<input type="hidden" name="task" value="' . $this->view_name . '.' . $this->form_task . '" />';

        echo HTMLHelper::_('form.token');
        
        // Submit or Save Buttons
        if (empty($this->buttons))
        {
            $this->buttons[] = $this->params->get('button');
        }
        if (empty($this->buttons))
        {
            $this->buttons[0] = new \stdClass();
            $this->buttons[0]->text = 'Submit';
            $this->buttons[0]->button_class = Button::get_class(array(), $this->framework);
        }
        
      	foreach ($this->buttons as $button)
        {
        	$button = (array) $button;
          	$button['name'] = isset($button['name']) ? $button['name'] : 'save';
          
          	$btn_options = array();
          	if ($button['button_class'])
            {
             	$btn_options['button_class'] = $button['button_class'];
            }
          	$button['button_class'] = Button::get_class($btn_options, $this->framework);
          
          	echo '<input type="submit" name="' . $button['name'] . '" class="' . $button['button_class'] . '" value="' . $button['text'] . '" />';
        }
		
        echo '</form>';
    }
    
    // Renders fieldset legend (label), description and all fields (Depreciated : Use TfFieldset)
    public function render_fieldset($fieldset, $show_label = true)
    {
    	$output = '';
      
      	if (isset($fieldset->label) && !empty($fieldset->label) && $show_label)
      	{
        	$output .= '<fieldset class="border border-primary p-3 mb-2 shadow">';
        	$output .= '<legend class="float-none w-auto p-2">' . Text::_($fieldset->label) . '</legend>';
      	}

      	if (isset($fieldset->description) && !empty($fieldset->description))
      	{
        	$output .= '<div class="alert bg-light alert-info">';
        	$output .= '<span class="fas fa-info-circle" aria-hidden="true"></span> ' . Text::_($fieldset->description);
        	$output .= '</div>';
      	}

      	$output .= $this->form->renderFieldset($fieldset->name);
        
        if (isset($fieldset->label) && !empty($fieldset->label) && $show_label)
        {
            $output .= '</fieldset>';
        }
        
        return $output;
    }
    
    protected function _prepareDocument()
    {
        $app = Factory::getApplication();
        $title = null;
        
        // 01. Page heading of document
		$menus = $app->getMenu();
		$menu = $menus->getActive();
		if ($menu)
		{
			$this->params->def('page_heading', $this->params->get('page_title', $menu->title));
		}
        
        // 02. Title of document
        $title = $this->params->get('page_title', $menu->title);
        
        $this->setDocumentTitle($title);
    }
}