<?php
 /*
 * @package		TF Mail Component
 * @license		GNU General Public License version 2 or later; see LICENSE.txt
 */

namespace TechFry\Component\TfMail\Administrator\Model;

defined('_JEXEC') or die;

use Joomla\CMS\Factory;
use Joomla\CMS\Table\Table;
use Joomla\CMS\Language\Text;
use TechFry\Component\TfMail\Administrator\Helper\QueueHelper;
use TechFry\Library\Model\Back\TfModelForm;
use TechFry\Library\TfUser;
use TechFry\Component\TfMail\Administrator\Helper\BounceHelper;

class BounceModel extends TfModelForm
{
	public function __construct($config = array())
	{
	    $this->table_name = 'tfm_bounces';
	    
	    parent::__construct($config);
	}
    
// *****************************************************************************

	public function handle()
	{
	    $email = array(
	        'server' => $this->get_param('bounces_server'),
            'port' => $this->get_param('bounces_port'),
            'username' => $this->get_param('bounces_username'),
            'password' => $this->get_param('bounces_password'));
	    
	    $messages = BounceHelper::handle($email);
        
        $msg = '<p>There are <strong>' . $messages . '</strong> messages in your mailbox</p>';
        $msg .= '<a href="index.php?option=com_tfmail&task=bounce.read">Click here to handle the messages</a>';
        
        $this->app->enqueueMessage($msg, 'success');
        
        return $messages;
	}
	
	public function read()
	{
	    $email = array(
	        'server' => $this->get_param('bounces_server'),
            'port' => $this->get_param('bounces_port'),
            'username' => $this->get_param('bounces_username'),
            'password' => $this->get_param('bounces_password'));
            
        $count = BounceHelper::read($email, $this->get_param('bounces_limit', 5));
        
        $msg = '<p>' . $count['total_messages'] . ' messages processed. ' . $count['total_bounces'] . ' emails found. ' . $count['total_users'] . ' users unpublished.</p>';
        
        $this->app->enqueueMessage($msg);
        
        return $count;
	}
    
    // 04. Delete emails from queue
    public function deletefromq($email)
    {
        $email = str_replace(array("\n", "\t", "\r"), '', $email);
        
        // Find user id from user email
        $user_id = TfUser::find_user($email);
        
        if ($user_id)
        {
            QueueHelper::delete_q($user_id);
        }
    }
}