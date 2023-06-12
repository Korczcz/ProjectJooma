<?php
 /*
 * @package		TF Mail Component
 * @license		GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;

use Joomla\CMS\Language\Text;
use Joomla\CMS\Router\Route;
use TechFry\Library\TfDb;

if (!empty($this->items))
{
  foreach ($this->items as $i => $row)
  {
    $link = Route::_('index.php?option=com_tfmail&view=mail&layout=edit&id=' . $row->id);
            
    $queue = $this->getModel()->count_items('tfm_queue', 'mail_id', $row->id);

    $sent = $this->getModel()->count_sent($row->id);

    $opens = $this->getModel()->count_opens($row->id);

    $clicks = $this->getModel()->count_clicks($row->id);

    $per = $sent ? floor(($opens*100)/$sent) . '%' : '-';

    $filters = json_decode($row->filter, true);

    $row_filters = '';
    if (!empty($filters['filter']))
    {
      foreach ($filters['filter'] as $filter)
      {
        $row_filters .= $filter['where_field'] . ' ' . $filter['where_operator'] . ' ' . $filter['where_value'] . '<br>';
      }
    }
    if (!empty($filters['filterusers']))
    {
      foreach ($filters['filterusers'] as $filter)
      {
        if ($filter['where_field'] != 'group_id')
        {
          $field = TfDb::get_item('fields', $filter['where_field']);
          $filter['where_field'] = $field->name;
        }
        $row_filters .= $filter['where_field'] . ' ' . $filter['where_operator'] . ' ' . $filter['where_value'] . '<br>';
      }
    }
    if (!empty($filters['filterstats']))
    {
      foreach ($filters['filterstats'] as $filter)
      {
        $row_filters .= $filter['stat_type'] . ' ' . $filter['where_operator'] . ' ' . $filter['where_value'] . '<br>';
      }
    }

    $freq = $row->mail_type == 'automation' ? Text::_('COM_TFMAIL_FREQUENCY') . ': ' . $row->frequency : '';
    
    $this->tbody[] = array(
      $this->get_link($link, $row->title) . $this->get_small($row_filters),
                    
      $row->mail_type . $this->get_small($freq),

      '<small>' . $this->get_date($row->send_date) . '</small>',

      $this->get_binary($row->schedule),

      $this->get_number($queue, 'danger') . ' ' . $this->get_number($sent, 'warning') . ' ' . $this->get_number($opens, 'info') . ' ' . $this->get_number($clicks, 'success'),

      $per
      );
  }
}

$this->display_list_layout();
?>