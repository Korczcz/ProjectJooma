<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library;

defined('_JEXEC') or die;

use Joomla\CMS\HTML\HTMLHelper;
use Joomla\CMS\Language\Text;

// Script for Modal Popup

class TfModal
{
    public static function render_select_modal($modal_id, $url)
    {
        $html = HTMLHelper::_('bootstrap.renderModal', 'ModalSelect' . $modal_id,
			array(
				'title' => Text::_('COM_TF_SELECT'),
				'url' => $url,
				'height' => '400px',
				'width' => '800px',
				'bodyHeight' => '70',
				'modalWidth' => '80',
				'footer' => '<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">' . Text::_('JLIB_HTML_BEHAVIOR_CLOSE') . '</button>',
			)
		);
        
        return $html;
    }
    
    public static function select_button($value, $id, $modal_id)
    {
        $html = '<button class="btn btn-primary' . ($value ? ' hidden' : '') . '"'
				. ' id="' . $id . '_select"'
				. ' data-bs-toggle="modal"'
				. ' type="button"'
				. ' data-bs-target="#ModalSelect' . $modal_id . '">'
				. '<span class="icon-file" aria-hidden="true"></span> ' . Text::_('JSELECT')
				. '</button>';
        
        return $html;
    }
    
    public static function clear_button($value, $id)
    {
        $html = '<button class="btn btn-danger' . ($value ? '' : ' hidden') . '"'
				. ' id="' . $id . '_clear"'
				. ' type="button"'
				. ' onclick="window.processModalParent(\'' . $id . '\'); return false;">'
				. '<span class="icon-times" aria-hidden="true"></span> ' . Text::_('JCLEAR')
				. '</button>';
        
        return $html;
    }
}