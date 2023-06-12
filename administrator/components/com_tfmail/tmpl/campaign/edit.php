<?php
 /*
 * @package		TF Mail Component
 * @license		GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;

$this->main_fields = array('title');
?>

<?php $this->start_form_layout(); ?>

    <?php $this->add_tab_forms(array('description', 'options'), 'COM_TFMAIL_CAMPAIGN'); ?>
    
    <?php $this->add_tab_form('mails', 'COM_TFMAIL_MAILS'); ?>
    
    <?php $this->add_tab_form('filterusers', 'COM_TFMAIL_USERS'); ?>
    
    <?php $this->add_tab_form('sending', 'COM_TFMAIL_SENDING_OPTIONS'); ?>
    
    <?php $this->add_tab_form('details', 'JDETAILS'); ?>
    
    <?php $this->add_tab_tmpl('subscribers', 'COM_TFMAIL_SUBSCRIBERS'); ?>
    
    <?php $this->add_tab_tmpl('info', 'INFO'); ?>

<?php $this->end_form_layout(); ?>