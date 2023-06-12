<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library;

defined('_JEXEC') or die;

use Joomla\CMS\Factory;

class TfDbv2
{
    // TO DO: Cutom query for select distinct
    
    // 01. Get multiple records from $table - all columns
    public static function get_items($table, $conditions = array(), $order = null, $limit = null, $offset = 0)
    {
        $db = Factory::getDbo();
        $query = $db->getQuery(true);
        
        $query->select('*')
            ->from($db->qn('#__' . $table));
            
        if (!empty($conditions))
        {
            $query->where($conditions);
        }
        
        if ($order)
        {
            $query->order($order);
        }
        
        if ($limit)
        {
            $query->setLimit($limit, $offset);
        }

        $db->setQuery($query);
        
        $rows = $db->loadObjectList();
            
        return $rows;
    }
    
    // 02. Get multiple records from $table; supports select columns
    public static function get_records($table, $select = '*', $conditions = array(), $order = null, $limit = null, $offset = 0)
    {
        $db = Factory::getDbo();
        $query = $db->getQuery(true);
            
        $query->select($select)
            ->from($db->qn('#__' . $table));
            
        if (!empty($conditions))
        {
            $query->where($conditions);
        }
        
        if ($order)
        {
            $query->order($order);
        }
        
        if ($limit)
        {
            $query->setLimit($limit, $offset);
        }
        
        $db->setQuery($query);
        
        $rows = $db->loadObjectList();
            
        return $rows;
    }
    
    // 03. Get multiple records from $table; supports joining tables
    public static function get_records_from_tables($table, $select = '*', $joins = array(), $conditions = array(), $order = null, $limit = null, $offset = 0)
    {
        $char = 'a';
        
        $db = Factory::getDbo();
        $query = $db->getQuery(true);
            
        $query->select($select)
            ->from($db->quoteName('#__' . $table, $char));
            
        if (!empty($conditions))
        {
            $query->where($conditions);
        }
        
        if (!empty($joins))
        {
            foreach ($joins as $join)
            {
                $char++;
                
                if (!isset($join['type']))
                {
                    $join['type'] = 'LEFT';
                }
                
                $query->join($join['type'], $db->quoteName('#__' . $join['table'], $char) . ' ON ' . $join['on'] . ' = ' . $char . '.id');
            }
        }
        
        if ($order)
        {
            $query->order($order);
        }
        
        if ($limit)
        {
            $query->setLimit($limit, $offset);
        }
        
        $db->setQuery($query);
        
        $rows = $db->loadObjectList();
            
        return $rows;
    }
    
    // 04. Get single row from $table where id is $pk
    public static function get_item($table, $pk = null, $column = 'id')
    {
        if ($pk == null)
	    {
	        $input = Factory::getApplication()->input;
            $pk = $input->get('id', 0, 'int');
	    }
        
        $db = Factory::getDbo();
        $query = $db->getQuery(true);
            
        $query->select('*')
            ->from($db->qn('#__' . $table))
            ->where($db->qn($column) . ' = ' . $db->q($pk));
        
        $db->setQuery($query);

		$row = $db->loadObject();
            
        return $row;
    }
    
    // 05. Get single record from $table based on the $conditions
    public static function get_record($table, $conditions = array(), $order = null, $offset = 0)
    {
        $db = Factory::getDbo();
        $query = $db->getQuery(true);
        
        $query->select('*')
            ->from($db->qn('#__' . $table))
            ->setLimit(1, $offset);
        
        if (!empty($conditions))
	    {
	        $query->where($conditions);
	    }
	    
	    if ($order)
        {
            $query->order($order);
        }
	    
	    $db->setQuery($query);

		$row = $db->loadObject();
            
        return $row;
    }
    
    // 06. Get single record from $table based on the $conditions; supports select columns
    public static function get_row($table, $select = array(), $conditions = array(), $order = null, $offset = 0)
    {
        $db = Factory::getDbo();
        $query = $db->getQuery(true);
        
        $query->select($select)
            ->from($db->qn('#__' . $table))
            ->setLimit(1, $offset);
        
        if (!empty($conditions))
	    {
	        $query->where($conditions);
	    }
	    
	    if ($order)
        {
            $query->order($order);
        }
	    
	    $db->setQuery($query);

		$row = $db->loadObject();
            
        return $row;
    }
    
    // 07. Get single cell value
    public static function get_single($table, $select, $conditions = array(), $order = null, $offset = 0)
    {
        $db = Factory::getDbo();
        $query = $db->getQuery(true);
            
        $query->select($select)
            ->from($db->qn('#__' . $table))
            ->setLimit(1, $offset);
            
        if (!empty($conditions))
	    {
	        $query->where($conditions);
	    }
	    
	    if ($order)
        {
            $query->order($order);
        }
        
        $db->setQuery($query);

		$result = $db->loadResult();
            
        return $result;
    }
    
