<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library\View\Others;

defined('_JEXEC') or die;

use Joomla\CMS\Factory;
use Joomla\CMS\Http\HttpFactory;

class Location
{
    // Get user location information from IP Address - https://ipapi.co
  	public static function get_output($ip_address, $config = array())
    {
        // config
        
        if (empty($ip_address))
        {
            return;
        }
        
      	$url = 'https://ipapi.co/' . $ip_address . '/json/';
        
        $http = HttpFactory::getHttp();
        $response = $http->get($url);
        
      	// city, country_name, region, country_code, postal (and others) 
        $data = json_decode($response->body, true);

		return $data;
    }
  
  	public static function get_ip_address()
    {
    	$app = Factory::getApplication();
      	$input = $app->input;
        $ip_address = $input->server->get('REMOTE_ADDR');
      
      	return $ip_address;
    }
}