<?php
 /*
 * @package		TF Mail Component
 * @license		GNU General Public License version 2 or later; see LICENSE.txt
 */

namespace TechFry\Component\TfMail\Administrator\Model;

defined('_JEXEC') or die;

use Joomla\CMS\Factory;
use TechFry\Library\Model\Back\TfModelList;
use TechFry\Library\TfUser;
use TechFry\Library\TfDb;

class UsersModel extends TfModelList
{
    public function __construct($config = array())
    {
        $this->table_name = 'users';
        
        $this->select_fields = array('a.id', 'a.block', 'a.email', 'a.registerDate', 'a.lastVisitDate');
        
        $this->search = 'a.email';
        
        $this->filters['block'] = 'a.block';
        
        array_push($this->sorting_fields, 'a.registerDate', 'a.lastVisitDate');
        
        parent::__construct($config);
    }
    
// *****************************************************************************
    
    // 01. Returns total emails sent
    public function count_sent($user_id)
    {
        $conditions = array(array('user_id', '=', $user_id), array('type', '!=', 'click'));
        
        $total = TfDb::total_rows('tfm_statistics', $conditions);
	    
	    return $total;
    }
    
    // 02. Returns total emails opened
    public function count_opens($user_id)
    {
        $conditions = array(array('user_id', '=', $user_id), array('type', '=', 'open'));
        
        $total = TfDb::total_rows('tfm_statistics', $conditions);
	    
	    return $total;
    }
    
    // 03. Returns total clicks by user
    public function count_clicks($user_id)
    {
        $conditions = array(array('user_id', '=', $user_id), array('type', '=', 'click'));
        
        $total = TfDb::total_rows('tfm_statistics', $conditions);
	    
	    return $total;
    }
    
    // 04. Get last open date
    public function get_last_open($user_id)
    {
        $record = TfDb::get_record('tfm_statistics', array(array('user_id', '=', $user_id)), 'open_date DESC', array('open_date'));
	    
	    if (isset($record->open_date))
	    {
	        return $record->open_date;
	    }
    }
}