<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library\View\JForm;

defined('_JEXEC') or die;

use TechFry\Library\TfAmp;

class TfField
{
  	public static $class_field = '';
  
  	public static $class_label = '';
  
  	public static $class_desc = '';
  
  	public static function get_output($field, $fw = 'bs', $config = array())
    {
        // $field is joomla form field object
      	// $config - show_label
      
      	if (TfAmp::check_amp())
        {
        	$fw = 'amp';  
        }
      	
      	$function_name = 'set_class_' . $fw;
      	self::$function_name();
      	
      	$output = '';
      	
      	if ($field->type != 'Hidden')
        {
        	$output .= '<div class="' . self::$class_field . '">';  
        }
      
      	// Label
      	if (isset($config['show_label']) && $config['show_label'])
        {
        	$hidden_label = $field->getAttribute('hiddenLabel');
          	if (!$hidden_label)
            {
            	self::$class_label = trim(self::$class_label . ' ' . $field->getAttribute('labelclass'));
              
              	$field->__set('labelclass', self::$class_label);
          		$output .= $field->label;  
            }
        }
      
		// Field
      	switch ($field->type)
        {
          	case 'Text' :
          	case 'Email' :
          	case 'Url' :
            	$output .= TfText::get_output($field, $fw);
            	break;
            
          	case 'Textarea' :
            	$output .= TfTextarea::get_output($field, $fw);
            	break;
            
            case 'List' :
            case 'Filelist' :
            case 'Folderlist' :
            case 'Imagelist' :
            case 'SQL' :
            	$output .= TfList::get_output($field, $fw);
            	break;
            
             case 'Password' :
            	$output .= TfPassword::get_output($field, $fw);
            	break;
            
            case 'Number' :
            	$output .= TfNumber::get_output($field, $fw);
            	break;
            
            case 'Calendar' :
            	$output .= TfCalendar::get_output($field, $fw);
            	break;
            
          	case 'Checkbox' :
            	$output .= TfCheckbox::get_output($field, $fw);
            	break;
            
            case 'Checkboxes' :
            	$output .= TfCheckboxes::get_output($field, $fw);
            	break;
            
          	case 'Radio' :
              	$output .= TfRadio::get_output($field, $fw);
            	break;
            
          	case 'Editor' :
            	$output .= TfEditor::get_output($field, $fw);
            	break;
            
            case 'File' :
            	$output .= TfFile::get_output($field, $fw);
            	break;
            
          	case 'Subform' :
            	$output .= TfSubform::get_output($field, $fw);
            	break;
            
            case 'Color' :
            	$output .= TfColor::get_output($field, $fw);
            	break;
            
            case 'Hidden' :
            	$output .= TfHidden::get_output($field, $fw);
            	break;
            
          	case 'Captcha' :
            	$output .= TfCaptcha::get_output($field, $fw);
            	break;
            
            case 'Integer' :
            	$output .= TfInteger::get_output($field, $fw);
            	break;
            
            default :
            	$output .= $field->input;
            	break;
        }
      	
      	// Description or Help Text
      	if ($field->description && (!$field->getAttribute('hiddenDescription')))
        {
      		$output .= '<small class="' . self::$class_desc . '">' . $field->description . '</small>';
        }
      	
      	if ($field->type != 'Hidden')
        {
        	$output .= '</div>';  
        }
      	
      	return $output;
    }
  
  	public static function set_class_bs()
    {
     	self::$class_field = 'mb-3';
      
      	self::$class_label = 'form-label';
      
      	self::$class_desc = 'form-text';

    }
  
  	public static function set_class_uk()
    {
     	self::$class_field = 'uk-margin';
      
      	self::$class_label = 'uk-form-label';
      
      	self::$class_desc = 'uk-text-meta';
    }
  
  	public static function set_class_amp()
    {
     	self::$class_field = 'form-group';
      
      	self::$class_label = 'form-label';
      
      	self::$class_desc = '';
    }
}