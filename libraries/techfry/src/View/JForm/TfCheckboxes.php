<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library\View\JForm;

defined('_JEXEC') or die;

class TfCheckboxes
{ 
  	public static $inner_div_class = '';
  	
  	public static $input_class = '';
  	
  	public static $label_class = '';
  
  	public static function get_output($field, $fw = 'bs')
    {      
      	$checked_options = array();
      	if ($field->value)
        {
        	$checked_options = is_array($field->value) ? $field->value : json_decode($field->value, true);  
        }
      
      	$function_name = 'set_class_' . $fw;
      	self::$function_name();
      
      	$output = '<div>';

		foreach ($field->options as $i => $option)
        {
        	$oid = $field->id . $i; // Id for each option
          	$value = htmlspecialchars($option->value, ENT_COMPAT, 'UTF-8');
          	$checked = in_array($value, $checked_options) ? ' checked' : '';
          
          	$output .= '<div class="' . self::$inner_div_class . '">';  
          		$output .= '<input type="checkbox"';
          		if (!empty(self::$input_class))
            	{
              		$output .= ' class="' . self::$input_class . '"';
            	}
          		
          		$output .= ' id="' . $oid . '"';
          		$output .= ' name="' . $field->name . '"';
          		$output .= ' value="' . $value . '"';
          		$output .= $checked;
          		$output .= '> ';
          
          		$output .= '<label for="' . $oid . '" class="' . self::$label_class . '">' . $option->text . '</label>';
          
          	$output .= '</div>';
        }        
      
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
}