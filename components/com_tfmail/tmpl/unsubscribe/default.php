<?php
 /*
 * @package		TF Mail Component
 * @license		GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;

use TechFry\Library\View\JForm\TfFieldset;

$this->start_page_layout();

$this->start_form_layout();

$fieldsets = $this->form->getFieldsets();
$fields = $this->form->getFieldset('general');

echo TfFieldset::get_output($fieldsets['general'], $fields, $this->framework, array('show_label' => true));

$this->end_form_layout();

$this->end_page_layout();
?>