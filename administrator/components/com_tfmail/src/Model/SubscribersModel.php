<?php
 /*
 * @package		TF Mail Component
 * @license		GNU General Public License version 2 or later; see LICENSE.txt
 */

namespace TechFry\Component\TfMail\Administrator\Model;

defined('_JEXEC') or die;

use TechFry\Library\Model\Back\TfModelList;

class SubscribersModel extends TfModelList
{
    public function __construct($config = array())
    {
        $this->table_name = 'tfm_campsub';
      
      	$this->orderCol = 'a.created';
        
        $this->select_fields = array('a.*', 'b.title', 'c.email');
        
        $this->search = 'c.email';
      
      	$this->left_joins = array(
            array('table' => 'tfm_campaign', 'on1' => 'a.camp_id', 'on2' => 'b.id'),
            array('table' => 'users', 'on1' => 'a.user_id', 'on2' => 'c.id')
            );
      
        $this->filters['title'] = 'a.camp_id';
        
        array_push($this->sorting_fields, 'a.user_id', 'b.title', 'a.created');
        
        parent::__construct($config);
    }
}