<?php
 /*
 * @package		TF Mail Component
 * @license		GNU General Public License version 2 or later; see LICENSE.txt
 */

namespace TechFry\Component\TfMail\Site\Controller;

defined('_JEXEC') or die;

use Joomla\CMS\Factory;
use Joomla\CMS\Language\Text;
use Joomla\CMS\Uri\Uri;
use TechFry\Library\Controller\TfControllerFormFront;
use TechFry\Component\TfMail\Administrator\Helper\GoogleHelper;
use TechFry\Component\TfMail\Administrator\Helper\LinkedinHelper;
use TechFry\Component\TfMail\Administrator\Helper\FacebookHelper;
use TechFry\Component\TfMail\Administrator\Helper\GithubHelper;
use TechFry\Library\TfUser;

class SubscribeController extends TfControllerFormFront
{
    // 01. Save function when AMP form is submitted
    public function saveamp($key = null, $urlVar = null)
    {
        // Check for request forgeries
		JSession::checkToken() or jexit(Text::_('JINVALID_TOKEN'));
        
		$app = Factory::getApplication();
		$input = $app->input;
		
		$model = $this->getModel();
		
		$currentUri = (string) Uri::getInstance(); // Action attribute of form
		
		// Get the data from the HTTP POST request
		$data  = $input->get('jform', array(), 'array');
		
		$context = $this->option . 'edit' . $this->context;
		
		if (!$model->save($data))
		{
		    // Save the data in the session
			$app->setUserState($context . '.data', $data);

			$this->setMessage(Text::sprintf('JLIB_APPLICATION_ERROR_SAVE_FAILED', $model->getError()), 'error');
			
            $domain_url = (isset($_SERVER['HTTPS']) ? "https" : "http") . "://$_SERVER[HTTP_HOST]";
            header("Content-type: application/json");
            header("AMP-Access-Control-Allow-Source-Origin: " . $domain_url);
            header("Access-Control-Expose-Headers: AMP-Access-Control-Allow-Source-Origin");
        
            $amp_json = json_encode(array('message' => strip_tags($this->getError()), 'type' => 'warning'));
            echo $amp_json;
            exit;
		}
		
		// Clear the data in the form
		$app->setUserState($context . '.data', null);
		
		// Post Save Method
		$this->post_save($data);
		
		$custom_message  = isset($data['custom_message']) ? $data['custom_message'] : Text::_('COM_TFMAIL_SUBSCRIBE_SUCCESSFUL');
		$custom_redirect  = isset($data['custom_redirect']) ? $data['custom_redirect'] : $currentUri;

	    $domain_url = (isset($_SERVER['HTTPS']) ? "https" : "http") . "://$_SERVER[HTTP_HOST]";
        header("Content-type: application/json");
        header("AMP-Access-Control-Allow-Source-Origin: " . $domain_url);
        header("Access-Control-Expose-Headers: AMP-Access-Control-Allow-Source-Origin");
        
        $amp_json = json_encode(array('message' => $custom_message, 'type' => 'success'));
        echo $amp_json;
        exit;
    }
    
    // Subscription through Google
    public function google()
    {
        $code = $this->input->get('code', '', 'RAW');
        
        // Exchange code for access token
        $access_token = GoogleHelper::get_token($code);
        
        // Get user info
        $info = GoogleHelper::get_info($access_token);
        
        $this->social_save($info);
        
        $model = $this->getModel();
        $redirect_url = $model->get_param('redirect_url', Uri::base());
        
        $this->setRedirect($redirect_url);
    }
    
    // Subscription through Linkedin
    public function linkedin()
    {
        $code = $this->input->get('code', '', 'RAW');
        
        // Exchange code for access token
        $access_token = LinkedinHelper::get_token($code);
        
        // Get user info
        $info = LinkedinHelper::get_info($access_token);
        
        $this->social_save($info);
        
        $model = $this->getModel();
        $redirect_url = $model->get_param('redirect_url', Uri::base());
        
        $this->setRedirect($redirect_url);
    }
    
    // Subscription through Facebook
    public function facebook()
    {
        $code = $this->input->get('code', '', 'RAW');
        
        // Exchange code for access token
        $access_token = FacebookHelper::get_token($code);
        
        // Get user info
        $info = FacebookHelper::get_info($access_token);
        
        $this->social_save($info);
        
        $model = $this->getModel();
        $redirect_url = $model->get_param('redirect_url', Uri::base());
        
        $this->setRedirect($redirect_url);
    }
    
    // Subscription through Github
    public function github()
    {
        $code = $this->input->get('code', '', 'RAW');
        
        // Exchange code for access token
        $access_token = GithubHelper::get_token($code);
        
        // Get user info
        $info = GithubHelper::get_info($access_token);
        
        $this->social_save($info);
        
        $model = $this->getModel();
        $redirect_url = $model->get_param('redirect_url', Uri::base());
        
        $this->setRedirect($redirect_url);
    }
    
    // Save and login user from social profie
    public function social_save($info)
    {
        $user_id = TfUser::find_user($info['email']);
        if (!$user_id)
        {
            $juser = TfUser::create_user($info);
            if (empty($juser->id))
            {
                Factory::getApplication()->enqueueMessage('<strong>' . Text::_('COM_TFMAIL_ERROR_SUBSCRIBER_NOT_SAVED') . '</strong>', 'error');
               
                return false;
            }
            
            $user_id = $juser->id;
        }
        
        TfUser::login_user($user_id);
        
        Factory::getApplication()->enqueueMessage('<strong>You have successfully logged in.</strong>', 'success');
    }
}