<?php
 /*
 * @package		TF Mail Component
 * @license		GNU General Public License version 2 or later; see LICENSE.txt
 */

namespace TechFry\Component\TfMail\Administrator\Helper;

defined('_JEXEC') or die;

use Joomla\CMS\Component\ComponentHelper;
use Joomla\CMS\Factory;
use Joomla\CMS\Http\HttpFactory;
use Joomla\CMS\Uri\Uri;
use TechFry\Library\TfUser;
use TechFry\Library\TfDb;

class LinkedinHelper
{
	// 01. Create url for redirection
	public static function create_url()
	{
	    $client_id = ComponentHelper::getParams('com_tfmail')->get('linkedin_client_id');
	    
	    $redirect_uri = Uri::base() . 'index.php?option=com_tfmail&task=subscribe.linkedin';
	    
	    $url = 'https://www.linkedin.com/oauth/v2/authorization?response_type=code';
	    $url .= '&client_id=' . $client_id;
	    $url .= '&redirect_uri=' . urlencode($redirect_uri);
	    $url .= '&scope=r_liteprofile r_emailaddress';
        
        return $url;
	}
	
	// 02. Get access token from code
	public static function get_token($code)
	{
	    $tokenurl = 'https://www.linkedin.com/oauth/v2/accessToken';
	    
	    $client_id = ComponentHelper::getParams('com_tfmail')->get('linkedin_client_id');
	    $client_secret = ComponentHelper::getParams('com_tfmail')->get('linkedin_client_secret');
	    
	    $redirect_uri = Uri::base() . 'index.php?option=com_tfmail&task=subscribe.linkedin';
	    
	    $data = array(
            'code' => $code,
            'client_id' => $client_id,
            'client_secret' => $client_secret,
            'redirect_uri' => $redirect_uri,
            'grant_type' => 'authorization_code'
            );
	    
	    $http = HttpFactory::getHttp();
	    
        $response = $http->post($tokenurl, $data);
	    
	    $response_arr = json_decode($response->body, true);
	    
	    return $response_arr['access_token'];
	}
	
	// 03. Get user profile info
	public static function get_info($access_token)
	{
	    $user_fields = self::get_user_information($access_token);
	    
		$email_fields  = self::get_email_address($access_token);

		$name = $user_fields['localizedFirstName'] . ' ' . $user_fields['localizedLastName'];
        $email = $email_fields['elements'][0]['handle~']['emailAddress'];
        
        $user_data = array(
            'name' => $name,
            'email' => $email
            );
        
        return $user_data;
	}
	
	public static function get_user_information($access_token)
	{
		$endpoint = 'https://api.linkedin.com/v2';
	    $path = '/me';
	    
	    $headers = array(
            'Authorization' => 'Bearer ' . $access_token
            );
        
        $http = HttpFactory::getHttp();
        
        $response = $http->get($endpoint . $path, $headers);
        
        $response_arr = json_decode($response->body, true);
        
        return $response_arr;
	}
	
	public static function get_email_address($access_token)
	{
		$endpoint = 'https://api.linkedin.com/v2';
	    $path = '/emailAddress?q=members&projection=(elements*(handle~))';
	    
	    $headers = array(
            'Authorization' => 'Bearer ' . $access_token
            );
        
        $http = HttpFactory::getHttp();
        
        $response = $http->get($endpoint . $path, $headers);
        
        $response_arr = json_decode($response->body, true);
        
        return $response_arr;
	}
}