<?php
 /*
 * @package		TF Mail Component
 * @license		GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;

use Joomla\CMS\Factory;
use TechFry\Component\TfMail\Administrator\Helper\UserfilterHelper;

$filter = $this->item->filter['filter'];
$filterusers = $this->item->filter['filterusers'];
$filterstats = $this->item->filter['filterstats'];
$filterstats_aggr = $this->item->filter['filterstats_aggr'];

$users = UserfilterHelper::filter_users($filter, $filterusers, $filterstats, $filterstats_aggr, true);

$this->get_alert('Displaying first 100 users to which email will be sent.');
$i = 1;
?>
<table class="table table-hover">
    <tr>
        <th>User ID</th>
        <th>Name</th>
        <th>Email</th>
    </tr>
<?php
foreach ($users as $user)
{
    $user_obj = Factory::getUser($user);
    echo '<tr>';
        echo '<td>' . $user_obj->id . '</td>';
        echo '<td>' . $user_obj->name . '</td>';
        echo '<td>' . $user_obj->email . '</td>';
    echo '</tr>';
    
    $i++;
    if ($i > 100)
    {
        break;
    }
}
?>
</table>