<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library\Controller;

defined('_JEXEC') or die;

use Joomla\CMS\Application\CMSApplication;
use Joomla\CMS\Factory;
use Joomla\CMS\Language\Text;
use Joomla\CMS\MVC\Controller\BaseController;
use Joomla\CMS\MVC\Model\BaseDatabaseModel;
use Joomla\CMS\Router\Route;
use Joomla\CMS\MVC\Factory\MVCFactoryInterface;
use Joomla\Input\Input;
use TechFry\Library\TfUser;
use TechFry\Library\TfArticle;
use TechFry\Library\TfDb;
use TechFry\Library\TfString;
use TechFry\Library\TfDate;

class TfControllerQuery extends BaseController
{
    public $option;
    
    public $type;
    
    public $db_table;
    
    public $db_table_wo_prefix;
    
    public $info;
    
    public $column;
    
    public $column_save;
    
    public $function_name;
    
    public $conditions = array();
    
    public $text;
    
    public $value;
    
    public $rows;
    
    public $num_rows;
    
    public $users;
    public $articles;
    
    public function __construct($config = array(), MVCFactoryInterface $factory = null, ?CMSApplication $app = null, ?Input $input = null)
	{
	    parent::__construct($config, $factory, $app, $input);
	    
        $this->option = $this->input->get('option');
	}
	
// *****************************************************************************

    public function get_form_info()
    {
        $this->info = $this->input->get('jform', array(), 'array');
    }
    
    public function process()
    {
        $model = $this->getModel();
        
        if (!$model->pro())
        {
            $this->setMessage('Please upgrade to pro version to use this feature.', 'error');
        
            $this->setRedirect(Route::_('index.php?option=' . $this->option . '&view=query', false));
        
            return;
        }
        
        $info = $this->input->get('jform', array(), 'array');
        $this->get_form_info();
        
        $this->type = $info['type'];
        if ($this->type == 'users')
        {
            $this->filter_users();
        }
        elseif ($this->type == 'content')
        {
            $this->articles = TfArticle::filter_articles($info['filter'], $info['filterarticles']);
        }
        
        $this->db_table = '#__' . $info['type'];
        $this->db_table_wo_prefix = $info['type'];
        $this->column = $info['column_field'];
        $this->column_save = ($info['column_save'] != '') ? $info['column_save'] : $info['column_field'];
        $this->text = $info['text'];
        $this->value = $info['value'];
        
        if ($info['tool'] == 'string')
        {
            $this->function_name = $info['str_function'];
        }
        elseif ($info['tool'] == 'date')
        {
            $this->function_name = $info['date_function'];
        }
        elseif ($info['tool'] == 'numeric')
        {
            $this->function_name = $info['num_function'];
        }
        
        // Conditions
        if (!empty($info['filter']))
        {
            foreach ($info['filter'] as $filter)
            {
                if ($filter['where_field'] != '' && $filter['where_value'] != '')
                {
                    // $this->conditions[] = $filter['where_field'] . ' ' . $filter['where_operator'] . ' ' . $filter['where_value'];
                    $this->conditions[] = array($filter['where_field'], $filter['where_operator'], $filter['where_value']);
                }
                elseif ($filter['where_field'] != '' && $filter['where_value'] == '')
                {
                    $this->conditions[] = $filter['where_field'] . ' ' . $filter['where_operator'];
                }
            }
        }
        
        $function_name = $info['tool'] . '_tool';
        
        $message = $this->$function_name();
        if (is_array($message))
        {
            $message = '<pre>' . print_r($message, true) . '</pre>';
        }
        
        if ($this->num_rows != '')
        {
            $this->app->enqueueMessage('Affected Rows: ' . $this->num_rows . '<br>');
        }
        
        $this->setMessage($message);
        
        $this->setRedirect(Route::_('index.php?option=' . $this->option . '&view=query&type=' . $this->type, false));
    }
    
    // 01. Find text in table column; Return ids
    public function find_tool()
    {
        $like = '%' . $this->text . '%';
        $order = $this->info['order_col'] . ' ' . $this->info['order_dirn'];
        
        $conditions = array(
            array($this->column, 'LIKE', $like)
            );
        
        $result = TfDb::get_items($this->db_table_wo_prefix, $conditions, $order, $this->info['limit'], 'id');
        
        return $result;
    }
    
    // 02. Find duplicates by column
    public function find_duplicates_tool()
    {
        $db = Factory::getDbo();
        $query = $db->getQuery(true);
        
        $query
            ->select(array($this->column, 'COUNT(*) AS c'))
            ->from($db->quoteName($this->db_table))
            ->group($db->quoteName($this->column))
            ->having('c > 1');
        
        $db->setQuery($query);
            
        $db->execute();
        
        $this->num_rows = $db->getNumRows();
        
        $result = $db->loadAssocList();
        
        return $result;
    }
    
    // 03. Update text with value in table column
    public function update_tool()
    {
        if ($this->type == 'users')
        {
            foreach ($this->users as $user_id)
            {
                // Case 1: Update Users Custom Fields
                if (is_numeric($this->column))
                {
                    TfUser::save_custom_field($this->column, $user_id, $this->value);
                }
                // Case 2: Update Joomla Users Table
                else
                {
                    $action_field = $this->column;
                    $userdata = array('id' => $user_id, $action_field => $this->value);
                    $updates = array($action_field);
                    TfUser::update_user($userdata, $updates);
                }
            }
            
            $this->num_rows = count($this->users);
        }
        elseif ($this->type == 'content')
        {
            foreach ($this->articles as $article_id)
            {
                // Case 1: Update Content Custom Fields
                if (is_numeric($this->column))
                {
                    TfArticle::save_custom_field($this->column, $article_id, $this->value);
                }
                // Case 2: Update Joomla Content Table
                else
                {
                    $action_field = $this->column;
                    $articledata = array('id' => $article_id, $action_field => $this->value);
                    TfArticle::update_article($articledata);
                }
            }
            
            $this->num_rows = count($this->articles);
        }
        else
        {
            $sets = array($this->column => $this->value);
            
            $this->num_rows = TfDb::update_records($this->db_table_wo_prefix, $this->conditions, $sets);
        }
    }
    
