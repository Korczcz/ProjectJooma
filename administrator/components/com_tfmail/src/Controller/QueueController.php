<?php
 /*
 * @package		TF Mail Component
 * @license		GNU General Public License version 2 or later; see LICENSE.txt
 */

namespace TechFry\Component\TfMail\Administrator\Controller;

defined('_JEXEC') or die;

use Joomla\CMS\Factory;
use Joomla\CMS\Language\Text;
use Joomla\CMS\Router\Route;
use TechFry\Library\Controller\TfControllerAdmin;

class QueueController extends TfControllerAdmin
{
    public function getModel($name = 'Queue', $prefix = 'Administrator', $config = array('ignore_request' => true))
    {
        $model = parent::getModel($name, $prefix, $config);

        return $model;
    }
    
// *****************************************************************************    
    
    // 01.
    public function process()
    {
        $this->checkToken();
        
        $model = $this->getModel('Queue');
        
        $count = $model->process();
        
        if ($count['suc'] == 0 && $count['err'] == 0)
        {
            $this->setMessage(Text::_('COM_TFMAIL_MESSAGE_NO_NEWSLETTER'), 'warning');
        }
        else
        {
            $this->setMessage($count['suc'] . ' emails sent successfully. ' . $count['err'] . ' errors in sending email.');
        }
        
        $this->setRedirect(Route::_('index.php?option=' . $this->option . '&view=' . $this->view_list, false));
    }
    
    // 02. 
    public function deletefromq()
    {   
        $mail_id = $this->input->getInt('mail_id');
        $user_id = $this->input->getInt('user_id');
        
        $model = $this->getModel();
        
        $model->delete_q($user_id, $mail_id);
        
        $this->setMessage('Message from queue deleted for user ID ' . $user_id . ' and mail ID ' . $mail_id);
        
        $this->setRedirect(Route::_('index.php?option=' . $this->option . '&view=' . $this->view_list, false));
    }
}