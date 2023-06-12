<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library\View\Air;

defined('_JEXEC') or die;

use TechFry\Library\View\Html\TfHtml;

class Testimonial
{
    // Image, Title, Designation, Description, Rating
    public static function get_output($item, $config = array())
    {
        // config - image_class, title_head, title_class, designation_class, desc_class, rated_icon_class, unrated_icon_class
        
        $item = (array) $item;
        
        $output = '';
        
        if (!empty($item['image']))
        {
            $output .= TfHtml::get_image($item['image'], $item['title'], array('class' => $config['image_class']));
        }
        
        if (!empty($item['title']))
        {
            $output .= TfHtml::get_heading($item['title'], $config['title_head'], array('class' => $config['title_class']));
        }
        
        if (!empty($item['designation']))
        {
            $output .= TfHtml::get_element($item['designation'], 'p', array('class' => $config['designation_class']));
        }

        if (!empty($item['description']))
        {
            $output .= TfHtml::get_element($item['description'], 'p', array('class' => $config['desc_class']));
        }
        
        if (!empty($item['rating']))
        {
            for ($i = 0; $i < $item['rating']; $i++)
            {
                $output .= Icon::get_output($config['rated_icon_class']);
            }
            for ($i = 5; $i > $item['rating']; $i--)
            {
                $output .= Icon::get_output($config['unrated_icon_class']);
            }
        }
        
        return $output;
    }
}