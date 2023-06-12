<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library\View\JForm;

defined('_JEXEC') or die;

use Joomla\CMS\Factory;
use Joomla\CMS\Language\Text;

class TfPassword
{
  	public static $input_class = '';
  
  	public static $group_class = '';
  
  	public static $hidden_class = '';
  
  	public static function get_output($field, $fw = 'bs')
    {      
      	$document = Factory::getApplication()->getDocument();
      	$wa = $document->getWebAssetManager();
      	$wa->useScript('field.passwordview');
      
      	Text::script('JFIELD_PASSWORD_INDICATE_INCOMPLETE');
		Text::script('JFIELD_PASSWORD_INDICATE_COMPLETE');
		Text::script('JSHOWPASSWORD');
		Text::script('JHIDEPASSWORD');
      
      	$function_name = 'set_class_' . $fw;
      	self::$function_name();
      	
      	$output = '<div class="' . self::$group_class . '">';
      
      	$output .= '<input type="' . strtolower($field->type) . '"';
      	if (!empty(self::$input_class))
        {
        	$output .= ' class="' . self::$input_class . '"';
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

      	$output .= '>';
      
      	// Button
      	$output .= '<button type="button" class="btn btn-light input-password-toggle">';
        	$output .= '<span class="far fa-eye fa-fw" aria-hidden="true"></span>';
            $output .= '<span class="' . self::$hidden_class . '">' . Text::_('JSHOWPASSWORD') . '</span>';
        $output .= '</button>';
      
      	$output .= '</div>';
      	
      	return $output;
    }
  
  	public static function set_class_bs()
    {
     	self::$input_class = 'form-control';
      
      	self::$group_class = 'input-group';
      
      	self::$hidden_class = 'visually-hidden';
    }
  
  	public static function set_class_uk()
    {
     	self::$input_class = 'uk-input';
    }
  
  	public static function set_class_amp()
    {
     	self::$input_class = 'form-input';
      
      	self::$group_class = 'input-group';
      
      	self::$hidden_class = 'text-assistive';
    }
}