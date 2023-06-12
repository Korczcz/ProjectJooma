<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library\View\Air;

defined('_JEXEC') or die;

class Navbar
{
    public static function get_classes($fw = 'bs')
    {
     	$function_name = 'get_classes_' . $fw;
      
      	return self::$function_name();
    }
  
  	public static function get_classes_bs()
    {
    	$arr = array(
          'list_class' => 'navbar-nav',
		  'list_item_class' => 'nav-item',
		  'link_class' => 'nav-link',
		  'active_link_class' => ''
          );
      
      	return $arr;
    }
  
  	public static function get_classes_uk()
    {
     	$arr = array(
          'list_class' => 'uk-navbar-nav',
		  'list_item_class' => '',
		  'link_class' => '',
		  'active_link_class' => ''
          );
      
      	return $arr;
    }
  
  	public static function get_classes_amp()
    {
    	$arr = array(
          'list_class' => 'main-menu',
		  'list_item_class' => '',
		  'link_class' => '',
		  'active_link_class' => ''
          );
      
      	return $arr;
    }
}