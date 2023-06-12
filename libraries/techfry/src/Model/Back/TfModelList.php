<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library\Model\Back;

defined('_JEXEC') or die;

use Joomla\CMS\Factory;
use Joomla\CMS\Language\Associations;
use Joomla\CMS\MVC\Factory\MVCFactoryInterface;
use Joomla\CMS\MVC\Model\ListModel;
use Joomla\Database\ParameterType;
use Joomla\Utilities\ArrayHelper;
use TechFry\Library\TfXml;
use TechFry\Library\TfDb;
use TechFry\Library\Model\TfModelTrait;

class TfModelList extends ListModel
{
    use TfModelTrait;
    
    public $select_fields = array();
    
    public $join_tables = array(); // Depreciated
    public $joins = array(); // Depreciated
  	public $left_joins = array();
  	public $inner_joins = array();
    
    public $orderCol = 'a.id';
    public $orderDirn = 'DESC';
    
    public $search = 'a.title'; // Default search field
  	public $search_fields = array(); // key - operator, value - table.database_column
    
    public $filters = array(); // key - name in filter form, value - table.database_column
    
    public $sorting_fields = array();
    
    public $sortings = array();
    
    public $is_ml = false;
    
    public function __construct($config = array(), MVCFactoryInterface $factory = null)
    {
		if ($this->table_name)
		{
		    $this->table_columns = TfDb::get_table_columns($this->table_name);    
		}
		
		$this->set_filters();
      
		$this->set_sorting_fields();
      
      	$this->set_search_fields();
      	
      	$config['filter_fields'] = $this->sorting_fields;
        
        if (Associations::isEnabled())
		{
			$config['filter_fields'][] = 'association';
		}
      
        parent::__construct($config, $factory);
        
        $this->app = Factory::getApplication();
        
        $this->input = $this->app->input;
        
        $this->option = $this->input->get('option');
        
        $this->set_sortings_array();
    }
    
    public function getFilterForm($data = array(), $loadData = true)
    {
        $form = parent::getFilterForm($data, $loadData);
        
        // Search
        $element = '<field name="search" type="text" inputmode="search" label="COM_TF_FILTER_SEARCH_LABEL" hint="JSEARCH_FILTER" />';
        $form = $this->add_field($form, $element, 'default', 'filter');
        
        // Filters
        foreach ($this->filters as $k => $v)
        {
            switch ($k)
            {
                case 'published' :
                    $element = TfXml::filter_published_field();
		            $form = $this->add_field($form, $element, 'default', 'filter');
		            break;
		            
		        case 'access' :
		            $element = TfXml::filter_access_field();
                    $form = $this->add_field($form, $element, 'default', 'filter');
                    break;
                    
                case 'note' :
                    $element = TfXml::filter_note_field($this->table_name);
                    $form = $this->add_field($form, $element, 'default', 'filter');
                    break;
                    
                case 'language' :
                    $element = TfXml::filter_language_field();
			        $form = $this->add_field($form, $element, 'default', 'filter');
			        break;
            }
        }
        
        // Ordering field
        $element = TfXml::filter_ordering_field($this->orderCol);
        $form = $this->add_field($form, $element, 'default', 'list');
        
        $ordering = $form->getField('fullordering', 'list');
        foreach ($this->sortings as $k => $v)
        {
            $ordering->addOption($k, array('value' => $v));
        }
        
        // Limit field
        $element = TfXml::filter_limit_field();
        $form = $this->add_field($form, $element, 'default', 'list');
        
        $data = $this->loadFormData();

        $form->bind($data);
        
        return $form;
    }
    
