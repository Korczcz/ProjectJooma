<?php
 /*
 * @package		TF Mail Component
 * @license		GNU General Public License version 2 or later; see LICENSE.txt
 */

namespace TechFry\Component\TfMail\Administrator\Model;

defined('_JEXEC') or die;

use Joomla\CMS\Plugin\PluginHelper;
use TechFry\Library\Model\Back\TfModelDashboard;

class DashboardModel extends TfModelDashboard
{
    public function getAlerts()
    {
        $output = array();
        
        $plugin = PluginHelper::isEnabled('user', 'tfmail');
        if (!$plugin)
        {
            $output[] = 'Please install or enable TF Mail Plugin';
        }
        
        return $output;
    }
}