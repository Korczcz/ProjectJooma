<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library\View\Air;

defined('_JEXEC') or die;

class Column
{
    use UtilityTrait;
  
  	public static $column;
  
  	public static function get_class_uk()
    {
     	self::get_class_common();
    }
  
  	public static function get_class_pico()
    {
    	
    }
  
  	public static function get_class_bs()
    {
    	self::get_class_common();
    }
  
  	public static function get_class_common()
    {
    	self::$column = self::$config;
      
      	if (self::$column['align'])
        {
         	$align = Align::get_classes(self::$fw);
          	self::$column['align'] = $align[self::$column['align']];
        }
      
      	if (self::$column['border_radius'])
        {
         	$radius = Border::get_classes(self::$fw);
          	self::$column['border_radius'] = $radius[self::$column['border_radius']];
        }
      
      	if (self::$column['padding'])
        {
         	$padding = Padding::get_classes(self::$fw);
          	self::$column['padding'] = $padding[self::$column['padding']];
        }
      
      	if (self::$column['shadow'])
        {
         	$shadow = Shadow::get_classes(self::$fw);
          	self::$column['shadow'] = $shadow[self::$column['shadow']];
        }
      
      	self::$class = '';
      	foreach (self::$column as $k => $classes)
        {
        	if (in_array($k, array('column_class', 'padding', 'border', 'border_radius', 'align', 'shadow', 'hover', 'transition')))
            {
             	self::$class .= $classes . ' '; 
            }
        }
    }
}