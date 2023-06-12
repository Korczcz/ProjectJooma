<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library\View\Others;

defined('_JEXEC') or die;

class Graphviz
{
    // Reference: https://quickchart.io/documentation/graphviz-api/
    public static function get_output($content, $config = array())
    {
        // content
        
        if (empty($content))
        {
            return;
        }
        
        $url = 'https://quickchart.io/graphviz?graph=digraph{' . $content . '}';
        
        $output = '<img src="' . $url . '">';
        
        return $output;
    }
}