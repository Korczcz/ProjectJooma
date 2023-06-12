<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library\View\JForm;

defined('_JEXEC') or die;

use Joomla\CMS\Language\Text;

class TfHidden
{  
  	public static function get_output($field, $fw = 'bs')
    {
      	$output = '<input type="' . strtolower($field->type) . '"';
      	
      	$output .= ' name="' . $field->name . '"';
      
      	if ($field->value)
        {
        	$output .= ' value="' . $field->value . '"';
        }

      	$output .= '>';
      	
      	return $output;
    }
}