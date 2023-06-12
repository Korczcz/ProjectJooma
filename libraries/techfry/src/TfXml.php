<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library;

defined('_JEXEC') or die;

// Script for Xml Forms
class TfXml
{
    public static function create_xml($main_tag = 'form')
    {
    	$str = '<?xml version="1.0" encoding="UTF-8"?><' . $main_tag . '></' . $main_tag . '>';
      
      	$xml = new \SimpleXMLElement($str);
      
      	return $xml;
    }
  	
  	public static function add_child($xml, $name, $value, $attributes = array())
    {
    	$child = $xml->addChild($name, $value);
      
      	if (!empty($attributes))
        {
        	foreach ($attributes as $k => $v)
            {
            	$child->addAttribute($k, $v);
            }
        }
      
      	$final_xml = $xml->asXML();
      
      	return $final_xml;
    } 
  	
  	public static function start_field($field)
    {
        // name, type, label, description, required, default, hint, readonly, filter, message, disabled
      	// autocomplete, hiddenDescription, hiddenLabel, pattern, validationtext, labelclass
        
        $output = '<field name="' . $field->name . '"';
        $output .= ' type="' . $field->type . '"';
        $output .= ' label="' . $field->label . '"';
        
        $output .= (isset($field->description) && $field->description) ? ' description="' . strip_tags($field->description) . '"' : '';
        
        // $output .= (isset($field->default_value)) ? ' default="' . $field->default_value . '"' : '';
      
      	if (isset($field->default_value))
        {
        	$field->default_value = TfDynamic::user($field->default_value);
          	$output .= ' default="' . $field->default_value . '"';
        }
           
        $output .= (isset($field->hint)) ? ' hint="' . $field->hint . '"' : '';
        
        $output .= (isset($field->required)) ? ' required="' . $field->required . '"' : '';
        
        $output .= (isset($field->readonly)) ? ' readonly="' . $field->readonly . '"' : '';
      
      	$output .= (isset($field->autocomplete)) ? ' autocomplete="' . $field->autocomplete . '"' : '';
      
      	$output .= (isset($field->hidden_description)) ? ' hiddenDescription="' . $field->hidden_description . '"' : '';
      
      	$output .= (isset($field->hidden_label)) ? ' hiddenLabel="' . $field->hidden_label . '"' : '';
      
      	$output .= (isset($field->labelclass)) ? ' labelclass="' . $field->labelclass . '"' : '';
      
      	$output .= (isset($field->pattern)) ? ' pattern="' . $field->pattern . '"' : '';
      
      	$output .= (isset($field->validationtext)) ? ' validationtext="' . $field->validationtext . '"' : '';
      
      	$output .= (isset($field->disabled)) ? ' disabled="' . $field->disabled . '"' : '';
      
      	$output .= (isset($field->filter)) ? ' filter="' . $field->filter . '"' : '';
      
      	$output .= (isset($field->message)) ? ' message="' . $field->message . '"' : '';
        
        return $output;
    }
    
    // Set options for list, radio, checkboxes
    public static function set_field_options($options)
    {
        $output = '';
        
        if (is_string($options))
        {
            $options_obj = explode(',', $options);
            foreach ($options_obj as $opt)
            {
                $output .= '<option value="' . $opt . '">' . $opt . '</option>';
            }
        }
        else
        {
            foreach ($options as $opt)
            {
                if (is_array($opt))
                {
                    $opt = (object) $opt;
                }
                $output .= '<option value="' . $opt->value . '">' . $opt->name . '</option>';
            }
        }
        
        return $output;
    }
    
    // A-01. Text Field
    public static function field_text($field)
    {
        // maxlength, charcounter, inputmode, addonBefore, addonAfter
        
        $output = self::start_field($field);
        
        $output .= $field->maxlength ? ' maxlength="' . $field->maxlength . '"' : '';
      	$output .= $field->charcounter ? ' charcounter="' . $field->charcounter . '"' : '';
      	$output .= (isset($field->inputmode)) ? ' inputmode="' . $field->inputmode . '"' : '';
      	$output .= (isset($field->addon_before)) ? ' addonBefore="' . $field->addon_before . '"' : '';
      	$output .= (isset($field->addon_after)) ? ' addonAfter="' . $field->addon_after . '"' : '';
        
        $output .= '></field>';

        return $output;
    }
    
