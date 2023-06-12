<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library\View\JForm;

defined('_JEXEC') or die;

use TechFry\Library\TfAmp;

class TfCheckbox
{ 
  	public static $inner_div_class = '';
  	
  	public static $input_class = '';
  	
  	public static $label_class = '';
  
  	public static function get_output($field, $fw = 'bs')
    {      
      	if (TfAmp::check_amp())
        {
        	$fw = 'amp';  
        }
      
      	$function_name = 'set_class_' . $fw;
      	self::$function_name();

        $output = '<div class="' . self::$inner_div_class . '">';
            $output .= '<input type="checkbox"';
            if (!empty(self::$input_class))
            {
              $output .= ' class="' . self::$input_class . '"';
            }
            $output .= ' name="' . $field->name . '" id="' . $field->name . '"';
      
      		$value = htmlspecialchars($field->value, ENT_QUOTES, 'UTF-8');
            $output .= ' value="' . $value . '"';

            $output .= '> ';

            $output .= '<label for="' . $field->name . '" class="' . self::$label_class . '">' . $field->label . '</label>';
        $output .= '</div>';
          
      	return $output;
    }
  
  	public static function set_class_bs()
    {
     	self::$inner_div_class = 'form-check';
      
      	self::$input_class = 'form-check-input';
      
      	self::$label_class = 'form-check-label';
    }
  
  	public static function set_class_uk()
    {
     	self::$input_class = 'uk-checkbox';
      
      	self::$label_class = 'uk-margin-right';
    }
  
  	public static function set_class_amp()
    {
    	self::$inner_div_class = 'form-group';
      
      	self::$input_class = '';
      
      	self::$label_class = '';  
    }
}