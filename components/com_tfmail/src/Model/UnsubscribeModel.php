<?php
 /*
 * @package		TF Mail Component
 * @license		GNU General Public License version 2 or later; see LICENSE.txt
 */

namespace TechFry\Component\TfMail\Site\Model;

defined('_JEXEC') or die;

use Joomla\CMS\Factory;
use Joomla\CMS\Language\Text;
use Joomla\CMS\MVC\Factory\MVCFactoryInterface;
use Joomla\CMS\Form\FormFactoryInterface;
use TechFry\Library\Model\Front\TfModelForm;
use TechFry\Library\TfUser;
use TechFry\Library\TfDb;
use TechFry\Library\TfNotify;

class UnsubscribeModel extends TfModelForm
{
    public function __construct($config = array(), MVCFactoryInterface $factory = null, FormFactoryInterface $formFactory = null)
    {
        $this->table_name = 'users';
        
        $this->loadData = false;
	    
	    parent::__construct($config, $factory, $formFactory);
    }
  	
  	// 01. Get Form
  	public function getForm($data = array(), $loadData = true)
    {
     	parent::getForm($data, $loadData);
      
      	// Survey field
      	if ($this->get_menu_param('survey', 0))
		{
			$survey_list = $this->get_menu_param('survey_list', array());
  			$survey_field = $this->form->getField('survey');
          
   			foreach ($survey_list as $option)
   			{
    			$survey_field->addOption($option->field_text, array('value' => $option->field_value));
   			}
		}
      	else
        {
        	$this->form->removeField('survey');
        }
      
      	// Get user id and otpkey
      	$input = Factory::getApplication()->input;

		$otpkey = $input->get('otpkey', '0', 'INT');
		$id = $input->get('id', '0', 'INT');
      
      	$this->form->setValue('otpkey', null, $otpkey);
		$this->form->setValue('id', null, $id);
      
      	$email = $this->get_user_email($id, $otpkey);
      	if ($email)
		{
    		$this->form->setValue('email', null, $email);
		}
      	elseif ($this->user->id)
        {
        	$this->form->setValue('id', null, $this->user->id);
          	$this->form->setValue('email', null, $this->user->email);
        }
      
      	return $this->form;
    }
	
  	// 02. Unsubscribe user
	public function save($data)
	{        
        // Insert unsubscription record - To Do: Check for existing record
        $record = new \stdClass();
        
        $record->camp_id = 0;
        $record->user_id = $data['id'];
        $record->created = $this->today;
        $record->remarks = $data['survey'];
        
        TfDb::insert_update('tfm_campsub', $record, false);
        
        // Send notification to admin
        if ($this->get_param('notify_unsubscribe', 1))
        {
            TfNotify::notify_admin(Text::_('COM_TFMAIL_SUBJECT_UNSUBSCRIBE'), $data);
        }
        
	    return true;
	}
	
	public function get_user_email($id, $otpkey)
	{
	    $user = TfUser::check_otp($id, $otpkey);
	    
	    return ($user) ? $user->email : null;
	}
}