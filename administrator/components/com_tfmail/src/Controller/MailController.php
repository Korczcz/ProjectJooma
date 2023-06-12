<?php
 /*
 * @package		TF Mail Component
 * @license		GNU General Public License version 2 or later; see LICENSE.txt
 */

namespace TechFry\Component\TfMail\Administrator\Controller;

defined('_JEXEC') or die;

use Joomla\CMS\Factory;
use Joomla\CMS\Router\Route;
use TechFry\Component\TfMail\Administrator\Helper\SendHelper;
use TechFry\Component\TfMail\Administrator\Helper\QueueHelper;
use TechFry\Library\TfDb;

use TechFry\Library\Controller\TfControllerForm;

class MailController extends TfControllerForm
{
    // 01. Add mail to queue
    public function add2queue()
    {
        $mail_id = $this->input->getInt('id');
        
        $mail = TfDb::get_item('tfm_mail', $mail_id);
        
        if ($mail->published != 1)
        {
            $this->setMessage('Newsletter is not published.', 'warning');
        }
        else
        {
            $count = QueueHelper::add2queue($mail_id);

            $this->setMessage($count . ' emails added to the queue.');
        }
        
        $this->setRedirect(Route::_('index.php?option=' . $this->option . '&view=' . $this->view_list, false));
    }
    
    // 02. Send test mail
    public function testmail()
    {
        $mail_id = $this->input->getInt('id');
        
        $model = $this->getModel();
        
        $user_id = $model->get_param('mail_test_id');
        
        $send = SendHelper::send_mail($mail_id, $user_id);
        
        $user = Factory::getUser($user_id);
        
        if ($send)
        {
            $this->setMessage('Test mail sent to: <strong>' . $user->email . '</strong>');
        }
        else
        {
            $this->setMessage('Error sending test mail');
        }
        
        $this->setRedirect(Route::_('index.php?option=' . $this->option . '&view=mail&layout=edit&id=' . $mail_id, false));
    }
    
    // 03. Redirect to preview layout
    public function preview()
    {
        $this->save();
        
        $mail_id = $this->input->getInt('id');
        
        $this->setMessage('Preview Mode');
        
        $this->setRedirect(Route::_('index.php?option=' . $this->option . '&view=mail&layout=preview&id=' . $mail_id, false));
    }
}