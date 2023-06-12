<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library\View\Air;

defined('_JEXEC') or die;

use Joomla\CMS\HTML\HTMLHelper;
use TechFry\Library\TfResource;
use TechFry\Library\TfAmp;

class Carousel
{
    public static $fw;
  
  	public static $images = array();
  
  	public static function get_output($items, $config = array(), $fw = 'bs')
    {
        // items - array : image
        // config - effect, loop, slides_per_view, space_between, pagination, auto_play
        
        if (empty($items))
        {
            return;
        }
        
        foreach ($items as $i => $item)
        {
            $item = (array) $item;
            
            $image = HTMLHelper::cleanImageURL($item['image']);
            self::$images[] = $image->url;
        }
      
      	self::$fw = $fw;
      	if (TfAmp::check_amp())
        {
        	self::$fw = 'amp';  
        }
      
      	$function_name = 'get_output_' . self::$fw;
        
        // $output = Slider::get_output($content, $config);
        
        return self::$function_name();
    }
  
  	public static function get_output_bs()
    {
    	$output = '<div id="carousel" class="carousel slide">';
      		$output .= '<div class="carousel-inner">';
      		foreach (self::$images as $i => $image)
            {
            	$active = ($i == 0) ? ' active' : '';
              
              	$output .= '<div class="carousel-item' . $active . '">';
              		$output .= '<img src="' . $image . '" class="d-block w-100">';
              	$output .= '</div>';
            }
			$output .= '</div>';
      	
      	// Previous and Next
      	$output .= '<button class="carousel-control-prev" type="button" data-bs-target="#carousel" data-bs-slide="prev">';
    		$output .= '<span class="carousel-control-prev-icon" aria-hidden="true"></span>';
    		$output .= '<span class="visually-hidden">Previous</span>';
  		$output .= '</button>';
      	
      	$output .= '<button class="carousel-control-next" type="button" data-bs-target="#carousel" data-bs-slide="next">';
    		$output .= '<span class="carousel-control-next-icon" aria-hidden="true"></span>';
    		$output .= '<span class="visually-hidden">Next</span>';
  		$output .= '</button>';
      
      
      
      	$output .= '</div>';
      
      	return $output;  
    }
  
  	public static function get_output_uk()
    {
     	$output = '<div class="uk-position-relative uk-visible-toggle uk-light" tabindex="-1" uk-slideshow>';
    		$output .= '<ul class="uk-slideshow-items">';
      		foreach (self::$images as $image)
            {
            	$output .= '<li>';
              		$output .= '<img src="' . $image . '" uk-cover>';
              	$output .= '</li>';
            }
    		$output .= '</ul>';
		$output .= '</div>';
      
      	$output .= '<a class="uk-position-center-left uk-position-small uk-hidden-hover" href="#" uk-slidenav-previous uk-slideshow-item="previous"></a>';
    	$output .= '<a class="uk-position-center-right uk-position-small uk-hidden-hover" href="#" uk-slidenav-next uk-slideshow-item="next"></a>';
      
      	return $output;
    }
  
  	public static function get_output_amp()
    {
    	TfResource::add_resource('https://cdn.ampproject.org/v0/amp-carousel-0.2.js', 'js', array('async' => 'async', 'custom-element' => 'amp-carousel'));
      	$output = '';
      
      	$output .= '<amp-carousel width="450" height="300" layout="responsive" type="slides" role="region" aria-label="Carousel">';
      	foreach (self::$images as $image)
        {
         	$output .= '<amp-img src="' . $image . '" width="450" height="300">';
            $output .= '</amp-img>';
        }
      	$output .= '</amp-carousel>';
      
      	return $output;
    }
}