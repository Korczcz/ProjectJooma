<?php
 /*
 * @package		TF Mail Component
 * @license		GNU General Public License version 2 or later; see LICENSE.txt
 */

namespace TechFry\Component\TfMail\Administrator\Controller;

defined('_JEXEC') or die;

use Joomla\CMS\Language\Text;
use Joomla\CMS\Router\Route;
use TechFry\Library\Controller\TfControllerAdmin;

class MailsController extends TfControllerAdmin
{
    public function getModel($name = 'Mail', $prefix = 'Administrator', $config = array('ignore_request' => true))
    {
        $model = parent::getModel($name, $prefix, $config);

        return $model;
    }
    
// *****************************************************************************    
    
    // 01. Add newsletters to the queue
    public function process()
    {
        $this->checkToken();
        
        $model = $this->getModel('mails');
        
        $result = $model->process();
        
        if ($result == false)
        {
            $this->setMessage(Text::_('COM_TFMAIL_MESSAGE_NO_NEWSLETTER'), 'warning');
        }
        else
        {
            $this->setMessage($result . ' ' . Text::_('COM_TFMAIL_MESSAGE_EMAILS_QUEUE'));
        }
        
        $this->setRedirect(Route::_('index.php?option=' . $this->option . '&view=' . $this->view_list, false));
    }
}