<?php
 /*
 * @package		TF Mail Component
 * @license		GNU General Public License version 2 or later; see LICENSE.txt
 */

namespace TechFry\Component\TfMail\Administrator\View\Subscribers;

defined('_JEXEC') or die;

use TechFry\Library\View\Back\TfViewList;

class HtmlView extends TfViewList
{
    public $toolbar_buttons = array('dashboard', 'truncate', 'import', 'export', 'query');
    
    public $icon = 'fas fa-user-check';
    
    public $es_add = false;
  
  	public $help_url = 'https://www.techfry.com/documentation/subscribers-list';
  
  	public $columns = array('created');

    public $theads = array(
        'COM_TFMAIL_CAMPAIGN' => 'a.camp_id',
        'JGLOBAL_EMAIL' => 'a.user_id',
        'COM_TFMAIL_ACTIONS' => ''
        );
}