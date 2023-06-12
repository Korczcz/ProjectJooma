<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library\Field;

defined('_JEXEC') or die;

use Joomla\CMS\Factory;
use Joomla\CMS\Language\Text;
use Joomla\CMS\Form\Field\NoteField;

class HelpField extends NoteField
{
	protected $type = 'Help';

  	protected function getLabel()
    {
        $html  = [];

      	$class = ' class="alert alert-info"';
        $url = (string) $this->element['url'];
        $html[] = '<span class="icon-question" aria-hidden="true"></span> ';
        $html[] = !empty($url) ? '<strong><a href="' . $url . '"target="_blank">' . Text::_('JHELP') . '</a></strong>' : '';
      
        return '</div><div ' . $class . '>' . implode('', $html);
    }
}