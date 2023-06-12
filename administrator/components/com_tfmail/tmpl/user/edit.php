<?php
 /*
 * @package		TF Mail Component
 * @license		GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;

$this->main_fields = array('email');
?>

<?php $this->start_form_layout(); ?>

    <?php $this->add_tab_forms(array('general', 'groups'), 'COM_TFMAIL_USER', array(6, 6)); ?>
    
    <?php $this->add_tab_tmpl('custom', 'COM_TF_CUSTOM_FIELDS'); ?>
    
    <?php $this->add_tab_form('details', 'JDETAILS'); ?>
    
    <?php $this->add_tab_tmpl('stats', 'COM_TFMAIL_STATISTICS'); ?>
    
    <?php $this->add_tab_tmpl('camps', 'COM_TFMAIL_CAMPAIGNS'); ?>

<?php $this->end_form_layout(); ?>