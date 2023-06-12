<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library\Field;

defined('_JEXEC') or die;

use Joomla\CMS\Factory;
use Joomla\CMS\Language\Text;
use Joomla\CMS\Form\Field\ListField;

class ListproField extends ListField
{
	protected $type = 'Listpro';
  
  	protected function getLabel()
    {
      	$label = parent::getlabel();
      
      	$label .= ' <i class="fas fa-lock text-danger" title="' . Text::_('TF_PRO_FIELD') . '"></i>';
      
      	return $label;
    }
  
  	protected function getInput()
    { 	
      	$this->__set('disabled', true);
      
		$input = parent::getInput();
      
      	return $input;
    }
}