<?php
 /*
 * @package		TF Mail Component
 * @license		GNU General Public License version 2 or later; see LICENSE.txt
 */

namespace TechFry\Component\TfMail\Site\Controller;

defined('_JEXEC') or die;

use TechFry\Library\Controller\TfControllerAuto;
use TechFry\Component\TfMail\Administrator\Helper\AutoHelper;

class AutoController extends TfControllerAuto
{
    public function crontask()
    {
        AutoHelper::process_tasks();
      
      	return true;
    }
}