<?php
 /*
 * @package		TF Mail Component
 * @license		GNU General Public License version 2 or later; see LICENSE.txt
 */

namespace TechFry\Component\TfMail\Administrator\View\Bounces;

defined('_JEXEC') or die;

use Joomla\CMS\Language\Text;
use Joomla\CMS\Toolbar\ToolbarHelper;
use TechFry\Library\View\Back\TfViewList;

class HtmlView extends TfViewList
{
    public $toolbar_buttons = array('dashboard', 'publish', 'trash', 'truncate');
    
    public $icon = 'fas fa-sync';
    
    public $es_add = false;
  
  	public $help_url = 'https://www.techfry.com/documentation/bounces-list';
  
  	public $columns = array('id', 'published');
  
  	public $theads = array(
      'JGLOBAL_TITLE' => 'a.subject',
      'COM_TFMAIL_BOUNCE_EMAIL' => 'a.bounce_email',
      'JDATE' => ''
    );
    
    public function custom_toolbar_buttons()
    {
        $this->toolbar->standardButton('Process')
            ->text('COM_TFMAIL_BOUNCE_HANDLING')
            ->icon('fas fa-sync')
            ->task('bounce.handle');
    }
}