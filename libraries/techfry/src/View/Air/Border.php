<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library\View\Air;

defined('_JEXEC') or die;

class Border
{
    public static $classes = array();
  	
  	public static function get_classes($fw = 'bs')
    {
     	$function_name = 'get_classes_' . $fw;
      
      	self::$function_name();
      
      	return self::$classes;
    }
  
  	public static function get_classes_pico()
    {
    	
    }
  
  	public static function get_classes_bs()
    {
		self::$classes = array(
          'rounded' => 'rounded',
		  'rounded-pill' => 'rounded-pill',
		  'rounded-circle' => 'rounded-circle'
          );
    }
  
  	public static function get_classes_uk()
    {
     	self::$classes = array(
          'rounded' => 'uk-border-rounded',
		  'rounded-pill' => 'uk-border-pill',
		  'rounded-circle' => 'uk-border-circle'
          );
    }
}