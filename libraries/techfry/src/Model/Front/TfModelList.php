<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library\Model\Front;

defined('_JEXEC') or die;

use Joomla\CMS\Factory;
use Joomla\CMS\MVC\Model\ListModel;
use TechFry\Library\Model\TfModelTrait;
use TechFry\Library\TfDb;

class TfModelList extends ListModel
{
    use TfModelTrait;
    
    public $select_fields = array();
    
    public $join_tables = array(); // Depreciated
    public $joins = array(); // Depreciated
  	public $left_joins = array();
  	public $inner_joins = array();
    
    public $where = array();
  	public $or_where = array();
  	public $and_where = array();
    
    public $orderby;
    
    public $searches = array('a.title');
    
    // 01. Query for list of items
    protected function getListQuery()
    {
        if (empty($this->select_fields))
        {
            $this->select_fields = '*';
        }
      
      	// Get table columns
      	$db = Factory::getDbo();
        $cols = $db->getTableColumns('#__' . $this->table_name);
      
        $char = 'a';
      	$search_char = 'a';
        
        // Initialize variables
        $db = Factory::getDbo();
        $query = $db->getQuery(true);
        
        $query->select($this->select_fields)
            ->from($db->quoteName('#__' . $this->table_name, $char));
      
      	if (array_key_exists('published', $cols))
        {
        	$query->where($db->quoteName('a.published') . ' = ' . $db->quote(1));  
        }
            
        // Search
        $input = Factory::getApplication()->input;
        foreach ($this->searches as $search)
        {
          	// $search is numeric for joomla custom field
          	if (is_numeric($search))
            {
            	$field = TfDb::get_item('fields', $search);
              	$search_field = $field->name;
              
              	$search_value = $input->get($search_field, '', 'RAW');
    	    	if ($search_value)
    	    	{
                  	$join_as = 'fv' . $search_char++;
                  	$this->left_joins[] = array('table' => 'fields_values', 'as' => $join_as, 'on1' => 'a.id', 'on2' => $join_as . '.item_id');
                  	$this->where[] = array($join_as . '.field_id', '=', $search);
                  	$this->where[] = array($join_as .  '.value', 'LIKE', '%' . $search_value . '%');
    	    	}
            }
            else
            {
            	if (strpos($search, '.') == true)
            	{
                	$arr = explode('.', $search);
                	$search_field = $arr[1];
            	}
            	else
            	{
                	$search_field = $search;
            	}
              
              	$search_value = $input->get($search_field, '', 'RAW');
    	    	if ($search_value)
    	    	{
    	        	$query->where($db->quoteName($search) . ' LIKE ' . $db->quote('%' . $search_value . '%'));
    	    	}  
            }
        }
        
        // Join over other tables
        foreach ($this->join_tables as $table)
        {
            $char++;
            
            $query->select($char . '.' . $table[1])
                 ->join('LEFT', $db->quoteName('#__' . $table[0], $char) . ' ON a.' . $table[2] . ' = ' . $char . '.id');
        }
        
        if (!empty($this->joins))
        {
            foreach ($this->joins as $join)
            {
                $char++;
              	if (!isset($join['on2']))
                {
                	$join['on2'] = $char . '.id';
                }
                
                $query->join('LEFT', $db->quoteName('#__' . $join['table'], $char) . ' ON ' . $join['on'] . ' = ' . $join['on2']);
            }
        }
      
      	if (!empty($this->left_joins))
        {
        	foreach ($this->left_joins as $join)
            {
                $char++;
              	if (isset($join['as']))
                {
                	$join_as = $join['as'];
                }
              	else
                {
                  	$join_as = $char;
                }
              
                $query->join('LEFT', $db->quoteName('#__' . $join['table'], $join_as), $db->quoteName($join['on1']) . ' = ' . $db->quoteName($join['on2']));
            }  
        }
      
      	if (!empty($this->inner_joins))
        {
        	foreach ($this->inner_joins as $join)
            {
                $char++;
              	if (isset($join['as']))
                {
                	$join_as = $join['as'];
                }
              	else
                {
                  	$join_as = $char;
                }
              
                $query->join('INNER', $db->quoteName('#__' . $join['table'], $char), $db->quoteName($join['on1']) . ' = ' . $db->quoteName($join['on2']));
            }  
        }
        
      	// Where Conditions
        foreach ($this->where as $condition)
        {
            if (is_array($condition))
            {
                $query->Where($db->quoteName($condition[0]) . ' ' . $condition[1] . ' ' . $db->quote($condition[2]));
            }
            else
            {
                $query->Where($condition);
            }
        }
      
      	// Where Conditions (OR)
        foreach ($this->or_where as $condition)
        {
	        $query->orWhere($condition);
        }
      
      	// Where Conditions (AND)
        foreach ($this->and_where as $condition)
        {
        	$query->andWhere($condition);
        }
      
        // Ordering
        if (!empty($this->orderby))
        {
            $query->order($this->orderby);
        }

        return $query;
    }
    
    // 02. Count total items in table where column = value
    public function count_items($table, $column, $value)
    {
        $db = Factory::getDbo();
		$query = $db->getQuery(true);
		
		$query->select('COUNT(*)')
		    ->from($db->quoteName('#__' . $table))
		    ->where($db->quoteName($column) . ' = ' . $db->quote($value))
		    ->andWhere($db->quoteName('published') . ' = ' . $db->quote('1'));
		    
	    $db->setQuery($query);
	    
        $total = $db->loadResult();
        
        return $total;
    }
}