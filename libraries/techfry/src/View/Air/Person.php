<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library\View\Air;

defined('_JEXEC') or die;

use TechFry\Library\View\Html\TfHtml;

class Person
{
    public static $image = '';
    
    public static $name = '';
    
    public static $designation = '';
    
    public static $links = '';
    
    public static $layout = '';
    
    // Name, Designation, Image, Links
    public static function get_output($item, $config = array())
    {
        // item - name, designation, image
        // config - layout, image_class, name_class, designation_class, icon_class
        
        self::$layout = $config['layout'] ?? 1;
        
        $item = (array) $item;
        
        self::$image = TfHtml::get_image($item['image'], $item['name'], array('class' => $config['image_class']));
        
        if (!empty($item['name']))
        {
            self::$name = TfHtml::get_heading($item['name'], 'h3', array('class' => $config['name_class']));
        }
        
        if (!empty($item['designation']))
        {
            self::$designation = TfHtml::get_element($item['designation'], 'p', array('class' => $config['designation_class']));
        }
        
        if (!empty($item['links']))
        {
            $list_options = array(
                'list_class' => 'list-inline',
                'list_item_class' => 'list-inline-item', 
                'icon_class' => $config['icon_class']
                );
            
            self::$links = Iconlist::get_output($item['links'], $list_options);
        }
        
        return self::display();
    }
    
    public static function display()
    {
        $output = '';
        
        switch (self::$layout)
        {
            case 1 :
                $output .= self::$image . self::$name . self::$designation . self::$links;
                break;
                
            case 2 :
                $output .= '<div class="d-flex">';
                $output .= '<div>' . self::$image . '</div>';
                $output .= '<div>' . self::$name . self::$designation . self::$links . '</div>';
                break;
        }
        
        return $output;
    }
}