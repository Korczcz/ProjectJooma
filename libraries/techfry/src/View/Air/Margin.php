<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library\View\Air;

defined('_JEXEC') or die;

class Margin
{
    use UtilityTrait;
  
  	// my-1, my-3, my-5, mt-3, mb-5 
  
  	public static function get_classes_bs()
    {
    	self::$classes = array('my-1' => 'my-1', 'my-3' => 'my-3', 'my-5' => 'my-5', 'mt-3' => 'mt-3', 'mb-3' => 'mb-3');
    }
  
  	public static function get_classes_uk()
    {
     	self::$classes = array('my-1' => 'uk-margin-small', 'my-3' => 'uk-margin-medium', 'my-5' => 'uk-margin-large', 
                               'mt-3' => 'uk-margin-top', 'mb-3' => 'uk-margin-bottom');
    }
  
  	public static function get_classes_amp()
    {
    	self::$classes = array('my-1' => 'my-1', 'my-3' => 'my-2', 'my-5' => 'my-2', 'mt-3' => 'mt-2', 'mb-3' => 'mb-2');
    }
}