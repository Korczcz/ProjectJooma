<?php
 /*
 * @package		TF Mail Component
 * @license		GNU General Public License version 2 or later; see LICENSE.txt
 */

namespace TechFry\Component\TfMail\Administrator\View\Campaign;

defined('_JEXEC') or die;

use Joomla\CMS\Language\Text;
use Joomla\CMS\Toolbar\ToolbarHelper;
use TechFry\Library\View\Back\TfViewForm;

class HtmlView extends TfViewForm
{
    public $toolbar_buttons = array('apply', 'save', 'save2new', 'save2copy', 'cancel');
    
    public $help_url = 'https://www.techfry.com/documentation/email-campaigns';
    
    public function custom_toolbar_buttons()
    {
        ToolbarHelper::custom('campaign.add2queue', 'envelope', 'envelope', Text::_('COM_TFMAIL_TOOLBAR_SEND'), false);
    }
}