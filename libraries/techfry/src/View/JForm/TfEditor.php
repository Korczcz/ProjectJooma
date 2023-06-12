<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library\View\JForm;

defined('_JEXEC') or die;

use Joomla\CMS\Factory;
use Joomla\CMS\Editor\Editor;
use Joomla\CMS\Language\Text;

class TfEditor
{  
  	public static function get_output($field, $fw = 'bs')
    {      
      	$editor = Editor::getInstance(Factory::getConfig()->get('editor'));

      	// $name, $html, $width, $height, $col, $row, $buttons = true, $id = null, $asset = null, $author = null, $params = []
      	$output = $editor->display($field->name, $field->value, '', '', '', '', false);
      	
      	return $output;
    }
}