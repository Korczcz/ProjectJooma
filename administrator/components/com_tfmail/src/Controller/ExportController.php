<?php
 /*
 * @package		TF Mail Component
 * @license		GNU General Public License version 2 or later; see LICENSE.txt
 */

namespace TechFry\Component\TfMail\Administrator\Controller;

defined('_JEXEC') or die;

use TechFry\Library\Controller\TfControllerExport;
use TechFry\Component\TfMail\Administrator\Helper\UserfilterHelper;

class ExportController extends TfControllerExport
{
    // Override method to include filters based on statistics and aggregate statistics
    public function filter_users()
    {
        $users = UserfilterHelper::filter_users($this->info['filter'], $this->info['filterusers'], $this->info['filterstats'], $this->info['filterstats_aggr']);
        
        return $users;
    }
}