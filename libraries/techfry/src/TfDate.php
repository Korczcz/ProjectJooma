<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library;

defined('_JEXEC') or die;

use Joomla\CMS\Factory;

class TfDate
{
    // $data - date
    public static function process($function, $data = null, $param = null)
    {
        // Factory::getApplication()->enqueueMessage($function);
        
        switch ($function)
        {
            // Create current date
            case 'create' :
            case 'date_create' :
                $date = $data ? Factory::getDate($data) : Factory::getDate();
                $result = $date->format('Y-m-d H:i:s');
                break;
            
            // No arguments
            case 'getdate' :
            case 'time' :
            case 'timezone_identifiers_list' :
                $result = $function();
                break;
            
            // No parameters
            case 'toISO8601' :
            case 'toRFC822' :
            case 'toUnix' :
            case 'toSql' :
                $date = Factory::getDate($data);
                $result = $date->$function();
                break;
                
            // format
            case 'date_format' :
            case 'format' :
                $date = Factory::getDate($data);
                $result = $date->format($param);
                break;
                
            // modify
            case 'date_modify' :
            case 'modify' :
                $date = Factory::getDate($data);
                $result = $date->modify($param);
                break;
        }
        
        return $result;
    }
    
    /*
    DATE INTERVALS
    
    P1D / 1 day
    P2W / 2 weeks
    P3M / 3 months
    P4Y / 4 years
    
    P1Y1D / 1 year + 1 day
    P1YT12H / 1 year + 12 hours
    
    PT3600S / 3600 seconds
    
    */
    
	// Find number of days between two dates 	
    public static function get_days($date1, $date2 = '')
    {
     	if ($date2 == '')
        {
        	$date2 = date('Y-m-d'); // today
        }
      
      	$difference = abs(strtotime($date2) - strtotime($date1));
      	$days = $difference/(60 * 60 * 24);
      
      	return $days;
    }
}