<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library\View\Air;

defined('_JEXEC') or die;

class Background
{  
  	use UtilityTrait;
  
  	// bg-primary, bg-secondary, bg-light
  
  	public static function get_classes_bs()
    {
      	self::$classes = array(
          'bg-primary' => 'bg-primary',
          'bg-secondary' => 'bg-secondary',
          'bg-light' => 'bg-light',
          'bg-dark' => 'bg-dark'
          );
    }
  
  	public static function get_classes_uk()
    {
     	self::$classes = array(
          'bg-primary' => 'uk-background-primary',
          'bg-secondary' => 'uk-background-secondary',
          'bg-light' => 'uk-background-muted',
          'bg-dark' => 'uk-dark'
          );
    }
  
  	public static function get_classes_amp()
    {
      	self::$classes = array(
          'bg-primary' => 'bg-primary',
          'bg-secondary' => 'bg-secondary',
          'bg-light' => 'bg-light',
          'bg-dark' => 'bg-dark'
          );
    }
}