    // 08. Insert or update record in $table
    public static function insert_update($table, $data, $pk = 'id')
    {
        if (\is_array($data))
        {
            $data = (object) $data;
        }
        
        // If $pk is false, then skip update and directly insert
        if ($pk)
        {
            if (isset($data->id) && $data->id != 0)
            {
                $result = Factory::getDbo()->updateObject('#__' . $table, $data, $pk);
            }
            else
            {
                $data->id = 0;
                $result = Factory::getDbo()->insertObject('#__' . $table, $data, $pk);
            }
        }
        else
        {
            $result = Factory::getDbo()->insertObject('#__' . $table, $data);
        }
        
        // TO DO: Check what to return? $result or $data
        
        return $data;
    }
    
    // 09. Delete records based on $conditions
    public static function delete_items($table, $conditions = array())
    {
        if (empty($conditions))
        {
            // TO DO: Display message
            
            return;
        }
        
        $db = Factory::getDbo();
		$query = $db->getQuery(true);
		
		$query->delete($db->qn('#__' . $table))
		    ->where($conditions);

	    $db->setQuery($query);
	    
        $db->execute();
	    
	    return $db->getAffectedRows();
    }
    
    // 10. Get total rows in $table based on $conditions
    public static function total_rows($table, $conditions = array())
    {
        if (!self::table_exists($table))
        {
            return false;
        }
        
        $db = Factory::getDbo();
        
		$query = $db->getQuery(true);
		
		$query->select('COUNT(*)')
		    ->from($db->qn('#__' . $table));
		    
	    if (!empty($conditions))
	    {
	        $query->where($conditions);
	    }
		    
	    $db->setQuery($query);
	    
        $total = $db->loadResult();
	    
	    return $total;
    }
    
    // 11. Aggregate function to a columns - AVG, SUM, MAX, MIN
    public static function aggregate_column($table, $column, $function = 'AVG', $conditions = array())
    {
        $db = Factory::getDbo();
        
		$query = $db->getQuery(true);
		
		$select = $function . '(' . $column . ')';
		
		$query->select($select)
		    ->from($db->qnuoteName('#__' . $table));
		    
	    if (!empty($conditions))
	    {
	        $query->where($conditions);
	    }
		    
	    $db->setQuery($query);
	    
        $result = $db->loadResult();
	    
	    return $result;
    }
    
   
    
    
    
    
    
    
    // 08. Check if database table exists
    public static function table_exists($table)
    {
        $db = Factory::getDbo();
        
        $tables = $db->getTableList();
        $prefix = $db->getPrefix();
        
        if (in_array($prefix . $table, $tables))
        {
            return true;
        }
        
        return false;
    }
    
    // 10. Update records based on conditions
    public static function update_records($table, $conditions = array(), $sets = array())
    {
        $db = Factory::getDbo();
        $query = $db->getQuery(true);
        
        $query->update($db->quoteName('#__' . $table));
        
        foreach ($conditions as $condition)
		{
		    $query->where($db->quoteName($condition[0]) . ' ' . $condition[1] . ' ' . $db->quote($condition[2]));
		}
		
		foreach ($sets as $k => $v)
		{
		    $query->set($db->quoteName($k) . ' = ' . $db->quote($v));
		}
		
		$db->setQuery($query);
	    
        $db->execute();
	    
	    return $db->getAffectedRows();
    }
    
    // 11. Truncate table
    public static function truncate_table($table)
    {
        $db = Factory::getDbo();
        
        $db->truncateTable('#__' . $table);
    }
    
    // 12. Get columns in a table
    public static function get_table_columns($table)
    {
        $db = Factory::getDbo();
        
        $cols = $db->getTableColumns('#__' . $table);
        
        return $cols;
    }
    
    // 13. Drop table
    public static function drop_table($table)
    {
        if (!self::table_exists($table))
        {
            return false;
        }
        
        $db = Factory::getDbo();
        
		$query = $db->getQuery(true);
        
        $query = 'DROP TABLE ' . $db->quoteName('#__' . $table);
        
        $db->setQuery($query);
	    
	    $db->execute();
    }
    
    // 14. Drop column from table
    public static function drop_column($table, $column)
    {
        $db = Factory::getDbo();
        
		$query = $db->getQuery(true);
        
        $query = 'ALTER TABLE ' . $db->quoteName('#__' . $table);
        $query .= ' DROP COLUMN ' . $db->quoteName($column);
        
        $db->setQuery($query);
	    $db->execute();
    }
    
    public static function in_helper($array)
    {
        $output = '(' . implode(', ', $array) . ')';
        
        return $output;
    }
}