<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library\View\Html;

defined('_JEXEC') or die;

class TfForm
{
    public static function get_form($fields = array(), $action = '', $method = 'post')
    {
        if (empty($fields))
        {
            return;
        }
        
        if ($action)
        {
            $action = ' action="' . $action . '"';
        }
        
        $output = '<form method="' . $method . $action . '>';
        
            foreach ($fields as $field)
            {
                $output .= $field;
            }
        
        $output .= '</form>';
        
        return $output;
    }
    
    public static function get_input($name, $type = 'text', $attribs = array())
    {
        $array = array(
            'type' => $type,
            'name' => $name
            );
        
        $attribs = array_merge($array, $attribs);
        
        return TfHtml::get_open_tag('input', $attribs);
    }
    
    public static function get_label($text, $name = '')
    {
        $attribs = array(
            'for' => $name
            );
            
        $output = TfHtml::get_element($text, 'label', $attribs);
        
        return $output;
    }
    
    public static function get_field($name, $label, $type = 'text')
    {
        $output = self::get_label($label, $name);
        
        $output .= self::get_input($name, $type);
        
        return $output;
    }
    
    public static function get_radio($name, $options = array())
    {
        $output = '';
        
        foreach ($options as $k => $v)
        {
            $output .= self::get_input($name, 'radio', array('value' => $v));
            $output .= self::get_label($option, $k);
        }
        
        return $output;
    }
    
    public static function get_checkbox($name, $options = array())
    {
        $output = '';
        
        foreach ($options as $k => $v)
        {
            $output .= self::get_input($k, 'checkbox', array('value' => $v));
            $output .= self::get_label($option, $k);
        }
        
        return $output;
    }
    
    public static function get_select($name, $options = array())
    {
        $output = '<select name="' . $name . '">';
        
        foreach ($options as $k => $v)
        {
            $output .= '<option value="' . $k .'">' . $v . '</option>';
        }
        
        $output .= '</select>';
        
        return $output;
    }
    
    public static function get_textarea($name)
    {
        $output = '<textarea name="' . $name . '">';
        
        $output .= '</textarea>';
        
        return $output;
    }
    
    public static function get_submit($name = 'submit', $value = 'Submit')
    {
        return self::get_input($name, 'submit', $value);
    }
}