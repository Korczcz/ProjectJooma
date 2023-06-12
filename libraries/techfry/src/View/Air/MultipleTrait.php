<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library\View\Air;

defined('_JEXEC') or die;

use Joomla\CMS\HTML\HTMLHelper;
use TechFry\Library\View\Html\TfHtml;
use TechFry\Library\TfAmp;

trait MultipleTrait
{
	public static $fw = 'bs';
  
  	public static $items = array();
  
  	public static $final_items = array();
  
  	public static $config = array();
  
  	public static $columns = 3;
  	
  	public static $column_class;
  
  	public static function get_outputs($items, $config = array(), $columns = 3, $column_class = '', $fw = 'bs')
    {
      	self::$items = $items;
      	self::$config = $config;
      	self::$columns = $columns;
      	self::$column_class = $column_class;
      	self::$fw = $fw;
      
      	$function_name = 'get_output_' . $fw;
      
      	foreach ($items as $item)
        {
        	self::$final_items[] .= self::$function_name($item);
        }
      
      	return self::get_multiple();
    }
  
  	public static function get_multiple()
    {
     	if (TfAmp::check_amp())
        {
        	self::$fw = 'amp';
        }
      
      	$function_name = 'get_outputs_' . self::$fw;
      
      	return self::$function_name(); 
    }
  	
  	// 03. Display multiple items for Bootstrap Framework
  	public static function get_outputs_bs()
    {
      	$span = floor(12/self::$columns);
      
      	$output = '';
      	$n = 0;
        foreach (self::$final_items as $item)
        {
            if ($n == 0)
            {
             	$output .= '<div class="row">';
            }
            $output .= '<div class="mb-3 col-12 col-md-' . $span . '">';
          	$output .= '<div class="' . self::$column_class . '">';
            	$output .= $item;
            $output .= '</div>';
          	$output .= '</div>';
          	
          	$n++;
          	if ($n == self::$columns)
            {
            	$output .= '</div>';
              	$n = 0;
            }
        }
        
        if ($n != self::$columns && $n != 0)
        {
        	$output .= '</div>';  
        }
        
        return $output;
    }
  
  	// 03. Display multiple items for UIkit Framework
  	public static function get_outputs_uk()
    {
     	$grid_column_class = 'uk-width-1-' . self::$columns . '@m';
     
      	$output = '<div uk-grid>';
        
        foreach (self::$final_items as $item)
        {
            $output .= '<div class="' . $grid_column_class . '">';
                $output .= '<div class="' . self::$column_class . '">';
                    $output .= $item;
                $output .= '</div>';
            $output .= '</div>';
        }
        
        $output .= '</div>';
        
        return $output; 	
    }
  
  	// 03. Display multiple items for AMP
  	public static function get_outputs_amp()
    {
      	$output = '<div class="columns">';
        
        foreach (self::$final_items as $item)
        {
            $output .= '<div class="column col-12 mb-2">';
                $output .= '<div class="' . self::$column_class . '">';
                    $output .= $item;
                $output .= '</div>';
            $output .= '</div>';
        }
        
        $output .= '</div>';
        
        return $output;
    }
}