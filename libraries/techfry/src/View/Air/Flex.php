<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library\View\Air;

defined('_JEXEC') or die;

class Flex
{
    public static $fw;
  
  	public static $flex;
  
  	public static $base_class;
  
  	public static function get_class($flex, $with_class = true, $fw = 'bs')
    {
        // $flex - align, valign, direction, responsive
      
      	self::$fw = $fw;
      
      	if (!is_array($flex))
        {
            $flex = (array) $flex;
        }
      
      	self::$flex = $flex;
        
      	$function_name = 'get_classes_' . self::$fw;
      	self::$function_name();
      
      	$class = self::$base_class . ' ';
      	foreach (self::$flex as $k => $classes)
        {
        	if (in_array($k, array('align', 'valign', 'direction', 'responsive')))
            {
             	$class .= $classes . ' '; 
            }
        }
        
        $class = trim(preg_replace('/\s+/', ' ', $class));
        
        $flex_class = !empty($class) ? ' class="' . $class . '"' : '';
        
        return $with_class ? $flex_class : $class;
    }
  
  	public static function get_classes_uk()
    {
    	self::$base_class = 'uk-flex';
      
      	$align = self::$flex['align'] ?? '';
      	switch ($align)
        {
          	case 'start' :
            	self::$flex['align'] = 'uk-flex-left';
            	break;
            
            case 'center' :
            	self::$flex['align'] = 'uk-flex-center';
            	break;
            
            case 'end' :
            	self::$flex['align'] = 'uk-flex-right';
            	break;
            
            case 'between' :
            	self::$flex['align'] = 'uk-flex-between';
            	break;
            
            case 'around' :
            	self::$flex['align'] = 'uk-flex-around';
            	break;
        }
      
      	$valign = self::$flex['valign'] ?? '';
      	switch ($valign)
        {
          	case 'start' :
            	self::$flex['valign'] = 'uk-flex-top';
            	break;
            
            case 'center' :
            	self::$flex['valign'] = 'uk-flex-middle';
            	break;
            
            case 'end' :
            	self::$flex['valign'] = 'uk-flex-bottom';
            	break;
            
            case 'baseline' :
            	self::$flex['valign'] = '';
            	break;
            
            case 'stretch' :
            	self::$flex['valign'] = 'uk-flex-stretch';
            	break;
        }
    }
  
  	public static function get_classes_bs()
    {
    	self::$base_class = 'd-flex';
      
      	$align = self::$flex['align'] ?? '';
      	switch ($align)
        {
          	case 'start' :
            	self::$flex['align'] = 'justify-content-start';
            	break;
            
            case 'center' :
            	self::$flex['align'] = 'justify-content-center';
            	break;
            
            case 'end' :
            	self::$flex['align'] = 'justify-content-end';
            	break;
            
            case 'between' :
            	self::$flex['align'] = 'justify-content-between';
            	break;
            
            case 'around' :
            	self::$flex['align'] = 'justify-content-around';
            	break;
        }
      
      	$valign = self::$flex['valign'] ?? '';
      	switch ($valign)
        {
          	case 'start' :
            	self::$flex['valign'] = 'align-items-start';
            	break;
            
            case 'center' :
            	self::$flex['valign'] = 'align-items-center';
            	break;
            
            case 'end' :
            	self::$flex['valign'] = 'align-items-end';
            	break;
            
            case 'baseline' :
            	self::$flex['valign'] = 'align-items-baseline';
            	break;
            
            case 'stretch' :
            	self::$flex['valign'] = 'align-items-stretch';
            	break;
        }
      
      	if (isset(self::$flex['responsive']) && self::$flex['responsive'])
        {
        	self::$flex['responsive'] = 'flex-sm-column flex-md-row';
        }
    }
}