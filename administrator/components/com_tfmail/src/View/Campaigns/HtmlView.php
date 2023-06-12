<?php
 /*
 * @package		TF Mail Component
 * @license		GNU General Public License version 2 or later; see LICENSE.txt
 */

namespace TechFry\Component\TfMail\Administrator\View\Campaigns;

defined('_JEXEC') or die;

use TechFry\Library\View\Back\TfViewList;

class HtmlView extends TfViewList
{
    public $toolbar_buttons = array('dashboard', 'new', 'publish', 'trash', 'empty', 'import', 'export', 'query');
    
    public $help_url = 'https://www.techfry.com/documentation/campaigns-list';
    
    public $icon = 'fas fa-envelope-open-text';
  
  	public $columns = array('id', 'published', 'title');
  
  	public $theads = array(
      'COM_TFMAIL_MAILS' => '',
      'COM_TFMAIL_FILTER' => '',
      'COM_TFMAIL_SUBSCRIBE' => '',
      'COM_TFMAIL_MODIFY' => '',
      'COM_TFMAIL_USERS' => ''
    );
}