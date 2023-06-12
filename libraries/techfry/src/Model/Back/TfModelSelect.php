<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library\Model\Back;

defined('_JEXEC') or die;

use Joomla\CMS\Factory;
use TechFry\Library\Model\TfModel;

class TfModelSelect extends TfModel
{
    public $select_types = array();
    
    public function getItems()
    {
        $input = Factory::getApplication()->input;
        
        $select_type = $input->get('select_type');
        
        $function_name = 'get_select_types_' . $select_type;
        $items = $this->$function_name();
        
        return $items;
    }
}