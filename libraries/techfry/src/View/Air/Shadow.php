<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library\View\Air;

defined('_JEXEC') or die;

class Shadow
{
    use UtilityTrait;
  
  	public static function get_classes_pico()
    {
    	
    }
  
  	public static function get_classes_bs()
    {
      	self::$classes = array(
          'small' => 'shadow-sm',
		  'medium' => 'shadow',
		  'large' => 'shadow-lg'
          );
    }
  
  	public static function get_classes_uk()
    {
     	self::$classes = array(
          'small' => 'uk-box-shadow-small',
		  'medium' => 'uk-box-shadow-medium',
		  'large' => 'uk-box-shadow-large'
          );
    }
}