<?php
 /*
 * @package		TF Mail Component
 * @license		GNU General Public License version 2 or later; see LICENSE.txt
 */

namespace TechFry\Component\TfMail\Administrator\View\Mails;

defined('_JEXEC') or die;

use Joomla\CMS\Language\Text;
use Joomla\CMS\Toolbar\ToolbarHelper;
use TechFry\Library\View\Back\TfViewList;

class HtmlView extends TfViewList
{
    public $toolbar_buttons = array('dashboard', 'select', 'publish', 'trash', 'empty', 'import', 'export', 'query');
    
    public $help_url = 'https://www.techfry.com/documentation/newsletters-list';
    
    public $icon = 'fas fa-envelope';
  
  	public $columns = array('id', 'published', 'title');
  
  	public $theads = array(
      'COM_TFMAIL_TYPE' => 'a.mail_type',
      'COM_TFMAIL_SEND_DATE' => 'a.send_date',
      'COM_TFMAIL_SCHEDULE' => 'a.schedule',
      'COM_TFMAIL_QSOC' => '',
      'COM_TFMAIL_PERCENTAGE' => ''
      );
    
    public function custom_toolbar_buttons()
    {
        $this->toolbar->standardButton('Process')
            ->text('COM_TFMAIL_TOOLBAR_PROCESS')
            ->icon('fas fa-envelope')
            ->task($this->view_name . '.process');
    }
}