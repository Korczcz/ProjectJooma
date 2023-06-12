<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library\View\Air;

defined('_JEXEC') or die;

use TechFry\Library\View\Html\TfHtml;

class Pricing
{
    use MultipleTrait;
    
    public static $title = '';
  
  	public static $price = '';
    
    public static $features = '';
    
    public static $button = '';
  
  	public static function get_output_bs($item)
    {
    	return self::get_one($item);
    }
  
  	public static function get_output_uk($item)
    {
    	return self::get_one($item);
    }
  
  	public static function get_output_pico($item)
    {
    	return self::get_one($item);
    }
  
  	public static function get_one($item)
    {
        // item - title, currency, price, duration, features, url
        // config - title_class, price_class, button_text, button_class
        
        $item = (array) $item;
      
      	$features = str_getcsv($item['features']);
        $price_text = $item['currency'] . $item['price'] . ' / ' . $item['duration'];
        
      	if (!empty($item['title']))
      	{
        	self::$title = TfHtml::get_heading($item['title'], self::$config['title_head'], array('class' => self::$config['title_class']));
      	}

      	if (!empty($item['price']))
      	{
          	self::$price = TfHtml::get_element($price_text, 'p', array('class' => self::$config['price_class']));
      	}
      
      	if (!empty($features))
        {
        	self::$features .= TfHtml::get_ul_list($features, self::$config['features_class']);
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
        
        $output .= self::$title . self::$price . self::$features . self::$button;
        
        return $output;
    }
}