  	// Build an SQL query to load the list data
    protected function getListQuery()
    {
        $char = 'a';
        if (empty($this->select_fields))
        {
            $this->select_fields = array('a.*');
        }
        
        // Initialize variables
      	// $db = $this->getDatabase(); // Not working in earlier Joomla version
      	$db = Factory::getDbo();
        $query = $db->getQuery(true);
      	// $user = $this->getCurrentUser(); // Not working in earlier Joomla version
      	$user = Factory::getUser();
        
        $query->select($this->select_fields)
            ->from($db->quoteName('#__' . $this->table_name, $char));
            
        // Join over other tables
        foreach ($this->join_tables as $table)
        {
            $char++;
            
            $query->select($table[1])
                 ->join('LEFT', $db->quoteName('#__' . $table[0], $char) . ' ON ' . $table[2] . ' = ' . $char . '.id');
        }
      
        if (!empty($this->joins))
        {
            foreach ($this->joins as $join)
            {
                $char++;
                
                $query->join('LEFT', $db->quoteName('#__' . $join['table'], $char) . ' ON ' . $join['on'] . ' = ' . $char . '.id');
            }
        }
      
      	if (!empty($this->left_joins))
        {
        	foreach ($this->left_joins as $join)
            {
                $char++;
                $query->join('LEFT', $db->quoteName('#__' . $join['table'], $char), $db->quoteName($join['on1']) . ' = ' . $db->quoteName($join['on2']));
            }  
        }
      
      	if (!empty($this->inner_joins))
        {
        	foreach ($this->inner_joins as $join)
            {
                $char++;
                $query->join('INNER', $db->quoteName('#__' . $join['table'], $char), $db->quoteName($join['on1']) . ' = ' . $db->quoteName($join['on2']));
            }  
        }
            
        // Add the list ordering clause
        $orderCol = $this->state->get('list.ordering', $this->orderCol);
        $orderDirn = $this->state->get('list.direction', $this->orderDirn);
        
        $query->order($db->escape($orderCol) . ' ' . $db->escape($orderDirn));

        // Join over languages
        if (Associations::isEnabled() && $this->is_ml)
        {
            $query->select(array($db->quoteName('l.title', 'language_title'), $db->quoteName('l.image', 'language_image')));
            
            $query->join('LEFT', $db->quoteName('#__languages', 'l'), $db->quoteName('l.lang_code') . ' = ' . $db->quoteName('a.language'));
        }
        
        // Join over associations
		if (Associations::isEnabled() && $this->is_ml)
		{
			$subQuery = $db->getQuery(true)
				->select('COUNT(' . $db->quoteName('asso1.id') . ') > 1')
				->from($db->quoteName('#__associations', 'asso1'))
				->join('INNER', $db->quoteName('#__associations', 'asso2'), $db->quoteName('asso1.key') . ' = ' . $db->quoteName('asso2.key'))
				->where(array($db->quoteName('asso1.id') . ' = ' . $db->quoteName('a.id'), $db->quoteName('asso1.context') . ' = ' . $db->quote('com_tfcontent.item'))
				);

			$query->select('(' . $subQuery . ') AS ' . $db->quoteName('association'));
		}
        
      	// Add filters
      	$filters = $this->filters;
      
        // Filter by search
        $search = $this->getState('filter.search');
        if (!empty($search))
        {
          	$default_search = true;
          	foreach ($this->search_fields as $search_field => $db_field)
            {
            	if (stripos($search, $search_field . ':') === 0)
            	{
                	$search = substr($search, strlen($search_field) + 1);
                  	if ($search_field == 'id')
                    {
                    	$query->where($db->quoteName($db_field) . ' = :search')
                    	->bind(':search', $search);
                    }
                	else
                    {
                    	$search = '%' . str_replace(' ', '%', trim($search)) . '%';
              			$query->where($db->quoteName($db_field) . ' LIKE ' . $db->quote($search));  
                    }
                  	
                  	$default_search = false;
                  	break;
            	}
            }
          	if ($default_search)
            {
              	$search = '%' . str_replace(' ', '%', trim($search)) . '%';
              
              	$query->where($db->quoteName($this->search) . ' LIKE :search')
                    	->bind(':search', $search);
            }
        }
        
        // Filter by access level
		if (array_key_exists('access', $filters))
		{
		    $access = $this->getState('filter.access');
		    if (is_numeric($access))
		    {
		        $access = (int) $access;
              	$query->where($db->quoteName('a.access') . ' = :access')
				    ->bind(':access', $access, ParameterType::INTEGER);
		    }
		    elseif (is_array($access))
		    {
    			$access = ArrayHelper::toInteger($access);
    			$query->whereIn($db->quoteName('a.access'), $access);
		    }
          	unset($filters['access']);
		}
		
		// Filter by published state
		if (array_key_exists('published', $filters))
		{
		    $published = (string) $this->getState('filter.published');
    		if ($published !== '*')
    		{	
              	if (is_numeric($published))
    		    {
                  
                  	$state = (int) $published;
                  	$query->where($db->quoteName('a.published') . ' = :published')
                      	->bind(':published', $state, ParameterType::INTEGER);
    		    }
    		    else
    		    {
    		        $query->whereIn($db->quoteName('a.published'), array(0, 1));
    		    }
    		}
          	unset($filters['published']);
		}
		
        // Other Filters
        foreach ($filters as $k => $v)
        {
          	$value = $this->getState('filter.' . $k);
          	if ($value != '')
          	{
            	if (is_array($value))
            	{
              		// To Do: Array may contain integers or strings
                  	$value = ArrayHelper::toInteger($value);
              		$query->whereIn($db->quoteName($v), $value);
            	}
           		else
            	{
              		$query->where($db->quoteName($v) . ' = ' . $db->quote($value));
            	}
            }
        }
      	
      	if (Factory::getConfig()->get('debug'))
        {
        	$this->get_message($query->dump(), 'info');
        }

        return $query;
    }
    
