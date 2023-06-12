<?php
 /*
 * @package		TF Components
 * @license		GNU General Public License version 2 or later; see LICENSE.txt
 */

namespace TechFry\Library\Model\Front;

defined('_JEXEC') or die;

use Joomla\CMS\Factory;
use Joomla\CMS\MVC\Factory\MVCFactoryInterface;
use Joomla\CMS\MVC\Model\ItemModel;
use TechFry\Library\Model\TfModelTrait;

class TfModelItem extends ItemModel
{
    use TfModelTrait;
    
    public $json_fields = array();
    
    public $join_tables = array();
    
    public $where = array();
    
    public function __construct($config = array(), MVCFactoryInterface $factory = null)
	{
		parent::__construct($config);
		
	    $this->app = Factory::getApplication();
	    
	    $this->input = $this->app->input;
	}
    
    // 01. Get single item
    public function getItem($pk = null)
    {
        if ($pk == null)
	    {
	        $input = Factory::getApplication()->input;
            $pk = $input->get('id', 0, 'int');
	    }
	    
	    $char = 'a';
        
        $db = Factory::getDbo();
        $query = $db->getQuery(true);
        
        $query->select('*')
            ->from($db->quoteName('#__' . $this->table_name, $char))
            ->where($db->quoteName('id') . ' = '. $db->quote($pk));
            
        // Where conditions
        foreach ($this->where as $condition)
        {
            $query->andWhere($condition);
        }
            
        // Join over other tables
        foreach ($this->join_tables as $table)
        {
            $char++;
            
            $query->select($char . '.' . $table[1])
                 ->join('LEFT', $db->quoteName('#__' . $table[0], $char) . ' ON a.' . $table[2] . ' = ' . $char . '.id');
        }

        $db->setQuery($query);
        
        $row = $db->loadObject();
        
        // Convert JSON strings to Objects
        foreach ($this->json_fields as $field)
        {
            $row->$field = json_decode($row->$field);
        }
        
        return $row;
    }
    
    // 02. Increment hits
    public function record_hits($pk = null)
    {
        if (is_null($pk))
        {
            $input = Factory::getApplication()->input;
            $pk = $input->get('id', 0, 'int');
        }
        
        $db = Factory::getDbo();
        $query = $db->getQuery(true);
        
		$query->update('#__' . $this->table_name)
			->set($db->quoteName('hits') . ' = (' . $db->quoteName('hits') . ' + 1)')
			->where($db->quoteName('id') . ' = '. $db->quote($pk));

		$db->setQuery($query);
		
		$db->execute();
    }
}