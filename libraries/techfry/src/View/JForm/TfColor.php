<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library\View\JForm;

defined('_JEXEC') or die;

use Joomla\CMS\Language\Text;

class TfColor
{
  	public static $input_class = '';
  
  	public static function get_output($field, $fw = 'bs')
    {      
      	$function_name = 'set_class_' . $fw;
      	self::$function_name();
      
      	$output = '<input type="' . strtolower($field->type) . '"';
      	if (!empty(self::$input_class))
        {
        	$output .= ' class="' . self::$input_class . '"';
        }
      	$output .= ' name="' . $field->name . '"';
      
      	if ($field->value)
        {
        	$output .= ' value="' . $field->value . '"';
        }
      
      	if ($field->hint)
        {
        	$output .= ' placeholder="' . Text::_($field->hint) . '"';
        }
      
      	if ($field->required)
        {
        	$output .= ' required';
        }
      
      	if ($field->readonly)
        {
        	$output .= ' readonly';
        }

      	$output .= '>';
      	
      	return $output;
    }
  
  	public static function set_class_bs()
    {
     	self::$input_class = 'form-control';
    }
  
  	public static function set_class_uk()
    {
     	self::$input_class = 'uk-input';
    }
}