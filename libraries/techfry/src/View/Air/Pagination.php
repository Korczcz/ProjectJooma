<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library\View\Air;

defined('_JEXEC') or die;

class Pagination
{
  	public static $classes = array();
  
  	public static function get_classes($fw = 'bs')
    {
      	$function_name = 'get_classes_' . $fw;
      
      	self::$function_name();
      
      	return self::$classes;
    }
  
  	public static function get_classes_uk()
    {
    	self::$classes = array(
          'ul_class' => 'uk-pagination uk-margin-top',
          'li_class' => '',
          'link_class' => '',
          'active_class' => 'uk-active',
          'disabled_class' => 'uk-disabled'
          );	
    }
  
  	public static function get_classes_pico()
    {
    	
    }
  
  	public static function get_classes_bs()
    {
    	self::$classes = array(
          'ul_class' => 'pagination',
          'li_class' => 'page-item',
          'link_class' => 'page-link',
          'active_class' => 'active',
          'disabled_class' => 'disabled'
          );
    }
}