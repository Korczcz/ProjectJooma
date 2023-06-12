<?php
 /*
 * @package		TF Mail Component
 * @license		GNU General Public License version 2 or later; see LICENSE.txt
 */

namespace TechFry\Component\TfMail\Administrator\Controller;

defined('_JEXEC') or die;

use Joomla\CMS\Router\Route;
use TechFry\Library\Controller\TfControllerForm;

class BounceController extends TfControllerForm
{
    // 01. 
    public function handle()
    {
        $model = $this->getModel();
        
        $model->handle();
        
        $this->setRedirect(Route::_('index.php?option=' . $this->option . '&view=' . $this->view_list, false));
    }
    
    // 02. 
    public function read()
    {
        $model = $this->getModel();
        
        $model->read();
        
        $this->setRedirect(Route::_('index.php?option=' . $this->option . '&task=bounce.handle', false));
    }
}