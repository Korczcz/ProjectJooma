<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library\View\Air;

defined('_JEXEC') or die;

class Padding
{
	// p-1, p-3, p-5, py-1, py-3, py-5
  
  	use UtilityTrait;
  
  	public static function get_classes_bs()
    {
    	self::$classes = array('p-1' => 'p-1', 'p-3' => 'p-3', 'p-5' => 'p-5','py-1' => 'py-1', 'py-3' => 'py-3', 'py-5' => 'py-5');	
    }
  
  	public static function get_classes_uk()
    {
     	self::$classes = array('p-1' => 'uk-padding-small', 'p-3' => 'uk-padding', 'p-5' => 'uk-padding-large', 
                               'py-1' => 'uk-padding-small uk-padding-remove-horizontal', 
                               'py-3' => 'uk-padding uk-padding-remove-horizontal',
                               'py-5' => 'uk-padding-large uk-padding-remove-horizontal');
    }
  
  	public static function get_classes_amp()
    {
    	self::$classes = array('p-1' => 'p-1', 'p-3' => 'p-2', 'p-5' => 'p-2','py-1' => 'py-1', 'py-3' => 'py-2', 'py-5' => 'py-2');
    }
}