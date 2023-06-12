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
    $linkd = Route::_('index.php?option=com_tfmail&task=queue.deletefromq&mail_id=' . $row->mail_id . '&user_id=' . $row->user_id);
    
    $this->tbody[] = array(
      $row->mail_id,
                        
      $this->get_link($linkm, $row->title),

      $row->user_id,

      $this->get_link($linku, $row->email),

      $this->get_date($row->send_date),

      $row->priority,

      $this->get_button($linkd, 'COM_TFMAIL_DELETE', 'warning')
      );
  }
}

$this->display_list_layout();
?>