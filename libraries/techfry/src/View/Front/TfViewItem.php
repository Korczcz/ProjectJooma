<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library\View\Front;

defined('_JEXEC') or die;

use Joomla\CMS\Factory;
use Joomla\CMS\Language\Text;
use Joomla\CMS\Uri\Uri;

class TfViewItem extends TfView
{
    // View class for frontend item
    
    public $item;
    
    public $form_view;
  
  	public $cf_context; // Custom field context

    public function initiate_item()
    {
        // Form view
        $this->form_view = substr($this->view_name, 0, -1);
        
        // Get data from model
        $this->item = $this->get('Item');
      	
      	if ($this->cf_context)
        {
          	Factory::getApplication()->triggerEvent('onContentPrepare', [$this->cf_context, &$this->item, &$this->item->params]);
      
            $this->item->event = new \stdClass;

            $results = Factory::getApplication()->triggerEvent('onContentAfterTitle', [$this->cf_context, &$this->item, &$this->item->params]);
            $this->item->event->afterDisplayTitle = trim(implode("\n", $results));

            $results = Factory::getApplication()->triggerEvent('onContentBeforeDisplay', [$this->cf_context, &$this->item, &$this->item->params]);
            $this->item->event->beforeDisplayContent = trim(implode("\n", $results));

            $results = Factory::getApplication()->triggerEvent('onContentAfterDisplay', [$this->cf_context, &$this->item, &$this->item->params]);
            $this->item->event->afterDisplayContent = trim(implode("\n", $results));  
        }
        
        $this->initiate_view();
    }
    
    protected function _prepareDocument()
	{
	    $app = Factory::getApplication();
	    $pathway = $app->getPathway();
	    
	    // 01. Page heading of document
	    $menus = $app->getMenu();
	    $menu = $menus->getActive();
	    if ($menu)
		{
			$this->params->def('page_heading', $this->params->get('page_title', $menu->title));
		}
		
		// 02. Add item path to breadcrumb
		$pathway->addItem($this->item->title);
	    
	    // 03. Title of document
		$title = $this->item->title;
		
		$this->setDocumentTitle($title);
	}
    
    // Fucntion to start displaying item layout
    public function start_item_layout()
    {
        if (!empty($this->item->title))
        {
            echo '<h1>' . $this->item->title . '</h1>';
        }
        
        if (!empty($this->item->image))
        {
            echo '<img class="img-fluid img-thumbnail mb-3" src="' . $this->item->image . '" />';
        }
        
        if (!empty($this->item->description))
        {
            echo $this->item->description;
        }
    }
    
    // Function to finish displaying item layout
    public function end_item_layout()
    {
        // Record Hits
	    if ($this->getModel()->get_param('record_hits'))
	    {
	        $this->getModel()->record_hits();
	    }
    }
}