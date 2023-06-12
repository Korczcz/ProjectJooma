<?php
 /*
 * @package		TF Mail Component
 * @license		GNU General Public License version 2 or later; see LICENSE.txt
 */

namespace TechFry\Component\TfMail\Administrator\Model;

defined('_JEXEC') or die;

use TechFry\Library\Model\Back\TfModelList;

class StatisticsModel extends TfModelList
{
    public function __construct($config = array())
    {
        $this->table_name = 'tfm_statistics';
        
        $this->select_fields = array('a.*', 'b.title', 'c.email');
        
        $this->search = 'c.email';
        
        $this->left_joins = array(
            array('table' => 'tfm_mail', 'on1' => 'a.mail_id', 'on2' => 'b.id'),
            array('table' => 'users', 'on1' => 'a.user_id', 'on2' => 'c.id')
            );
                            
        $this->filters['title'] = 'a.mail_id';
        $this->filters['mailid'] = 'a.mail_id';
        $this->filters['type'] = 'a.type';
        
        array_push($this->sorting_fields, 'a.user_id', 'a.mail_id', 'a.opens', 'a.clicks', 'a.type');
        
        parent::__construct($config);
        
        unset($this->filters['a.published']);
    }
}