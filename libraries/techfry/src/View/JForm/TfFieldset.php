<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library\View\JForm;

defined('_JEXEC') or die;

use Joomla\CMS\Language\Text;

class TfFieldset
{
  	public static $class_field = '';
  
  	public static $class_label = '';
  
  	public static $class_desc = '';
  
  	public static function get_output($fieldset, $fields, $fw = 'bs', $config = array())
    {
      	$function_name = 'set_class_' . $fw;
      	self::$function_name();
      
      	$output = '';

      	if (isset($fieldset->description) && !empty($fieldset->description))
      	{
        	$output .= '<div class="' . self::$class_desc . '">';
        	$output .= '<span class="fas fa-info-circle" aria-hidden="true"></span> ' . Text::_($fieldset->description);
        	$output .= '</div>';
      	}
      	
      	foreach ($fields as $field)
        {
          	$output .= TfField::get_output($field, $fw, $config);
        }
      
      	return $output;
    }
  
  	public static function set_class_bs()
    {
     	self::$class_field = 'mb-3';
      
      	self::$class_label = 'form-label';
      
      	self::$class_desc = 'alert alert-info';
    }
  
  	public static function set_class_uk()
    {
     	self::$class_field = 'uk-margin';
      
      	self::$class_label = 'uk-form-label';
      
      	self::$class_desc = 'uk-alert uk-alert-primary';
    }
}