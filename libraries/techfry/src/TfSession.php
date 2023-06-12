<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library;

defined('_JEXEC') or die;

use Joomla\CMS\Factory;
use Joomla\CMS\Session\Session;

class TfSession
{
    public static function set_session($name, $value)
    {
		$session = Factory::getSession();
      	$session->set($name, $value);
    }
  
  	public static function get_session($name)
    {
		$session = Factory::getSession();
      	$value = $session->get($name);
      
      	return $value;
    }
  
  	public static function delete_session($name)
    {
		$session = Factory::getSession();
      	$session->clear($name);
    }
}