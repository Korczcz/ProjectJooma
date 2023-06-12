<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library\View\Air;

defined('_JEXEC') or die;

use TechFry\Library\TfAmp;

class Table
{
    public static $fw;
  
  	public static $items;
  
  	public static $config;
  
  	public static $table_class;
  
  	public static function get_output($items, $config = array(), $fw = 'bs')
    {
        // config
        
        if (empty($items))
        {
            return;
        }
      
      	if (TfAmp::check_amp())
        {
        	self::$fw = 'amp';  
        }
      
      	self::$fw = $fw;
      	self::$items = $items;
      	self::$config = $config;
      
      	$function_name = 'get_classes_' . self::$fw;
      
      	self::$function_name();
      	
      	$table_class = self::$table_class ? ' class="' . self::$table_class . '"' : '';
      
      	$output = '<table' . $table_class . '>';
      	$output .= '<tbody>';
      	foreach (self::$items as $item)
        {
        	$output .= '<tr>';
          	$output .= '<td><a href="' . $item['url'] . '">' . $item['title'] . '</a></td>';
          	$output .= '</tr>';
        }
      	$output .= '</tbody>';
      	$output .= '</table>';
      	
      	return $output;
    }
  
  	public static function get_class($fw)
    {
    	$function_name = 'get_classes_' . $fw;
      
      	self::$function_name();
      
      	return self::$table_class;
    }
  
  	public static function get_classes_bs()
    {
    	self::$table_class = 'table table-striped table-hover';
    }
  
  	public static function get_classes_uk()
    {
    	self::$table_class = 'uk-table uk-table-divider uk-table-striped uk-table-hover uk-table-small';    
    }
  
  	public static function get_classes_amp()
    {
    	self::$table_class = 'table table-striped table-hover';	
    }
}