    // A-02. Email Field
    public static function field_email($field)
    {
        $output = self::start_field($field);
        
        $output .= '></field>';
        
        return $output;
    }
    
    // A-03. Url Field
    public static function field_url($field)
    {
        // maxlength, relative
        
        $output = self::start_field($field);
        
        $output .= (isset($field->relative)) ? ' relative="' . $field->relative . '"' : '';
        $output .= (isset($field->maxlength)) ? ' maxlength="' . $field->maxlength . '"' : '';
        
        $output .= '></field>';
        
        return $output;
    }
    
    // A-04. List Field (Also used for checkboxes)
    public static function field_list($field)
    {
        // multiple, layout
        
        $output = self::start_field($field);
        
        $output .= (isset($field->form_layout)) ? ' layout="' . $field->form_layout . '"' : '';
        $output .= (isset($field->multiple)) ? ' multiple="' . $field->multiple . '"' : '';
        
        $output .= '>';
        
        // Options
        $output .= self::set_field_options($field->options);
        
        $output .= '</field>';
        
        return $output;
    }
    
    // A-05. Radio Field
    public static function field_radio($field)
    {
        // layout
        
        $output = self::start_field($field);
        
        $output .= (isset($field->form_layout)) ? ' layout="' . $field->form_layout . '"' : '';
        
        $output .= '>';
        
        // Options
        $output .= self::set_field_options($field->options);
        
        $output .= '</field>';
        
        return $output;
    }
    
    // A-06. Integer Field (Depreciated : Use Number field only)
    public static function field_integer($field)
    {
        // first, last, step
        
        $output = self::start_field($field);
        
        $output .= ' first="' . $field->first . '"';
        $output .= ' last="' . $field->last . '"';
        $output .= ' step="' . $field->step . '"';
        
        $output .= '></field>';
        
        return $output;
    }
    
    // A-07. Number Field (Also used for Range)
    public static function field_number($field)
    {
        // min, max, step
        
        if ($field->options != '')
        {
            $arr = str_getcsv($field->options);
            foreach ($arr as $v)
            {
                $a = explode(':', $v);
                $var = $a[0];
                $field->$var = $a[1];
            }
        }
        
        $output = self::start_field($field);
        
        $output .= ' min="' . $field->min . '"';
        $output .= ' max="' . $field->max . '"';
        $output .= ' step="' . $field->step . '"';
        
        $output .= '></field>';
        
        return $output;
    }
    
    // A-08. Textarea Field
    public static function field_textarea($field)
    {
        // rows, cols
        
        $output = self::start_field($field);
        
        $output .= ' rows="' . $field->rows . '"';
        $output .= ' cols="' . $field->cols . '"';
        
        $output .= '></field>';
        
        return $output;
    }
    
    // A-09. Calendar Field
    public static function field_calendar($field)
    {
        // showtime, singleheader, todaybutton, weeknumbers, filltable, translateformat, format, minyear, maxyear
        
        $output = self::start_field($field);
        
        $output .= (isset($field->showtime)) ? ' showtime="' . $field->showtime . '"' : '';
        $output .= (isset($field->singleheader)) ? ' singleheader="' . $field->singleheader . '"' : '';
        $output .= (isset($field->todaybutton)) ? ' todaybutton="' . $field->todaybutton . '"' : '';
        $output .= (isset($field->weeknumbers)) ? ' weeknumbers="' . $field->weeknumbers . '"' : '';
        $output .= (isset($field->filltable)) ? ' filltable="' . $field->filltable . '"' : '';
        $output .= (isset($field->translateformat)) ? ' translateformat="' . $field->translateformat . '"' : '';
        $output .= (isset($field->format)) ? ' format="' . $field->format . '"' : '';
        $output .= (isset($field->minyear)) ? ' minyear="' . $field->minyear . '"' : '';
        $output .= (isset($field->maxyear)) ? ' maxyear="' . $field->maxyear . '"' : '';
        
        $output .= '></field>';
        
        return $output;
    }
    
    // A-10. Password Field
    public static function field_password($field)
    {
        $output = self::start_field($field);
        
        $output .= '></field>';
        
        return $output;
    }
    
    // A-11. File Field
    public static function field_file($field)
    {
        // multiple
        
        $output = self::start_field($field);
        
        $output .= (isset($field->multiple)) ? ' multiple="' . $field->multiple . '"' : '';
        
        $output .= '></field>';
        
        return $output;
    }
    
