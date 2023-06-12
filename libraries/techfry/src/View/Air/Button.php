<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library\View\Air;

defined('_JEXEC') or die;

class Button
{
    public static $fw;
  
  	public static $config;
  
  	public static $button_text;
  
  	public static $base_class;
  
  	public static $button_class = '';
  
  	public static $url;
  
  	public static $target;
  
  	public static function get_output($text, $config = array(), $extra = array('url' => '#'), $fw = 'bs')
    {
        // config - button_class, type, outline, border_radius, shadow, hover
        // extra - url, target

        if ($text == '')
        {
            return;
        }
      	
      	self::$fw = $fw;
      	self::$button_text = $text;
      	self::$url = $extra['url'];
      	self::$target = $extra['target'] ?? '';
      
      	self::get_class($config, $fw);
      	
      	$output = '<a href="' . self::$url . '"';
        $output .= ' class="' . trim(self::$button_class) . '"';
        $output .= ' title="' . self::$button_text . '"';
        $output .= isset(self::$target) ? ' target="' . self::$target . '"' : '';
        $output .= ' role="button">';
        $output .= self::$button_text . '</a>';
        
        return $output; 
    }
  
  	public static function get_class($config = array(), $fw = 'bs')
    {
    	// $config - button_class, type, size, outline, border_radius, shadow, hover
      	// type: btn-prmary, btn-secondary, btn-success, btn-danger, btn-warning, btn-info, btn-light, btn-dark
      	// size: btn-sm, btn-lg
      
      	self::$fw = $fw;
      	self::$config = $config;
      	
      	self::$button_class = ''; // Reset button class for multiple buttons in one script
      
      	$function_name = 'get_class_' . self::$fw;
      
      	self::$function_name();
      	
      	if (empty(self::$button_class))
        {
        	self::$button_class = self::$base_class;		
          	$class_options = array('button_class', 'type', 'size', 'border_radius', 'shadow', 'hover', 'transition');
            foreach ($class_options as $class_option)
            {
              	if (isset(self::$config[$class_option]) && self::$config[$class_option])
              	{
                  	self::$button_class .= ' ' . self::$config[$class_option];
              	}
            }  
        }
        
        return self::$button_class;
    }
  
  	public static function get_class_bs()
    {
      	self::$base_class = 'btn';
      
      	// If config is empty, set default class
      	if (empty(self::$config) && empty(self::$config['button_class']))
        {
        	self::$button_class = 'btn btn-sm btn-outline-primary';
        }
      	else
        {
        	if (isset(self::$config['outline']) && self::$config['outline'])
            {
                self::$config['type'] = 'btn-outline' . substr(self::$config['type'], 3);
            }
        }
    }
  
  	public static function get_class_uk()
    {
    	self::$base_class = 'uk-button';
      	
      	// If config is empty, set default class
      	if (empty(self::$config) && empty(self::$config['button_class']))
        {
          	self::$button_class = 'uk-button uk-button-primary uk-button-small';
          
          	return;
        }
      
      	switch (self::$config['type'])
        {
          	case 'btn-primary' :
            	self::$config['type'] = 'uk-button-primary';
            	break;
            
            case 'btn-secondary' :
            	self::$config['type'] = 'uk-button-secondary';
            	break;
            
            case 'btn-warning' :
            case 'btn-danger' :
            	self::$config['type'] = 'uk-button-danger';
            	break;
            
            default :
            	self::$config['type'] = 'uk-button-default';
            	break;
        }
      
      	switch (self::$config['size'])
        {
          	case 'btn-sm' :
            	self::$config['size'] = 'uk-button-small';
            	break;
            
          	case 'btn-lg' :
            	self::$config['size'] = 'uk-button-large';
            	break;
        }
    }
  
  	public static function get_class_amp()
    {
    	self::$base_class = 'btn';
      
      	// If config is empty, set default class
      	if (empty(self::$config) && empty(self::$config['button_class']))
        {
        	self::$button_class = 'btn btn-primary';
        }
      	else
        {
        	
        }
    }
}