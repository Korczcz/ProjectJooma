<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library\View\Front;

defined('_JEXEC') or die;

use Joomla\CMS\Factory;
use Joomla\CMS\Language\Text;
use Joomla\CMS\Router\Route;
use Joomla\CMS\Uri\Uri;
use TechFry\Library\View\Air\Alert;

class TfViewList extends TfView
{
    // View class for frontend list
    // Methods: escape(), getLayout(), setLayout(), loadTemplate()
    
    public $form_view;
    
    public $items;
    
    public $state;
    
    public $pagination;
    
    public $total;
	
  	// 01. Starting method for list layouts
    public function initiate_list()
    {
      	$this->initiate_view();
      
      	// Form view name
        if (empty($this->form_view))
        {
            $this->form_view = substr($this->view_name, 0, -1);
        }
        
        // Get data from model
        $this->items = $this->get('Items');
        $this->state = $this->get('State');
        $this->pagination = $this->get('Pagination');
        
        $this->total = $this->get('Total');
        
        $this->initiate_view();
    }
    
    protected function _prepareDocument()
	{
	    parent::_prepareDocument();
	    
	    // Add feed link
	    if ($this->get_param('show_feed_link', 0))
	    {
	        $this->add_feed();
	    }
	}
    
    // Start displaying list layout
    public function start_list_layout()
    {   
        if ($this->params->get('show_page_heading'))
        {
            echo '<h1>' . $this->escape($this->params->get('page_heading')) . '</h1>';
        }
        
        if (!empty($this->params->get('description')))
        {
            echo $this->params->get('description');
        }
        
        if (empty($this->items))
        {
            $no_results_msg = $this->get_no_results_msg();
            echo Alert::get_output($no_results_msg, array('type' => 'warning'), $this->framework);
        }
    }
    
    // Finish displaying list layout
    public function end_list_layout()
    {
        // Add pagination links
      	if (!empty($this->items))
        {
          	$show_pagination = $this->get_param($this->view_name . '_pagination', 1);
          	if ($show_pagination)
            {
            	echo $this->pagination->getPagesCounter();
      
      			echo $this->pagination->getPagesLinks();  
            }  
        }
    }
    
    public function add_feed()
	{
		$link = '&format=feed&limitstart=';
		
		$attribs = array('type' => 'application/rss+xml', 'title' => 'RSS 2.0');
		$this->document->addHeadLink(Route::_($link . '&type=rss'), 'alternate', 'rel', $attribs);
		
		$attribs = array('type' => 'application/atom+xml', 'title' => 'Atom 1.0');
		$this->document->addHeadLink(Route::_($link . '&type=atom'), 'alternate', 'rel', $attribs);
	}
}