    // A-12. Note Field
    public static function field_note($field)
    {
        // class, close
        
        $output = self::start_field($field);
        
        $output .= (isset($field->class_value)) ? ' class="' . $field->class_value . '"' : '';
        $output .= (isset($field->close) && $field->close == 'true') ? ' close="' . $field->close . '"' : '';
        
        $output .= '></field>';
        
        return $output;
    }
    
    // A-13. Filelist Field
    public static function field_filelist($field)
    {
        // directory, fileFilter, exclude, stripext
        
        $output = self::start_field($field);
        
        $output .= (isset($field->directory)) ? ' directory="' . $field->directory . '"' : '';
        $output .= (isset($field->fileFilter)) ? ' fileFilter="' . $field->fileFilter . '"' : '';
        $output .= (isset($field->exclude)) ? ' exclude="' . $field->exclude . '"' : '';
        $output .= (isset($field->stripext)) ? ' stripext="' . $field->stripext . '"' : '';
      
      	$output .= (isset($field->hide_none)) ? ' hide_none="' . $field->hide_none . '"' : '';
      	$output .= (isset($field->hide_default)) ? ' hide_default="' . $field->hide_default . '"' : '';
      
      	$output .= (isset($field->form_layout)) ? ' layout="' . $field->form_layout . '"' : '';
        $output .= (isset($field->multiple)) ? ' multiple="' . $field->multiple . '"' : '';
        
        $output .= '></field>';
        
        return $output;
    }
    
    // A-14. Folderlist Field
    public static function field_folderlist($field)
    {
        // directory, folderFilter, exclude, recursive
        
        $output = self::start_field($field);
        
        $output .= (isset($field->directory)) ? ' directory="' . $field->directory . '"' : '';
        $output .= (isset($field->folderFilter)) ? ' folderFilter="' . $field->folderFilter . '"' : '';
        $output .= (isset($field->exclude)) ? ' exclude="' . $field->exclude . '"' : '';
        $output .= (isset($field->recursive)) ? ' recursive="' . $field->recursive . '"' : '';
      
      	$output .= (isset($field->hide_none)) ? ' hide_none="' . $field->hide_none . '"' : '';
      	$output .= (isset($field->hide_default)) ? ' hide_default="' . $field->hide_default . '"' : '';
      
      	$output .= (isset($field->form_layout)) ? ' layout="' . $field->form_layout . '"' : '';
        $output .= (isset($field->multiple)) ? ' multiple="' . $field->multiple . '"' : '';
        
        $output .= '></field>';
        
        return $output;
    }
    
    // A-15. Imagelist Field
    public static function field_imagelist($field)
    {
        // directory, filter, exclude, stripext
        
        $output = self::start_field($field);
        
        $output .= (isset($field->directory)) ? ' directory="' . $field->directory . '"' : '';
        $output .= (isset($field->exclude)) ? ' exclude="' . $field->exclude . '"' : '';
        $output .= (isset($field->stripext)) ? ' stripext="' . $field->stripext . '"' : '';
      
      	$output .= (isset($field->hide_none)) ? ' hide_none="' . $field->hide_none . '"' : '';
      	$output .= (isset($field->hide_default)) ? ' hide_default="' . $field->hide_default . '"' : '';
      
      	$output .= (isset($field->form_layout)) ? ' layout="' . $field->form_layout . '"' : '';
        $output .= (isset($field->multiple)) ? ' multiple="' . $field->multiple . '"' : '';
        
        $output .= '></field>';
        
        return $output;
    }
    
    // A-16. Color Field
    public static function field_color($field)
    {
        //
        
        $output = self::start_field($field);
        
        $output .= '></field>';
        
        return $output;
    }
    
    // A-17. Subform Field
    public static function field_subform($field)
    {
        // multiple, layout
        
        $output = self::start_field($field);
        
        $output .= (isset($field->form_layout)) ? ' layout="' . $field->form_layout . '"' : '';
        // $output .= (isset($field->multiple)) ? ' multiple="' . $field->multiple . '"' : '';
      	$output .= ' multiple="true"';
        
        $output .= '>';

        // Subform fields - field_name, field_type
        $output .= '<form>';
      		if (!empty($field->subform_fields))
            {
            	foreach ($field->subform_fields as $subform_field)
            	{
                	$output .= '<field name="' . $subform_field->field_name . '" type="' . $subform_field->field_type . '" label="' . $subform_field->field_name . '" />';
            	}
            }
            
      
      		// For Joomla field, subfields are stored as options
      		if (!empty($field->options))
            {
             	foreach ($field->options as $subform_field)
                {
                	$subform_field_id = $subform_field->customfield;
                  	$subfield = TfDb::get_item('fields', $subform_field_id);
                  	// print_r($subfield->label);
                  	$output .= '<field name="' . $subfield->name . '" type="' . $subfield->type . '" label="' . $subfield->label . '" />';
                }
            }
      
      
        $output .= '</form>';
        
        $output .= '</field>';
        
        return $output;
    }
  
