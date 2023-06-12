<?php
 /*
 * @package		TF Mail Component
 * @license		GNU General Public License version 2 or later; see LICENSE.txt
 */

namespace TechFry\Component\TfMail\Administrator\Controller;

defined('_JEXEC') or die;

use Joomla\CMS\Factory;
use Joomla\CMS\Router\Route;
use TechFry\Library\Controller\TfControllerForm;

class CampaignController extends TfControllerForm
{
    // 01. Add campaign mails to queue
    public function add2queue()
    {
        $camp_id = $this->input->getInt('id');
        
        $model = $this->getModel('Campaign');
        
        $model->add2queue($camp_id);
        
        $this->setMessage('Campaign emails added to the queue');
        
        $this->setRedirect(Route::_('index.php?option=' . $this->option . '&view=campaigns', false));
    }
    
    // 02. Delete subscriptions for a campaign
    public function deletesubs()
    {
        $camp_id = $this->input->getInt('campid');
        
        $model = $this->getModel('Campaign');
        $model->deletesubs($camp_id);
        
        $this->setMessage('Subscriptions deleted.');

        $this->setRedirect(Route::_('index.php?option=' . $this->option . '&view=campaign&layout=edit&id=' . $camp_id, false));
    }
}