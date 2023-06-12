<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library;

defined('_JEXEC') or die;

use Joomla\CMS\Factory;
use Joomla\CMS\Log\Log;

class TfLog
{
    public static function add_entry($message, $log_file = '')
    {
		if (empty($log_file))
        {
        	$log_file = Factory::getApplication()->input->get('option', 'techfry') . '.php';  
        }
      	else
        {
        	$log_file .= '.php';  
        }
      
      	Log::addLogger(array('text_file' => $log_file, 'text_entry_format' => '{DATE} {TIME} {PRIORITY} {MESSAGE}'));
      
		Log::add($message, Log::INFO);
    }
  
  	public static function add_error($message, $log_file = '')
    {
		if (empty($log_file))
        {
        	$log_file = Factory::getApplication()->input->get('option', 'techfry') . '.php';  
        }
      	else
        {
        	$log_file .= '.php';  
        }
      
      	Log::addLogger(array('text_file' => $log_file, 'text_entry_format' => '{DATE} {TIME} {PRIORITY} {MESSAGE}'));
      
		Log::add($message, Log::ERROR);
    }
}