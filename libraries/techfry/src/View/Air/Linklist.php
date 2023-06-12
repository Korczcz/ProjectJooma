<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library\View\Air;

defined('_JEXEC') or die;

use TechFry\Library\TfAmp;
use TechFry\Library\TfResource;

class Linklist
{
    public static $fw;
  
  	public static $items;
  
  	public static $config;
  
  	public static $classes = array();
  
  	public static function get_output($items, $config = array(), $fw = 'bs')
    {
        // config - type (list, listgroup, inline), li_class, a_class ; To Add: nav

        if (empty($items))
        {
            return;
        }
      
      	self::$fw = $fw;
      
      	if (TfAmp::check_amp())
        {
        	self::$fw = 'amp';  
        }
      
      	self::$items = $items;
      	self::$config = $config;
      
      	$function_name = 'get_classes_' . self::$fw;
      
      	self::$function_name();
      	
      	// Class on ul tag
      	$ul_class = self::$classes['ul_class'] ? ' class="' . self::$classes['ul_class'] . '"' : '';
      	
      	// Class on li tag
      	self::$classes['li_class'] = trim(self::$classes['li_class'] . ' ' . $config['li_class']);
      	$li_class = self::$classes['li_class'] ? ' class="' . self::$classes['li_class'] . '"' : '';
      
      	// Class on a tag
      	self::$classes['link_class'] = trim(self::$classes['link_class'] . ' ' . $config['a_class']);
      	$link_class = self::$classes['link_class'] ? ' class="' . self::$classes['link_class'] . '"' : '';
      
      	$output = '<ul' . $ul_class . '>';
      	foreach (self::$items as $item)
        {
        	$item = (array) $item;
          	$output .= '<li' . $li_class . '>';
          	$output .= '<a' . $link_class . ' href="' . $item['url'] . '" style="color:inherit;">' . $item['title'] . '</a>';
          	$output .= '</li>';
        }
      
      	$output .= '</ul>';
      	
      	return $output;
    }
  
  	public static function get_classes($config = array(), $fw = 'bs')
    {
    	// $config - type (inline, listgroup)
      	
      	self::$fw = $fw;
      
      	if (TfAmp::check_amp())
        {
        	self::$fw = 'amp';  
        }

      	self::$config = $config;
      
      	$function_name = 'get_classes_' . self::$fw;
      
      	self::$function_name();
      
      	return self::$classes;
    }
  
  	public static function get_classes_bs()
    {
    	switch (self::$config['type'])
        {
          	case 'listgroup' :
            	self::$classes = array(
              		'ul_class' => 'list-group list-unstyled',
              		'li_class' => '',
                  	'link_class' => 'list-group-item list-group-item-action',
                  	'active_link_class' => 'active'
              	);
            	break;
          
          	case 'inline' :
            	self::$classes = array(
              		'ul_class' => 'list-inline',
              		'li_class' => 'list-inline-item',
                  	'link_class' => '',
                  	'active_link_class' => ''
              	);
            	break;
            
           	default :
            	self::$classes = array(
              		'ul_class' => 'list-unstyled',
              		'li_class' => 'py-1',
                  	'link_class' => '',
                  	'active_link_class' => ''
              	);
        }
      		
    }
  
  	public static function get_classes_uk()
    {
    	switch (self::$config['type'])
        {
          	case 'listgroup' :
            	self::$classes = array(
          			'ul_class' => 'uk-list uk-nav-default',
          			'li_class' => '',
                  	'link_class' => '',
                  	'active_link_class' => 'uk-active'
          		);
            	break;
          
          	case 'inline' :
            	self::$classes = array(
          			'ul_class' => 'uk-subnav uk-subnav-divider',
          			'li_class' => '',
                  	'link_class' => '',
                  	'active_link_class' => 'uk-active'
          		);
            	break;
            
           	default :
            	self::$classes = array(
          			'ul_class' => 'uk-list uk-nav-default',
          			'li_class' => '',
                  	'link_class' => '',
                  	'active_link_class' => 'uk-active'
          		);
        }
    }
  
  	public static function get_classes_amp()
    {
      	switch (self::$config['type'])
        {
           	default :
            	self::$classes = array(
          			'ul_class' => 'nav',
          			'li_class' => 'nav-item',
                  	'link_class' => '',
                  	'active_link_class' => ''
          		);
        }
    }
}