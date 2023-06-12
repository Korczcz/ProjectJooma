<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library\View\JForm;

defined('_JEXEC') or die;

use Joomla\CMS\Language\Text;

class TfTextarea
{
  	public static $class_ta = '';
  
  	public static function get_output($field, $fw = 'bs')
    {
      	$function_name = 'set_class_' . $fw;
      	self::$function_name();
      
      	$output = '<textarea';
      	if (!empty(self::$class_ta))
        {
        	$output .= ' class="' . self::$class_ta . '"';
        }
      	$output .= ' name="' . $field->name . '"';
      
      	if ($field->hint)
        {
        	$output .= ' placeholder="' . Text::_($field->hint) . '"';
        }
      
      	if ($field->rows)
        {
        	$output .= ' rows="' . $field->rows . '"';
        }
      
      	if ($field->required)
        {
        	$output .= ' required';
        }

        $output .= '>';
      
      	if ($field->value)
        {
        	$output .= htmlspecialchars($field->value, ENT_COMPAT, 'UTF-8');
        }
      
      	$output .= '</textarea>';
      
      	return $output;
    }
  
  	public static function set_class_bs()
    {
     	self::$class_ta = 'form-control';
    }
  
  	public static function set_class_uk()
    {
     	self::$class_ta = 'uk-textarea';
    }
}