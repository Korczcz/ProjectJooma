<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library\View\Air;

defined('_JEXEC') or die;

use TechFry\Library\View\Html\TfHtml;

class Clients
{
    // Image, Title, Subtitle, Description, Button
    public static function get_output($items = array(), $config = array())
    {
        // items - image, title, url
        // config - image_class, title_class
        
        if (empty($items))
        {
            return;
        }
        
        $output = '<div class="d-flex justify-content-between">';
        
        foreach ($items as $item)
        {
            $output .= TfHtml::get_image($item['image'], $item['title'], array('class' => $config['image_class']));
        }
        
        $output .= '</div>';
        /*
        $output = TfHtml::get_image($item['image'], $item['title'], array('class' => $config['image_class']));
        
        if (!empty($item['title']))
        {
            $output .= TfHtml::get_heading($item['title'], 'h3', array('class' => $config['title_class']));
        }
        
        if (!empty($item['subtitle']))
        {
            $output .= TfHtml::get_element($item['subtitle'], 'p', array('class' => $config['subtitle_class']));
        }
        
        if (!empty($item['description']))
        {
            $output .= TfHtml::get_element($item['description'], 'p', array('class' => $config['desc_class']));
        }
        
        if (!empty($item['url']))
        {
            $output .= Button::get_output($config['button_text'], array('button_class' => $config['button_class']), array('url' => $item['url']));
        }
        */
        return $output;
    }
}