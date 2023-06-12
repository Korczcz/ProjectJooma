<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library\View\Air;

defined('_JEXEC') or die;

class Position
{
    public static $fw;
  
  	public static $position;
  
  	public static $classes = array();
  
  	public static function get_class($position, $with_class = true, $fw = 'bs')
    {
        // $position (string) - absolute, relative, fixed, fixed-top, fixed-bottom
      
      	self::$fw = $fw;
      
      	if (empty($position))
        {
        	return;  
        }
          
      	self::$position = $position;
        
      	$function_name = 'get_classes_' . self::$fw;
      	self::$function_name();
        
        $class = self::$classes[$position];
        
        $position_class = !empty($class) ? ' class="' . $class . '"' : '';
        
        return $with_class ? $position_class : $class;
    }
  
  	public static function get_classes_bs()
    {
    	self::$classes = array(
          'absolute' => 'position-absolute',
          'relative' => 'position-relative',
          'fixed' => 'position-fixed',
          'fixed-top' => 'fixed-top',
          'fixed-bottom' => 'fixed-bottom'
          );
    }
  
  	public static function get_classes_uk()
    {
    	self::$classes = array(
          'absolute' => 'uk-position-absolute',
          'relative' => 'uk-position-relative',
          'fixed' => 'uk-position-fixed',
          'fixed-top' => 'uk-position-top',
          'fixed-bottom' => 'uk-position-bottom'
          );
    }
}