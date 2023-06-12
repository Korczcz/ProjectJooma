<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library\View\Air;

defined('_JEXEC') or die;

class Float
{
    use UtilityTrait;
  
  	// float-start, float-end, float-none, clearfix
  
  	public static function get_classes_bs()
    {
    	self::$classes = array('float-start' => 'float-start', 'float-end' => 'float-end', 'float-none' => 'float-none', 'clearfix' => 'clearfix');
    }
  
  	public static function get_classes_uk()
    {
     	self::$classes = array('float-start' => 'uk-float-left', 'float-end' => 'uk-float-right', 'float-none' => '', 'clearfix' => 'uk-clearfix');
    }
  
  	public static function get_classes_amp()
    {
    	self::$classes = array('float-start' => 'float-start', 'float-end' => 'float-end', 'float-none' => 'float-none', 'clearfix' => 'clearfix');
    }
}