  	// A-18. Sql Field
  	public static function field_sql($field)
    {
     	$output = self::start_field($field);
      
      	$output .= (isset($field->sql_select)) ? ' sql_select="' . $field->sql_select . '"' : '';
      	$output .= (isset($field->sql_from)) ? ' sql_from="#__' . $field->sql_from . '"' : '';
      	$output .= (isset($field->sql_where)) ? ' sql_where="' . $field->sql_where . '"' : '';
      	$output .= (isset($field->sql_group)) ? ' sql_group="' . $field->sql_group . '"' : '';
      	$output .= (isset($field->sql_order)) ? ' sql_order="' . $field->sql_order . '"' : '';
      
      	$output .= (isset($field->key_field)) ? ' key_field="' . $field->key_field . '"' : '';
      	$output .= (isset($field->value_field)) ? ' value_field="' . $field->value_field . '"' : '';
      	$output .= (isset($field->header)) ? ' header="' . $field->header . '"' : '';
      
      	$output .= (isset($field->form_layout)) ? ' layout="' . $field->form_layout . '"' : '';
        $output .= (isset($field->multiple)) ? ' multiple="' . $field->multiple . '"' : '';
      
      	$output .= '></field>';
      
     	return $output; 
    }
  
  	// A-19. Editor Field
    public static function field_editor($field)
    {
        //
        
        $output = self::start_field($field);
        
        $output .= '></field>';
        
        return $output;
    }
    
    // B-01. Limit field
    public static function filter_limit_field()
    {
        $element = '<field name="limit" type="limitbox" label="JGLOBAL_LIST_LIMIT" default="25" onchange="this.form.submit();" />';
		
		return $element;
    }
    
    // B-02. Ordering field
    public static function filter_ordering_field($orderCol)
    {
        $element = '<field name="fullordering" type="list" label="JGLOBAL_SORT_BY" onchange="this.form.submit();" default="' . $orderCol . ' DESC" validate="options">';
        
        $element .= '<option value="">JGLOBAL_SORT_BY</option>';
        
        $element .=	'</field>';
		
		return $element;
    }
    
    // B-03. Published field 
    public static function filter_published_field()
    {
        $element = '<field name="published" type="list" label="JOPTION_SELECT_PUBLISHED" onchange="this.form.submit();">';
                    
        $element .= '<option value="">JOPTION_SELECT_PUBLISHED</option><option value="1">JPUBLISHED</option><option value="0">JUNPUBLISHED</option>';
		$element .= '<option value="2">JARCHIVED</option><option value="-2">JTRASHED</option><option value="*">JALL</option>';
		$element .=	'</field>';
		
		return $element;
    }
    
    // B-04. Access field
    public static function filter_access_field()
    {
        $element = '<field name="access" type="accesslevel" label="JGRID_HEADING_ACCESS" multiple="true" layout="joomla.form.field.list-fancy-select"';
		 
		$element .= ' hint="JOPTION_SELECT_ACCESS" onchange="this.form.submit();" />';
		
		return $element;
    }
    
    // B-05. Note field
    public static function filter_note_field($table_name)
    {
        $element = '<field name="note" type="sql" query="SELECT DISTINCT note FROM #__' . $table_name . ' WHERE note != \'\' ORDER BY note ASC" key_field="note" value_field="note"';
        
        $element .= ' header="- Select Note -" default="" layout="joomla.form.field.list-fancy-select" onchange="this.form.submit();"></field>';
		
		return $element;
    }
    
    // B-06. Language field
    public static function filter_language_field()
    {
        $element = '<field name="language" type="contentlanguage" label="JGRID_HEADING_LANGUAGE" onchange="this.form.submit();">';
        
		$element .= '<option value="">JOPTION_SELECT_LANGUAGE</option><option value="*">JALL</option></field>';
		
		return $element;
    }
}