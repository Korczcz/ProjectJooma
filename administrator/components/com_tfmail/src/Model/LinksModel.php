<?php
 /*
 * @package		TF Mail Component
 * @license		GNU General Public License version 2 or later; see LICENSE.txt
 */

namespace TechFry\Component\TfMail\Administrator\Model;

defined('_JEXEC') or die;

use TechFry\Library\Model\Back\TfModelList;
use Techfry\Library\TfDb;

class LinksModel extends TfModelList
{
    public function __construct($config = array())
    {
        $this->table_name = 'tfm_links';
        
        $this->select_fields = array('a.id', 'a.title', 'a.published', 'a.link_url', 'a.note', 'a.modified', 'a.campaign_id', 'b.title AS campaign_title');
        
        $this->left_joins = array(
            array('table' => 'tfm_campaign', 'on1' => 'a.campaign_id', 'on2' => 'b.id')
            );
        
        parent::__construct($config);
    }
    
    // Total number of clicks for a link
    public function count_clicks($link_id)
    {
        $conditions = array(array('link_id', '=', $link_id), array('click_date', 'IS NOT NULL'));
        
        $total = TfDb::total_rows('tfm_statistics', $conditions);
	    
	    return $total;
    }
}