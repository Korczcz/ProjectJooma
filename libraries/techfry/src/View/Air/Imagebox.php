<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library\View\Air;

defined('_JEXEC') or die;

use TechFry\Library\View\Html\TfHtml;

class Imagebox
{
    use MultipleTrait;
  
  	public static $image = '';
    
    public static $title = '';
    
    public static $desc = '';
    
    public static $button = '';
  
  	public static function get_output($item, $config = array())
    {
     	self::$config = $config;
      
      	return self::get_one($item); 
    }
  
  	public static function get_output_bs($item)
    {
    	return self::get_one($item);
    }
  
  	public static function get_output_uk($item)
    {
    	return self::get_one($item);
    }
  
  	public static function get_one($item)
    {
        // item - icon, title, description, url
        // config - image_class, title_class, image_class, desc_class, button_class, button_text, title_head
        
        $item = (array) $item;
      
      	self::$image = TfHtml::get_image($item['image'], $item['title'], array('class' => self::$config['image_class']));
        
      	if (!empty($item['title']))
      	{
        	self::$title = TfHtml::get_heading($item['title'], self::$config['title_head'], array('class' => self::$config['title_class']));
      	}

      	if (!empty($item['description']))
      	{
        	self::$desc = TfHtml::get_element($item['description'], 'p', array('class' => self::$config['desc_class']));
      	}

      	if (!empty($item['url']))
      	{
        	self::$button = Button::get_output(self::$config['button_text'], array('button_class' => self::$config['button_class']), array('url' => $item['url']));
      	}
        
        return self::display_layout();
    }
  
  	// Display based on layout
    public static function display_layout()
    {
        $output = '';
        
        $output .= self::$image . self::$title . self::$desc . self::$button;
        
        return $output;
    }
}