<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library\View\Back;

\defined('_JEXEC') or die;

use Joomla\CMS\Factory;
use Joomla\CMS\Language\Text;
use Joomla\CMS\MVC\Model\BaseDatabaseModel;
use Joomla\CMS\Toolbar\ToolbarHelper;
use Joomla\CMS\Router\Route;
use Joomla\CMS\Uri\Uri;

class TfViewSelect extends TfView
{
    protected $state;
    
    protected $items;
    
    public $toolbar_buttons = array('dashboard', 'back');
    
    public $help_url = '';
    
    public function display($tpl = null)
    {
        $this->icon = 'fas fa-list';
        
        $this->state = $this->get('State');
        
		$this->items = $this->get('Items');
        
        parent::display($tpl);
    }
    
    public function select_search()
    {
        echo '<div class="d-flex mt-2">';
            echo '<div class="ms-auto me-auto">';
                echo '<label class="visually-hidden" for="comTechfrySelectSearch">';
                    echo Text::_('COM_MODULES_TYPE_CHOOSE');
                echo '</label>';
                echo '<div class="input-group mb-3 me-sm-2">';
                    echo '<input type="text" value="" class="form-control" id="comTechfrySelectSearch" placeholder="' . Text::_('JSEARCH_FILTER') . '">';
                    echo '<div class="input-group-text">';
                        echo '<span class="icon-search" aria-hidden="true"></span>';
                    echo '</div>';
                echo '</div>';
            echo '</div>';
        echo '</div>';
    }
    
    public function select_items()
    {
        $input = Factory::getApplication()->input;
        
        $select_type = $input->get('select_type');
        
        echo '<div class="new-modules">';
        
        echo '<h2 class="pb-3 ms-3">Select ' . ucwords($select_type) . ' Type</h2>';
        
        echo '<div class="main-card card-columns p-4" id="comTechfrySelectResultsContainer">';
            foreach ($this->items as $item)
            {
                $link = 'index.php?option=' . $this->option . '&view=' . $select_type . '&layout=edit&type=' . $item['value'];
                
                echo '<a href="' . Route::_($link) . '" class="new-module mb-3 comModulesSelectCard">';
                    echo '<div class="new-module-details">';
                        echo '<h3 class="new-module-title">' . $item['title'] . '</h3>';
              			if (isset($item['desc']))
                        {
                        	echo '<p class="card-body new-module-caption p-0">' . $item['desc'] . '</p>';  
                        }
                    echo '</div>';
                    echo '<span class="new-module-link"><span class="icon-plus" aria-hidden="true"></span></span>';
                echo '</a>';
            }
        echo '</div>';
        
        echo '</div>';
    }
    
    public function select_layout()
    {
        $wa = $this->document->getWebAssetManager();
        // $wa->useScript('com_modules.admin-module-search');

        $this->select_search();

        $this->select_items();
    }
}