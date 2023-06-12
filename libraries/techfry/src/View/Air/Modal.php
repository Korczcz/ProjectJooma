<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library\View\Air;

defined('_JEXEC') or die;

use TechFry\Library\TfResource;

class Modal
{
    public static $fw;
  
  	public static $config;
  
  	public static $item;
  
  	public static $modal_content_class;
  	
  	// Title, Body
    public static function get_output($item, $config = array(), $fw = 'bs')
    {
        // item - button_text, body, title
      	// config - button_class, width, bg, close_class, body_class, on_load, delay
        
        if (empty($item))
        {
            return;
        }
        
        if (is_object($config))
        {
            $config = (array) $config;
        }
        
        $config['modal_id'] = 'myModal';
        
        self::$fw = $fw;
      	self::$config = $config;
      	self::$item = $item;
      
      	self::$modal_content_class = trim($config['width'] . ' ' . $config['bg'] . ' ' . $config['animation'] . ' ' . $config['modal_class']);
      
      	$function_name = 'get_output_' . $fw;
        
        return self::$function_name();
    }
  
  	public static function get_output_bs()
    {
    	// Button trigger
      	$output = '<button type="button" class="' . self::$config['button_class'] . '" data-bs-toggle="modal" data-bs-target="#' . self::$config['modal_id'] . '"';
        if (self::$config['on_load'])
        {
            $output .= ' data-bs-delay="' . self::$config['delay'] * 1000 . '"';
        }
        $output .= '>' . self::$item['button_text'] . '</button>';
        
      	// Modal 
        $output .= '<div class="modal fade" id="' . self::$config['modal_id'] . '" tabindex="-1" aria-hidden="true">';
      	$output .= '<div class="modal-dialog">';
            $output .= '<div class="modal-content ' . self::$modal_content_class . '">';
    			$output .= '<div class="modal-header">';
      				$output .= '<h1 class="modal-title fs-5">' . self::$item['title'] . '</h1>';
                	$output .= '<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>';
                $output .= '</div>';
                $output .= '<div class="modal-body ' . self::$config['body_class'] . '">';
                    $output .= self::$item['body'];
                $output .= '</div>';
                
            $output .= '</div>';
        $output .= '</div>';
      	$output .= '</div>';
        
        return $output;  
    }
  
  	public static function get_output_uk()
    {
    	// Button trigger
      	$output = '<button type="button" class="' . self::$config['button_class'] . '" uk-toggle="target: #' . self::$config['modal_id'] . '"';
        if (self::$config['on_load'])
        {
            $output .= ' data-bs-delay="' . self::$config['delay'] * 1000 . '"';
        }
        $output .= '>' . self::$item['button_text'] . '</button>';
        
      	// Modal 
        $output .= '<div id="' . self::$config['modal_id'] . '" uk-modal>';
            $output .= '<div class="uk-modal-dialog uk-modal-body ' . self::$modal_content_class . '">';
      			$output .= '<h2 class="uk-modal-title">' . self::$item['title'] . '</h2>';
                $output .= '<div class="' . self::$config['body_class'] . '">';
                    $output .= self::$item['body'];
                $output .= '</div>';
                $output .= '<p class="uk-text-right">';
            		$output .= '<button class="uk-button uk-button-default uk-modal-close" type="button">Close</button>';
            	$output .= '</p>';
            $output .= '</div>';
      	$output .= '</div>';
        
        return $output;    
    }
  
  	public static function get_output_pico()
    {
    	$output = '<button class="' . $config['button_class'] . '" data-bs-toggle="modal" data-bs-target="#' . $config['modal_id'] . '"';
        if ($config['on_load'])
        {
            $output .= ' data-bs-delay="' . $config['delay'] * 1000 . '"';
        }
        $output .= '>' . $item['button_text'] . '</button>';
        
        $output .= '<div class="modal d-none" id="' . $config['modal_id'] . '">';
            $output .= '<div class="modal-content ' . $modal_content_class . '">';
    
                $output .= '<span class="btn-close ' . $config['close_class'] . '" data-bs-dismiss="modal" aria-label="Close">&times;</span>';
                
                $output .= '<div class="' . $config['body_class'] . '">';
                    $output .= $item['body'];
                $output .= '</div>';
                
            $output .= '</div>';
        $output .= '</div>';
        
        // Add Javascript
        $js_url = '/media/techfry/js/modal.js';
        TfResource::add_resource($js_url, 'js');
        
        return $output;  
    }
  
  
}