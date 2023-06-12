<?php
 /*
 * @package		TF Mail Component
 * @license		GNU General Public License version 2 or later; see LICENSE.txt
 */

namespace TechFry\Component\TfMail\Administrator\View\Mail;

defined('_JEXEC') or die;

use Joomla\CMS\Factory;
use Joomla\CMS\Language\Text;
use Joomla\CMS\Toolbar\ToolbarHelper;
use TechFry\Library\View\Back\TfViewForm;

class HtmlView extends TfViewForm
{
    public $toolbar_buttons = array('apply', 'save', 'save2new', 'save2copy', 'cancel');
    
    public $help_url = 'https://www.techfry.com/documentation/newsletters-edit';
    
    public function custom_toolbar_buttons()
    {
        if ($this->layout == 'preview')
        {
            ToolbarHelper::title(Text::_('COM_TFMAIL_MAIL_PREVIEW'), 'fas fa-eye');
            
            ToolbarHelper::back();
            
            ToolbarHelper::custom('mail.add2queue', 'envelope', 'envelope', Text::_('COM_TFMAIL_TOOLBAR_SEND'), false);
		    
		    ToolbarHelper::custom('mail.testmail', 'ok', 'ok', Text::_('COM_TFMAIL_TOOLBAR_SEND_TEST_MAIL'), false);
        }
        elseif ($this->layout != 'preview')
        {
		    ToolbarHelper::custom('mail.preview', 'eye-open', 'eye-open', Text::_('COM_TFMAIL_TOOLBAR_PREVIEW'), false);
        }
    }
}