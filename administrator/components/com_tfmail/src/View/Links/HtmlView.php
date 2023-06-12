<?php
 /*
 * @package		TF Mail Component
 * @license		GNU General Public License version 2 or later; see LICENSE.txt
 */

namespace TechFry\Component\TfMail\Administrator\View\Links;

defined('_JEXEC') or die;

use TechFry\Library\View\Back\TfViewList;

class HtmlView extends TfViewList
{
    public $toolbar_buttons = array('dashboard', 'new', 'publish', 'trash', 'empty', 'import', 'export', 'query');
    
    public $icon = 'fas fa-link';
  
  	public $help_url = 'https://www.techfry.com/documentation/tf-mail-links-list';
  
  	public $columns = array('id', 'published', 'title', 'modified');
  
  	public $theads = array(
      'COM_TFMAIL_CAMPAIGN' => '',
      'COM_TFMAIL_CLICKS' => ''
      );
}