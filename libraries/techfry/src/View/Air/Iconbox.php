<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library\View\Air;

defined('_JEXEC') or die;

use TechFry\Library\View\Html\TfHtml;

class Iconbox
{
    use MultipleTrait;
  
  	public static $icon = '';
    
    public static $title = '';
    
    public static $desc = '';
    
    public static $button = '';
    
    public static $layout = '';
  
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
        // config - icon_class, button_class, button_text, title_class, desc_class, title_head, layout
        
        self::$layout = self::$config['layout'] ?? 1;
        
        $item = (array) $item;
        
      	$icon_class = trim(self::$config['size'] . ' ' . self::$config['color'] . ' ' . self::$config['rotate'] . ' ' . self::$config['animate']);
        self::$icon = Icon::get_output($item['icon'], array('icon_class' => $icon_class));
        
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
        
        switch (self::$layout)
        {
            case 1 :
                $output .= self::$icon . self::$title . self::$desc . self::$button;
                break;
                
            case 2 :
                $flex = Flex::get_class(array(), false, self::$fw);

            	$output .= '<div class="' . $flex . '">';
                $output .= self::$icon . self::$title;
                $output .= '</div>';
                $output .= self::$desc . self::$button;
                break;
        }
        
        return $output;
    }
}