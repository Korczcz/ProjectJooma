<?php
 /*
 * @package		TF Mail Component
 * @license		GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;

$filter = $this->item->filter['filter'];
$filterusers = $this->item->filter['filterusers'];
$filterstats = $this->item->filter['filterstats'];
$filterstats_aggr = $this->item->filter['filterstats_aggr'];

$users = $this->getModel()->get_users($filter, $filterusers, $filterstats, $filterstats_aggr);

$this->get_alert('<strong>The newsletter will be sent to ' . count($users) . ' users.</strong>', 'success');
?>