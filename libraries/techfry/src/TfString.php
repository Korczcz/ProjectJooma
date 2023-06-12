<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library;

defined('_JEXEC') or die;

use Joomla\CMS\Factory;

class TfString
{
    // $data - string or array of string
    public static function process($function, $data, $params = array())
    {
        switch ($function)
        {
            // One argument - data
            case 'strtolower' :
            case 'strtoupper' :
            case 'ucfirst' :
            case 'ucwords' :
            case 'strlen' :
            case 'trim' :
            case 'ltrim' :
            case 'rtrim' :
            case 'strrev' :
            case 'str_word_count' :
            case 'htmlspecialchars_decode' :
            case 'htmlspecialchars' :
            case 'parse_str' :
            case 'parse_url' :
            case 'str_getcsv' :
            case 'str_shuffle' :
            case 'str_split' :
            case 'strip_tags' :
            case 'base64_decode' :
            case 'base64_encode' :
            case 'urldecode' :
            case 'urlencode' :
            case 'html_entity_decode' :
            case 'htmlentities' :
                $result = self::one($function, $data);
                break;
                
            // Two arguments - data, 1 parameter
            case 'str_repeat' :
            case 'strtok' :
            case 'rand' :
                $result = self::two($function, $data, $params[0]);
                break;
            
            // Three arguments - data, 2 parameters
            case 'substr' :
            case 'wordwrap' :
                $result = self::three($function, $data, $params[0], $params[1]);
                break;
                
            // String as second argument
            case 'explode' : // Returns array
            case 'preg_match' :
                $result = $function($params[0], $data);
                break;
                
            // String as third arguument
            case 'str_replace' :
            case 'str_ireplace' :
            case 'preg_replace' :
                $result = $function($params[0], $params[1], $data);
                break;
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
    
    public static function three($function, $data, $param1, $param2)
    {
        if (is_array($data))
        {
            foreach ($data as $k => $str)
            {
                $data[$k] = $function($str, $param1, $param2);
            }
        }
        else
        {
            $data = $function($data, $param1, $param2);
        }
        
        return $data;
    }
}