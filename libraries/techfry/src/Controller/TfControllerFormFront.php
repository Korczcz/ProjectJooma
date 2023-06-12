<?php
 /*
 * @package		TF Components
 * @license		GNU General Public License version 2 or later; see LICENSE.txt
 */

namespace TechFry\Library\Controller;

defined('_JEXEC') or die;

use Joomla\CMS\Factory;
use Joomla\CMS\Filesystem\File;
use Joomla\CMS\Language\Text;
use Joomla\CMS\MVC\Controller\FormController;
use Joomla\CMS\MVC\Factory\MVCFactoryInterface;
use Joomla\CMS\Uri\Uri;

class TfControllerFormFront extends FormController
{
    public $data;
  
  	public $file_fields = array();
  
  	public $upload_options = array();
    
    public $save_folder = ''; // Save folder for file uploads
    public $max_file_size = 500000; // Maximum file size in bytes for upload
    public $allow_extensions = array('jpg', 'png', 'pdf'); // Extensions allowed for file upload
    
    public function __construct($config = array(), MVCFactoryInterface $factory = null)
    {
     	parent::__construct($config, $factory);
      
      	$model = $this->getModel();
      	if (empty($this->file_fields))
        {
         	$this->file_fields = $model->file_fields;
        }
      
      	if (empty($this->upload_options))
        {
         	$this->upload_options = $model->upload_options;
        }
    }
  
  	// 01. Save function when form is submitted
    public function save($key = null, $urlVar = null)
    {
        // Check for request forgeries.
		$this->checkToken();
		
		$model = $this->getModel();
		
		// Get the data from the HTTP POST request
		$data = $this->input->get('jform', array(), 'array');
		
		$custom_message = (isset($data['custom_message']) && !empty($data['custom_message'])) ? $data['custom_message'] : Text::_('COM_TF_SUBMIT_SUCCESSFUL');
		
		$custom_redirect = (isset($data['custom_redirect']) && !empty($data['custom_redirect'])) ? $data['custom_redirect'] : Uri::getInstance();
		
		$context = $this->option . '.edit.' . $this->context;
		
		// File Handling and Uploading
		if (!empty($this->file_fields))
		{
            $files = $this->input->files->get('jform');
          	
            foreach ($this->file_fields as $file_field)
            {
              	$newfile = '';
              	$this->upload_options[$file_field] = isset($this->upload_options[$file_field]) ? $this->upload_options[$file_field] : array();
                  
                // For multiple files in one field, $files[$file_field] is 2-D array
                if (isset($files[$file_field][0]))
                {
                   	$arr = array();
                   	foreach ($files[$file_field] as $f)
                    {
                       	if ($f['size'] > 0)
                        {
                        	$arr[] = $this->save_file($f, $this->upload_options[$file_field]);  
                        }
                    }
                  	if (!empty($arr))
                    {
                     	$newfile = implode(', ', $arr); 
                    }
                }
                else
                {
                	if ($files[$file_field]['size'] > 0)
                    {
                    	$newfile = $this->save_file($files[$file_field], $this->upload_options[$file_field]);  
                    }
                }
                  	
        		if ($newfile === false)
        		{
        			// Save the data in the session
			        $this->app->setUserState($context . '.data', $data);
			            
		            // Redirect back to the edit screen
		            $this->setRedirect(Uri::getInstance());

                    return false;
        		}
              
              	$data[$file_field] = $newfile;
            }
		}
		
		if (!$model->save($data))
		{
		    // Save the data in the session
			$this->app->setUserState($context . '.data', $data);
			
		    // Redirect back to the edit screen
		    $this->setRedirect($custom_redirect);

            return false;
		}
		
		// Clear the data in the form
		$this->app->setUserState($context . '.data', null);
		
		// Post Save Method (Depreciated - Shift to Model)
		$this->post_save($data);
        
		$this->setRedirect($custom_redirect, $custom_message);
		
		return true;
    }
    
    // Function called after saving data (Depreciated: Shift these to model save)
    public function post_save($data)
    {
        
    }
    
    // Save file to folder
    protected function save_file($file, $upload_options = array())
    {
      	$allow_extensions = isset($upload_options['allow_extensions']) ? $upload_options['allow_extensions'] : $this->allow_extensions;
      	$max_file_size = isset($upload_options['max_file_size']) ? $upload_options['max_file_size'] : $this->max_file_size;
      	$save_folder = isset($upload_options['save_folder']) ? $upload_options['save_folder'] : $this->save_folder;
      
      	$filename = File::makeSafe($file['name']);
		    
		$ext = File::getExt($filename);
		
		// Check for file extension allowed to upload
      	if (!is_array($allow_extensions))
        {
        	$allow_extensions = str_getcsv($allow_extensions);
        }
		if (!in_array(strtolower($ext), $allow_extensions))
		{
		    $this->setMessage(Text::_('COM_TF_INVALID_FILE_EXTENSION'), 'warning');
		    
		    return false;
		}
		
		// Check for maximum file size allowed to upload
		if ($file['size'] > $max_file_size)
		{
		    $this->setMessage(Text::_('COM_TF_INVALID_FILE_SIZE'), 'warning');
		    
		    return false;
		}
		
		$name = File::stripExt($filename);
		    
		$newfilename = $name . '_' . mt_rand(100,999) . '.' . $ext;
		    
		$src = $file['tmp_name'];
		$folder = $save_folder ? $save_folder . '/' : '';
		$dest = JPATH_SITE . '/images/' . $folder . $newfilename;
		
		if (File::upload($src, $dest))
        {
            return $newfilename;
        }
        else
        {
            return false;
        }
    }
  	
  	// Submit form with one or more submit actions
  	public function submit()
    {
     	// Check for request forgeries
		$this->checkToken();
      	
      	// Get the data
		$this->data = $this->input->get('jform', array(), 'array');
      
      	if (isset($this->data['save']))
        {
        	$this->save();  
        }
      	
    }
}