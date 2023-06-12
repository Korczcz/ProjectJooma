<?php
 /*
 * @package		TF Mail Component
 * @license		GNU General Public License version 2 or later; see LICENSE.txt
 */

namespace TechFry\Component\TfMail\Administrator\View\Statistics;

defined('_JEXEC') or die;

use TechFry\Library\View\Back\TfViewList;

class HtmlView extends TfViewList
{
    public $toolbar_buttons = array('dashboard', 'truncate', 'export', 'query');
    
    public $icon = 'fas fa-chart-bar';
    
    public $es_add = false;
  
  	public $help_url = 'https://www.techfry.com/documentation/tf-mail-newsletter-statistics';
  
  	public $columns = array('id');

    public $theads = array(
        'COM_TF_TYPE' => 'a.type',
        'JGLOBAL_TITLE' => 'a.mail_id',
        'JGLOBAL_EMAIL' => 'a.user_id',
        'COM_TFMAIL_OPENS' => 'a.opens',
        'COM_TFMAIL_CLICKS' => 'a.clicks'
        );
}