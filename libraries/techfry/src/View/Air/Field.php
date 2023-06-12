<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library\View\Air;

defined('_JEXEC') or die;

use Joomla\CMS\Factory;
use Joomla\CMS\HTML\HTMLHelper;
use TechFry\Library\View\Html\TfHtml;

// Display custom field
class Field
{
    public static $config = array();
  
  	public static $value;
  
  	public static function get_output($value, $config = array())
    {
        // $config - render_class, value_render_class, label_render_class, showlabel, prefix, suffix, label
      	// layout (default, stacked, table, list)
      
      	if (empty($value))
        {
            return;
        }
      
      	self::$config = $config;
      	self::$value = $value;
      
      	$output = '';
      	
      	if (isset(self::$config['layout']))
        {  
        	$function_name = 'layout_' . self::$config['layout'];
        }
      	else
      	{
        	$function_name = 'layout_default';
      	}
      
      	$output .= '<div class="my-3 ' . self::$config['render_class'] . '">';
      
      	$output .= self::$function_name();

      	$output .= '</div>';
        
        return $output;
    }
  
  	public static function layout_default()
    {
    	$output = '';	
      
      	if (isset(self::$config['showlabel']) && self::$config['showlabel'])
        {
        	$pre_label = '';
        	$post_label = '';
        	if (self::$config['label_render_class'])
        	{
            	$pre_label = '<span class="' . self::$config['label_render_class'] . '">';
            	$post_label = '</span>';
        	}
          
          	$output .= $pre_label . '<strong>' . self::$config['label'] . ':</strong>' . $post_label . ' ';
        }
      	
      	$pre_value = '';
      	$post_value = '';
      	if (self::$config['value_render_class'])
      	{
        	$pre_value = '<span class="' . self::$config['value_render_class'] . '">';
        	$post_value = '</span>';
      	}
      	
      	$output .= $pre_value;
      	if (isset(self::$config['prefix']) && self::$config['prefix'])
        {
        	$output .= self::$config['prefix'];  
        }
      	$output .= self::$value;
      	if (isset(self::$config['suffix']) && self::$config['suffix'])
        {
        	$output .= self::$config['suffix'];
        }
      	$output .= $post_value;
      
      	return $output;
    }
  
  	public static function layout_stacked()
    {
    	$output = '';	
      
      	$output .= self::get_label_stacked();
      	
      	$value_render_class = self::$config['value_render_class'] ? ' class="' . self::$config['value_render_class'] . '"' : '';
      
       	$pre_value = '<div' . $value_render_class . '>';
        $post_value = '</div>';
      	
      	$output .= $pre_value;
      	if (isset(self::$config['prefix']) && self::$config['prefix'])
        {
        	$output .= self::$config['prefix'];  
        }
      	$output .= self::$value;
      	if (isset(self::$config['suffix']) && self::$config['suffix'])
        {
        	$output .= self::$config['suffix'];
        }
      	$output .= $post_value;
      
      	return $output;  
    }
  
  	public static function layout_table()
    {
    	$output = '';
      
      	$output .= self::get_label_stacked();
      
      	$theads = array();
      	if (isset(self::$config['subfields']))
        {
        	$theads = array_column(self::$config['subfields'], 'label');  
        }
      
      	$output .= TfHtml::get_table(self::$value, self::$config['value_render_class'], $theads);
      
      	return $output;
    }
  
  	public static function layout_cards()
    {
    	$output = '';
      
      	$output .= self::get_label_stacked();
      	
      	foreach (self::$value as $row)
        {
        	$i = 0;
          	$output .= '<div class="' . self::$config['value_render_class'] . '">';
          	foreach ($row as $col)
            {
              	$output .= '<div class="my-3 ' . self::$config['subfields'][$i]['render_class'] . '">';
              
              	if (isset(self::$config['subfields'][$i]['showlabel']) && self::$config['subfields'][$i]['showlabel'])
        		{
          			$label_render_class = self::$config['subfields'][$i]['label_render_class'] ? ' class="' . self::$config['subfields'][$i]['label_render_class'] . '"' : '';
          
          			$pre_label = '<div' . $label_render_class . '>';
          			$post_label = '</div>';
          
          			$output .= $pre_label . '<strong>' . self::$config['subfields'][$i]['label'] . '</strong>' . $post_label;
        		}
              
              	$value_render_class = self::$config['subfields'][$i]['value_render_class'] ? ' class="' . self::$config['subfields'][$i]['value_render_class'] . '"' : '';
      
       			$pre_value = '<div' . $value_render_class . '>';
        		$post_value = '</div>';
              
              	$output .= $pre_value . $col . $post_value;

              	$output .= '</div>';
              	$i++;
            }
          	$output .= '</div>';
        }

      	return $output;
    }
  
  	public static function layout_list()
    {
     	$output = '';
      
      	$output .= self::get_label_stacked();
      
      	$output .= TfHtml::get_ul_list(self::$value);
      
      	return $output;
    }
  
  	public static function get_label_stacked()
    {
    	$output = '';
      
      	if (isset(self::$config['showlabel']) && self::$config['showlabel'])
        {
          	$label_render_class = self::$config['label_render_class'] ? ' class="' . self::$config['label_render_class'] . '"' : '';
          
          	$pre_label = '<div' . $label_render_class . '>';
          	$post_label = '</div>';
          
          	$output .= $pre_label . '<strong>' . self::$config['label'] . '</strong>' . $post_label;
        }
      
      	return $output;
    }
}