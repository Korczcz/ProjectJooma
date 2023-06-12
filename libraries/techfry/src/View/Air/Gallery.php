<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library\View\Air;

defined('_JEXEC') or die;

use TechFry\Library\TfImg;
use TechFry\Library\TfResource;
use TechFry\Library\TfAmp;

class Gallery
{
	public static $fw;
  
  	public static $config;
  
  	public static $grid;
  
  	public static $folder;
  
  	public static $images;
  
  	public static $columns;
  
  	// Image gallery from Joomla folder in images
    public static function get_output($folder, $config = array(), $fw = 'bs')
    {
        // Refer: https://lokeshdhakar.com/projects/lightbox2/
        
        // config - columns
      
        self::$folder = 'images/' . $folder;
        self::$images = TfImg::get_images(self::$folder);
        
        if (empty(self::$images))
        {
            return;
        }
      
      	self::$fw = $fw;
      	if (TfAmp::check_amp())
        {
        	self::$fw = 'amp';  
        }
        
        self::$columns = $config['columns'];
      
      	self::$grid = Grid::get_classes($fw);
      
      	$function_name = 'get_output_' . self::$fw;
      	
      	return self::$function_name();
    }
  
  	public static function get_output_bs()
    {
    	$output = '';
        
        // Display images as grid
        $output .= '<div class="row row-cols-' . self::$columns . '">';
        
        foreach (self::$images as $k => $image)
        {
            $path_info = pathinfo($image);
                
            $output .= '<a href="' . self::$folder . '/' . $image . '" data-lightbox="image-gallery" data-title="' . $path_info['filename'] . '">';
            
            $output .= '<img class="img-thumbnail mb-3" src="' . self::$folder . '/' . $image . '">';
            
            $output .= '</a>';
        }
        
        $output .= '</div>';
        
        // Add CSS and Javascript
        $css_url = 'https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.11.3/css/lightbox.min.css';
        $js_url = 'https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.11.3/js/lightbox-plus-jquery.min.js';
        
        TfResource::add_resource($css_url, 'css');
        TfResource::add_resource($js_url, 'js');
        
        return $output;  
    }
  
  	public static function get_output_uk()
    {
		$output = '<div class="' . self::$grid['grid_class'] . '" uk-lightbox="animation: slide">';
        
        foreach (self::$images as $i => $image)
        {
            $path_info = pathinfo($image);
			
          	$output .= '<div class="' . self::$grid['col_auto'][self::$columns] . ' uk-margin-bottom">';
              $output .= '<a href="' . self::$folder . '/' . $image . '" class="uk-inline" data-caption="' . $path_info['filename'] . '">';
                  $output .= '<img src="' . self::$folder . '/' . $image . '">';
              $output .= '</a>';
          	$output .= '</div>';
        }
      
      	$output .= '</div>';
      
      	return $output;
    }
  
  	public static function get_output_amp()
    {
     	TfResource::add_resource('https://cdn.ampproject.org/v0/amp-lightbox-gallery-0.1.js', 'js', array('async' => 'async', 'custom-element' => 'amp-lightbox-gallery'));
        
        $output = '';
      	$output = '<div class="columns">';
      	foreach (self::$images as $i => $image)
        {
        	$image_info = getimagesize(self::$folder . '/' . $image);
          
          	$output .= '<div class="column col-12 mb-2">';
          		$output .= '<amp-img layout="responsive" src="' . self::$folder . '/' . $image . '" width="' . $image_info[0] . '" height="' . $image_info[1] . '" lightbox></amp-img>';
          	$output .= '</div>';
        }
      	$output .= '</div>';
      
      	return $output;
    }
}