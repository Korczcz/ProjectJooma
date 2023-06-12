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
use Joomla\CMS\MVC\Factory\MVCFactoryInterface;
use Joomla\Input\Input;
use Joomla\CMS\Router\Route;
use TechFry\Library\TfUser;
use TechFry\Library\TfArticle;
use TechFry\Library\TfDb;

class TfControllerExport extends BaseController
{
    public $option;
    
    public $info;
    
    public function __construct($config = array(), MVCFactoryInterface $factory = null, ?CMSApplication $app = null, ?Input $input = null)
	{
	    parent::__construct($config, $factory, $app, $input);
	    
        $this->option = $this->input->get('option');
	}
	
// *****************************************************************************
    
    public function expo()
    {
        $model = $this->getModel();
        
        if (!$model->pro())
        {
            $this->setMessage('Please upgrade to pro version to use this feature.', 'error');
        
            $this->setRedirect(Route::_('index.php?option=' . $this->option . '&view=export', false));
        
            return;
        }
        
        $info = $this->input->get('jform', array(), 'array');
        
        $this->info = $this->input->get('jform', array(), 'array');
        
        if (empty($info['export_select']))
        {
            $this->setMessage(Text::_('COM_TF_ERROR_SELECT_FIELDS'), 'error');
            
            $this->setRedirect(Route::_('index.php?option=' . $this->option . '&view=export&type=' . $info['type'], false));
            
            return;
        }
        
        if ($info['type'] == 'users')
        {
            $users = $this->filter_users();
            
            if (!is_array($info['export_select']))
            {
                $info['export_select'] = explode(',', $info['export_select']);
            }
            
            $i = 0;
            $j = 0;
            $rows = array();
            
            foreach ($users as $user_id)
            {
                $user = Factory::getUser($user_id);
                $rows[$i] = array();
                foreach ($info['export_select'] as $exportfield)
                {
                    // Case 1: Field is group id
                    if ($exportfield == 'group_id')
                    {
                        $rows[$i][$j] = implode(',', $user->getAuthorisedGroups());
                    }
                    
                    // Case 2: Field is Custom Field
                    elseif (is_numeric($exportfield))
                    {
                        $rows[$i][$j] = TfUser::get_custom_field($exportfield, $user_id);
                    }
                    
                    // Case 3: Field is from users table
                    elseif ((is_numeric($exportfield) == false))
                    {
                        $rows[$i][$j] = $user->$exportfield;
                    }
                    
                    $j++;
                }
                $i++;
            }
        }
        else
        {
            // Conditions
            $conditions = array();
            foreach ($info['filter'] as $filter)
            {
                if ($filter['where_field'] != '' && $filter['where_value'] != '')
                {
                    $conditions[] = array($filter['where_field'], $filter['where_operator'], $filter['where_value']);
                }
                elseif ($filter['where_field'] != '' && $filter['where_value'] == '')
                {
                    $conditions[] = array($filter['where_field'], $filter['where_operator']);
                }
            }
            
            $rows = TfDb::get_records($info['type'], $info['export_select'], $conditions, $info['order'], $info['limit']);
            
            if ($info['type'] == 'content' && !empty($info['articles_cf']))
            {
                $rows = $this->add_article_fields($rows, $info['articles_cf']);
            }
        }
        
        // Export data
        $filename = $info['type'] . '.csv';
        
        // Create a file pointer
        $fp = fopen('php://output', 'w');
        
        foreach ($rows as $row)
        {
            $row = (array) $row;
            
            // Convert json to separate columns
            if (!empty($info['jsons']))
            {
                $jsons = str_getcsv($info['jsons']);
                foreach ($jsons as $json)
                {
                    $arr = json_decode($row[$json], true);
                    foreach ($arr as $k => $v)
                    {
                        $row[$k] = $v;
                    }
                    unset($row[$json]);
                }
            }
            
            fputcsv($fp, $row);
        }
        
        // Set headers to download file rather than display
        header('Content-Type: text/csv');
        header('Content-Disposition: attachment; filename="' . $filename . '";');
        
        exit;
    }
    
    public function add_article_fields($rows, $fields)
    {
        foreach ($rows as $i => $row)
        {
            $row = (array) $row;
            
            foreach ($fields as $field)
            {
                // Case 1: Field is an image
                if ($field == 'image_intro' || $field == 'image_fulltext')
                {
                    $article = TfDb::get_item('content', $row['id']);
                    $images = json_decode($article->images, true);
                    $rows[$i]->$field = $images[$field];
                }
                // Case 2: Combine intro text and fulltext
                elseif ($field == 'full_article')
                {
                    $article = TfDb::get_item('content', $row['id']);
                    $rows[$i]->$field = $article->introtext . $article->fulltext;
                }
                // Case 3: Field is custom field
                elseif (is_numeric($field))
                {
                    $rows[$i]->$field = TfArticle::get_custom_field($field, $row['id']);
                }
            }
        }
        
        return $rows;
    }
    
    public function filter_users()
    {
        $users = TfUser::filter_users($this->info['filter'], $this->info['filterusers']);
        
        return $users;
    }
    
    public function cancel($key = null)
    {
        $this->checkToken();
        
        $this->setRedirect(Route::_('index.php?option=' . $this->option . '&view=dashboard', false));
        
        return true;
    }
}