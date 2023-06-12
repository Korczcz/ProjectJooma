<?php
 /*
 * @package		TF Mail Component
 * @license		GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;

use TechFry\Library\View\Air\Accordion;

echo Accordion::get_output($this->tabs, array(), $this->framework);
?>