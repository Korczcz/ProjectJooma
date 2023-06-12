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

class FacebookHelper
{
	// 01. Create url for redirection
	public static function create_url()
	{
	    $client_id = ComponentHelper::getParams('com_tfmail')->get('facebook_client_id');
	    
	    $redirect_uri = Uri::base() . 'index.php?option=com_tfmail&task=subscribe.facebook';
	    
	    $url = 'https://www.facebook.com/dialog/oauth?response_type=code';
	    $url .= '&client_id=' . $client_id;
	    $url .= '&redirect_uri=' . urlencode($redirect_uri);
	    $url .= '&scope=public_profile email';
        
        return $url;
	}
	
	// 02. Get access token from code
	public static function get_token($code)
	{
	    $tokenurl = 'https://graph.facebook.com/oauth/access_token';
	    
	    $client_id = ComponentHelper::getParams('com_tfmail')->get('facebook_client_id');
	    $client_secret = ComponentHelper::getParams('com_tfmail')->get('facebook_client_secret');
	    
	    $redirect_uri = Uri::base() . 'index.php?option=com_tfmail&task=subscribe.facebook';
	    
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
	    $headers = array(
            'Authorization' => 'Bearer ' . $access_token
            );
        
        $http = HttpFactory::getHttp();
        
        $response = $http->get('https://graph.facebook.com/v2.7/me?fields=id,name,email', $headers);
        
        $response_arr = json_decode($response->body, true);
        
        $user_data = array(
            'name' => $response_arr['name'],
            'email' => $response_arr['email']
            );
        
        return $user_data;
	}
}