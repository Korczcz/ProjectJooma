<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library\View\Air;

defined('_JEXEC') or die;

use Joomla\CMS\Factory;
use Joomla\CMS\Language\Text;
use TechFry\Library\TfDb;
use TechFry\Library\TfAmp;

class Search
{
    public static $fw;
  
  	public static $config;
  
  	public static $form_class;
  
  	public static $form_group_class;
  	
  	public static $select_class;
  	public static $input_class;
  
  	public static $button_class;
  	public static $reset_button_class;
  
  	public static function get_output($searches = array(), $config = array(), $fw = 'bs')
    {
        // config
      	// searches - either database column field or joomla custom field id
      	
      	if (empty($searches))
        {
         	$searches = array('title');
        }
      
      	$function_name = 'get_classes_' . $fw;
      	self::$function_name();
        
        $is_amp = TfAmp::check_amp();
        
        if (!$is_amp)
        {
            $grid = Grid::get_grid(3, $fw); // Three Equal Columns
            $columns = 3;
            
            $input = Factory::getApplication()->input;
            
            $output = '<form class="' . self::$form_class . '" method="post" role="search">';
            
          	$n = 0;
          	foreach ($searches as $search)
          	{
            	$options = array();

            	// $search is numeric for joomla custom fields
            	if (is_numeric($search))
            	{
              		$field = TfDb::get_item('fields', $search);
              		$search = $field->name;

              		$search_type = ($field->type == 'list' || $field->type == 'radio') ? 'search_list' : 'search_text';
              		if ($field->type == 'list' || $field->type == 'radio')
              		{
                		$options = json_decode($field->fieldparams, true)['options'];
              		}
            	}
            	else
            	{
              		$search_type = 'search_text';
            	}

            	$value = $input->get($search, '', 'RAW');

              	if ($n == 0)
                {
                	$output .= '<div class="' . $grid['row'] . '">';
                }
            	
              	$output .= '<div class="' . $grid['col1'] . '">';
              		$output .= self::$search_type($search, $value, $options);
              	$output .= '</div>';
              
              	$n++;
              
              	if ($n == $columns)
                {
                	$output .= '</div>';
                  	$n = 0;  
                }
          	}
          
          	if ($n != $columns && $n != 0)
            {
            	$output .= '</div>';  
            }

            $output .= '<input type="submit" class="' . self::$button_class . '" value="' . Text::_('COM_TF_BUTTON_SEARCH') . '">';
          	// $output .= '<input type="reset" class="' . self::$reset_button_class . '" value="Clear">';
            
            $output .= '</form>';
        }
        
        return $output;
    }
  
  	public static function get_classes_bs()
    {
     	self::$form_class = 'mb-3';
      
      	self::$form_group_class = 'form-group me-2';
      	
      	self::$select_class = 'form-select form-select-sm mb-2';
      	self::$input_class = 'form-control form-control-sm mb-2';
      
      	self::$button_class = 'btn btn-outline-primary btn-sm';
      	self::$reset_button_class = 'ms-2 btn btn-outline-secondary btn-sm';
    }
  
  	public static function get_classes_uk()
    {
     	self::$form_class = 'uk-margin-bottom';
      
      	self::$form_group_class = 'form-group uk-margin-right';
      
      	self::$select_class = 'uk-select';
      	self::$input_class = 'uk-input uk-form-small';
      
      	self::$button_class = 'uk-button uk-button-default uk-button-small';
      	self::$reset_button_class = 'uk-button uk-button-secondary uk-button-small'; 
    }
  
  	public static function search_text($search, $value, $options = array())
    {
     	$output = '';
      
      	$output .= '<div class="' . self::$form_group_class . '">';
        	$output .= '<input type="search" class="' . self::$input_class . '" name="' . $search . '" id="search-' . $search . '"';
            $output .= $value ? ' value="' . $value . '"' : '';
            $output .= ' placeholder="' . ucwords($search) . '">';
        $output .= '</div>';
      
      	return $output;
    }
  
  	public static function search_list($search, $value, $options = array())
    {
     	if (empty($options))
        {
        	return;  
        }
      	$output = '';
      
      	$output .= '<div class="' . self::$form_group_class . '">';
        	$output .= '<select type="search" class="' . self::$select_class . '" name="' . $search . '" id="search-' . $search . '"';
            $output .= $value ? ' value="' . $value . '"' : '';
            $output .= '>';
      			$output .= '<option value="">' . ucwords($search) . '</option>';
      			foreach ($options as $option)
                {
                 	$selected = ($option['value'] == $value) ? ' selected' : '';
                  
                  	$output .= '<option value="' . $option['value'] . '"' . $selected . '>' . $option['name'] . '</option>'; 
                }
      		$output .= '</select>';
        $output .= '</div>';
      
      	return $output;
    }
}