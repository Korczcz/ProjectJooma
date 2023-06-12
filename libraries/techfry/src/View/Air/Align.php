<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library\View\Air;

defined('_JEXEC') or die;

class Align
{  
  	use UtilityTrait;
  
  	// alignment: text-start, text-center, text-end
  
  	public static function get_classes_bs()
    {
		self::$classes = array(
          'text-start' => 'text-start',
		  'text-center' => 'text-center',
		  'text-end' => 'text-end'
          );
    }
  
  	public static function get_classes_uk()
    {
     	self::$classes = array(
          'text-start' => 'uk-text-left',
		  'text-center' => 'uk-text-center',
		  'text-end' => 'uk-text-right'
          );
    }
  
  	public static function get_classes_fn()
    {
		self::$classes = array(
          'text-start' => 'text-left',
		  'text-center' => 'text-center',
		  'text-end' => 'text-right'
          );
    }
  
  	public static function get_classes_amp()
    {
		self::$classes = array(
          'text-start' => 'text-left',
		  'text-center' => 'text-center',
		  'text-end' => 'text-right'
          );
    }
}