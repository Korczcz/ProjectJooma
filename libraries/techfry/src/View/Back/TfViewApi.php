<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library\View\Back;

\defined('_JEXEC') or die;

use Joomla\CMS\Factory;
use Joomla\CMS\MVC\View\JsonApiView as BaseApiView;
use TechFry\Library\TfDb;

class TfViewApi extends BaseApiView
{
    protected $fieldsToRenderItem = array();

    protected $fieldsToRenderList = array();
    
    public $table_name;
    
    public function __construct($config = array())
    {
        $columns = TfDb::get_table_columns($this->table_name);
        $cols = array_keys($columns);
        
        $this->fieldsToRenderItem = $cols;
        
        $this->fieldsToRenderList = array('id', 'title', 'alias');

        parent::__construct($config);
    }
}