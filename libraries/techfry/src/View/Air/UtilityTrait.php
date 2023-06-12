<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library\View\Air;

defined('_JEXEC') or die;

trait UtilityTrait
{
	public static $fw = 'bs';
  
  	public static $config = array();
  
  	public static $class;
  
  	public static $classes = array();
  	
  	// 01. Returns string based on configuration
  	public static function get_class($config = array(), $with_class = true, $fw = 'bs')
    {
     	if (!is_array($config))
        {
        	$config = (array) $config;
        }
      
      	self::$fw = $fw;
      	self::$config = $config;
      	
      	$function_name = 'get_class_' . $fw;
      
      	self::$function_name();
      
      	$class_str = trim(preg_replace('/\s+/', ' ', self::$class));
      
      	$class = !empty($class_str) ? ' class="' . $class_str . '"' : '';
      
      	return $with_class ? $class : $class_str;
    }
  
  	// Returns array with different classes
  	public static function get_classes($fw = 'bs')
    {      
      	self::$fw = $fw;
      	
      	$function_name = 'get_classes_' . $fw;
      
      	self::$function_name();
      
      	return self::$classes;
    }
}