<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library\Field;

defined('_JEXEC') or die;

use Joomla\CMS\Factory;
use Joomla\CMS\Language\Text;
use Joomla\CMS\Form\Field\FileField;

class UploadField extends FileField
{
	protected $type = 'Upload';
  
  	protected function getInput()
    {
    	$input = '';
      
      	if (!empty($this->value))
        {
        	$value = htmlspecialchars($this->value, ENT_QUOTES);
          	$input .= '<input type="hidden" name="' . $this->fieldname . '" value="' . $value . '">';
        }
          
        $input .= parent::getInput();
      	if (!empty($this->value))
        {
        	$input .= '<br><strong>Uploaded File:</strong> ' . $this->value;  
        }
      
      	return $input;
    }
}