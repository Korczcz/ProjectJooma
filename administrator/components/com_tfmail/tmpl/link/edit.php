<?php
 /*
 * @package		TF Mail Component
 * @license		GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;

$this->main_fields = array('title');
?>

<?php $this->start_form_layout(); ?>

    <?php $this->add_tab_forms(array('general', 'options'), 'COM_TFMAIL_LINK'); ?>
    
    <?php $this->add_tab_form('details', 'JDETAILS'); ?>
    
<?php $this->end_form_layout(); ?>