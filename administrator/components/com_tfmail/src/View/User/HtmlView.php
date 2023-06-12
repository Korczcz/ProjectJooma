<?php
 /*
 * @package		TF Mail Component
 * @license		GNU General Public License version 2 or later; see LICENSE.txt
 */

namespace TechFry\Component\TfMail\Administrator\View\User;

defined('_JEXEC') or die;

use TechFry\Library\View\Back\TfViewForm;

class HtmlView extends TfViewForm
{
    public $toolbar_buttons = array('cancel');
    
    public $help_url = 'https://www.techfry.com/documentation/tf-mail-users-edit';
}