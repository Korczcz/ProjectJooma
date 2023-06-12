<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library\Controller;

defined('_JEXEC') or die;

use Joomla\CMS\Application\CMSApplication;
use Joomla\CMS\Factory;
use Joomla\CMS\Filter\OutputFilter;
use Joomla\CMS\Language\Text;
use Joomla\CMS\MVC\Controller\BaseController;
use Joomla\CMS\Router\Route;
use Joomla\CMS\Filesystem\File;
use Joomla\CMS\MVC\Factory\MVCFactoryInterface;
use Joomla\Input\Input;
use TechFry\Library\TfUser;
use TechFry\Library\TfArticle;
use TechFry\Library\TfDb;

class TfControllerImport extends BaseController
{
    public $option;
    
    public function __construct($config = array(), MVCFactoryInterface $factory = null, ?CMSApplication $app = null, ?Input $input = null)
	{
	    parent::__construct($config, $factory, $app, $input);
	    
        $this->option = $this->input->get('option');
	}

    public function import()
    {
        $model = $this->getModel();
        
        if (!$model->pro())
        {
            $this->setMessage('Please upgrade to pro version to use this feature.', 'error');
        
            $this->setRedirect(Route::_('index.php?option=' . $this->option . '&view=import', false));
        
            return;
        }
        
        $info = $this->input->get('jform', array(), 'array');
        
        $files = $this->input->files->get('jform');
        $file = $files['upload_file'];
        
        $filename = File::makeSafe($file['name']);
        
        $ext = strtolower(File::getExt($filename));
        if ($ext !== 'csv')
        {
            $this->setMessage(Text::_('COM_TF_ERROR_INVALID_FILE'), 'error');
            
            $this->setRedirect(Route::_('index.php?option=' . $this->option . '&view=import&type=' . $info['type'], false));
            
            return;
        }
        
        if (empty($info['import_columns']))
        {
            $this->setMessage(Text::_('COM_TF_ERROR_SELECT_FIELDS'), 'error');
            
            $this->setRedirect(Route::_('index.php?option=' . $this->option . '&view=import&type=' . $info['type'], false));
            
            return;
        }
        
        $columns_arr = $info['import_columns'];
        if ($info['type'] == 'users' && !empty($info['users_cf']))
        {
            $columns_arr = array_merge($columns_arr, $info['users_cf']);
        }
        
        $model = $this->getModel('import');
        
        $fileopen = fopen($file['tmp_name'], "r");
        $counter = 0;
        $c_exists = 0;
        
        // Ignore first row of csv file
        if ($info['ignore_first'])
        {
            fgetcsv($fileopen, 10000, ",");
        }
        
        while (($data = fgetcsv($fileopen, 10000, ",")) !== FALSE)
        {
            $record = $this->set_data($data, $columns_arr);
            
            if ($info['type'] == 'users')
            {
                $user_exists = TfUser::find_user($record['email']);
                if ($user_exists)
                {
                    $c_exists++;
                }
                else
                {
                    $user = TfUser::create_user($record);
                    
                    if (!empty($info['users_cf']))
                    {
                        $fields = $info['users_cf'];
                        foreach ($fields as $field_id)
                        {
                            TfUser::save_custom_field($field_id, $user->id, $record[$field_id]);
                        }
                    }
                    
                    $counter++;
                }
            }
            elseif ($info['type'] == 'content')
            {
                $article = TfArticle::create_article($record);
                    
                if (!empty($info['articles_cf']))
                {
                    $fields = $info['articles_cf'];
                    foreach ($fields as $field_id)
                    {
                        // TO DO: Get $alias from title
                        $article_id = TfArticle::find_article($alias, $record['catid']);
                        
                        TfArticle::save_custom_field($field_id, $article_id, $record[$field_id]);
                    }
                }
                
                $counter++;
            }
            else
            {
                $record = $this->set_columns($record, $info['type']);
            
                $result = TfDb::insert_update($info['type'], $record);
            
                $result ? $counter++ : $c_exists++;
            }
        }
        
        fclose($fileopen);
        
        $this->setMessage($counter . ' ' . Text::_('COM_TF_RECORDS_IMPORTED') . ' ' . $c_exists . ' ' . Text::_('COM_TF_RECORDS_EXISTS'));
        
        $this->setRedirect(Route::_('index.php?option=' . $this->option . '&view=import&type=' . $info['type'], false));
    }
    
    // 02. Returns record array to save in database
    public function set_data($data, $columns)
    {
        $record = array();
        
        $c = 0; // Column number
        foreach ($columns as $column)
        {
            $record[$column] = $data[$c];
            $c++;
        }
        
        return $record;
    }
    
    // 03. Add fields that should be handled automatically
    public function set_columns($record, $table)
    {
        // 1. Id
        $record['id'] = 0;
        
        $db = Factory::getDbo();
        $cols = $db->getTableColumns('#__' . $table);
        
        // 2. Alias
        if (array_key_exists('alias', $cols) && !isset($record['alias']))
        {
            $record['alias'] = OutputFilter::stringURLSafe($record['title']);
        }
        
        // 3. Dates - created, modified
        $date = Factory::getDate();
        if (array_key_exists('created', $cols) && !isset($record['created']))
        {
            $record['created'] = $date->toSql();
        }
        if (array_key_exists('modified', $cols) && !isset($record['modified']))
        {
            $record['modified'] = $date->toSql();
        }
        
        // 4. Created by
        if (array_key_exists('created_by', $cols) && !isset($record['created_by']))
        {
            $record['created_by'] = Factory::getUser()->id;
        }
        
        // 5. Hits
        if (array_key_exists('hits', $cols) && !isset($record['hits']))
        {
            $record['hits'] = 0;
        }
        
        // 6. Access
        if (array_key_exists('access', $cols) && !isset($record['access']))
        {
            $record['access'] = 1;
        }
        
        // 7. Published
        if (array_key_exists('published', $cols) && !isset($record['published']))
        {
            $record['published'] = 1;
        }
        
        // 8. Language
        if (array_key_exists('language', $cols) && !isset($record['language']))
        {
            $record['language'] = '*';
        }
        
        return $record;
    }
    
    public function cancel($key = null)
    {
        $this->checkToken();
        
        $this->setRedirect(Route::_('index.php?option=' . $this->option . '&view=dashboard', false));
        
        return true;
    }
}