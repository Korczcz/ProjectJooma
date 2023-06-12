<?php
 /*
 * @package		TF Mail Component
 * @license		GNU General Public License version 2 or later; see LICENSE.txt
 */

namespace TechFry\Component\TfMail\Administrator\Model;

defined('_JEXEC') or die;

use TechFry\Library\Model\Back\TfModelForm;

class LinkModel extends TfModelForm
{
	public function __construct($config = array())
	{
	    $this->table_name = 'tfm_links';
	    
	    parent::__construct($config);
	}
}