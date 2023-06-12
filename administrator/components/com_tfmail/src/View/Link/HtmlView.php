<?php
 /*
 * @package		TF Mail Component
 * @license		GNU General Public License version 2 or later; see LICENSE.txt
 */

namespace TechFry\Component\TfMail\Administrator\View\Link;

defined('_JEXEC') or die;

use TechFry\Library\View\Back\TfViewForm;

class HtmlView extends TfViewForm
{
    public $toolbar_buttons = array('apply', 'save', 'save2new', 'save2copy', 'cancel');
  
  	public $help_url = 'https://www.techfry.com/documentation/tf-mail-links-edit';
}