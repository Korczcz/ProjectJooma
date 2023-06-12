<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library\Controller;

defined('_JEXEC') or die;

use Joomla\CMS\MVC\Controller\BaseController;
use Joomla\CMS\Application\CMSApplication;
use Joomla\CMS\MVC\Factory\MVCFactoryInterface;
use Joomla\Input\Input;
use Joomla\CMS\Factory;
use Joomla\CMS\Response\JsonResponse;
use Joomla\CMS\Router\Route;
use Joomla\CMS\Component\ComponentHelper;

class TfControllerAuto extends BaseController
{
    public $option;
  
  	public $message;
  
  	public $data = array();
  
  	public $is_error = false;
    
    public function __construct($config = array(), MVCFactoryInterface $factory = null, ?CMSApplication $app = null, ?Input $input = null)
	{
	    parent::__construct($config, $factory, $app, $input);
	    
        $this->option = $this->input->get('option');
	}
  
  	public function cron()
    {
      	// Check for token
      	$save_token = ComponentHelper::getParams($this->option)->get('cron_token', '');
      	if ($save_token)
        {
        	$get_token = $this->input->get('token', '');
          	if ($save_token != $get_token)
            {
            	echo new JsonResponse(null, 'Cron Token Mismatch', true);
              	return;
            }
        }
      
        if (!$this->crontask())
        {
        	$this->is_error = true;  
        }
      
      	$response = new JsonResponse($this->data, $this->message, $this->is_error);
      
        echo $response;
      
      	// $this->setRedirect('index.php?option=' . $this->option . '&task=auto.complete&format=json');
    }
  	
  	// Method to be implemented by child classes
  	public function crontask()
    {
    	
      	return true;  
    }
}