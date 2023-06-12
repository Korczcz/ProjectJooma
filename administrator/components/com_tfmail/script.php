<?php
 /*
 * @package		TF Mail Component
 * @license		GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;

use Joomla\CMS\Installer\InstallerAdapter;
use Joomla\CMS\Factory;
use Joomla\CMS\Filesystem\File;
use Joomla\CMS\Filesystem\Folder;
use Joomla\CMS\Language\Text;
use Joomla\CMS\Helper\LibraryHelper;

class com_TfMailInstallerScript
{
    public $extension = 'com_tfmail';
    
    public $admin_folders = array();
    
    public $site_folders = array();
    
    public $app;
    
    public function __construct()
    {
        $admin_path = JPATH_ADMINISTRATOR . '/components/' . $this->extension;
        
        $site_path = JPATH_SITE . '/components/' . $this->extension;
        
        if (Folder::exists($admin_path))
        {
            $this->admin_folders = Folder::folders($admin_path);    
        }
        
        if (Folder::exists($site_path))
        {
            $this->site_folders = Folder::folders($site_path);    
        }
        
        $this->app = Factory::getApplication();
    }
    
    // 01. Called after component is installed
    public function install(InstallerAdapter $adapter) 
    {
        if (!LibraryHelper::isEnabled('techfry'))
        {
            $message = '<strong>Please Download and Install TF Library Extension.</strong><br>';
          	$message .= '<a class="btn btn-danger" href="https://labs.techfry.com/joomla/techfry.zip" download><i class="fas fa-download"></i> Download TF Library</a>';
          	$this->app->enqueueMessage($message);
        }
      	else
        {
        	$adapter->getParent()->setRedirectURL('index.php?option=' . $this->extension);
        }
    }
    
    // 02. Called after component is updated
    public function update(InstallerAdapter $adapter) 
    {
        $adapter->getParent()->setRedirectURL('index.php?option=' . $this->extension);
        
        $new_version = $adapter->getManifest()->version;
    }
    
    // 03. Called before installation
    public function preflight($type, InstallerAdapter $adapter)
    {
        if ($type == 'update')
        {
            foreach ($this->admin_folders as $admin_folder)
            {
                $path = JPATH_ADMINISTRATOR . '/components/' . $this->extension . '/' . $admin_folder;
                if (Folder::exists($path))
                {
                    Folder::delete($path);
                }
            }
            
            foreach ($this->site_folders as $site_folder)
            {
                $path = JPATH_SITE . '/components/' . $this->extension . '/' . $site_folder;
                if (Folder::exists($path))
                {
                    Folder::delete($path);
                }
            }
        }
        
        return true;
    }
}