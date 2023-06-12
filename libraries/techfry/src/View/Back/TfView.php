<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library\View\Back;

\defined('_JEXEC') or die;

use Joomla\CMS\Component\ComponentHelper;
use Joomla\CMS\Factory;
use Joomla\CMS\Language\Text;
use Joomla\CMS\MVC\View\HtmlView as BaseHtmlView;
use Joomla\CMS\Router\Route;
use Joomla\CMS\Toolbar\Toolbar;
use Joomla\CMS\Toolbar\ToolbarHelper;
use Joomla\CMS\Uri\Uri;
use TechFry\Library\TfDb;

class TfView extends BaseHtmlView
{
    // General view class for backend
    // get_binary, get_link, get_date, get_number, get_access, get_small, get_button, get_user, get_alert
    // get_joomla_version
    
    public $input;
    
    public $option;
    
    public $com_name;
    
    public $view_name;
  
  	public $app;
    
    public $user;
    
    public $toolbar;
    
    public $toolbar_buttons = array(); // Define in view file
    
    public $icon = 'icon-generic';
    
    public $help_url = '';
    
    public $layout;
    
    public $is_pro = false;

    public function display($tpl = null)
    {
        $this->initiate_view();
        
        // Set the toolbar
        $this->addToolbar();
        
        // Check for Pro Version
        $model = $this->getModel();
        if ($this->is_pro && !$model->is_pro())
        {
            $model->set_message(Text::_('COM_TF_PRO_UPGRADE_MESSAGE'), 'error');
            
            return;
        }
        
        // Display the template
        return parent::display($tpl);
    }
    
    public function initiate_view()
    {
        $this->app = Factory::getApplication();
      
      	$this->input = Factory::getApplication()->input;
        
        $this->option = $this->input->get('option');
        
        $this->com_name = substr($this->option, 6);
        
        $this->view_name = $this->getName();
        
        $this->layout = $this->getLayout();
        
        $this->user = Factory::getApplication()->getIdentity();
    }
    
    protected function addToolbar()
    {
        ToolbarHelper::title(Text::_(strtoupper($this->option) . '_MANAGER_' . strtoupper($this->view_name)), $this->icon);
        
        if (in_array('back', $this->toolbar_buttons))
        {
            ToolbarHelper::back();
        }
        
        $this->toolbar = Toolbar::getInstance('toolbar');
        
        if (in_array('dashboard', $this->toolbar_buttons))
        {
            $this->toolbar->linkButton('Dashboard')
                ->text('COM_TF_DASHBOARD')
                ->url('index.php?option=' . $this->option . '&view=dashboard')
                ->icon('fas fa-th');
        }
      
      	$this->custom_toolbar_buttons();
        
        if ($this->user->authorise('core.admin', $this->option) || $this->user->authorise('core.options', $this->option))
        {
            ToolbarHelper::preferences($this->option);
        }
        
        if ($this->help_url)
        {
            $this->toolbar->help('', false, $this->help_url);
        }
    }
  
  	// Placeholder function to add custom toolbar buttons in view file
    public function custom_toolbar_buttons()
    {
        
    }
    
    // Display data in the form of 0 or 1
    public function get_binary($value)
    {
        $color = $value ? 'Green' : 'Red';
        
        $output = '';
        
            $output .= '<span style="color: ' . $color . ';" class="fas fa-';
            $output .= $value ? 'check' : 'times';
            $output .= '" aria-hidden="true"></span>';
        
        return $output;
    }
    
    // Display status icon with color
    public function get_status($value)
    {
        switch ($value)
        {
            case 1 :
                $color = 'MediumSeaGreen';
                $icon = 'check';
                break;
                
            case 0 :
                $color = 'Tomato';
                $icon = 'times';
                break;
                
            case 2 :
                $color = 'DodgerBlue';
                $icon = 'archive';
                break;
                
            case -2 :
                $color = 'Gray';
                $icon = 'trash';
        }
        
        $output = '';
        
            $output .= '<span style="color: ' . $color . ';" class="fas fa-' . $icon;
            $output .= '" aria-hidden="true"></span>';
        
        return $output;
    }
    
    // Display title with link to edit form
    public function get_link($link, $text, $title = 'JGLOBAL_EDIT_ITEM')
    {
        $output = '';
        
        if (!empty($link))
        {
            $output .= '<strong><a href="' . $link . '" title="' . Text::_($title) . '">' . $text . '</a></strong>';
        }
        return $output;
    }
    
    // Display date
    public function get_date($date)
    {
        $output = '';
        
        if (!empty($date) && $date != 0)
        {
            $mydate = Factory::getDate($date);
            $output = $mydate->format('d M Y');
        }
        
        return $output;
    }
    
    // Display number or count
    public function get_number($number, $style = 'success')
    {
        $output = '';
        
        $output .= '<span class="badge';

        $output .= (!empty((int) $number)) ? ' bg-' . $style : ' bg-secondary';

        $output .= '">' . $number . '</span>';
        
        return $output;
    }
    
    // Display access level
    public function get_access($id)
    {
        $access_level = TfDb::get_item('viewlevels', $id);
        
        return '<small>' . $access_level->title . '</small>';
    }
    
    // Display in small like alias
    public function get_small($sm)
    {
        $output = '';
        
        if (!empty($sm))
        {
            $output .= '<br><small>';
                $output .= $sm;
            $output .= '</small>';
        }
        
        return $output;
    }
    
    // Display action button
    public function get_button($link, $text, $type = 'success')
    {
        $output = '';
        
        $output .= '<a class="text-decoration-none btn btn-sm btn-' . $type . '" href="' . Route::_($link) . '">' . Text::_($text) . '</a> ';
        
        return $output;
    }
    
    // Display user email and id
    public function get_user($user_id, $user_email = '')
    {
        $output = '';
        
        if ($user_id)
        {
			$user_email = $user_email ? $user_email : Factory::getUser($user_id)->email;
            $output .= $user_email ? $user_email : '<span class="text-danger"><strong>User Not Available</strong></span>';
        
            $output .= $this->get_small(Text::_('COM_TF_USER_ID') . ': ' . $user_id);
        }
        
        return $output;
    }
    
    // Display badge or label
    public function get_label($text, $class = 'bg-light text-dark border')
    {
        $output = '';
        
        $output .= '<span class="badge ' . $class . '">';
        $output .= $text;
        $output .= '</span>';
        
        return $output;
    }
    
    // Display alert message
    public function get_alert($message, $type = 'info')
    {
        echo '<p class="alert alert-' . $type . '">' . $message . '</p>';
    }
    
    public function get_joomla_version($type = 'major')
	{
		$version = JVERSION;
		list ($major, $minor, $patch) = explode('.', $version);

		if (strpos($patch, '-') !== false)
		{
			$patch = explode('-', $patch)[0];
		}

		switch ($type)
		{
			case 'minor' :
				return (int) $minor;
				break;
				
			case 'patch' :
				return (int) $patch;
				break;
				
			case 'major' :
			default :
				return (int) $major;
		}
	}
    
    public function get_no_results_msg()
    {
        $output = '<div class="alert alert-info">';
            $output .= '<span class="icon-info-circle" aria-hidden="true"></span> ';
            $output .= '<span class="visually-hidden">' . Text::_('INFO') . '</span>';
            $output .= Text::_('JGLOBAL_NO_MATCHING_RESULTS');
        $output .= '</div>';
        
        return $output;
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