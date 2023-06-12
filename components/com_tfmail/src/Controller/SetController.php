<?php
 /*
 * @package		TF Mail Component
 * @license		GNU General Public License version 2 or later; see LICENSE.txt
 */

namespace TechFry\Component\TfMail\Site\Controller;

defined('_JEXEC') or die;

use Joomla\CMS\Application\ApplicationHelper;
use Joomla\CMS\Factory;
use Joomla\CMS\MVC\Controller\BaseController;
use Joomla\CMS\User\User;
use Joomla\CMS\User\UserHelper;
use Joomla\CMS\Router\Route;
use TechFry\Library\TfUser;

class SetController extends BaseController
{
    // 01.
    public function reset_pass()
    {
        $userid = $this->input->get('id', 0, 'INT');
        $otpkey = $this->input->get('otpkey', '0', 'INT');
        
        $check_user = TfUser::check_otp($userid, $otpkey);
        
        if ($check_user == false)
        {
            $this->setMessage('<strong>' . Text::_('COM_TFMAIL_ERROR_NO_SUBSCRIBER') . '</strong>', 'error');

            return false;
        }
        
        // Step 1: Generate activation token
        $user = User::getInstance($userid);
        
        $token = ApplicationHelper::getHash(UserHelper::genRandomPassword());
		$hashedToken = UserHelper::hashPassword($token);

		$user->activation = $hashedToken;
		
		$user->save(true);
		
		// Step 2 - Push the user data into the session
		$app = Factory::getApplication();
		$app->setUserState('com_users.reset.token', $user->activation);
		$app->setUserState('com_users.reset.user', $userid);
		
		// Step 3: Redirect to complete form layout
		$this->setRedirect(Route::_('https://joomla.techfry.com/en/login?view=reset&layout=complete', false));

		return true;
    }
}