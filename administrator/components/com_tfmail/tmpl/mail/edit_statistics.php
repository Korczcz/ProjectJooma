<?php
 /*
 * @package		TF Mail Component
 * @license		GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;

use TechFry\Component\TfMail\Administrator\Helper\UserfilterHelper;

$filter = $this->item->filter['filter'];
$filterusers = $this->item->filter['filterusers'];
$filterstats = $this->item->filter['filterstats'];
$filterstats_aggr = $this->item->filter['filterstats_aggr'];

$users = UserfilterHelper::filter_users($filter, $filterusers, $filterstats, $filterstats_aggr, true);

$this->get_alert('<strong>The newsletter will be sent to ' . count($users) . ' users.</strong>');
?>