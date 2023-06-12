<?php
 /*
 * @package		TF Mail Component
 * @license		GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;

use Joomla\CMS\Language\Text;
use Joomla\CMS\Router\Route;
use TechFry\Component\TfMail\Administrator\Helper\SubscriberHelper;

if (!empty($this->items))
{
  foreach ($this->items as $i => $row)
  {
    $link = Route::_('index.php?option=com_tfmail&view=user&layout=edit&id=' . $row->id);
        
    $queue = $this->getModel()->count_items('tfm_queue', 'user_id', $row->id);
    $sent = $this->getModel()->count_sent($row->id);
    $opens = $this->getModel()->count_opens($row->id);
    $clicks = $this->getModel()->count_clicks($row->id);

    $per = $sent ? floor(($opens*100)/$sent) . '%' : '-';

    $last_open = $this->getModel()->get_last_open($row->id);

    $inq = $this->getModel()->count_items('tfm_queue', 'user_id', $row->id);

    $label = '';
    $actions = '';
    $subscribed = SubscriberHelper::subscriber($row->id);
    if (!$subscribed)
    {
      $label = '<br>' . $this->get_label('Unsubscribed', 'bg-warning');
      $link_r = Route::_('index.php?option=com_tfmail&task=user.resubscribe&id=' . $row->id);
      $actions = $this->get_button($link_r, 'COM_TFMAIL_SUBSCRIBE', 'info');
    }

    $linkd = ($inq > 0) ? Route::_('index.php?option=com_tfmail&task=user.deletefromq&id=' . $row->id) : '';
    $actions .= $inq ? $this->get_button($linkd, 'COM_TFMAIL_EMPTY_QUEUE', 'danger') : '';
    
    $this->tbody[] = array(
      $this->get_binary(!$row->block),
            
      $this->get_link($link, $row->email) . $label,

      '<small>' . $this->get_date($row->registerDate) . '</small>',

      '<small>' . $this->get_date($row->lastVisitDate)  . '</small>',

      '<small>' . $this->get_date($last_open)  . '</small>',

      $this->get_number($queue, 'danger') . ' ' . $this->get_number($sent, 'warning') . ' ' . $this->get_number($opens, 'info') . ' ' . $this->get_number($clicks, 'success'),

      $per,

      $actions
      );
  }
}

$this->display_list_layout();
?>