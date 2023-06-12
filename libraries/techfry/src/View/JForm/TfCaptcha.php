<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library\View\JForm;

defined('_JEXEC') or die;

class TfCaptcha
{  
  	public static function get_output($field, $fw = 'bs')
    {      
      	$output = $field->input;
      
      	return $output;
    }
}