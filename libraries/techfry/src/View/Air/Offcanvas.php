<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library\View\Air;

defined('_JEXEC') or die;

use Joomla\CMS\Factory;
use TechFry\Library\TfResource;

class Offcanvas
{
    // Title, Body
    public static function get_output($item, $config = array())
    {
        // item - title, body
        // config - offcanvas_id, location

        if (is_object($item))
        {
            $item = (array) $item;
        }
        
        $offcanvas_id = $config['offcanvas_id'];
        
        $output = '<div class="offcanvas offcanvas-end bg-primary" tabindex="-1" id="' . $offcanvas_id . '" aria-labelledby="offcanvas">';
        
            $output .= '<div class="offcanvas-header">';
                if (isset($item['title']) && $item['title'])
                {
                    $output .= '<h5 class="offcanvas-title" id="offcanvasExampleLabel">' . $item['title'] . '</h5>';
                }
                $output .= '<button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"><i class="fa-solid fa-times"></i></button>';
            $output .= '</div>';
            
            $output .= '<div class="offcanvas-body"><div>';
                $output .= $item['body'];
            $output .= '</div></div>';
                
        $output .= '</div>';
        
        // Add Javascript
        $js_url = '/media/techfry/js/offcanvas.js';
        TfResource::add_resource($js_url, 'js');

        return $output;
    }
}