<?php
 /*
 * @package		TF Mail Component
 * @license		GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;

use TechFry\Library\View\Air\Plain;

$show_heading = $this->params->get('show_heading', 0);
echo Plain::get_output($this->tabs, array('show_heading' => $show_heading), $this->framework);
?>