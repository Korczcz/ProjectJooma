<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library\View\Others;

defined('_JEXEC') or die;

class Qrcode
{
    // Reference: https://quickchart.io/documentation/#qr
    public static function get_output($content, $config = array())
    {
        if (empty($content))
        {
            return;
        }
        
        $url = 'https://quickchart.io/qr?text=' . $content;
        
        $output = '<img src="' . $url . '">';
        
        return $output;
    }
}