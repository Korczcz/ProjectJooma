<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library\View\Air;

defined('_JEXEC') or die;

class Icon
{
    public static function get_output($icon, $config = array())
    {
        // config - icon_class
        
        if ($icon == '')
        {
            return;
        }
        
        if (is_object($config))
        {
            $config = (array) $config;
        }
        
        $class = $icon;
        
        $class .= isset($config['icon_class']) ? ' ' . $config['icon_class'] : '';
        
        $output = '<i class="' . $class . '"></i>';
        
        return $output;
    }
}