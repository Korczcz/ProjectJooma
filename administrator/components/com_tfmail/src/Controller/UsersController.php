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
use Joomla\Utilities\ArrayHelper;
use TechFry\Library\Controller\TfControllerAdmin;
use TechFry\Component\TfMail\Administrator\Helper\StatisticsHelper;
use TechFry\Library\TfUser;

class UsersController extends TfControllerAdmin
{
    public function getModel($name = 'User', $prefix = 'Administrator', $config = array('ignore_request' => true))
    {
        $model = parent::getModel($name, $prefix, $config);

        return $model;
    }
    
    public function publish()
    {
        $this->checkToken();
        
        $input = Factory::getApplication()->input;

        $cid = $this->input->get('cid', array(), 'array');
        $data = array('publish' => 1, 'unpublish' => 0, 'archive' => 2, 'trash' => -2, 'report' => -3);
        $task = $this->getTask();
        $value = ArrayHelper::getValue($data, $task, 0, 'int');

        if (!empty($cid))
        {
            $model = $this->getModel();

            $cid = ArrayHelper::toInteger($cid);

            $model->publish($cid, $value);
 
            $errors = $model->getErrors();
            $ntext = null;

            if ($value === 1)
            {
                if ($errors)
                {
                    Factory::getApplication()->enqueueMessage(Text::plural($this->text_prefix . '_N_ITEMS_FAILED_PUBLISHING', count($cid)), 'error');
                }
                else
                {
                    $ntext = $this->text_prefix . '_N_ITEMS_PUBLISHED';
                }
            }
            elseif ($value === 0)
            {
                $ntext = $this->text_prefix . '_N_ITEMS_UNPUBLISHED';
            }
            elseif ($value === 2)
            {
                $ntext = $this->text_prefix . '_N_ITEMS_ARCHIVED';
            }
            else
            {
                $ntext = $this->text_prefix . '_N_ITEMS_TRASHED';
            }

            if ($ntext !== null)
            {
                $this->setMessage(Text::plural($ntext, count($cid)));
            }
        }

        $this->setRedirect(Route::_('index.php?option=' . $this->option . '&view=' . $this->view_list, false));
    }
    
    public function delete()
	{
		$this->checkToken();
		
		$input = Factory::getApplication()->input;

		$cid = $this->input->get('cid', array(), 'array');

		$model = $this->getModel();

		$cid = ArrayHelper::toInteger($cid);

		if ($model->delete($cid))
		{
			$this->setMessage(Text::plural($this->text_prefix . '_N_ITEMS_DELETED', count($cid)));
		}
		else
		{
			$this->setMessage($model->getError(), 'error');
		}

		$this->setRedirect(Route::_('index.php?option=' . $this->option . '&view=' . $this->view_list, false));
	}
  
  	public function cleanusers()
    {
     	$model = $this->getModel();
      	
      	// Get users by group
      	$group_id = $model->get_param('clean_group', 0);
      	$users = TfUser::get_users_by_group($group_id);
      
      	// Dates
      	$register = $model->get_param('clean_register', 0);
      	if ($register)
        {
        	$users = array_intersect($users, StatisticsHelper::users_date('register', '<', $register));
        }
      
      	$lastvisit = $model->get_param('clean_lastvisit', 0);
      	if ($lastvisit)
        {
        	$users = array_intersect($users, StatisticsHelper::users_date('lastvisit', '<', $lastvisit));
        }
      
      	$senddate = $model->get_param('clean_senddate', 0);
      	if ($senddate)
        {
        	$users = array_intersect($users, StatisticsHelper::users_date('send', '<', $senddate));
        }
      
      	$opendate = $model->get_param('clean_opendate', 0);
      	if ($opendate)
        {
        	$users = array_intersect($users, StatisticsHelper::users_date('open', '<', $opendate));
        }
      	
      	// Aggregate statistics
      	$send = $model->get_param('clean_send', '');
      	if ($send != '')
        {
            $users = array_intersect($users, StatisticsHelper::users_aggregate('send', '>=', $send));
        }
      
      	$opens = $model->get_param('clean_opens', '');
      	if ($opens != '')
        {
        	$users = array_intersect($users, StatisticsHelper::users_aggregate('open', '<=', $opens));
        }
      
      	$clicks = $model->get_param('clean_clicks', '');
      	if ($clicks != '')
        {
        	$users = array_intersect($users, StatisticsHelper::users_aggregate('click', '<=', $clicks));
        }
      	
      	$total_users = \count($users);
      
      	$clean_users = $model->get_param('clean_users', 0);
      	$deleted_users = array();
      	if (!empty($users) && $clean_users)
        {
        	foreach ($users as $user_id)
            {
            	TfUser::delete_user($user_id);
              	$deleted_users[] = $user_id;
              	if (\count($deleted_users) >= $clean_users)
                {
                	break;  
                }
            }
        }
        
      	$this->setMessage($total_users . ' Users Found. ' . \count($deleted_users) . ' Users Deleted - ' . implode(', ', $deleted_users) . '. Id of First User ' . reset($users));
      	
      	$this->setRedirect(Route::_('index.php?option=' . $this->option . '&view=' . $this->view_list, false));
    }
}