    // 04. Replace text with value 
    public function replace_tool()
    {
        // Use TfDb class 
        
        $db = Factory::getDbo();
        $query = $db->getQuery(true);
            
        $query->update($db->quoteName($this->db_table));
        
        $fields = array($db->quoteName($this->column) . ' = REPLACE(' . $db->quoteName($this->column) . ',' . $db->quote($this->text) . ',' . $db->quote($this->value) . ')');
        
        $query->set($fields);
        
        if (!empty($this->conditions))
        {
            $query->where($this->conditions);
        }
        
        $db->setQuery($query);
            
        $db->execute();
            
        $this->num_rows = $db->getAffectedRows();
    }
    
    // 05. Delete rows
    public function delete_tool()
    {
        if (!empty($this->conditions))
        {
            $this->num_rows = TfDb::delete_items($this->db_table_wo_prefix, $this->conditions);
        }
    }
    
    // 06. Truncate table
    public function truncate_tool()
    {
        TfDb::truncate_table($this->db_table_wo_prefix);
        
        return 'Database table ' . $this->db_table_wo_prefix . ' truncated.';
    }
    
    // 07. Get columns in a table
    public function table_columns_tool()
    {
        $cols = TfDb::get_table_columns($this->db_table_wo_prefix);
        
        return $cols;
    }
    
    // 08. Get create statement for a table
    public function table_create_tool()
    {
        $db = Factory::getDbo();
        
        $cols = $db->getTableCreate($this->db_table);
        
        return $cols;
    }
    
    // 09. Get list of all database tables
    public function table_list_tool()
    {
        $db = Factory::getDbo();
        
        $tables = $db->getTableList();
        
        return $tables;
    }
    
    // 10. String function
    public function string_tool()
    {
        $this->get_rows();
        
        $column_name = $this->info['column_field'];
        $column_save = $this->column_save;
        
        if ($this->function_name == 'preg_replace')
        {
            $this->info['p1'] = '/' . $this->info['p1'] . '/i';
        }
        
        $params = array($this->info['p1'], $this->info['p2']);
        
        foreach ($this->rows as $row)
        {
            $row->$column_save = TfString::process($this->function_name, $row->$column_name, $params);
            
            TfDb::insert_update($this->db_table_wo_prefix, $row);
        }
    }
    
    // 11. Date function
    public function date_tool()
    {
        $this->get_rows();
        
        $column_name = $this->info['column_field'];
        $column_save = $this->column_save;
        
        foreach ($this->rows as $row)
        {
            $row->$column_save = TfDate::process($this->function_name, $row->$column_name, $this->info['p1']);
            
            TfDb::insert_update($this->db_table_wo_prefix, $row);
        }
    }
    
    // 12. Numeric function
    public function numeric_tool()
    {
        // $this->function_tool();
        
        return 'Coming Soon!';
    }
    
    // Function tool
    public function function_tool()
    {
        $model = $this->getModel();
        
        $this->get_rows();
        
        $function_name = $this->function_name;
        $column_name = $this->info['column_field'];
        $column_save = $this->column_save;
        
        foreach ($this->rows as $row)
        {
            if ($this->info['p1'] == '' && $this->info['p2'] == '' && $this->info['p3'] == '')
            {
                $row->$column_save = $function_name($row->$column_name);
            }
            elseif ($this->info['p1'] != '' && $this->info['p2'] == '' && $this->info['p3'] == '')
            {
                $row->$column_save = $function_name($row->$column_name, $this->info['p1']);
            }
            elseif ($this->info['p1'] != '' && $this->info['p2'] != '' && $this->info['p3'] == '')
            {
                $row->$column_save = $function_name($row->$column_name, $this->info['p1'], $this->info['p2']);
            }
            elseif ($this->info['p1'] != '' && $this->info['p2'] != '' && $this->info['p3'] != '')
            {
                $row->$column_save = $function_name($row->$column_name, $this->info['p1'], $this->info['p2'], $this->info['p3']);
            }
            
            $model->direct_save($row, $this->db_table_wo_prefix);
        }
    }
    
    public function get_rows()
    {
        $db = Factory::getDbo();
        $query = $db->getQuery(true);
        
        $query
            ->select($db->quoteName(array('id', $this->column)))
            ->from($db->quoteName($this->db_table))
            ->order($this->info['order_col'] . ' ' . $this->info['order_dirn'])
            ->setLimit($this->info['limit']);
            
        if (!empty($this->conditions))
        {
            $query->where($this->conditions);
        }
        
        $db->setQuery($query);
            
        $db->execute();
        
        $this->num_rows = $db->getNumRows();
        
        $this->rows = $db->loadObjectList();
    }
    
    public function filter_users()
    {
        $this->users = TfUser::filter_users($this->info['filter'], $this->info['filterusers']);
    }
    
    public function cancel($key = null)
    {
        $this->checkToken();
        
        $this->setRedirect(Route::_('index.php?option=' . $this->option . '&view=dashboard', false));
        
        return true;
    }
}