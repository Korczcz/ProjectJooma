<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library;

defined('_JEXEC') or die;

use Joomla\CMS\Factory;
use Joomla\CMS\Language\Text;
use Joomla\CMS\Image\Image;
use Joomla\CMS\Filter\OutputFilter;
use Joomla\CMS\Filesystem\File;
use Joomla\CMS\Filesystem\Folder;

// Class for handling folders and files 

class TfFile
{
    // Handle uploaded file
    public static function handle_file($file, $options = array())
    {
        // $file array - name, type, tmp_name, error, size
        // $options - allow_ext, max_size, save_folder, new_name
      
      	if ($file['name'] == '')
        {
        	return;
        }
        
        // 1. Check for valid file extension
      	if (isset($options['allow_ext']))
        {
          	$allow_ext = is_array($options['allow_ext']) ? $options['allow_ext'] : explode(',', $options['allow_ext']);
          	$ext = File::getExt($file['name']);
			if (!in_array(strtolower($ext), $allow_ext))
			{
		    	Factory::getApplication()->enqueueMessage(Text::_('TF_ERROR_INVALID_FILE_TYPE'), 'error');
          		return false;
			}
        }
		
		// 2. Check for file size
		if (isset($options['max_size']) && ($file['size'] > $options['max_size']))
		{
		    Factory::getApplication()->enqueueMessage(Text::_('TF_ERROR_INVALID_FILE_SIZE'), 'error');
          	return false;
		}
		
		// 3. Rename file
		if (isset($options['new_name']))
		{
		    $new_name = $options['new_name'] . '.' . $ext;
		}
		else
		{
		    $name = File::stripExt($file['name']);
		    $new_name = $name . '_' . mt_rand(100,999) . '.' . $ext;
		}
		
		// 4. Upload file
      	if (!isset($options['save_folder']) && empty($options['save_folder']))
        {
        	Factory::getApplication()->enqueueMessage(Text::_('TF_ERROR_INVALID_SAVE_FOLDER'), 'error');
          	return false;
        }
      
		$src = $file['tmp_name'];
		$dest = $options['save_folder'] . '/' . $new_name;
		
		if (File::upload($src, $dest))
        {
            return $new_name;
        }
        else
        {
            return false;
        }
    }
  
  	// Check file for its existence
  	public static function check_file($file)
    {
    	return File::exists($file) ? true : false;  
    }
  
  	// Get extension of file 
  	public static function get_extension($file)
    {
     	return File::getExt($file);
    }
  
  	// Strip or remove extension of file 
  	public static function strip_extension($file)
    {
     	return File::stripExt($file);
    }
  
  	// Make name of file safe to use 
  	public static function make_safe($file)
    {
     	return File::makeSafe($file);
    }
  
  	// Convert bytes to KB or MB
  	public static function format_size_units($bytes)
    {
        if ($bytes >= 1073741824)
        {
            $bytes = number_format($bytes / 1073741824, 2) . ' GB';
        }
        elseif ($bytes >= 1048576)
        {
            $bytes = number_format($bytes / 1048576, 2) . ' MB';
        }
        elseif ($bytes >= 1024)
        {
            $bytes = number_format($bytes / 1024, 2) . ' KB';
        }
        elseif ($bytes > 1)
        {
            $bytes = $bytes . ' bytes';
        }
        elseif ($bytes == 1)
        {
            $bytes = $bytes . ' byte';
        }
        else
        {
            $bytes = '0 bytes';
        }

        return $bytes;
	}
  
  	// Get all files in a folder
  	public static function get_files($folder)
    {
     	$path = JPATH_SITE . '/' . $folder;
      
      	return Folder::files($path); 
    }
  
  	// copy_file, delete_file, move_file, write_file, append_file, upload_file
  
  	// create_folder, copy_folder, delete_folder, move_folder, get_folders
}