<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library\View\Front;

defined('_JEXEC') or die;

use Joomla\CMS\Component\ComponentHelper;
use Joomla\CMS\Factory;
use Joomla\CMS\Language\Text;
use Joomla\CMS\Router\Route;
use Joomla\CMS\MVC\View\HtmlView as BaseHtmlView;
use Joomla\CMS\Uri\Uri;
use TechFry\Library\TfResource;
use TechFry\Library\TfAmp;

class TfView extends BaseHtmlView
{
    // General view class for frontend
    
    public $app;
    
    public $input;
    
    public $option;
    
    public $layout;
    
    public $params;
    
    public $view_name;
    
    public $uri;
    
    public $user;
    
    public $load_bs = 0;
    
    public $load_rs;
    
    public $title;
  
  	public $framework;

    public function initiate_view()
    {
        $this->uri = Uri::getInstance();
        
        $this->app = Factory::getApplication();
        
        $this->input = $this->app->input;
        
        $this->option = $this->input->get('option');
        
        $this->layout = $this->getLayout();
        
        $this->view_name = $this->getName();
        
        $this->user = Factory::getUser();
      
      	$this->framework = $this->get_param('framework', 'bs');
        
        // Active menu parameters
        $this->params = $this->app->getMenu()->getActive()->getParams();
        
        // Load Resources
        TfResource::add_resources($this->get_param('load_rs'));
        
        $this->_prepareDocument();
    }
    
    protected function _prepareDocument()
	{
	    $pathway = $this->app->getPathway();
	    
	    // 01. Page heading of document
	    $menus = $this->app->getMenu();
	    $menu = $menus->getActive();
	    if ($menu)
		{
			$this->params->def('page_heading', $this->params->get('page_title', $menu->title));
		}
		
		// 02. Add item path to breadcrumb
		// $pathway->addItem($this->title);
	    
	    // 03. Title of document
		if ($this->title)
		{
		    $title = $this->title;
		}
		else
		{
		    $title = $this->params->get('page_title', $menu->title);
		}
		
		$this->setDocumentTitle($title);
	}
	
	//
	public function action_buttons($actions = array())
    {
        $output = '';
      	
      	foreach ($actions as $action)
        {
            $output .= $this->action_button($action[0], $action[1], $action[2], $action[3]);
        }
      
      	return $output;
    }
    
    public function action_button($text, $task, $class = 'btn btn-primary', $icon = '', $hidden = array())
    {
        $output = '<form method="post">';
        
            $output .= '<input type="hidden" name="option" value="' . $this->option . '">';
            $output .= '<input type="hidden" name="task" value="' . $task . '">';
            
            foreach ($hidden as $k => $v)
            {
                $output .= '<input type="hidden" name="' . $k . '" value="' . $v . '">';
            }
            
            $output .= '<button type="submit" class="' . $class . '" style="margin-right:8px;">';
            if (!empty($icon))
            {
                $output .= '<i class="' . $icon . '"></i> ';
            }
            if (!empty($text))
            {
                $output .= Text::_($text);
            }
            $output .= '</button>';
            
        $output .= '</form>';
      
      	return $output;
    }
	
	// Handle access if frontend view is not permitted
	public function handle_access($message = '', $type = 'error')
    {
        $app = Factory::getApplication();
        
        // 1. Login for guest user
        if ($this->user->get('guest'))
        {
            $return = base64_encode(Uri::getInstance());
            
			$login_url_with_return = Route::_('index.php?option=com_users&view=login&return=' . $return);
			
			$app->enqueueMessage(Text::_('COM_TF_LOGIN_TO_CONTINUE'), 'notice');
			
			$app->redirect($login_url_with_return, 403);
        }
        // 2. Display message
        else
        {
            if (empty($message))
            {
                $message = Text::_('JERROR_ALERTNOAUTHOR');
            }
            
            $app->enqueueMessage($message, $type);
            
            $app->setHeader('status', 403, true);
        }
    }
    
    // Override to get custom message
    public function get_no_results_msg()
    {
        return Text::_('JGLOBAL_NO_MATCHING_RESULTS');
    }
    
    // Start page display
    public function start_page_layout()
    {
        if (!empty($this->params->get('pageclass_sfx')))
        {
            echo '<div class="' . $this->params->get('pageclass_sfx') . ' p-3">';
        }
        
        if ($this->params->get('show_page_heading'))
        {
            echo '<h1>' . $this->escape($this->params->get('page_heading')) . '</h1>';
        }
        
        if (!empty($this->params->get('image')))
        {
            echo '<img class="img-thumbnail mb-3" src="' . $this->params->get('image') . '" title="' . $this->escape($this->params->get('page_heading')) . '">';
        }
        
        if (!empty($this->params->get('description')))
        {
            echo $this->params->get('description');
        }
    }
    
    // End page display
    public function end_page_layout()
    {
        if (!empty($this->params->get('pageclass_sfx')))
        {
            echo '</div>';
        }
    }
    
    // Get parameter from component options
    public function get_param($type, $default = null)
    {
        $input = Factory::getApplication()->input;
        $option = $input->get('option');
        
        $param = ComponentHelper::getParams($option)->get($type, $default);
        
        return $param;
    }
}