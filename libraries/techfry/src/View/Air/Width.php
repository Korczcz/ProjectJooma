<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library\View\Air;

defined('_JEXEC') or die;

class Width
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
          'w-100' => 'w-100',
		  'w-75' => 'w-75',
		  'w-50' => 'w-50',
          'w-25' => 'w-25',
          'w-auto' => 'w-auto'
          );
    }
  
  	public static function get_classes_uk()
    {
     	self::$classes = array(
          'w-100' => 'uk-width-1-1',
		  'w-75' => 'uk-width-3-4',
		  'w-50' => 'uk-width-1-2',
          'w-25' => 'uk-width-1-4',
          'w-auto' => 'uk-width-auto'
          );
    }
}