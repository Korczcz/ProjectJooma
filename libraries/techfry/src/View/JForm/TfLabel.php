<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library\View\JForm;

defined('_JEXEC') or die;

use TechFry\Library\TfAmp;

class TfLabel
{
  	public static $label_class = '';
  
  	public static function get_output($text, $for, $fw = 'bs', $config = array())
    { 
      	// config - required
      
      	if (TfAmp::check_amp())
        {
        	$fw = 'amp';  
        }
      
      	$function_name = 'set_class_' . $fw;
      	self::$function_name();
      
      	$output = '<label class="' . self::$label_class . '" for="' . $for . '"';
      	$output .= '>';
      	$output .= $text;
      	
      	if (isset($config['required']) && $config['required'])
        {
        	$output .= '<span class="star" aria-hidden="true">&#160;*</span>';
        }
      
      	$output .= '</label>';
      
      	return $output;
    }
  
  	public static function set_class_bs()
    {
     	self::$label_class = 'form-label';    
    }
  
  	public static function set_class_uk()
    {
     	self::$label_class = 'uk-form-label';
    }
  
  	public static function set_class_amp()
    {
     	self::$label_class = 'form-label';
    }
}