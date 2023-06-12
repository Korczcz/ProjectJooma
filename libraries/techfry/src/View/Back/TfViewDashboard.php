<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library\View\Back;

\defined('_JEXEC') or die;

use Joomla\CMS\Factory;
use Joomla\CMS\Language\Text;
use Joomla\CMS\Toolbar\ToolbarHelper;
use Joomla\CMS\Uri\Uri;
use TechFry\Library\TfDb;
use TechFry\Library\TfDbv2;

class TfViewDashboard extends TfView
{
    // View class for backend dashboard
    
    public $tiles_table = array();
    
    public $tiles_general = array(array('import', 'upload'), array('export', 'download'), array('query', 'database'));
    
    public $tiles_link = array();
    
    public $tiles = array();
                
    public $alerts = array();
    
    public $pro_url = '';
  
  	public $custom_fields_section;
    
    public $current_version;
    public $new_version;
    public $mode;
    
    public function display($tpl = null)
    {
        $this->icon = 'fas fa-th';
        
        return parent::display($tpl);
    }
    
    // Fucntion to start displaying dashboard layout
    public function start_dashboard_layout()
    {
        // INITIAL VARIABLES
        $model = $this->getModel();
        
        $this->current_version = $model->get_current_version();
        $this->new_version = $model->get_new_version();
        
        $this->mode = $model->is_pro() ? 'Pro' : 'Lite';
        
        // START LAYOUT
        echo '<div id="j-main-container">';
        
        $this->add_table_tiles();
        
        $this->add_general_tiles();
        
        $this->add_message();

        // echo '<div class="row">';
            
            // echo '<div class="col-md-9">';
                echo '<div class="card mb-3">';
                echo '<div class="card-body">';
                    echo '<nav class="quick-icons">';
                        echo '<ul class="nav flex-wrap">';
                        foreach ($this->tiles as $tile)
                        {
                            echo $tile;
                        }
                        echo '</ul>';
                    echo '</nav>';
                echo '</div>';
                echo '</div>';
            // echo '</div>';
            
            // echo '<div class="col-md-3">';
            
            
            // echo '</div>';
            
        // echo '</div>';
    }
    
    // Function to finish dashboard layout
    public function end_dashboard_layout()
    {
        echo '<small>Version: ' . $this->current_version . '<br> Mode: ' . $this->mode . '</small>';
        echo '</div>';
    }
    
    // Add tile with table in database
    public function add_tile_table($view, $table = null, $icon = 'check-circle', $title = '')
    {
        $link = 'index.php?option=' . $this->option . '&view=' . $view;
      
      	if (empty($title))
        {
        	$title = strtoupper($this->option) . '_' . strtoupper($view);  
        }
        
        $total_rows = null;
        if ($table)
        {
            $total_rows = TfDb::total_rows($table);
        }
        
        $output = $this->j4_tile($link, $icon, $title, $total_rows);
        
        return $output;
    }
    
    // Add Tile - Import, Export, Query
    public function add_tile($view, $icon = 'checkin')
    {
        $link = 'index.php?option=' . $this->option . '&view=select&select_type=' . $view;
        $str = 'COM_TF_' . strtoupper($view);
        
        $output = $this->j4_tile($link, $icon, $str, false, false);
        
        return $output;
    }
    
    // Add tile with external link
    public function add_tile_link($link, $text, $icon = 'checkin')
    {
        $str = 'COM_TF_' . strtoupper($text);
        
        $output = $this->j4_tile($link, $icon, $str, false, true);
        
        return $output;
    }
    
    // Add message
    public function add_message()
    {
        $model = $this->getModel();
        
        // 01. Message for Component version
        if ($this->new_version != false && $this->current_version != $this->new_version)
        {
            $model->set_message('<strong>New version ' . $this->new_version . ' is available! Please update the extension.</strong>', 'error');
        }
        
        // 02. Message for Library version
        $current_library = $model->get_current_version('techfry');
        $new_library = $model->get_new_library_version();
        if ($new_library != false && $current_library != $new_library)
        {
            $model->set_message('<strong>New version ' . $new_library . ' of TF Library is available! Please update the extension.</strong>', 'error');
        }
        
        // 03. Messages from component dashboard model
        $this->alerts = $this->get('Alerts');
        if (!empty($this->alerts))
        {
            foreach ($this->alerts as $type => $alert)
            {
                $model->set_message('<strong>' . $alert . '</strong>', $type);
            }
        }
    }
    
    public function j4_tile($link, $icon, $str, $total_rows = false, $target = false, $class = '')
    {
        $output = '<li class="quickicon-group">';
            $output .= '<ul class="list-unstyled d-flex w-100">';
                $output .= '<li class="quickicon">';
                    $output .= '<a href="' . $link . '" class="pt-3 ' . $class . '"';
                    if ($target)
                    {
                        $output .= ' target="_blank"';
                    }
                    $output .= '>';
                        $output .= '<div class="quickicon-info"><div class="quickicon-icon">';
					    $output .= '<div class="fas fa-' . $icon . '" aria-hidden="true"></div>';
					    $output .= '</div></div>';
						$output .= '<div class="quickicon-name d-flex align-items-center">' . Text::_($str);
						if ($total_rows)
						{
						    $output .= ' (' . $total_rows . ')';
						}
						$output .= '</div>';
                    $output .= '</a>';
                $output .= '</li>';
            $output .= '</ul>';
        $output .= '</li>';
        
        return $output;
    }
    
    // Add all general tiles without table
    public function add_general_tiles()
    {
        // Field Groups, Fields Tiles
      	if ($this->custom_fields_section)
        {
        	$link = 'index.php?option=com_fields&view=fields&context=' . $this->option . '.' . $this->custom_fields_section;
      		$this->tiles[] = $this->j4_tile($link, 'puzzle-piece', 'JGLOBAL_FIELDS', false, false);
          
          	$link = 'index.php?option=com_fields&view=groups&context=' . $this->option . '.' . $this->custom_fields_section;
      		$this->tiles[] = $this->j4_tile($link, 'puzzle-piece', 'JGLOBAL_FIELD_GROUPS', false, false);
        }
      	
      
      	// Import, Export, Query Tiles
        foreach ($this->tiles_general as $tile)
        {
            $this->tiles[] = $this->add_tile($tile[0], $tile[1]);
        }
        
        // Support Tile
        $this->tiles[] = $this->add_tile_link('https://www.techfry.com/forum', 'SUPPORT', 'question-circle text-info');
        
        // Pro Tile
        if (!empty($this->pro_url))
        {
            $this->tiles[] = $this->add_tile_link($this->pro_url, 'PRO_VERSION', 'star text-success');
        }
    }
    
    // Add all tiles which are associated with database tables
    public function add_table_tiles()
    {
        foreach ($this->tiles_table as $tile)
        {
          	$tile_icon = $tile[2] ?? 'check-circle';
          	
          	$tile_title = $tile[3] ?? '';
            
            $this->tiles[] = $this->add_tile_table($tile[0], $tile[1], $tile_icon, $tile_title);
        }
    }
}