<?php
 /*
 * @package		TF Mail Component
 * @license		GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;

use Joomla\CMS\Language\Text;
use TechFry\Library\View\JForm\TfFieldset;
?>

<?php $this->start_form_layout(); ?>

    <?php 
		$fieldsets = $this->form->getFieldsets();
		unset($fieldsets['details'], $fieldsets['captcha']);

		$fieldset_names = array_keys($fieldsets);

		$i = 0;
		$this->tabs = array();

		foreach ($fieldsets as $fieldset)
        {
          	$this->tabs[$i][0] = Text::_($fieldset->label);
          
          	$fields = $this->form->getFieldset($fieldset->name);
          	$this->tabs[$i][1] = TfFieldset::get_output($fieldset, $fields, $this->framework, array('show_label' => true));
        	$i++;  
        }

		echo $this->loadTemplate('layout_' . $this->params->get('form_layout', 'simple'));
    ?>

<?php $this->end_form_layout(); ?>
