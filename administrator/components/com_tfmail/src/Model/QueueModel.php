<?php
 /*
 * @package		TF Mail Component
 * @license		GNU General Public License version 2 or later; see LICENSE.txt
 */

namespace TechFry\Component\TfMail\Administrator\Model;

defined('_JEXEC') or die;

use Joomla\CMS\Factory;
use TechFry\Library\Model\Back\TfModelList;
use TechFry\Component\TfMail\Administrator\Helper\SendHelper;
use TechFry\Component\TfMail\Administrator\Helper\QueueHelper;
use TechFry\Library\TfDb;

class QueueModel extends TfModelList
{
    public function __construct($config = array())
    {
        $this->table_name = 'tfm_queue';
        
        $this->select_fields = array('a.*', 'b.title', 'c.email');
        
        $this->search = 'c.email';
        
        $this->orderCol = 'a.send_date';
        
        $this->orderDirn = 'ASC';
        
        $this->left_joins = array(
            array('table' => 'tfm_mail', 'on1' => 'a.mail_id', 'on2' => 'b.id'),
            array('table' => 'users', 'on1' => 'a.user_id', 'on2' => 'c.id')
            );
                            
        $this->filters['title'] = 'a.mail_id';
        $this->filters['mailid'] = 'a.mail_id';
        
        array_push($this->sorting_fields, 'a.user_id', 'a.mail_id', 'a.send_date', 'a.priority', 'b.title', 'c.email');
        
        parent::__construct($config);
    }
    
// *****************************************************************************
    
    // 01. Save or add message in queue (can be used for API)
  	public function save($data)
    {
    	QueueHelper::insert_q($data);
      
      	return true;
    }
  
  	// 02. 
    public function process()
    {
        $count = array('suc' => 0, 'err' => 0);
        
        $queue_limit = $this->get_param('queue_limit', 5);
        
        for ($i = 0; $i < $queue_limit; $i++)
        {
            // Get queue
            $q = $this->get_q();
        
            if (!$q)
            {
                return false;
            }
            
            // Send email through send helper
            $send = SendHelper::send_mail($q->mail_id, $q->user_id);
            if ($send)
            {
                // Delete from queue
                $this->delete_q($q->user_id, $q->mail_id);
                
                // Add to statistics
                $this->add_statistics($q->mail_id, $q->user_id);
                
                $count['suc']++;
            }
            else
            {
                $count['err']++;
            }
        }
        
        return $count;
    }
    
    // 03.
    public function add_statistics($mail_id, $user_id)
    {
        $date = Factory::getDate();
        
        $stats = new \stdClass();
        
        $stats->type = 'send';
        $stats->mail_id = $mail_id;
        $stats->user_id = $user_id;
        $stats->send_date = $date->toSql();
        $stats->opens = 0;
        
        TfDb::insert_update('tfm_statistics', $stats, false);
    }
    
    // 04. Used by process function
    public function get_q()
    {
        $today = Factory::getDate();
        
        $conditions = array(array('send_date', '<', $today));
        
        $order = 'priority ASC, send_date ASC, user_id ASC';
	    
        $row = TfDb::get_record('tfm_queue', $conditions, $order);
	    
	    return $row;
    }
    
    // 05. Used by process function ; Used by Actions in Queue and Users // Depreciated: Use QueueHelper
    public function delete_q($user_id, $mail_id = null)
    {
        $conditions = array();
        $conditions[] = array('user_id' , '=', $user_id);
        if ($mail_id != null)
        {
            $conditions[] = array('mail_id', '=', $mail_id);
        }
        
        $num = TfDb::delete_items('tfm_queue', $conditions);
	    
	    return $num;
    }
}