<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library\Controller;

defined('_JEXEC') or die;

use Joomla\CMS\MVC\Controller\AdminController;
use Joomla\CMS\Router\Route;
use TechFry\Library\TfDb;

class TfControllerAdmin extends AdminController
{
    protected $text_prefix = 'COM_TF';
    
    // Empty table after checking existing records
    public function deleteTable()
    {
	    $this->checkToken();
	    
	    $model = $this->getModel();
	    
	    $model->deleteTable($model->table_name);
	    
	    $this->setMessage('Table truncated successfully: ' . $model->table_name);
    	
	    $this->setRedirect(Route::_('index.php?option=' . $this->option . '&view=' . $this->view_list, false));
    }
    
    // Empty table without checking existing records
    public function truncateTable()
    {
	    $this->checkToken();
	    
	    $model = $this->getModel();
	    
	    TfDb::truncate_table($model->table_name);
	    
	    $this->setMessage('Table truncated successfully: ' . $model->table_name);
    	
	    $this->setRedirect(Route::_('index.php?option=' . $this->option . '&view=' . $this->view_list, false));
    }
}