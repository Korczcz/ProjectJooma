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

class Card
{
	use MultipleTrait;
  
  	public static $config = array();
  
  	public static $items = array();
  
  	public static $classes = array();
  
  	// 01. Image, Heading, Date, Description, Button
    public static function get_output($item, $config = array('show_title' => 1, 'show_date' => 1), $fw = 'bs')
    {
        // item - image, title, description, url, when
        // config - button_class, button_text, card_class, image_class, image_hover, transition, card_hover, show_title, show_date, date_format
        
        self::$config = $config;
      	self::$fw = $fw;
      
      	if (TfAmp::check_amp())
        {
        	self::$fw = 'amp';  
        }
      
      	$function_name = 'get_classes_' . self::$fw;
      	self::$function_name();
      
      	return self::get_one($item);
    }
  
  	public static function get_outputs($items, $config = array(), $columns = 3, $column_class = '', $fw = 'bs')
    {
      	self::$items = $items;
      	self::$config = $config;
      	self::$columns = $columns;
      	self::$column_class = $column_class;
      	self::$fw = $fw;
      
      	if (TfAmp::check_amp())
        {
        	self::$fw = 'amp';  
        }
      
      	$function_name = 'get_classes_' . self::$fw;
      	self::$function_name();
      
      	foreach ($items as $item)
        {
        	self::$final_items[] .= self::get_one($item);
        }
      
      	return self::get_multiple();
    }
  
  	public static function get_one($item)
    {
      	$output = '';	

      	$card_class = trim(self::$classes['card_class'] . ' ' . self::$config['card_class'] . ' ' . self::$config['card_hover'] . ' ' . self::$config['transition']);
      	
      	$output .= '<div class="' . $card_class . '">';
      
      	if (!empty($item->image))
        {
        	$img = HTMLHelper::cleanImageURL($item->image);
            $image_size = filesize(JPATH_ROOT . '/' . $img->url);
            
            if ($image_size > 0)
            {
              	$image_class = trim(self::$classes['img_class'] . ' ' . self::$config['image_class'] . ' ' . self::$config['image_hover'] . ' ' . self::$config['transition']);
              
              	$output .= '<div class="' . self::$classes['div_img_class'] . '">';
              	$output .= '<a href="' . $item->url . '" title="' . $item->title . '">';
                	$output .= TfHtml::get_image($img->url, $item->title, array('class' => $image_class));
              	$output .= '</a>';
              	$output .= '</div>';
            }
        }
      	
      	$output .= '<div class="' . self::$classes['body_class'] . '">';
      
      	if (isset(self::$config['show_title']) && self::$config['show_title'])
        {
          	$output .= '<a href="' . $item->url . '">';
          		$output .= '<h4 class="' . self::$classes['title_class'] . '">' . $item->title . '</h4>';
          	$output .= '</a>';
        }
      
      	if (isset(self::$config['show_date']) && self::$config['show_date'])
        {
          	$output .= Date::get_output($item->when, array('format' => self::$config['date_format']));
        }
		
      	if (isset($item->description))
        {
          	$output .= '<p class="' . self::$classes['text_class'] . '">' . $item->description . '</p>';
        }
      
      	if (isset(self::$config['button_text']) && !empty(self::$config['button_text']))
        {
          	$btn_options = array();
          	if (self::$config['button_class'])
            {
            	$btn_options = array('button_class' => self::$config['button_class']);  
            }
          	$output .= Button::get_output(self::$config['button_text'], $btn_options, array('url' => $item->url), self::$fw);
        }
      
      	$output .= '</div>';
      	$output .= '</div>';
        
      	return $output;
    }
  
  	public static function get_classes_bs()
    {
     	self::$classes = array(
          'card_class' => 'card',
          'img_class' => 'card-img-top',
          'div_img_class' => 'overflow-hidden',
          'body_class' => 'card-body',
          'title_class' => 'card-title',
          'text_class' => 'card-text'
          );
    }
  
  	public static function get_classes_uk()
    {
     	self::$classes = array(
          'card_class' => 'uk-card uk-card-default uk-card-small',
          'img_class' => '',
          'div_img_class' => 'uk-card-media-top uk-overflow-hidden',
          'body_class' => 'uk-card-body',
          'title_class' => 'uk-card-title',
          'text_class' => ''
          );
    }
  
  	public static function get_classes_amp()
    {
     	self::$classes = array(
          'card_class' => 'card',
          'img_class' => '',
          'div_img_class' => 'card-image',
          'body_class' => 'card-body',
          'title_class' => 'card-title',
          'text_class' => ''
          );
    }
}