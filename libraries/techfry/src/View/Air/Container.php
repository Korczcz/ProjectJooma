<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library\View\Air;

defined('_JEXEC') or die;

use TechFry\Library\TfAmp;

class Container
{
    public static $fw;
  
  	public static $container;
  
  	public static function get_class($container, $with_class = true, $fw = 'bs')
    {
        // $container - container_type, container_class, container_padding
      
      	self::$fw = $fw;
      
      	if (TfAmp::check_amp())
        {
        	self::$fw = 'amp';  
        }
      
      	if (!is_array($container))
        {
            $container = (array) $container;
        }
      
      	self::$container = $container;
        
      	$function_name = 'get_classes_' . self::$fw;
      	self::$function_name();
      
      	$class = '';
      	foreach (self::$container as $k => $classes)
        {
        	if (in_array($k, array('container_type', 'container_class', 'container_padding')))
          	$class .= $classes . ' ';
        }
        
        $class = trim(preg_replace('/\s+/', ' ', $class));
        
        $container_class = !empty($class) ? ' class="' . $class . '"' : '';
        
        return $with_class ? $container_class : $class;
    }
  
  	public static function get_classes_uk()
    {
    	switch (self::$container['container_type'])
        {
          	case 'container' :
            	self::$container['container_type'] = 'uk-container';
            	break;
            
            case 'container-fluid' :
            	self::$container['container_type'] = 'uk-container uk-container-expand';
            	break;
        }
      
      	switch (self::$container['container_padding'])
        {
          case 'py-1' :
            self::$container['container_padding'] = 'uk-padding-small uk-padding-remove-horizontal';
            break;
            
          case 'py-3' :
            self::$container['container_padding'] = 'uk-padding uk-padding-remove-horizontal';
            break;
            
          case 'py-5' :
            self::$container['container_padding'] = 'uk-padding-large uk-padding-remove-horizontal';
            break;
        }
    }
  
  	public static function get_classes_bs()
    {
    	
    }
  
  	public static function get_classes_amp()
    {
    	switch (self::$container['container_type'])
        {
          	case 'container' :
            	self::$container['container_type'] = 'container';
            	break;
            
            case 'container-fluid' :
            	self::$container['container_type'] = 'container-fluid';
            	break;
        }
      
      	switch (self::$container['container_padding'])
        {
          case 'py-1' :
            self::$container['container_padding'] = 'py-1';
            break;
            
          case 'py-3' :
            self::$container['container_padding'] = 'py-2';
            break;
            
          case 'py-5' :
            self::$container['container_padding'] = 'py-2';
            break;
        }
    }
}