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

class TfViewImport extends TfViewForm
{
    // View class for backend import
    
    public $toolbar_buttons = array('dashboard', 'back', 'cancel');
    
    public $loadData = false;
    
    public $fileUpload = true;
    
    public $help_url = 'https://www.techfry.com/documentation/import-tool';
    
    public $is_pro = true;
    
    public function custom_toolbar_buttons()
    {
        ToolbarHelper::custom('import.import', 'upload', 'upload', Text::_('COM_TF_IMPORT'), false);
    }
    
    protected function addToolBar()
    {
        parent::addToolBar();
        
        ToolbarHelper::title(Text::_('COM_TF_IMPORT'), 'upload');
    }
    
    public function import_layout()
    {
        $this->start_form_layout();
        
            $this->add_tab_forms(array('general', 'options'), 'COM_TF_IMPORT', array(6, 6));
        
        $this->end_form_layout();
    }
}