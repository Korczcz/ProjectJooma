<?php
 /*
 * @package		TF Mail Component
 * @license		GNU General Public License version 2 or later; see LICENSE.txt
 */

namespace TechFry\Component\TfMail\Administrator\Model;

defined('_JEXEC') or die;

use TechFry\Library\Model\Back\TfModelList;

class BouncesModel extends TfModelList
{
    public function __construct($config = array())
    {
        $this->table_name = 'tfm_bounces';
        
        $this->select_fields = array('a.id', 'a.subject', 'a.published', 'a.emailDate', 'a.bounce_email');
        
        $this->search = 'a.subject';
        
        array_push($this->sorting_fields, 'a.subject', 'a.bounce_email');
        
        parent::__construct($config);
    }
}