<?php
 /*
 * @package		TF Mail Component
 * @license		GNU General Public License version 2 or later; see LICENSE.txt
 */

namespace TechFry\Component\TfMail\Administrator\View\Users;

defined('_JEXEC') or die;

use TechFry\Library\View\Back\TfViewList;

class HtmlView extends TfViewList
{
    public $toolbar_buttons = array('dashboard', 'publish', 'delete', 'import', 'export', 'query');
    
    public $help_url = 'https://www.techfry.com/documentation/tf-mail-users-list';
    
    public $icon = 'fas fa-users';
  
  	public $columns = array('id');

    public $theads = array(
        'JSTATUS' => 'a.block',
        'JGLOBAL_EMAIL' => 'a.email',
        'COM_TFMAIL_REGISTER' => 'a.registerDate',
        'COM_TFMAIL_LAST_VISIT' => 'a.lastVisitDate',
        'COM_TFMAIL_LAST_OPEN' => '',
        'COM_TFMAIL_QSOC' => '',
        'COM_TFMAIL_PERCENTAGE' => '',
        'COM_TFMAIL_ACTIONS' => ''
        );
  
  	public function custom_toolbar_buttons()
    {
    	$this->toolbar->standardButton('Clean')
            ->text('COM_TFMAIL_TOOLBAR_CLEAN_USERS')
            ->icon('fas fa-trash')
            ->task($this->view_name . '.cleanusers')
          	->buttonClass('btn btn-danger');
    }
}