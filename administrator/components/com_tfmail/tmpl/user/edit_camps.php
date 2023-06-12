<?php
 /*
 * @package		TF Mail Component
 * @license		GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;

use Joomla\CMS\Factory;
use Joomla\CMS\Language\Text;

$camps = $this->getModel()->get_user_camps($this->item->id);
?>
<?php if (empty($camps)) : ?>
    <?php $this->get_alert(Text::_('JGLOBAL_NO_MATCHING_RESULTS')); ?>
<?php else : ?>

<table class="table table-striped table-hover">
    <thead>
        <tr>
            <th>#</th>
            <th>Campaign (ID)</th>
            <th>Joined</th>
        </tr>
    </thead>
    <?php if (!empty($camps)) : ?>
    <?php foreach ($camps as $i => $camp) : ?>
        <?php $created = Factory::getDate($camp->created)->format('d M Y H:i'); ?>
        <tr>
            <td><?php echo $i; ?></td>
            <td><?php echo $camp->title . ' (' . $camp->camp_id . ')'; ?></td>
            <td><?php echo $created; ?></td>
        </tr>
    <?php endforeach; ?>
    <?php endif; ?>
</table>

<?php endif; ?>