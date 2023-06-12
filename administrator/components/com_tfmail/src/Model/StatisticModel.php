<?php
 /*
 * @package		TF Mail Component
 * @license		GNU General Public License version 2 or later; see LICENSE.txt
 */

namespace TechFry\Component\TfMail\Administrator\Model;

defined('_JEXEC') or die;

use TechFry\Library\Model\Back\TfModelForm;

class StatisticModel extends TfModelForm
{
	public function __construct($config = array())
	{
	    $this->table_name = 'tfm_statistics';
	    
	    parent::__construct($config);
	}
    
    // To implement: Joomla\CMS\MVC\Model\FormModel::getForm
    public function getForm($data = array(), $loadData = true)
    {

    }
}