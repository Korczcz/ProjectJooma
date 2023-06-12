<?php
 /*
 * @package		TF Mail Component
 * @license		GNU General Public License version 2 or later; see LICENSE.txt
 */

namespace TechFry\Component\TfMail\Administrator\Controller;

defined('_JEXEC') or die;

use TechFry\Library\Controller\TfControllerQuery;

class QueryController extends TfControllerQuery
{
    public function filter_users()
    {
        $usersModel = $this->getModel('Users');
        
        $this->users = $usersModel->filter_users($this->info['filter'], $this->info['filterusers'], $this->info['filterstats'], $this->info['filterstats_aggr']);
    }
}