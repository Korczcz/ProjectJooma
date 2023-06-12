<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library\View\Air;

defined('_JEXEC') or die;

use Joomla\CMS\Factory;
use TechFry\Library\TfAmp;
use TechFry\Library\TfResource;

class Accordion
{
    public static $fw;
  
  	public static $items;
  
  	public static $config;
  
  	public static function get_output($items = array(), $config = array(), $fw = 'bs')
    {
        // config
        
        if (empty($items))
        {
            return;
        }
      
      	self::$fw = $fw;
      	self::$items = $items;
      	self::$config = $config;
        
        if (TfAmp::check_amp())
        {
            self::$fw = 'amp';
        }
      
      	$function_name = 'get_output_' . self::$fw;
      	
      	return self::$function_name();
    }
  
  	public static function get_output_bs()
    {
     	$i = 1;
        
        $output = '<div class="accordion mb-3" id="accordion">';
        
        foreach (self::$items as $item)
        {
            $item = (array) $item;
            $item = array_values($item);
            
            // Show first accordion by default
            $show = ($i == 1) ? ' show' : '';
            $collapsed = ($i == 1) ? '' : ' collapsed';
            
            $output .= '<div class="accordion-item">';
            
                    $output .= '<h2 class="accordion-header">';
                        $output .= '<button class="accordion-button' . $collapsed . '" type="button" data-bs-toggle="collapse" data-bs-target="#collapse' . $i . '"';
                        $output .= ' aria-expanded="true">';
                            $output .= $item[0];
                        $output .= '</button>';
                    $output .= '</h2>';
            
                $output .= '<div id="collapse' . $i . '" class="accordion-collapse collapse' . $show . '" data-bs-parent="#accordion">';
                    $output .= '<div class="accordion-body">';
                        $output .= $item[1];
                    $output .= '</div>';
                $output .= '</div>';
                
            $output .= '</div>';
            
            $i++;
        }

        $output .= '</div>';
        
        return $output; 
    }
  
  	public static function get_output_uk()
    {
     	$i = 1;
        
        $output = '<ul uk-accordion>';
        
        foreach (self::$items as $item)
        {
            $item = (array) $item;
            $item = array_values($item);
            
            // Show first accordion by default
            $show = ($i == 1) ? ' class="uk-open"' : '';
            
            $output .= '<li' . $show . '>';
            
          		$output .= '<a class="uk-accordion-title" href="#">';
          			$output .= $item[0];
          		$output .= '</a>';
            
                $output .= '<div class="uk-accordion-content">';
                	$output .= $item[1];
                $output .= '</div>';
                
            $output .= '</li>';
            
            $i++;
        }

        $output .= '</ul>';
        
        return $output; 
    }
  
  	public static function get_output_amp()
    {        
        TfResource::add_resource('https://cdn.ampproject.org/v0/amp-accordion-0.1.js', 'js', array('async' => 'async', 'custom-element' => 'amp-accordion'));
        
        $output = '';
        
        $output .= '<amp-accordion id="my-accordion" animate disable-session-states>';
        $n = 1;
        foreach (self::$items as $i => $item)
        {
            $item = (array) $item;
            $item = array_values($item);

          	// First item should be expanded
          	$expanded = ($n == 1) ? ' expanded' : '';
            
            $output .= '<section class=""' . $expanded . '>';
                $output .= '<h3 class="p-2">' . $item[0] . '</h3>';
                $output .= '<div class="p-2">' . $item[1] . '</div>';
            $output .= '</section>';
          
          	$n++;
        }
        
        $output .= '</amp-accordion>';
        
        return $output;
    }
}