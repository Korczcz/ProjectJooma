<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library\View\JForm;

defined('_JEXEC') or die;

use Joomla\CMS\Factory;
use Joomla\CMS\Language\Text;
use TechFry\Library\TfAmp;

class TfText
{
  	public static $input_class = '';
  
  	public static $group_class = '';
  
  	public static $group_text_class = '';
  
  	public static function get_output($field, $fw = 'bs')
    {      
      	if (TfAmp::check_amp())
        {
        	$fw = 'amp';  
        }
      
      	$function_name = 'set_class_' . $fw;
      	self::$function_name();
      	
      	$charcounterclass = '';
		if ($field->charcounter) 
        {
	    	$wa = Factory::getApplication()->getDocument()->getWebAssetManager();
   	 		$wa->useScript('short-and-sweet');

		    // Set the css class to be used as the trigger
    		$charcounterclass = ' charcount';

    		// Set the text
    		$counterlabel = ' data-counter-label="' . Text::_('JFIELD_META_DESCRIPTION_COUNTER') . '"';
		}

      	$output = '';
      	if ($field->addonBefore || $field->addonAfter)
        {
          	$output .= '<div class="' . self::$group_class . '">';  
        }
      
      	if ($field->addonBefore)
        {
          	$output .= '<span class="' . self::$group_text_class . '">' . Text::_($field->addonBefore) . '</span>';
        }
      
      	$output .= '<input type="' . strtolower($field->type) . '"';
      	if (!empty(self::$input_class))
        {
        	$output .= ' class="' . self::$input_class . $charcounterclass . '"';
        }
      	$output .= ' name="' . $field->name . '"';
      
      	if ($field->value)
        {
        	$output .= ' value="' . $field->value . '"';
        }
      
      	if ($field->hint)
        {
        	$output .= ' placeholder="' . Text::_($field->hint) . '"';
        }
      
      	if ($field->required)
        {
        	$output .= ' required';
        }
      
      	if ($field->readonly)
        {
        	$output .= ' readonly';
        }
      
      	if ($field->disabled || $field->readonly)
        {
        	$output .= ' disabled';
        }
      
      	if ($field->maxLength)
        {
        	$output .= ' maxlength="' . $field->maxLength . '"';
        }
      
      	if (isset($counterlabel) && $counterlabel)
        {
         	$output .= $counterlabel;
        }

      	$output .= '>';
      
      	if ($field->addonAfter)
        {
          	$output .= '<span class="' . self::$group_text_class . '">' . Text::_($field->addonAfter) . '</span>';
        }
      
      	if ($field->addonBefore || $field->addonAfter)
        {
        	$output .= '</div>';
        }
      	
      	return $output;
    }
  
  	public static function set_class_bs()
    {
     	self::$input_class = 'form-control';
      
      	self::$group_class = 'input-group';
      
      	self::$group_text_class = 'input-group-text';
    }
  
  	public static function set_class_uk()
    {
     	self::$input_class = 'uk-input';
    }
  
  	public static function set_class_amp()
    {
     	self::$input_class = 'form-input';
      
      	self::$group_class = 'input-group';
    }
}