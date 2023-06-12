<?php
 /*
 * @package		TF Mail Component
 * @license		GNU General Public License version 2 or later; see LICENSE.txt
 */

namespace TechFry\Component\TfMail\Administrator\Model;

defined('_JEXEC') or die;

use Joomla\CMS\Factory;
use TechFry\Library\Model\Back\TfModelList;

class CampaignsModel extends TfModelList
{
    public function __construct($config = array())
    {
        $this->table_name = 'tfm_campaign';
        
        $this->select_fields = array('a.id', 'a.title', 'a.published', 'a.mails', 'a.filter', 'a.onregister', 'a.onmodify');
        
        parent::__construct($config);
    }
    
// *****************************************************************************
    /*
    // 01. Get all published campaigns
    public function getCampaigns($trigger = null)
    {
        $db = Factory::getDbo();
		$query = $db->getQuery(true);
		
		$query->select('*')
		    ->from($db->quoteName('#__tfm_campaign'))
		    ->where($db->quoteName('published') . ' = ' . $db->quote(1))
		    ->order('id ASC');
		    
	    if ($trigger == 1)
	    {
	        $query->andWhere($db->quoteName('onregister') . ' = ' . $db->quote(1));
	    }
	    
	    if ($trigger == 2)
	    {
	        $query->andWhere($db->quoteName('onmodify') . ' = ' . $db->quote(1));
	    }
		    
	    $db->setQuery($query);
	    
        $rows = $db->loadAssocList();
	    
	    return $rows;
    }
    */
}