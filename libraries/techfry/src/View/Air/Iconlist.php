<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library\View\Air;

defined('_JEXEC') or die;

use TechFry\Library\View\Html\TfHtml;

class Iconlist
{
    // Icon List with Optional Links
    public static function get_output($items, $config = array())
    {
        // item - title, icon, url
        // config - icon_class, title_class, list_class, list_item_class
        
        if (!isset($config['list_class']))
        {
            $config['list_class'] = '';
        }
        if (!isset($config['list_item_class']))
        {
            $config['list_item_class'] = '';
        }
        
        $list_items = array();
        
        foreach ($items as $item)
        {
            $item = (array) $item;
            
            $list_item = Icon::get_output($item['icon'], array('icon_class' => $config['icon_class'])) . ' ' . TfHtml::get_span($item['title'], $config['title_class']);
            if (!empty($item['url']))
            {
                $list_item = '<a href="' . $item['url'] . '" target="_blank">' . $list_item  . '</a>';
            }
            
            $list_items[] = $list_item;
        }
        
        $output = TfHtml::get_ul_list($list_items, $config['list_class'], $config['list_item_class']);
        
        return $output;
    }
}