<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library\View\JForm;

defined('_JEXEC') or die;

use Joomla\CMS\Factory;
use Joomla\CMS\Language\Text;

class TfList
{
  	public static $select_class = '';
  
  	public static function get_output($field, $fw = 'bs')
    {
      	$function_name = 'set_class_' . $fw;
      	self::$function_name();
        
      	if ($field->layout == 'joomla.form.field.list-fancy-select')
        {
        	$output = self::layout_fancy($field);  
        }
      	else
        {
        	$output = self::layout_default($field);
        }
      
      	return $output;
    }
  
  	public static function layout_default($field)
    {      
      	$output .= '<select';
      	if (!empty(self::$select_class))
        {
        	$output .= ' class="' . self::$select_class . '"';
        }
      	$output .= ' name="' . $field->name . '"';
      
      	if ($field->required)
        {
        	$output .= ' required';
        }
      
      	if ($field->readonly || $field->disabled)
        {
        	$output .= ' disabled="disabled"';
        }
      
      	if ($field->multiple)
        {
        	$output .= ' multiple';
        }
      
      	$value = is_array($field->value) ? $field->value : (array) $field->value;
      	
      	$output .= '>';
      	foreach ($field->options as $option)
        {
         	$selected = in_array($option->value, $value) ? ' selected' : '';
          
          	$output .= '<option value="' . $option->value . '"' . $selected . '>' . $option->text . '</option>';
        }
      	$output .= '</select>';
      
      	return $output;
    }
  
  	public static function layout_fancy($field)
    {
      	Text::script('JGLOBAL_SELECT_NO_RESULTS_MATCH');
		Text::script('JGLOBAL_SELECT_PRESS_TO_SELECT');
      
      	Factory::getApplication()->getDocument()->getWebAssetManager()
    		->usePreset('choicesjs')
    		->useScript('webcomponent.field-fancy-select');
      	
      	$attr2 = ' placeholder="' . Text::_('JGLOBAL_TYPE_OR_SELECT_SOME_OPTIONS') . '" ';
      	if ($field->required) 
        {
    		$attr2 .= ' required';
		}
      
      	$output = '<joomla-field-fancy-select' . $attr2 . '>';
      
      	$output .= self::layout_default($field);
      
      	$output .= '</joomla-field-fancy-select>';
      
      	return $output;
      
    }
  
  	public static function set_class_bs()
    {
     	self::$select_class = 'form-select';
    }
  
  	public static function set_class_uk()
    {
     	self::$select_class = 'uk-select';
    }
}