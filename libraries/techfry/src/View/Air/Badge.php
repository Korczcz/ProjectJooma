<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library\View\Air;

defined('_JEXEC') or die;

class Badge
{
    public static $fw;
  
  	public static $config;
  
  	public static $text;
  
  	public static $badge_class;
  
  	public static function get_output($text, $config = array(), $fw = 'bs')
    {
        // config - badge_class, type, text, border_radius
        
        // TO DO: Alternate content - total rows count from tabe based on consitions
        
        if ($text == '')
        {
            return;
        }
        
        if (!is_array($config))
        {
            $config = (array) $config;
        }
      
      	self::$fw = $fw;
      	self::$config = $config;
      	self::$text = $text;
      
      	$function_name = 'get_class_' . $fw; 
        self::$function_name();
        
        $output = ' <span class="' . trim(self::$badge_class) . '">';
            $output .= $text;
        $output .= '</span>';
        
        return $output;
    }
  
  	public static function get_class_bs()
    {
    	self::$badge_class = 'badge text-bg-' . self::$config['type'] . ' ' . self::$config['badge_class'] . ' ' . self::$config['text'] . ' ' . self::$config['border_radius'];
    }
  
  	public static function get_class_uk()
    {
     	self::$badge_class = 'uk-label uk-label-' . self::$config['type'] . ' ' . self::$config['badge_class'] . ' ' . self::$config['text'] . ' ' . self::$config['border_radius']; 
    }
  
  	public static function get_class_pico()
    {
      
    }
}