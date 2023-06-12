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

class Tabs
{
  	public static $fw;
  
  	public static $items;
  
  	public static $config;
  
  	public static function get_output($items, $config = array(), $fw = 'bs')
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
     	// Buttons - Tab navigation
        $output = '<ul class="mb-3 nav nav-tabs" role="tablist">';
        $i = 1;
        
        foreach (self::$items as $tab)
        {
            $tab = (array) $tab;
            $tab = array_values($tab);
            
            // First tab is active
            $active = ($i == 1) ? ' active' : '';
            
            $output .= '<li class="nav-item" role="presentation">';
                
                $output .= '<button class="nav-link ' . $active .'" data-bs-toggle="tab" data-bs-target="#tab-pane' . $i . '" type="button" role="tab"';
                $output .= ' aria-controls="tab-pane' . $i . '" aria-selected="true">';
                    $output .= $tab[0];
                $output .= '</button>';
            
            $output .= '</li>';
            
            $i++;
        }
        $output .= '</ul>';
        
        // Tab content
        $output .= '<div class="tab-content">';
        $i = 1;
        foreach (self::$items as $tab)
        {
            $tab = (array) $tab;
            $tab = array_values($tab);
            
            $active = ($i == 1) ? ' show active' : '';
            
            $output .= '<div class="tab-pane fade' . $active . '" id="tab-pane' . $i .'" role="tabpanel" tabindex="0">';
                $output .= $tab[1];
            $output .= '</div>';
            
            $i++;
        }
        
        $output .= '</div>';
        
        return $output; 
    }
  
  	public static function get_output_uk()
    {
      	// Tab navigation
        $output = '<ul uk-tab>';
        $i = 1;
        
        foreach (self::$items as $tab)
        {
            $tab = (array) $tab;
            $tab = array_values($tab);
            
            $output .= '<li>';
                
                $output .= '<a href="#">';
                    $output .= $tab[0];
                $output .= '</a>';
            
            $output .= '</li>';
            
            $i++;
        }
        $output .= '</ul>';
        
        // Tab content
        $output .= '<ul class="uk-switcher uk-margin">';
        $i = 1;
        foreach (self::$items as $tab)
        {
            $tab = (array) $tab;
            $tab = array_values($tab);
            
            $output .= '<li>';
                $output .= $tab[1];
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