<?php
 /*
 * @package		TF Mail Component
 * @license		GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;

$this->main_fields = array('title');

$type = $this->input->get('type', '');
if ($type)
{
    $this->form->setFieldAttribute('mail_type', 'default', $type);
    $this->form->setFieldAttribute('mail_type', 'readonly', true);
}
?>

<?php $this->start_form_layout(); ?>

    <?php $this->add_tab_forms(array('description', 'options'), 'COM_TFMAIL_MAIL'); ?>
    
    <?php if ($this->item->mail_type != 'campaign' && $type != 'campaign') : ?>
        <?php $this->add_tab_form('filterusers', 'COM_TFMAIL_USERS'); ?>
        
        <?php $this->add_tab_form('sending', 'COM_TFMAIL_SENDING_OPTIONS'); ?>
    <?php endif; ?>
    
    <?php $this->add_tab_form('params', 'COM_TFMAIL_OTHER_OPTIONS'); ?>
    
    <?php $this->add_tab_tmpl('statistics', 'COM_TFMAIL_STATISTICS'); ?>
    
    <?php $this->add_tab_form('details', 'JDETAILS'); ?>
    
<?php $this->end_form_layout(); ?>