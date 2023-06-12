<?php
 /*
 * @package		TF Mail Component
 * @license		GNU General Public License version 2 or later; see LICENSE.txt
 */

namespace TechFry\Component\TfMail\Administrator\Model;

defined('_JEXEC') or die;

use Joomla\CMS\Factory;
use TechFry\Component\TfMail\Administrator\Helper\QueueHelper;
use TechFry\Library\Model\Back\TfModelList;
use TechFry\Library\TfDb;

class MailsModel extends TfModelList
{
    public $m;
    
    public function __construct($config = array())
    {
        $this->table_name = 'tfm_mail';
        
        $this->select_fields = array('a.id', 'a.title', 'a.send_date', 'a.schedule', 'a.published', 'a.mail_type', 'a.filter', 'a.frequency');
        
        $this->filters['mail_type'] = 'a.mail_type';
        $this->filters['schedule'] = 'a.schedule';
        
        array_push($this->sorting_fields, 'a.send_date', 'a.schedule', 'a.mail_type');
        
        parent::__construct($config);
    }
    
// *****************************************************************************
    
    // 01. Function to insert newsletter to the queue
    public function process()
    {
        $this->get_m();
        
        if ($this->m == null)
        {
            return false;
        }
        
        $count = QueueHelper::add2queue($this->m->id);
        
        return $count;
    }
    
    // 02. Used by process function
    protected function get_m()
    {
        $today = Factory::getDate();
        
        $conditions = array(array('send_date', '<', $today), array('published', '=', 1), array('schedule', '=', 1));
        
        $this->m = TfDb::get_record('tfm_mail', $conditions, 'send_date ASC');
    }
    
    // 03. Returns total emails sent
    public function count_sent($mail_id)
    {
        // type can be send or open
        $conditions = array(array('mail_id', '=', $mail_id), array('type', '!=', 'click'));
        
        $total = TfDb::total_rows('tfm_statistics', $conditions);
	    
	    return $total;
    }
    
    // 04. Returns total emails opened
    public function count_opens($mail_id)
    {
        $conditions = array(array('mail_id', '=', $mail_id), array('type', '=', 'open'));
        
        $total = TfDb::total_rows('tfm_statistics', $conditions);
	    
	    return $total;
    }
    
    // 05. Returns total clicks from email
    public function count_clicks($mail_id)
    {
        $conditions = array(array('mail_id', '=', $mail_id), array('type', '=', 'click'));
        
        $total = TfDb::total_rows('tfm_statistics', $conditions);
	    
	    return $total;
    }
}