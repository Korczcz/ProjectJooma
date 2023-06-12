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
use TechFry\Component\TfMail\Administrator\Helper\SubscriberHelper;

class UserController extends TfControllerForm
{
    // Delete email from queue for a user
  	public function deletefromq()
    {
        $user_id = $this->input->getInt('id');
        
        $qModel = $this->getModel('queue');
        
        $qModel->delete_q($user_id);
        
        $this->setMessage('All messages deleted from queue for user ID ' . $user_id);
        
        $this->setRedirect(Route::_('index.php?option=' . $this->option . '&view=' . $this->view_list, false));
    }
  	
  	// 02. Resubscribe unsubscribed user
  	public function resubscribe()
    {
        $user_id = $this->input->getInt('id');
        
        SubscriberHelper::resubscribe($user_id);
        
        $this->setMessage('The user with ID ' . $user_id . ' is subscribed successfully.');
        
        $this->setRedirect(Route::_('index.php?option=' . $this->option . '&view=' . $this->view_list, false));
    }
}