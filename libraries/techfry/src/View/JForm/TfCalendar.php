<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library\View\JForm;

defined('_JEXEC') or die;

class TfCalendar
{
  	public static $class_input = '';
  
  	public static function get_output($field, $fw = 'bs')
    {      
      	$function_name = 'set_class_' . $fw;
      	self::$function_name();
      
      	$output = '<input type="date"';
      	if (!empty(self::$class_input))
        {
        	$output .= ' class="' . self::$class_input . '"';
        }
      	$output .= ' name="' . $field->name . '"';
      
      	if ($field->value)
        {
        	$output .= ' value="' . $field->value . '"';
        }

        $output .= '>';
      
      	// $output .= $field->renderField();
      
      	return $output;
    }
  
  	public static function set_class_bs()
    {
     	self::$class_input = 'form-control';
    }
  
  	public static function set_class_uk()
    {
     	self::$class_input = 'uk-input';
    }
}