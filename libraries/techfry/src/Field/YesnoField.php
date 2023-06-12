<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library\Field;

defined('_JEXEC') or die;

use Joomla\CMS\Factory;
use Joomla\CMS\Language\Text;
use Joomla\CMS\Form\Field\RadioField;

class YesnoField extends RadioField
{
	protected $type = 'Yesno';
  
  	protected $layout = 'joomla.form.field.radio.switcher';

	protected function getOptions()
    {
      	$option1 = new \stdClass();
      	$option1->text = Text::_('JNO');
      	$option1->value = 0;
      
      	$option2 = new \stdClass();
      	$option2->text = Text::_('JYES');
      	$option2->value = 1;
      
      	$array = array($option1, $option2);
      
      	$options = array_merge(parent::getOptions(), $array);
        
      	return $options;
    }
}