<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library;

defined('_JEXEC') or die;

use Joomla\CMS\Factory;
use Joomla\CMS\Language\Text;

// XMF Field Generation Script

class TfAlpha
{
    // 01. Get array of custom field elements XML
    public static function display_fields($fields, $joomla_field = false)
	{
        $elements = array();
        
        if (!empty($fields))
        {
            foreach ($fields as $field)
            {
                $field = (object) $field;
                
                if ($joomla_field)
                {
                    $field = self::convert_joomla_field($field);
                }
                
                switch ($field->type)
                {
                    case 'text' :
                        $elements[] = TfXml::field_text($field);
                        break;
                        
                    case 'email' :
                        $elements[] = TfXml::field_email($field);
                        break;
                        
                    case 'url' :
                        $elements[] = TfXml::field_url($field);
                        break;
                        
                    case 'list' :
                    case 'checkboxes' :
                        $elements[] = TfXml::field_list($field);
                        break;
                        
                    case 'radio' :
                        $elements[] = TfXml::field_radio($field);
                        break;
                        
                    case 'integer' :
                        $elements[] = TfXml::field_integer($field);
                        break;
                        
                    case 'number' :
                    case 'range' :
                        $elements[] = TfXml::field_number($field);
                        break;
                        
                    case 'password' :
                        $elements[] = TfXml::field_password($field);
                        break;
                        
                    case 'file' :
                        $elements[] = TfXml::field_file($field);
                        break;
                        
                    case 'note' :
                        $elements[] = TfXml::field_note($field);
                        break;
                        
                    case 'textarea' :
                        $elements[] = TfXml::field_textarea($field);
                        break;
                        
                    case 'calendar' :
                        $elements[] = TfXml::field_calendar($field);
                        break;
                        
                    case 'subform' :
                        $elements[] = TfXml::field_subform($field);
                        break;
                        
                    case 'filelist' :
                        $elements[] = TfXml::field_filelist($field);
                        break;
                        
                    case 'folderlist' :
                        $elements[] = TfXml::field_folderlist($field);
                        break;
                        
                    case 'imagelist' :
                        $elements[] = TfXml::field_imagelist($field);
                        break;
                    
                  	case 'sql' :
                        $elements[] = TfXml::field_sql($field);
                        break;
                    
                    case 'hidden' :
                        $elements[] = TfXml::field_hidden($field);
                        break;
                    
                    case 'editor' :
                        $elements[] = TfXml::field_editor($field);
                        break;
                    
                    case 'color' :
                        $elements[] = TfXml::field_color($field);
                        break;
                }
            }
        }
        
	    return $elements;
	}
	
	// 02. Convert Joomla Field
	public static function convert_joomla_field($field)
	{
	    // fieldparams (specific to field type), params (common for all fields)
	    
	    $new_field = new \stdClass();
	    
	    $new_field->id = $field->id;
	    $new_field->name = $field->name;
	    $new_field->type = $field->type;
	    $new_field->label = $field->label;
	    $new_field->description = $field->description;
	    $new_field->default_value = $field->default_value;
	    
	    if (isset($field->required))
        {
            $new_field->required = ($field->required) ? 'true' : 'false';
        }
	    
	    $new_field->label_class = $field->params->get('label_class', '');
        $new_field->hint = $field->params->get('hint', '');
        $new_field->form_layout = $field->params->get('form_layout', '');
        
        $new_field->options = $field->fieldparams->get('options');
        $new_field->multiple = $field->fieldparams->get('multiple');
        $new_field->directory = 'images/' . $field->fieldparams->get('directory');
        $new_field->rows = $field->fieldparams->get('rows');
        $new_field->cols = $field->fieldparams->get('cols');
        $new_field->maxlength = $field->fieldparams->get('maxlength');
        $new_field->relative = $field->fieldparams->get('relative');

	    return $new_field;
	}
}