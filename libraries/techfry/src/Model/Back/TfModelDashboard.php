<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library\Model\Back;

defined('_JEXEC') or die;

use Joomla\CMS\Component\ComponentHelper;
use Joomla\CMS\Helper\LibraryHelper;
use Joomla\CMS\Factory;
use Joomla\CMS\Feed\FeedFactory;
use TechFry\Library\Model\TfModel;
use TechFry\Library\TfDb;

class TfModelDashboard extends TfModel
{
    // Get update site id from #__update_sites_extensions
    public function get_update_site_id($extension_id)
    {
        $db = Factory::getDbo();
	    $query = $db->getQuery(true);
	    
	    $query->select('update_site_id')
		    ->from($db->qn('#__update_sites_extensions'))
		    ->where($db->qn('extension_id') . ' = '. $db->q($extension_id));
	        
	    $db->setQuery($query);
	    
	    $update_site = $db->loadResult();
	    
	    return $update_site;
    }
    
    // Get current version of component installed
    public function get_current_version($element = '')
    {
        if ($element == '')
        {
            $element = $this->option;
        }
        
        $ext = TfDb::get_item('extensions', $element, 'element');
        
        $version = json_decode($ext->manifest_cache)->version;
        
        return $version;
    }
    
    // Get new bersion of component
    public function get_new_version()
    {
        $component = ComponentHelper::getComponent($this->option);
        
        $update_site = $this->get_update_site_id($component->id);
        
        $update = TfDb::get_item('update_sites', $update_site, 'update_site_id');
        $dom = new \DOMDocument();
        $result = $dom->load($update->location);
      	if ($result == false)
        {
        	$this->set_message('<strong>Component update information is not available.</strong>', 'warning');
          
          	return false;
        }
      
        $contents = $dom->getElementsByTagName('version');
        foreach ($contents as $content)
        {
            $new_version = $content->nodeValue;
        }
        
        return $new_version;
    }
    
    public function get_new_library_version()
    {
        $library = LibraryHelper::getLibrary('techfry');
        
        $update_site = $this->get_update_site_id($library->id);
        
        $update = TfDb::get_item('update_sites', $update_site, 'update_site_id');
        
        $dom = new \DOMDocument();
        $result = $dom->load($update->location);
      	if ($result == false)
        {
        	$this->set_message('<strong>Library update information is not available.</strong>', 'warning');
          
          	return false;
        }
      
        $contents = $dom->getElementsByTagName('version');
        foreach ($contents as $content)
        {
            $new_version = $content->nodeValue;
        }
        
        return $new_version;
    }
    
    // Placeholder function to be defined in component dashboard model class
    public function getAlerts()
    {
        $alerts = array();
        
        return $alerts;
    }
}