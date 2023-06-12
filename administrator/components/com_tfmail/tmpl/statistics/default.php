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
    $linkm = Route::_('index.php?option=com_tfmail&view=mail&layout=edit&id=' . $row->mail_id);
    $link_id = ($row->type == 'click') ? 'Link Id: ' . $row->link_id : '';
    
    $this->tbody[] = array(
      $row->type . $this->get_small($this->get_date($row->send_date) . $link_id),
                    
      $this->get_link($linkm, $row->title) . $this->get_small('Mail ID: ' . $row->mail_id),

      $this->get_link($linku, $row->email) . $this->get_small('User ID: ' . $row->user_id),

      $this->get_number($row->opens) . $this->get_small($this->get_date($row->open_date)),

      $this->get_number($row->clicks) . $this->get_small($this->get_date($row->click_date))
      );
  }
}

$this->display_list_layout();
?>