<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library\View\Others;

defined('_JEXEC') or die;

use TechFry\Library\TfResource;

class Aos
{
    // Reference: https://michalsnik.github.io/aos/
    public static function get_output($content = '', $config = array())
    {
        $output = '<script>AOS.init();</script>';
        
        // Add CSS and Javascript
        $css_url = 'https://unpkg.com/aos@2.3.1/dist/aos.css';
        $js_url = 'https://unpkg.com/aos@2.3.1/dist/aos.js';
        
        TfResource::add_resource($css_url, 'css');
        
        TfResource::add_resource($js_url, 'js', array());
        
        return $output;
    }
}