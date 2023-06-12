<?php
 /*
 * @package		TF Mail Component
 * @license		GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;

use Joomla\CMS\Factory;

$camp_users = $this->getModel()->get_camp_users($this->item->id);
$total_users = (!empty($camp_users)) ? count($camp_users) : 0;
?>
<p class="alert alert-info"><strong>Showing latest <?php echo $total_users; ?> users subscribed to this campaign.</strong></p>
<?php if (!empty($camp_users)) : ?>
<p class="alert alert-warning"><a class="alert-link" href="/administrator/index.php?option=com_tfmail&campid=<?php echo $this->item->id; ?>&task=campaign.deletesubs">Delete all subscriptions in this campaign</a></p>
<table class="table table-striped table-hover">
    <thead>
        <tr>
            <th>#</th>
            <th>Email</th>
            <th>User ID</th>
	        <th>Created</th>
        </tr>
    </thead>
    <tbody>
    <?php foreach ($camp_users as $i => $camp_user) : ?>
        <tr>
            <td><?php echo $i; ?></td>
            <td><?php echo $camp_user->email; ?></td>
            <td><?php echo $camp_user->user_id; ?></td>
            <td><?php echo Factory::getDate($camp_user->created)->format('d M Y H:i'); ?></td>
        </tr>
    <?php endforeach; ?>
    <?php endif; ?>
    </tbody>
</table>