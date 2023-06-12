<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library;

defined('_JEXEC') or die;

use Joomla\CMS\Factory;

class TfDb
{
    // 01. Get multiple rows from $table
    public static function get_items($table, $conditions = array(), $order = null, $limit = null, $column = null, $offset = 0)
    {
        $db = Factory::getDbo();
        $query = $db->getQuery(true);
        
        $select = $column ? $column : '*';
        
        $query->select($select)
            ->from($db->quoteName('#__' . $table));
            
        if (!empty($conditions))
        {
            foreach ($conditions as $condition)
            {
                if (isset($condition[2]) && $condition[2] != '')
                {
                    $query->where($db->quoteName($condition[0]) . ' ' . $condition[1] . ' ' . $db->quote($condition[2]));
                }
                else
                {
                    $query->where($db->quoteName($condition[0]) . ' ' . $condition[1]);
                }
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
        
        if ($column)
        {
            $data = $db->loadColumn();
        }
        else
        {
            $data = $db->loadObjectList();
        }
            
        return $data;
    }
    
    // 02. Get multiple records from $table; supports select columns and joining
    public static function get_records($table, $select = '*', $conditions = array(), $order = null, $limit = null, $joins = array(), $offset = 0)
    {
        $char = 'a';
        
        $db = Factory::getDbo();
        $query = $db->getQuery(true);
            
        $query->select($select)
            ->from($db->quoteName('#__' . $table, $char));
            
        if (!empty($conditions))
        {
            foreach ($conditions as $condition)
            {
                if (isset($condition[2]) && $condition[2] != '')
                {
                    $query->where($db->quoteName($condition[0]) . ' ' . $condition[1] . ' ' . $db->quote($condition[2]));
                }
                else
                {
                    $query->where($db->quoteName($condition[0]) . ' ' . $condition[1]);
                }
            }
        }
        
        if (!empty($joins))
        {
            $char++;
            
            foreach ($joins as $join)
            {
                $query->join('LEFT', $db->quoteName('#__' . $join['table'], $char) . ' ON ' . $join['on'] . ' = ' . $char . '.id');
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
        
        $data = $db->loadObjectList();
            
        return $data;
    }

  	// Get column
  	public static function get_column($table, $select = 'id', $conditions = array(), $order = null, $limit = null, $offset = 0)
    {
    	$db = Factory::getDbo();
        $query = $db->getQuery(true);
        
        $query->select($select)
            ->from($db->quoteName('#__' . $table));
            
        if (!empty($conditions))
        {
            foreach ($conditions as $condition)
            {
                if (isset($condition[2]) && $condition[2] != '')
                {
                    $query->where($db->quoteName($condition[0]) . ' ' . $condition[1] . ' ' . $db->quote($condition[2]));
                }
                else
                {
                    $query->where($db->quoteName($condition[0]) . ' ' . $condition[1]);
                }
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
        
        $column = $db->loadColumn();
            
        return $column;
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
            ->from($db->quoteName('#__' . $table))
            ->where($db->quoteName($column) . ' = ' . $db->quote($pk));
        
        $db->setQuery($query);

		$data = $db->loadObject();
            
        return $data;
    }
    
    // 05. Get single record from $table based on the $conditions
    public static function get_record($table, $conditions = array(), $order = null, $select = array(), $offset = 0)
    {
        $db = Factory::getDbo();
        $query = $db->getQuery(true);
        
        if (empty($select))
        {
            $query->select('*');
        }
        else
        {
            $query->select($db->quoteName($select));
        }
        
        $query->from($db->quoteName('#__' . $table))
            ->setLimit(1, $offset);
        
        if (!empty($conditions))
	    {
	        foreach ($conditions as $condition)
	        {
	            if (isset($condition[2]) && $condition[2] != '')
                {
                    $query->where($db->quoteName($condition[0]) . ' ' . $condition[1] . ' ' . $db->quote($condition[2]));
                }
                else
                {
                    $query->where($db->quoteName($condition[0]) . ' ' . $condition[1]);
                }
	        }
	    }
	    
	    if ($order)
        {
            $query->order($order);
        }
	    
	    $db->setQuery($query);

		$data = $db->loadObject();
            
        return $data;
    }
    
    // 07. Get single value
    public static function get_single($table, $pk, $select, $column = 'id')
    {
        $db = Factory::getDbo();
        $query = $db->getQuery(true);
            
        $query->select($select)
            ->from($db->quoteName('#__' . $table))
            ->where($db->quoteName($column) . ' = ' . $db->quote($pk));
        
        $db->setQuery($query);

		$result = $db->loadResult();
            
        return $result;
    }
    
    // 08. Insert or update record in $table
    public static function insert_update($table, $data, $pk = 'id')
    {
        if (is_array($data))
        {
            $data = (object) $data;
        }
        
        if ($pk)
        {
            if ($data->id == 0)
            {
                $result = Factory::getDbo()->insertObject('#__' . $table, $data, $pk);
            }
            else
            {
                $result = Factory::getDbo()->updateObject('#__' . $table, $data, $pk);
            }
        }
        else
        {
            $result = Factory::getDbo()->insertObject('#__' . $table, $data);
        }
        
        return $data;
    }
    
    // 09A. Delete Records
    public static function delete_items($table, $conditions = array())
    {
        if (empty($conditions))
        {
            return;
        }
        
        $db = Factory::getDbo();
		$query = $db->getQuery(true);
		
		$query->delete($db->quoteName('#__' . $table));
		
      	if (!empty($conditions))
        {
        	foreach ($conditions as $condition)
            { 
                if (isset($condition[2]) && $condition[2] != '')
                {
                    $query->where($db->quoteName($condition[0]) . ' ' . $condition[1] . ' ' . $db->quote($condition[2]));
                }
                else
                {
                    $query->where($db->quoteName($condition[0]) . ' ' . $condition[1]);
                }
            }
        }

	    $db->setQuery($query);
	    
        $db->execute();
	    
	    return $db->getAffectedRows();
    }
  
  	// 09B. Delete single item
    public static function delete_item($table, $pk, $column = 'id')
    {        
      	$db = Factory::getDbo();
		$query = $db->getQuery(true);
		
		$query->delete($db->quoteName('#__' . $table));
		
        $query->where($db->quoteName($column) . ' = ' . $db->quote($pk));

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
		    ->from($db->quoteName('#__' . $table));
		    
	    if (!empty($conditions))
	    {
	        foreach ($conditions as $condition)
	        {
	            if (isset($condition[2]) && $condition[2] != '')
                {
                    $query->where($db->quoteName($condition[0]) . ' ' . $condition[1] . ' ' . $db->quote($condition[2]));
                }
                else
                {
                    $query->where($db->quoteName($condition[0]) . ' ' . $condition[1]);
                }
	        }
	    }
		    
	    $db->setQuery($query);
	    
        $total = $db->loadResult();
	    
	    return $total;
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
}