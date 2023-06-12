<?php
 /*
 * @package		TF Mail Component
 * @license		GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;

$this->main_fields = array();

$this->email = $this->getModel()->prepare_email($this->item->id);
?>
<p class="lead"><strong><?php echo $this->email['subject']; ?></strong></p>

<?php $this->start_form_layout(); ?>

    <?php $this->add_tab_tmpl('html', 'COM_TFMAIL_HTML_MESSAGE'); ?>
    
    <?php $this->add_tab_tmpl('text', 'COM_TFMAIL_TEXT_MESSAGE'); ?>
    
    <?php $this->add_tab_tmpl('users', 'COM_TFMAIL_USERS'); ?>

<?php $this->end_form_layout(); ?>