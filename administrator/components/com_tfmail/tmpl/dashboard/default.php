<?php
 /*
 * @package		TF Mail Component
 * @license		GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;

$this->tiles_table = array(
    array('users', 'users', 'users'),
    array('mails', 'tfm_mail', 'envelope'),
    array('campaigns', 'tfm_campaign', 'envelope-open-text'),
  	array('subscribers', 'tfm_campsub', 'user-check'),
    array('links', 'tfm_links', 'link'),
    array('bounces', 'tfm_bounces', 'sync'),
    array('queue', 'tfm_queue', 'clock'),
    array('statistics', 'tfm_statistics', 'chart-bar')
    );
                        
$this->doc_link = 'https://www.techfry.com/docs/tf-mail';

$this->review_link = 'https://extensions.joomla.org/extension/tf-mail/';
?>

<?php $this->start_dashboard_layout(); ?>
    
<?php $this->end_dashboard_layout(); ?>