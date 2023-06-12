<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library;

defined('_JEXEC') or die;

use Joomla\CMS\Component\ComponentHelper;
use Joomla\CMS\Factory;
use Joomla\Component\Fields\Administrator\Helper\FieldsHelper;

// Helper class for Joomla custom fields

class TfField
{
    /*
  	FieldsHelper - extract, getFields, render, prepareForm, canEditFieldValue, displayFieldOnForm, getAssignedCategoriesIds,
  					getAssignedCategoriesTitles, getFieldsPluginId, getFieldTypes, clearFieldsCache
  	*/
  	
  	// 01. Save custom field
    public static function save_custom_field($field_id, $item_id, $value)
    {
        $fieldModel = Factory::getApplication()->bootComponent('com_fields')->getMVCFactory()->createModel('Field', 'Administrator', ['ignore_request' => true]);
        
      	// Custom field value will not be saved if not authorized to change it
       	$result = $fieldModel->setFieldValue($field_id, $item_id, $value);      
        
        return $result;
    }
    
    // 02. Get custom field
    public static function get_custom_field($field_id, $item_id)
    {
        $fieldModel = Factory::getApplication()->bootComponent('com_fields')->getMVCFactory()->createModel('Field', 'Administrator', ['ignore_request' => true]);
        
        $value = $fieldModel->getFieldValue($field_id, $item_id);
        
        return $value;
    }
  
  	// 03. Get custom fields - $field_ids: array
    public static function get_custom_fields($field_ids, $item_id)
    {
        $fieldModel = Factory::getApplication()->bootComponent('com_fields')->getMVCFactory()->createModel('Field', 'Administrator', ['ignore_request' => true]);
        
        $value = $fieldModel->getFieldValues($field_ids, $item_id);
        
        return $value;
    }
	
	// 04. Get custom fields by context, optionally grouped by custom field groups
	public static function get_fields($context, $grouped = false)
	{
	    $fields = FieldsHelper::getFields($context);
	    
	    if ($grouped)
	    {
    	    // Organizing fields according to their group
    		$fieldsPerGroup = array(0 => array());
    		
    		foreach ($fields as $field)
    		{
    		    if (!array_key_exists($field->group_id, $fieldsPerGroup))
    			{
    				$fieldsPerGroup[$field->group_id] = array();
    			}
    			
    			$fieldsPerGroup[$field->group_id][] = $field;
    		}
    	    
    	    return $fieldsPerGroup;
	    }
	    else
	    {
	        return $fields;
	    }
	}
  
  	// 05. Get information about field
  	public static function get_field($field_id)
    {
    	$fieldModel = Factory::getApplication()->bootComponent('com_fields')->getMVCFactory()->createModel('Field', 'Administrator', ['ignore_request' => true]);
        
      	// Sets context, fieldparams, assigned_cat_ids
        $field = $fieldModel->getItem($field_id);
      
      	return $field;
    }
  
  	// 06. Get information about field group
  	public static function get_field_group($group_id)
    {
    	$groupModel = Factory::getApplication()->bootComponent('com_fields')->getMVCFactory()->createModel('Group', 'Administrator', ['ignore_request' => true]);
        
      	// Sets context, params
        $group = $groupModel->getItem($group_id);
      
      	return $group;
    }
  
  	// 07. Get all field groups for context
  	public static function get_field_groups($context)
    {
    	$conditions = array(
          array('context', '=', $context),
          array('state', '=', 1)
          );
      
      	$groups = TfDb::get_column('fields_groups', 'id', $conditions, 'ordering ASC');
      
      	return $groups ? $groups : array();
    }
  
  	// 08. Get $this->item->jcfields by groups for items
  	public static function render_fields_by_group($context, $item, $fields)
    {
    	$groups = array();
      	$output = array();
      	foreach ($fields as $field)
        {
          	if (!isset($groups[$field->group_id]))
            {
            	$groups[$field->group_id] = array();
            }
          	
          	$groups[$field->group_id][] = $field;
        }

      	foreach ($groups as $group_id => $group)
        {
        	$output[$group_id] = FieldsHelper::render($context, 'fields.render', ['item' => $item, 'context' => $context, 'fields' => $group]);
        }
      
      	return $output;
    }
  
  	// 09. Get label of custom field from id
  	public static function get_custom_field_label($id)
    {
    	return TfDb::get_single('fields', $id, 'label');
    }
}