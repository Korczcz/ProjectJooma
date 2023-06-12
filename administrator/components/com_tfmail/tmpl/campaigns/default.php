<?php
 /*
 * @package		TF Mail Component
 * @license		GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;

use Joomla\CMS\Router\Route;
use TechFry\Library\TfDb;

if (!empty($this->items))
{
  foreach ($this->items as $i => $row)
  {
    $link = Route::_('index.php?option=com_tfmail&view=campaign&layout=edit&id=' . $row->id); 
        
    $mails = json_decode($row->mails, true);
    $newsletters = (is_array($mails)) ? count($mails) : 0;

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

    $total_users = $this->getModel()->count_items('tfm_campsub', 'camp_id', $row->id);
    
    $this->tbody[] = array(
      $this->get_link($link, $row->title),
                    
      $this->get_number($newsletters, 'info'),

      $row_filters,

      $this->get_binary($row->onregister),

      $this->get_binary($row->onmodify),

      $this->get_number($total_users)
      );
  }
}

$this->display_list_layout();
?>