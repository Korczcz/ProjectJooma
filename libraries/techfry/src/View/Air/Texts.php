<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library\View\Air;

defined('_JEXEC') or die;

class Texts
{
    use UtilityTrait;
  
  	public static function get_classes_bs()
    {
      	self::$classes = array(
          'text-primary' => 'text-primary',
          'text-secondary' => 'text-secondary',
          'text-success' => 'text-success',
          'text-danger' => 'text-danger',
          'text-warning' => 'text-warning',
          'text-info' => 'text-info',
          'text-light' => 'text-light',
          'lead' => 'lead'
          );
    }
  
  	public static function get_classes_uk()
    {
     	self::$classes = array(
          'text-primary' => 'uk-text-primary',
          'text-secondary' => 'uk-text-secondary',
          'text-success' => 'uk-text-success',
          'text-danger' => 'uk-text-danger',
          'text-warning' => 'uk-text-warning',
          'text-info' => 'uk-text-primary',
          'text-light' => 'uk-text-muted',
          'lead' => 'uk-text-lead'
          );
    }
  
  	public static function get_classes_fn()
    {
      	self::$classes = array(
          'text-primary' => '',
          'text-secondary' => '',
          'text-success' => '',
          'text-danger' => '',
          'text-warning' => '',
          'text-info' => '',
          'text-light' => '',
          'lead' => 'lead'
          );
    }
  
  	public static function get_classes_amp()
    {
      	self::$classes = array(
          'text-primary' => 'text-primary',
          'text-secondary' => 'text-secondary',
          'text-success' => 'text-success',
          'text-danger' => 'text-error',
          'text-warning' => 'text-warning',
          'text-info' => 'text-primary',
          'text-light' => 'text-light',
          'lead' => 'lead'
          );
    }
}