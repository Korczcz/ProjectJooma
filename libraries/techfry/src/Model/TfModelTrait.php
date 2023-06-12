<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library\Model;

defined('_JEXEC') or die;

use Joomla\CMS\Component\ComponentHelper;
use Joomla\CMS\Factory;
use Joomla\Registry\Registry;
use Joomla\CMS\Filter\OutputFilter;
use TechFry\Library\TfDb;

trait TfModelTrait
{
    public $table_name = null;
    
    public $table_columns = array();
    
    public $app;
    
    public $input;
    
    public $today;
    
    // 01. Prepare data for automatic fields before saving
    public function prepare_data($data, $table_name, $date_fields = array(), $subform_fields = array(), $multiple_fields = array())
    {
        $cols = TfDb::get_table_columns($table_name);
        
        // A. Automatic handling of alias
        if (array_key_exists('alias', $cols))
        {
            if ($data['alias'] == null)
            {
                if (Factory::getConfig()->get('unicodeslugs') == 1)
                {
                    $data['alias'] = OutputFilter::stringURLUnicodeSlug($data['title']);
                }
                else
                {
                    $data['alias'] = OutputFilter::stringURLSafe($data['title']);
                }
            }
            
            // Check for duplicate alias
            $data['alias'] = $this->check_alias($data['alias'], $data['id'], $table_name);
        }
        
        // B. Automatic handling of dates
        $date = Factory::getDate();
        foreach ($date_fields as $field)
        {
        	echo $field;
        	if (empty($data[$field]))
    		{
    			$data[$field] = $date->toSql();
    		}
    		else
    		{
    		    $date_for_sql = Factory::getDate($data[$field]);
    		    $data[$field] = $date_for_sql->toSql();
    		}
        }
        if (array_key_exists('created', $cols))
        {
            if ($data['id'] == 0 || !$data['created'])
            {
                $data['created'] = $date->toSql();
            }
            else
            {
                $created_date = Factory::getDate($data['created']);
                $data['created'] = $created_date->toSql();
            }
        }
        if (array_key_exists('modified', $cols))
        {
            $data['modified'] = $date->toSql();
        }
        
        // C. Automatic handling of ordering
        if (array_key_exists('ordering', $cols))
        {
            if (!$data['ordering'])
            {
                $db = Factory::getDbo();
                $query = $db->getQuery(true)
                            ->select('MAX(ordering)')
                            ->from('#__' . $table_name);

                $db->setQuery($query);
                $max = $db->loadResult();
            
                $data['ordering'] = $max + 1;
            }
        }
        
        // D. Convert subform fields to JSON string
        foreach ($subform_fields as $field)
        {
            if (isset($data[$field]) && is_array($data[$field]))
            {
                $registry = new Registry($data[$field]);

                $data[$field] = (string) $registry;
            }
        }
        
        // E. Convert arrays of multiple fields to JSON string (Add reverse function in getItem)
        foreach ($multiple_fields as $field)
        {
            if (isset($data[$field]) && is_array($data[$field]))
            {
                $registry = new Registry($data[$field]);

                $data[$field] = (string) $registry;
            }
        }
        
        // F. Automatic handling of user
        if (array_key_exists('created_by', $cols))
        {
            if (!$data['created_by'])
            {
                $user = Factory::getUser();
                $data['created_by'] = $user->id;
            }
        }
        
        // G. Hits
        if (array_key_exists('hits', $cols))
        {
            if ($data['id'] == 0)
            {
                $data['hits'] = 0;
            }
        }
        
        // H. Access
        if (array_key_exists('access', $cols))
        {
            if (!isset($data['access']))
            {
                $data['access'] = 1;
            }
        }
        
        // I. Access
        if (array_key_exists('published', $cols))
        {
            if (!isset($data['published']))
            {
                $data['published'] = 1;
            }
        }
        
        // J. Language
        if (array_key_exists('language', $cols))
        {
            if (!isset($data['language']))
            {
                $data['language'] = '*';
            }
        }
        
        if (isset($data['custom_redirect']))
        {
            unset($data['custom_redirect']);    
        }
        
        if (isset($data['custom_message']))
        {
            unset($data['custom_message']);
        }
        
        return $data;
    }
    