    protected function populateState($ordering = null, $direction = null)
	{
		$app = Factory::getApplication();
        
		// Adjust the context to support modal layouts.
		if ($layout = $app->input->get('layout'))
		{
			$this->context .= '.' . $layout;
		}

		// Adjust the context to support forced languages.
		$forcedLanguage = $app->input->get('forcedLanguage', '', 'CMD');
		if ($forcedLanguage)
		{
			$this->context .= '.' . $forcedLanguage;
		}
        
		parent::populateState($ordering, $direction);
        
		// If there is a forced language, then define that filter for the query where clause
		if (!empty($forcedLanguage))
		{
			$this->setState('filter.language', $forcedLanguage);
		}
	}
    
    // Count total items in $table where $column is $value
    public function count_items($table, $column, $value)
    {
        $db = Factory::getDbo();
		$query = $db->getQuery(true);
		
		$query->select('COUNT(*)')
		    ->from($db->quoteName('#__' . $table))
		    ->where($db->quoteName($column) . ' = ' . $db->quote($value));
		    
	    $db->setQuery($query);
	    
        $total = $db->loadResult();
        
        return $total;
    }
    
    // Add field to fieldset in the form
    public function add_field($form, $element, $fieldset = 'default', $group = null, $replace = true)
    {
        $xml = new \SimpleXMLElement($element);
        
      	if ($form)
        {
        	$form->setField($xml, $group, $fieldset, $replace);  
        }
        
        return $form;
    }
    
    public function set_sortings_array()
    {
        foreach ($this->sorting_fields as $field)
        {
            switch ($field)
            {
                case 'a.title' :
                    $this->sortings['JGLOBAL_TITLE_ASC'] = 'a.title ASC';
                    $this->sortings['JGLOBAL_TITLE_DESC'] = 'a.title DESC';
                    break;
                
                case 'a.published' :
                    $this->sortings['JSTATUS_ASC'] = 'a.published ASC';
                    $this->sortings['JSTATUS_DESC'] = 'a.published DESC';
                    break;
                    
                case 'a.id' :
                    $this->sortings['JGRID_HEADING_ID_ASC'] = 'a.id ASC';
                    $this->sortings['JGRID_HEADING_ID_DESC'] = 'a.id DESC';
                    break;
                    
                case 'a.modified' :
                    $this->sortings['JDATE_ASC'] = 'a.modified ASC';
                    $this->sortings['JDATE_DESC'] = 'a.modified DESC';
                    break;
                    
                case 'a.hits' :
                    $this->sortings['JGLOBAL_HITS_ASC'] = 'a.hits ASC';
                    $this->sortings['JGLOBAL_HITS_DESC'] = 'a.hits DESC';
                    break;
                    
                case 'a.ordering' :
                    $this->sortings['JGRID_HEADING_ORDERING_ASC'] = 'a.ordering ASC';
                    $this->sortings['JGRID_HEADING_ORDERING_DESC'] = 'a.ordering DESC';
                    break;
                    
                case 'a.access' :
                    $this->sortings['JGRID_HEADING_ACCESS_ASC'] = 'a.access ASC';
                    $this->sortings['JGRID_HEADING_ACCESS_DESC'] = 'a.access DESC';
                    break;
                    
                case 'a.note' :
                    $this->sortings['COM_TF_ORDERING_NOTE_ASC'] = 'a.note ASC';
                    $this->sortings['COM_TF_ORDERING_NOTE_DESC'] = 'a.note DESC';
                    break;
                    
                case 'a.language' :
                    $this->sortings['JGRID_HEADING_LANGUAGE_ASC'] = 'a.language ASC';
                    $this->sortings['JGRID_HEADING_LANGUAGE_DESC'] = 'a.language DESC';
                    break;
                    
                default :
                    $field_lang = (strpos($field, '.') == true) ? substr($field, 2) : $field;
                    $this->sortings[strtoupper($this->option) . '_ORDERING_' . strtoupper($field_lang) . '_ASC'] = $field . ' ASC';
                    $this->sortings[strtoupper($this->option) . '_ORDERING_' . strtoupper($field_lang) . '_DESC'] = $field . ' DESC';
            }
        }
    }
    
    public function set_filters()
    {
        $temps = array('published', 'access', 'note');
        
        // Key is the name of field in filter form; Value is column in db query
        foreach ($temps as $temp)
        {
            if (array_key_exists($temp, $this->table_columns))
            {
                $this->filters[$temp] = 'a.' . $temp;
            }
        }
    }
    
    public function set_sorting_fields()
    {
        $temps = array('id', 'title', 'published', 'modified', 'hits', 'ordering', 'access', 'note');
      	
        foreach ($temps as $temp)
        {
            if (array_key_exists($temp, $this->table_columns))
            {
                $this->sorting_fields[] = 'a.' . $temp;
            }
        }
    }
  
  	public function set_search_fields()
    {
        $defaults = array('id', 'description', 'note');
      	
        foreach ($defaults as $default)
        {
            if (array_key_exists($default, $this->table_columns))
            {
                $this->search_fields[$default] = 'a.' . $default;
            }
        }
    }
}