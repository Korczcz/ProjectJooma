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
use TechFry\Component\TfMail\Administrator\Helper\SendHelper;
use TechFry\Library\Model\Back\TfModelForm;

class MailModel extends TfModelForm
{
    public $db_limit = 20;
    
    public $pro_fields = array(
        'default' => array('attach')
        );
    
    public function __construct($config = array())
	{
	    $this->table_name = 'tfm_mail';
	    
	    $this->date_fields = array('send_date');
	    
	    $this->multiple_fields = array('filter', 'params');
	    
        $this->subform_fields = array('filter', 'filterusers', 'filterstats', 'filterstats_aggr');
	    
	    parent::__construct($config);
	}
    
    public function getForm($data = array(), $loadData = true)
    {
        parent::getForm();
        
        $this->form->setFieldAttribute('attach', 'description', 'Folder: ' . $this->get_param('mail_attach_folder'));
            
        return $this->form;
    }
	
// *****************************************************************************
    
    // Used by preview layout
    public function prepare_email($mail_id)
    {
        $user_id = $this->get_param('mail_test_id');
        
        SendHelper::pre_send($mail_id, $user_id);
        
        return SendHelper::$email;
    }
}