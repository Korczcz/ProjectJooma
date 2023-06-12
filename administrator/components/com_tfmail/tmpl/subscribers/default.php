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
    $linku = Route::_('index.php?option=com_tfmail&view=user&layout=edit&id=' . $row->user_id);
    $label = '';
    $actions = '';
    if (!$row->camp_id)
    {
      $label = $this->get_label('Unsubscribed', 'bg-warning');
      $link_r = Route::_('index.php?option=com_tfmail&task=user.resubscribe&id=' . $row->user_id);
      $actions = $this->get_button($link_r, 'COM_TFMAIL_SUBSCRIBE', 'info');
    }
    
    $this->tbody[] = array(
      $row->title . $label . $this->get_small('Campaign ID: ' . $row->camp_id),
                    
      $this->get_link($linku, $row->email) . $this->get_small('User ID: ' . $row->user_id),

      $actions
      );
  }
}

$this->display_list_layout();
?>