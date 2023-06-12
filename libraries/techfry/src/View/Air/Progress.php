<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library\View\Air;

defined('_JEXEC') or die;

class Progress
{
    public static $progress;
  
  	public static $config;
  
  	public static function get_output($progress, $config = array(), $fw = 'bs')
    {
        // config - progress_class, type
        
        if (!is_array($config))
        {
            $config = (array) $config;
        }
      
      	self::$progress = $progress;
      	self::$config = $config;
      
      	$function_name = 'get_output_' . $fw;
      
      	return self::$function_name();
    }
  
  	public static function get_output_bs()
    {
    	$class = self::$config['progress_class'] ?? '';
        
        $output = '<div class="progress">';
        
            $output .= '<div class="progress-bar ' . $class . '" role="progressbar" style="width: ' . self::$progress . '%" aria-valuenow="' . self::$progress . '" aria-valuemin="0" aria-valuemax="100">';
        
                $output .= self::$progress  . '%';
            
            $output .= '</div>';
        
        $output .= '</div>';
        
        return $output;
    }
  
  	public static function get_output_uk()
    {
    	$output = '<progress class="uk-progress" value="' . self::$progress . '" max="100"></progress>';
      
      	return $output;
    }
}