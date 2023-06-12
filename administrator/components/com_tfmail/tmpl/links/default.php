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
    $link = Route::_('index.php?option=com_tfmail&view=link&layout=edit&id=' . $row->id);
    
    $clicks = $this->getModel()->count_clicks($row->id);
    $note = empty($row->note) ? '' : '<strong>Note:</strong> ' . $row->note;
    
    $this->tbody[] = array(
      $this->get_link($link, $row->title) . $this->get_small($row->link_url) . $this->get_small($note),
                    
      $row->campaign_title,

      $this->get_number($clicks, 'success')
      );
  }
}

$this->display_list_layout();
?>