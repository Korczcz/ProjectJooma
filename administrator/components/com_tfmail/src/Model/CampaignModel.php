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
use TechFry\Library\Model\Back\TfModelForm;
use TechFry\Component\TfMail\Administrator\Helper\CampaignHelper;
use TechFry\Component\TfMail\Administrator\Helper\UserfilterHelper;
use TechFry\Library\TfUser;
use TechFry\Library\TfDb;

class CampaignModel extends TfModelForm
{
    public $db_limit = 5;
    
    public function __construct($config = array())
	{
        $this->table_name = 'tfm_campaign';
	    
	    $this->multiple_fields = array('filter');
	    
	    $this->subform_fields = array('mails', 'filter', 'filterusers');
	    
	    parent::__construct($config);
	}
    
// *****************************************************************************
    
    // 01. Add single campaign to all users based on filters
    public function add2queue($camp_id)
    {
        $users = CampaignHelper::get_users_campaign($camp_id);
        
        foreach ($users as $user)
        {
            CampaignHelper::user2camp($user, $camp_id);
        }
    }
    
    // 02. Get Users based on filters
    public function get_users($filter, $filterusers, $filterstats, $filterstats_aggr)
    {
        $users = UserfilterHelper::filter_users($filter, $filterusers, $filterstats, $filterstats_aggr, true);
        
        return $users;
    }
    
    // 03. Get users subscribed in a campaign (Used by View)
    public function get_camp_users($camp_id)
    {
        if (!$camp_id)
        {
        	return array();  
        }
      
      	$conditions = array(
            array('a.camp_id', '=', $camp_id)
            );
            
        $joins = array(
            array('table' => 'users', 'on' => 'user_id')
            );
        
        $camp_users = TfDb::get_records('tfm_campsub', 'a.user_id, a.created, b.email', $conditions, 'a.created DESC', 100, $joins);
        
        return $camp_users;
    }
    
    // 04. Delete subscriptions for campaign
    public function deletesubs($camp_id)
    {
        $conditions = array(
            array('camp_id', '=', $camp_id)
            );
        
        TfDb::delete_items('tfm_campsub', $conditions);
    }
}