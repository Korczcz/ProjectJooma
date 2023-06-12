<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library\View\Air;

defined('_JEXEC') or die;

trait OutputTrait
{
	public static $fw = 'bs';
  
  	public static $config = array();
  	
  	public static $data;
  
  	public static function get_output($data, $config = array(), $fw = 'bs')
    {
     	if (empty($data))
        {
        	return;
        }
      
      	self::$fw = $fw;
      	self::$data = $data;
      	self::$config = $config;
      	
      	$function_name = 'get_output_' . $fw;
      
      	return self::$function_name();
    }
}