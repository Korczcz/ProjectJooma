<?php
 /*
 * @package		TF Mail Component
 * @license		GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;

use Joomla\CMS\Router\Route;

if (!empty($this->items))
{
  foreach ($this->items as $i => $row)
  {
    $link = Route::_('index.php?option=com_tfmail&view=bounce&layout=edit&id=' . $row->id);
    
    $this->tbody[] = array(
      $this->get_link($link, $row->subject),
                    
      $row->bounce_email,

      $row->emailDate
      );
  }
}

$this->display_list_layout();
?>