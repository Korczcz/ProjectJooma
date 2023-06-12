<?php
 /*
 * @package		TF Mail Component
 * @license		GNU General Public License version 2 or later; see LICENSE.txt
 */

namespace TechFry\Component\TfMail\Site\View\Subscribe;

defined('_JEXEC') or die;

use TechFry\Library\View\Front\TfViewForm;

class HtmlView extends TfViewForm
{
    function display($tpl = null)
    {
        $this->loadData = false;
        
        $this->initiate_form();
        
        // Display the view
        return parent::display($tpl);
    }
}