    // 02. Check alias
    public function check_alias($alias, $id, $table_name)
    {
        $current_alias = $alias;
        $found = 0;
        $i = 2;
        
        do
        {
            $item = TfDb::get_item($table_name, $alias, 'alias');
            if ($item && ($item->id != $id))
            {
                $alias = $current_alias . '-' . $i;
                $found = 1;
                $i++;
            }
            else
            {
                $found = 0;
            }
            
        } while ($found);
        
        return $alias;
    }
    
    // 03A. Get parameter from component options
    public function get_param($type, $default = null)
    {
        $input = Factory::getApplication()->input;
        $option = $input->get('option');
        
        $param = ComponentHelper::getParams($option)->get($type, $default);
        
        return $param;
    }
  
  	// 03B. Get parameter from menu item options
  	public function get_menu_param($type, $default = null)
    {      
      	// Active menu parameters
        $params = Factory::getApplication()->getMenu()->getActive()->getParams();

        $param = $params->get($type, $default);
        
        return $param;
    }
   
    // 04A. Check if extension in premium version
    public function pro()
    {
        return $this->is_pro();
    }
    
    // 04B. Check if extension is premium version
    public function is_pro()
    {
        $file = JPATH_COMPONENT_ADMINISTRATOR . '/config.xml';
        $xml = simplexml_load_file($file);
        
        $nodes = $xml->xpath('//field[@name=\'is_pro\']');
        $json = json_encode($nodes);
        $arr = json_decode($json, true);
        
        $is_pro = $arr[0]['@attributes']['description'];
        
        if (strtolower($is_pro) == 'pro')
        {
            return true;
        }
        
        return false;
    }
    
    // 05. Create new admin model
    public function create_model_admin($name, $com = '')
    {
        if (empty($com))
        {
            $input = Factory::getApplication()->input;
            $com = $input->get('option');
        }
        
        $model = Factory::getApplication()->bootComponent($com)->getMVCFactory()->createModel($name, 'Administrator', array('ignore_request' => true));
        
        return $model;
    }
    
    // 06. Create new site model
    public function create_model_site($name, $com = '')
    {
        if (empty($com))
        {
            $input = Factory::getApplication()->input;
            $com = $input->get('option');
        }
        
        $model = Factory::getApplication()->bootComponent($com)->getMVCFactory()->createModel($name, 'Site', array('ignore_request' => true));
        
        return $model;
    }
    
    // 07. Get menu item id from the link
    public function get_menu_item_id($link)
    {
        $app = Factory::getApplication();
        
        $menu = $app->getMenu();
        
        $menuItem = $menu->getItems('link', $link, true);
        
        return $menuItem->id;
    }
    
    // 08. Truncate table if table is empty
    public function deleteTable($table)
    {
        // Check for records in table
        $total_rows = TfDb::total_rows($table);
        if ($total_rows)
        {
            $this->set_message('Truncate not allowed for table. ' . $total_rows . ' items exists in the table. Delete items and empty trash before truncating table.', 'error');
            
            return false;
        }
        
        TfDb::truncate_table($table);
        
        return true;
    }
    
    // 09. Set message
    public function set_message($msg, $type = 'message')
    {
        // $type - message (success), error, warning, notice (info)
      
      	if (is_array($msg))
        {
        	$msg = print_r($msg, true);  
        }
        
        Factory::getApplication()->enqueueMessage($msg, $type);
    }
    
    // 10. Get message
    public function get_message($msg, $type = 'message')
    { 
      	$output = '';
        
        if (is_array($msg))
        {
            $output = '<strong>Total Items in Array:</strong> ' . count($msg) . '<br>';
            foreach ($msg as $k => $v)
            {
                $output .= '<strong>' . $k . '</strong> => ';
                if (is_string($v) || is_int($v))
                {
                    $output .= $v;
                }
                else
                {
                    $output .= '<strong>' . gettype($v) . '</strong>';
                }
                $output .= '<br>';
            }
        }
        elseif (is_object($msg))
        {
            $msg = (array) $msg;
          	
          	$output = '<strong>Total Items in Object:</strong> ' . count($msg) . '<br>';
            foreach ($msg as $k => $v)
            {
                $output .= '<strong>' . $k . '</strong> => ';
                if (is_string($v) || is_int($v))
                {
                    $output .= $v;
                }
                else
                {
                    $output .= '<strong>' . gettype($v) . '</strong>';
                }
                $output .= '<br>';
            }
        }
        else
        {
            $output = $msg;
        }
        $app = Factory::getApplication();
        
        $app->enqueueMessage($output, $type);
    }
}