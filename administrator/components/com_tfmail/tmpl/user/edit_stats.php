<?php
 /*
 * @package		TF Mail Component
 * @license		GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;

use Joomla\CMS\Factory;
use Joomla\CMS\Language\Text;

$stats = $this->getModel()->get_user_stats($this->item->id);
?>
<?php if (empty($stats)) : ?>
    <?php $this->get_alert(Text::_('JGLOBAL_NO_MATCHING_RESULTS')); ?>
<?php else : ?>

<table class="table table-striped table-hover">
    <thead>
        <tr>
            <th>#</th>
            <th>Title (Mail ID)</th>
            <th>Send Date</th>
            <th>Open Date</th>
            <th>Opens</th>
        </tr>
    </thead>
    <?php if (!empty($stats)) : ?>
    <?php foreach ($stats as $i => $stat) : ?>
        <?php $send_date = Factory::getDate($stat->send_date); ?>
        <?php $open_date = ($stat->open_date != null) ? Factory::getDate($stat->open_date)->format('d M Y H:i') : '' ; ?>
        <tr>
            <td><?php echo $i; ?></td>
            <td><?php echo $stat->title . ' (' . $stat->mail_id . ')'; ?></td>
            <td><?php echo $send_date->format('d M Y H:i'); ?></td>
            <td><?php echo $open_date; ?></td>
            <td><?php echo $stat->opens; ?></td>
        </tr>
    <?php endforeach; ?>
    <?php endif; ?>
</table>

<?php endif; ?>