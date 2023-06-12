<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library;

defined('_JEXEC') or die;

use Joomla\CMS\HTML\HTMLHelper;

// Depreciated: Use Section, Container and Column Classes in Air
class TfStyle
{
    public static $fw = 'bs';
  
  	public static $section_classes = array();
  
  	public static $container_classes = array();
  
  	public static function get_section_class($var, $with_class = true, $fw = 'bs')
    {
        self::$fw = $fw;
      
      	if (!is_array($var))
        {
            $var = (array) $var;
        }
      
      	self::$section_classes = $var;
        
      	$function_name = 'get_section_classes_' . self::$fw;
      	self::$function_name();
      
      	$class = '';
      	foreach (self::$section_classes as $k => $classes)
        {
        	$class .= $classes . ' ';	  
        }
      	
        // $class = $var['section_class'] . ' ' . $var['section_padding'] . ' ' . $var['section_margin'] . ' ' . $var['align'] . ' ' . $var['section_text'] . ' ' . $var['section_bg'];
        
        if ($var['bg_image'])
        {
            $class .= ' bg-image ' . $var['bg_attach'] . ' ' . $var['bg_blend'];
        }
        
        $class = trim(preg_replace('/\s+/', ' ', $class));
        
        $section_class = !empty($class) ? ' class="' . $class . '"' : '';
        
        return $with_class ? $section_class : $class;
    }
    
    public static function get_container_class($var, $with_class = true)
    {
        if (!is_array($var))
        {
            $var = (array) $var;
        }
        
        $class = $var['container_type'] . ' ' . $var['container_class'] . ' ' . $var['container_padding'];
        
        $class = trim(preg_replace('/\s+/', ' ', $class));
        
        $container_class = !empty($class) ? ' class="' . $class . '"' : '';
        
        return $with_class ? $container_class : $class;
    }
    
    public static function get_section_style($var)
    {
        if (!is_array($var))
        {
            $var = (array) $var;
        }
        
        $style = '';
        if ($var['bg_image'])
        {
            $image = HTMLHelper::cleanImageURL($var['bg_image']);
            $style = ' style="background-image: url(\'' . $image->url . '\')"';
        }
        
        return $style;
    }
    
    public static function get_column_class($var, $with_class = true)
    {
        if (!is_array($var))
        {
            $var = (array) $var;
        }
        
        $class = $var['column_class'] . ' ' . $var['padding'] . ' ' . $var['border'] . ' ' . $var['border_radius'] . ' ' . $var['align'] . ' ' . $var['shadow'];
        $class .= ' ' . $var['hover'] . ' ' . $var['transition'];
        
        $class = trim(preg_replace('/\s+/', ' ', $class));
        
        $column_class = !empty($class) ? ' class="' . $class . '"' : '';
        
        return $with_class ? $column_class : $class;
    }
    
    public static function get_button_class($var)
    {
        if (!is_array($var))
        {
            $var = (array) $var;
        }
        
        $class = $var['button_class'] . ' ' . $var['bg'] . ' ' . $var['text'] . ' ' . $var['border_radius'] . ' ' . $var['shadow'] . ' ' . $var['hover'] . ' ' . $var['transition'];
        
        $class = trim(preg_replace('/\s+/', ' ', $class));
        
        return $class;
    }
  
  	public static function get_section_classes_uk()
    {
    	switch (self::$section_classes['section_bg'])
        {
          case 'bg-primary' :
            self::$section_classes['section_bg'] = 'uk-background-primary';
            break;
            
          case 'bg-secondary' :
            self::$section_classes['section_bg'] = 'uk-background-secondary';
            break;
            
          case 'bg-light' :
            self::$section_classes['section_bg'] = 'uk-background-muted';
            break;
        }
      
      	switch (self::$section_classes['section_padding'])
        {
          case 'py-1' :
            self::$section_classes['section_padding'] = 'uk-padding-small uk-padding-remove-horizontal';
            break;
            
          case 'py-3' :
            self::$section_classes['section_padding'] = 'uk-padding uk-padding-remove-horizontal';
            break;
            
          case 'py-5' :
            self::$section_classes['section_padding'] = 'uk-padding-large uk-padding-remove-horizontal';
            break;
        }
      
      	switch (self::$section_classes['section_margin'])
        {
          case 'my-1' :
            self::$section_classes['section_margin'] = 'uk-margin-small';
            break;
            
          case 'my-3' :
            self::$section_classes['section_margin'] = 'uk-margin-medium';
            break;
            
          case 'my-5' :
            self::$section_classes['section_margin'] = 'uk-margin-large';
            break;
            
         case 'mt-3' :
            self::$section_classes['section_margin'] = 'uk-margin-top';
            break;	   	
            
      	case 'mb-3' :
            self::$section_classes['section_margin'] = 'uk-margin-bottom';
            break;
        }
      
      	switch (self::$section_classes['align'])
        {
          case 'text-start' :
            self::$section_classes['align'] = 'uk-text-left';
            break;
            
          case 'text-center' :
            self::$section_classes['align'] = 'uk-text-center';
            break;
            
          case 'text-end' :
            self::$section_classes['align'] = 'uk-text-right';
            break;
        }
      
      	self::$section_classes['section_text'] = 'uk-' . self::$section_classes['section_text'];
    }
  
  	public static function get_section_classes_pico()
    {
    	
    }
  
  	public static function get_section_classes_bs()
    {
    	
    }
}