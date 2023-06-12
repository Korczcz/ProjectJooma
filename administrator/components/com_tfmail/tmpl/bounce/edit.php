<?php
 /*
 * @package		TF Mail Component
 * @license		GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;
?>

<?php $this->start_form_layout(); ?>

    <?php $this->add_tab_forms(array('general', 'options'), 'COM_TFMAIL_TEXT_MESSAGE'); ?>

    <?php $this->add_tab_form('message', 'COM_TFMAIL_HTML_MESSAGE'); ?>
    
    <?php $this->add_tab_form('details', 'JDETAILS'); ?>

<?php $this->end_form_layout(); ?>