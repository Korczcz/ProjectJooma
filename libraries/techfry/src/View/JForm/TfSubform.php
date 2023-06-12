<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library\View\JForm;

defined('_JEXEC') or die;

class TfSubform
{
  	public static $class_input = '';
  
  	public static function get_output($field, $fw = 'bs')
    {
      	$output = $field->input;
      	
      	// Replace icons
      	$search = array('icon-plus', 'icon-minus', 'icon-arrows-alt');
      	$replace = array('fas fa-plus', 'fas fa-minus', 'fas fa-arrows-alt');
      	
      	$output = str_replace($search, $replace, $output);

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