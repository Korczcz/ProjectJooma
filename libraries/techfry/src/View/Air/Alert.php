<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library\View\Air;

defined('_JEXEC') or die;

use TechFry\Library\TfAmp;

class Alert
{
    public static $fw;
  
  	public static $text;
  
  	public static $config;
  
  	public static function get_output($text, $config = array(), $fw = 'bs')
    {
        // config - type (light, primary, success, warning, danger), dismiss, alert_class
        
        if ($text == '')
        {
            return;
        }
      
      	self::$fw = $fw;
      	self::$text = $text;
      	self::$config = $config;
      
      	if (TfAmp::check_amp())
        {
        	self::$fw = 'amp';  
        }
      
      	$function_name = 'get_output_' . self::$fw;
      
      	return self::$function_name();
    }
  
  	public static function get_output_bs()
    {
    	$class = 'alert alert-' . self::$config['type'] . ' ' . self::$config['alert_class'];
        if (isset(self::$config['dismiss']) && self::$config['dismiss'])
        {
            $class .= ' alert-dismissible fade show';
        }
        
        $output = '<div class="' . $class . '" role="alert">';
            
            $output .= self::$text;
            
            if (isset(self::$config['dismiss']) && self::$config['dismiss'])
            {
                $output .= '<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>';
            }
            
        $output .= '</div>';
        
        return $output;    
    }
  
  	public static function get_output_uk()
    {
        $output = '<div class="uk-alert-' . self::$config['type'] . ' ' . self::$config['alert_class'] . '" uk-alert>';
      
      		if (isset(self::$config['dismiss']) && self::$config['dismiss'])
            {
                $output .= '<a class="uk-alert-close" uk-close></a>';
            }	
            
            $output .= self::$text;
            
        $output .= '</div>';
        
        return $output;  
    }
  
  	public static function get_output_amp()
    {
    	$class = 'toast toast-' . self::$config['type'] . ' ' . self::$config['alert_class'];
        
        $output = '<div class="' . $class . '" role="alert">';
            
            $output .= self::$text;
            
        $output .= '</div>';
        
        return $output;    
    }
}