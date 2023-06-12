<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library\View\Air;

defined('_JEXEC') or die;

use TechFry\Library\View\Html\TfHtml;

class Hero
{
    use OutputTrait;
  
    public static function get_output_bs()
    {
        // $data - title, description, button
        // $config - button_class, button_text, title_class, desc_class
        
        return self::get_one();
    }
  
  	public static function get_output_uk()
    {
        // $data - title, description, button
        // $config - button_class, button_text, title_class, desc_class
        
        return self::get_one();
    }
  	
  	// Return html part
  	public static function get_one()
    {
    	$item = (array) self::$data;

        if (!empty($item['title']))
        {
            $output .= TfHtml::get_heading($item['title'], 'h1', array('class' => self::$config['title_class']));
        }
        
        if (!empty($item['description']))
        {
            $output .= TfHtml::get_div($item['description'], self::$config['desc_class']);
        }
        
        if (!empty($item['url']))
        {
            $output .= Button::get_output(self::$config['button_text'], array('button_class' => self::$config['button_class']), array('url' => $item['url']));
        }
        
        return $output;  
    }
}