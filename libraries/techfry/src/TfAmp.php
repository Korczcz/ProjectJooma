<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library;

defined('_JEXEC') or die;

use Joomla\CMS\Factory;
use Joomla\CMS\Uri\Uri;
use TechFry\Library\TfResource;

class TfAmp
{
    // 1. Check whether to display amp page or not
    public static function check_amp()
    {
        // Check if AMP is enabled in template options
        $app = Factory::getApplication('site');
        
        $template = $app->getTemplate(true);
        $enable_amp = $template->params->get('enable_amp', 0);
        
        if (!$enable_amp)
        {
            return false;
        }
        
        $v = '';
        
        // First get v from Joomla uri
        $uri = Uri::getInstance();
        if ($uri->hasVar('v'))
        {
            $v = $uri->getVar('v');
        }
        
        // Then, try to get v from PHP server uri
        if (empty($v))
        {
            $server_uri = $app->input->server->get('REQUEST_URI', '', 'RAW');
            $str = parse_url($server_uri, PHP_URL_QUERY);
          	if ($str)
            {
            	parse_str($str, $output);
            
            	$v = $output['v'] ?? '';  
            }
        }
        
        if ($v != 'amp')
        {
            return false;
        }
        
        return true;
    }
    
    // 2. Get Amp url
    public static function get_amp_url()
    {
        $uri = Uri::getInstance();
        
        $amp_url = strpos($uri, '?') ? $uri . '&v=amp' : $uri . '?v=amp';
        
        return $amp_url;
    }
}