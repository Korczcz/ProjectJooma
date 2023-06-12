<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library\View\Air;

defined('_JEXEC') or die;

use TechFry\Library\TfAmp;

class Breadcrumb
{
    public static $fw;
  
  	public static $items;
  
  	public static $config;
  
  	public static $list_class;
  
  	public static $list_item_class;
  
  	public static $link_class;
  
  	public static function get_output($items, $config = array(), $fw = 'bs')
    {
        // config
        
        if (empty($items))
        {
            return;
        }
      
      	self::$fw = $fw;
      	self::$items = $items;
      	self::$config = $config;
      
      	if (TFAmp::check_amp())
        {
        	self::$fw = 'amp';
        }
      
      	$function_name = 'get_output_' . self::$fw;
      	self::$function_name();
      
      	$list_class = (self::$list_class) ? ' class="' . self::$list_class . '"' : '';
      	$list_item_class = (self::$list_item_class) ? ' class="' . self::$list_item_class . '"' : '';
      
      	$output = '';
      
      	$output .= '<ul' . $list_class . '>';
      	foreach ($items as $i => $item)
        {
        	$output .= '<li' . $list_item_class . '>';
          	if ($i == 0)
            {
            	$output .= '<span class="fa-solid fa-location-dot"></span> ';  
            }
          	if (isset($item['url']))
            {
            	$output .= '<a href="' . $item['url'] . '">' . $item['title'] . '</a>';
            }
          	else
            {
            	$output .= '<span>' . $item['title'] . '</span>';
            }
          	$output .= '</li>';
        }
      	$output .= '</ul>';
      	
      	return $output;
    }
  
  	public static function get_output_bs()
    {
     	self::$list_class = 'breadcrumb';
      
      	self::$list_item_class = 'breadcrumb-item';
    }
  
  	public static function get_output_uk()
    {
    	self::$list_class = 'uk-margin-top uk-breadcrumb';
    }
  
  	public static function get_output_amp()
    {
    	self::$list_class = 'breadcrumb';
      
      	self::$list_item_class = 'breadcrumb-item';      
    }
}