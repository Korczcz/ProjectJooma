<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library;

defined('_JEXEC') or die;

use Joomla\CMS\Factory;

class TfNumeric
{
    // $data - number or array of number
    public static function process($function, $data, $param = null)
    {
        switch ($function)
        {
            // One argument - data
            case 'abs' :
            case 'base_convert' :
            case 'bindec' :
            case 'ceil' :
            case 'decbin' :
            case 'dechex' :
            case 'decoct' :
            case 'deg2rad' :
            case 'exp' :
            case 'floor' :
            case 'hexdec' :
            case 'log' :
            case 'log10' :
            case 'octdec' :
            case 'rad2deg' :
            case 'round' :
            case 'sqrt' :
                $result = self::one($function, $data);
                break;
                
            // Two arguments - data, 1 parameter
            case 'fmod' :
            case 'intdiv' :
            case 'pow' :
            case 'rand' :
                $result = self::two($function, $data, $param);
                break;
            
            // Array as argument
            case 'max' :
            case 'min' :
            case 'array_sum' :
            case 'array_product' :
            case 'count' :
                $result = $function($data);
                break;
                
            // Arithmetic custom methods - 2 numbers
            case 'sum' :
            case 'add' :
            case 'subtract' : 
            case 'multiply' :
            case 'divide' :
            case 'mod' :
            case 'exp' :
                $result = self::arithmetic($function, $data);
        }
        
        return $result;
    }
    
    public static function one($function, $data)
    {
        if (is_array($data))
        {
            foreach ($data as $k => $str)
            {
                $data[$k] = $function($str);
            }
        }
        else
        {
            $data = $function($data);
        }
        
        return $data;
    }
    
    public static function two($function, $data, $param)
    {
        if (is_array($data))
        {
            foreach ($data as $k => $str)
            {
                $data[$k] = $function($str, $param);
            }
        }
        else
        {
            $data = $function($data, $param);
        }
        
        return $data;
    }
    
    public static function arithmetic($function, $data)
    {
        switch ($function)
        {
            case 'add' :
            case 'sum' :
                $result = $data[0] + $data[1];
                break;
            
            case 'multiply' :
                $result = $data[0] * $data[1];
                break;
                
            case 'subtract' :
                $result = $data[0] - $data[1];
                break;
                
            case 'divide' :
                $result = $data[0] / $data[1];
                break;
                
            case 'mod' :
                $result = $data[0] % $data[1];
                break;
                
            case 'exp' :
                $result = $data[0] ** $data[1];
                break;
        }
        
        return $result;
    }
}