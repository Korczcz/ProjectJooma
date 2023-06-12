<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library\View;

defined('_JEXEC') or die;

use Joomla\CMS\Language\Text;
use Joomla\CMS\Toolbar\ToolbarHelper;
use TechFry\Library\View\Back\TfViewForm;

class TfViewQuery extends TfViewForm
{
    // View class for backend query tools
    
    public $toolbar_buttons = array('dashboard', 'back', 'cancel');
    
    public $loadData = false;
    
    public $help_url = 'https://www.techfry.com/documentation/query-tool';
    
    public $is_pro = true;
    
    public function custom_toolbar_buttons()
    {
        ToolbarHelper::custom('query.process', 'database', 'database', Text::_('COM_TF_PROCESS'), false);
    }
    
    protected function addToolBar()
    {
        parent::addToolBar();
        
        ToolbarHelper::title(Text::_('COM_TF_QUERY'), 'database');
    }
    
    public function query_layout()
    {
        $this->start_form_layout();
        
            $this->add_tab_forms(array('general', 'filters'), 'COM_TF_QUERY', array(6, 6));
        
        $this->end_form_layout();
    }
}