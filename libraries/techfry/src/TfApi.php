<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library;

defined('_JEXEC') or die;

use Joomla\CMS\Factory;
use Joomla\Uri\Uri;
use Joomla\CMS\Http\HttpFactory;

// Script for API

class TfApi
{
    public static function curl($url, $options = array(), $post_fields = array())
    {
        $ch = curl_init();
        
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        
        // Set options
        foreach ($options as $k => $v)
        {
            curl_setopt($ch, $k, $v);
        }
        
        // Post Fields
        if (!empty($post_fields))
        {
            curl_setopt($ch, CURLOPT_POST, true);
            curl_setopt($ch, CURLOPT_POSTFIELDS, $post_fields);
        }

        $data = curl_exec($ch);
        
        // Curl errors
        if ($e = curl_error($ch)) 
        {
            echo 'Curl Error: ';
            print_r($e);
        }
        
        // Curl Info - url, content_type, http_code
        $info = curl_getinfo($ch);
        
        curl_close($ch);
    
        return $data;
    }
  
  	public static function curl_get($url, $headers = array())
    {
     	$http = HttpFactory::getHttp();
      	$http->setOption(CURLOPT_HTTP_VERSION, CURL_HTTP_VERSION_1_1);
        $response = $http->get($url, $headers);
      	
      	return $response;
    }
    
    public static function curl_post($url, $data = array(), $headers = array(), $send_as = '')
    {      
      	// Data can be sent as json string or query string
        if ($send_as == 'json')
        {
            $post_data = json_encode($data);
        }
        elseif ($send_as == 'query')
        {
           $post_data = http_build_query($data);
        }
      	else
        {
        	$post_data = $data;  
        }
      
      	$http = HttpFactory::getHttp();
      	$http->setOption(CURLOPT_HTTP_VERSION, CURL_HTTP_VERSION_1_1);
        $response = $http->post($url, $post_data, $headers);

        return $response;
    }
    
    // Create URL for OAuth2 authentication
    public static function create_url($options = array())
	{
		if (!$options['authurl'] || !$options['clientid'])
		{
			Factory::getApplication()->enqueueMessage('Authorization URL and client_id are required');
			
			return false;
		}

		$url = new Uri($options['authurl']);
		$url->setVar('response_type', 'code');
		$url->setVar('client_id', urlencode($options['clientid']));

		if ($redirect = $options['redirecturi'])
		{
			$url->setVar('redirect_uri', urlencode($redirect));
		}

		if ($scope = $options['scope'])
		{
			$scope = \is_array($scope) ? implode(' ', $scope) : $scope;
			$url->setVar('scope', urlencode($scope));
		}

		if ($state = $options['state'])
		{
			$url->setVar('state', urlencode($state));
		}

		if (\is_array($options['requestparams']))
		{
			foreach ($options['requestparams'] as $key => $value)
			{
				$url->setVar($key, urlencode($value));
			}
		}

		return (string) $url;
	}
	
	public static function get_access_token($options = array(), $code = null)
	{
	    if (!$code)
	    {
	        $code = Factory::getApplication()->input->get('code', false, 'raw');
	    }
	    
	    $data = array(
            'code' => $code,
            'client_id' => $options['clientid'],
            'client_secret' => $options['clientsecret'],
            'redirect_uri' => $options['redirecturi'],
            'grant_type' => 'authorization_code'
            );
	    
	    $http = HttpFactory::getHttp();
	    
	    $response = $http->post($options['tokenurl'], $data, $options['headers']);
	    
	    $token = array_merge(json_decode($response->body, true), ['created' => time()]);
	    
	    /*
	    if (strpos($response->headers['Content-Type'], 'application/json') !== false)
		{
			$token = array_merge(json_decode($response->body, true), ['created' => time()]);
		}
		else
		{
			parse_str($response->body, $token);
			$token = array_merge($token, ['created' => time()]);
		}
		*/
	    
	    return $token;
	}
    
}