<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library\View\Air;

defined('_JEXEC') or die;

use TechFry\Library\View\Html\TfHtml;

class Overlay
{
    public static function get_output($content, $config = array())
    {
        // item - image, description 
        // config - image_class, desc_class, location
        
        if (empty($content))
        {
            return;
        }
        
        if (!is_array($content))
        {
            $content = (array) $content;
        }
        
        $image_class = $config['image_class'] ?? '';
        $desc_class = 'position-absolute ' . $config['location'] . ' ' . $config['desc_class'];
        
        
        $output .= '<div class="position-relative">';
            $output .= TfHtml::get_image($content['image'], '', array('class' => $image_class));
        
            $output .= '<div class="' . $desc_class . '">';
                $output .= $content['description'];
            $output .= '</div>';
        $output .= '</div>';
        
        return $output;
    }
}