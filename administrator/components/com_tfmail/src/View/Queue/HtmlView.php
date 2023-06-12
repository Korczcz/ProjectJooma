<?php
 /*
 * @package		TF Mail Component
 * @license		GNU General Public License version 2 or later; see LICENSE.txt
 */

namespace TechFry\Component\TfMail\Administrator\View\Queue;

defined('_JEXEC') or die;

use Joomla\CMS\Language\Text;
use Joomla\CMS\Toolbar\ToolbarHelper;
use TechFry\Library\View\Back\TfViewList;

class HtmlView extends TfViewList
{
    public $toolbar_buttons = array('dashboard', 'truncate', 'query');
    
    public $help_url = 'https://www.techfry.com/documentation/email-queue';
    
    public $icon = 'fas fa-clock';
    
    public $es_add = false;
  
  	public $columns = array();

	public $theads = array(
      'COM_TFMAIL_MAIL_ID' => 'a.mail_id',
      'JGLOBAL_TITLE' => 'b.title',
      'COM_TFMAIL_USER_ID' => 'a.user_id',
      'JGLOBAL_EMAIL' => 'c.email',
      'COM_TFMAIL_SEND_DATE' => 'a.send_date',
      'COM_TFMAIL_PRIORITY' => 'a.priority',
      'COM_TFMAIL_ACTIONS' => ''
     );
    
    public function custom_toolbar_buttons()
    {
        $this->toolbar->standardButton('Process')
            ->text('COM_TFMAIL_TOOLBAR_PROCESS')
            ->icon('fas fa-envelope')
            ->task('queue.process');
    }
}