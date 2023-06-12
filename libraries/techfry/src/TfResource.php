<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library;

defined('_JEXEC') or die;

use Joomla\CMS\Factory;

class TfResource
{
    // 01.
  	public static function add_resources($resources = array())
    {
        if (!is_array($resources))
        {
            return;
        }
        
        foreach ($resources as $resource)
        {
            switch ($resource)
            {
              	case 'fa' :
              		$url = 'https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css';
                    $type = 'css';
                    break;
                
              	case 'bs_css' :
                    $url = 'https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css';
                    $type = 'css';
                    break;
                    
                case 'bs_js' :
                    $url = 'https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js';
                    $type = 'js';
                    break;
                
                case 'uk_css' :
                    $url = 'https://cdn.jsdelivr.net/npm/uikit@3.15.20/dist/css/uikit.min.css';
                    $type = 'css';
                    break;
                    
                case 'uk_js' :
                    $url = 'https://cdn.jsdelivr.net/npm/uikit@3.15.20/dist/js/uikit.min.js';
                    $type = 'js';
                    break;
                
              	case 'fn_css' :
                  	$url = 'https://cdn.jsdelivr.net/npm/foundation-sites@6.7.5/dist/css/foundation.min.css';
                	$type = 'css';
                	break;
                
                case 'fn_js' :
                    $url = 'https://cdn.jsdelivr.net/npm/foundation-sites@6.7.5/dist/js/foundation.min.js';
                    $type = 'js';
                    break;
                
                case 'md_css' :
                  	$url = 'https://unpkg.com/material-components-web@latest/dist/material-components-web.min.css';
                	$type = 'css';
                	break;
                
                case 'md_js' :
                    $url = 'https://unpkg.com/material-components-web@latest/dist/material-components-web.min.js';
                    $type = 'js';
                    break;
                
                case 'air_animation_css' :
                    $url = '/media/techfry/css/animation.css';
                    $type = 'css';
                    break;
            }
            
            self::add_resource($url, $type);
        }
    }
    
  	// 02.
    public static function add_resource($resource_url, $type = 'css', $attribs = array('defer' => 'defer'))
    {
        $document = Factory::getDocument();
        
        if ($type == 'css')
        {
            $document->addStyleSheet($resource_url);
        }
        elseif ($type == 'js')
        {
            $document->addScript($resource_url, array(), $attribs);
        }
    }
  
  	// 03. Include inline css
  	public static function add_inline_css($css_code)
    {
      	$document = Factory::getDocument();
      
    	$document->addStyleDeclaration($css_code);
    }
  
  	// 04. Include inline Script
  	public static function add_script($script_code)
    {
      	$document = Factory::getDocument();
      
    	$document->addScriptDeclaration($script_code);
    }
}