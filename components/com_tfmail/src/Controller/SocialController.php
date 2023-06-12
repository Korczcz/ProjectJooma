<?php
 /*
 * @package		TF Mail Component
 * @license		GNU General Public License version 2 or later; see LICENSE.txt
 */

namespace TechFry\Component\TfMail\Site\Controller;

defined('_JEXEC') or die;

use Joomla\CMS\Factory;
use Joomla\CMS\MVC\Controller\BaseController;
use Joomla\CMS\Language\Text;
use Joomla\CMS\Uri\Uri;
use TechFry\Component\TfMail\Administrator\Helper\GoogleHelper;
use TechFry\Component\TfMail\Administrator\Helper\LinkedinHelper;
use TechFry\Component\TfMail\Administrator\Helper\FacebookHelper;
use TechFry\Component\TfMail\Administrator\Helper\GithubHelper;

class SocialController extends BaseController
{
    // 01. Redirect to Google
    public function google()
    {
        $url = GoogleHelper::create_url();
        
        $this->setRedirect($url);
    }
    
    // 02. Redirect to Linkedin
    public function linkedin()
    {
        $url = LinkedinHelper::create_url();
        
        $this->setRedirect($url);
    }
    
    // 03. Redirect to Facebook
    public function facebook()
    {
        $url = FacebookHelper::create_url();
        
        $this->setRedirect($url);
    }
    
    // 04. Redirect to Github
    public function github()
    {
        $url = GithubHelper::create_url();
        
        $this->setRedirect($url);
    }
}