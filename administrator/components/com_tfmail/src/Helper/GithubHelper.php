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

class GithubHelper
{
	// 01. Create url for redirection
	public static function create_url()
	{
	    $client_id = ComponentHelper::getParams('com_tfmail')->get('github_client_id');
	    
	    $redirect_uri = Uri::base() . 'index.php?option=com_tfmail&task=subscribe.github';
	    
	    $url = 'https://github.com/login/oauth/authorize?response_type=code';
	    $url .= '&client_id=' . $client_id;
	    $url .= '&redirect_uri=' . urlencode($redirect_uri);
	    $url .= '&scope=user';
        
        return $url;
	}
	
	// 02. Get access token from code
	public static function get_token($code)
	{
	    $tokenurl = 'https://github.com/login/oauth/access_token';
	    
	    $client_id = ComponentHelper::getParams('com_tfmail')->get('github_client_id');
	    $client_secret = ComponentHelper::getParams('com_tfmail')->get('github_client_secret');
	    
	    $redirect_uri = Uri::base() . 'index.php?option=com_tfmail&task=subscribe.github';
	    
	    $data = array(
            'code' => $code,
            'client_id' => $client_id,
            'client_secret' => $client_secret,
            'redirect_uri' => $redirect_uri,
            'grant_type' => 'authorization_code'
            );
	    
	    $http = HttpFactory::getHttp();
	    
        $response = $http->post($tokenurl, $data);
        
        // Response is query string (not JSON)
        parse_str($response->body, $response_arr);
	    
	    return $response_arr['access_token'];
	}
	
	// 03. Get user profile info
	public static function get_info($access_token)
	{
	    $endpoint = 'https://api.github.com/graphql';
	    
		$query = <<< JSON
{
	"query" : "query { viewer { id, name, email, login, avatarUrl(size: 256) } }"
}

JSON;
	    
	    $headers = array(
            'Authorization' => 'Bearer ' . $access_token
            );
        
        $http = HttpFactory::getHttp();
        
        $response = $http->post($endpoint, $query, $headers);
        
        $response_arr = json_decode($response->body, true);
        
        $temp = $response_arr['data']['viewer'];
        
        $user_data = array(
            'name' => $temp['name'],
            'email' => $temp['email']
            );
        
        return $user_data;
	}
}