<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library;

defined('_JEXEC') or die;

use Joomla\CMS\Factory;

class TfArray
{
    // $data - array; $result - array / string / integer
    public static function process($function, $data = array(), $params = array())
    {
        switch ($function)
        {
            // One argument as array; Array is modified without returning
            case 'array_pop' :
            case 'array_shift' :
            case 'sort' :
            case 'rsort' :
            case 'ksort' :
            case 'krsort' :
            case 'asort' :
            case 'arsort' :
            case 'natsort' :
            case 'shuffle' :
                $temp = $data;
                $function($temp);
                $result = $temp;
                break;
            
            // One argument as array; Returns modified array
            case 'array_count_values' :
            case 'array_flip' :
            case 'array_keys' :
            case 'array_reverse' :
            case 'array_unique' :
            case 'array_values' :
                $result = $function($data);
                break;
                
            // One argument as array; Returns result as integer or string
            case 'count' :
            case 'array_sum' :
            case 'array_product' :
                $result = $function($data);
                break;
                
            // Two arguments - data as array, 1 parameter
            case 'array_change_key_case' :
          	case 'array_chunk' :
            case 'array_column' :
                $result = $function($data, $params[0]);
                break;
                
            // Three arguments - data as array, 2 parameters
            case 'array_pad' :
            case 'array_slice' :
                $result = $function($data, $params[0], $params[1]);
                break;
                
            // Special case - Modifies array without returning; 1 parameter
            case 'array_push' :
            case 'array_unshift' :
                $temp = $data;
                $function($temp, $params[0]);
                $result = $temp;
                break;
                
            // Array as second argument
            case 'implode' :
          	case 'array_search' :
                $result = $function($params[0], $data);
                break;
            
            // Data as two arrays
          	case 'array_merge' :
            case 'array_replace' :
            case 'array_combine' :
          	case 'array_diff' :
            case 'array_diff_key' :
            case 'array_diff_assoc' :
            case 'array_intersect' :
            case 'array_intersect_key' :
            case 'array_intersect_assoc' :
            	$result = $function($data[0], $data[1]);
            	break;	
        }
        
        return $result;
    }
}