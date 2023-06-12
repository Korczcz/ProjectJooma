<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library;

defined('_JEXEC') or die;

use Joomla\CMS\Factory;
use Joomla\CMS\Router\Route;
use Joomla\CMS\Uri\Uri;
use Joomla\CMS\Language\Text;

class TfSd
{
    // Create json array - with context and type
    public static function start_sd($type = '')
    {
        $json = array(
            "@context" => "https://schema.org"
            );
            
        if ($type != '')
        {
            $json['@type'] = $type;
        }
            
        return $json;
    }
    
    // Add property and value to array
    public static function set_property($array, $name, $value)
    {
        if ($value != '')
        {
            $array[$name] = $value;
        }
        
        return $array;
    }
    
    // Add property and value (search from $mapping array) to array
    public static function set_prop($array, $name, $mapping = array())
    {
        $property_name = strtolower($name);
        
        if (isset($mapping[$property_name]) && $mapping[$property_name] != '')
        {
            $array[$name] = $mapping[$property_name];
        }
        
        return $array;
    }
    
    // Add multiple properties and values (search from $mapping array) to array
    public static function set_props($array, $names = array(), $mapping = array())
    {
        foreach ($names as $name)
        {
            $array = self::set_prop($array, $name, $mapping);
        }
        
        return $array;
    }
    
    public static function set_property_image($array, $image)
    {
        if (empty($image))
        {
            return $array;
        }
        
        $uri = Uri::getInstance();
        
        $array['image'] = array(
                        '@type' => 'ImageObject',
                        'url' => $uri->base() . $image
                        );
        
        return $array;
    }
    
    public static function set_property_author($array, $type, $name, $url)
    {
        $array['author'] = array(
                        '@type' => $type,
                        'name' => $name,
                        'url' => $url
                        );
        
        return $array;
    }
    
    public static function set_property_publisher($array, $name, $logo)
    {
        $uri = Uri::getInstance();
        
        $array['publisher'] = array(
                        '@type' => 'Organization',
                        'name' => $name,
                        'url' => $uri->base(),
                        'logo' => array(
                            '@type' => 'ImageObject',
                            'url' => $uri->base() . $logo
                            )
                        );
        
        return $array;
    }
    
    public static function set_properties($array, $names, $values)
    {
        foreach ($names as $k => $v)
        {
            $array[$v] = $values[$k];
        }
        
        return $array;
    }
    
    // Display structured data
    public static function display_sd($json)
    {
        /*
        $jsonld = '<script type="application/ld+json">';
        $jsonld .= json_encode($json, JSON_PRETTY_PRINT | JSON_UNESCAPED_SLASHES);
        $jsonld .= '</script>';
        echo $jsonld;
        */
        $app = Factory::getApplication();
        
        $wa = $app->getDocument()->getWebAssetManager();
        
	    $wa->addInline('script', json_encode($json, JSON_UNESCAPED_UNICODE), array(), ['type' => 'application/ld+json']);
    }
}