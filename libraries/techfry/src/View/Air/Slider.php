<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library\View\Air;

defined('_JEXEC') or die;

use Joomla\CMS\Factory;
use TechFry\Library\TfResource;

class Slider
{
    // Swiper - https://swiperjs.com/
    public static function get_output($items, $config = array())
    {
        // items - array
        // config - controls, effect, loop, slides_per_view, space_between, pagination, auto_play
        
        if (empty($items))
        {
            return;
        }
        
        $auto_play = $config['auto_play'] ? 'autoplay: {delay: ' . $config['auto_play'] . ',},' : '';
        
        $output = '<div class="swiper">';
        
            // Items
            $output .= '<div class="swiper-wrapper">';
                foreach ($items as $i => $item)
                {
                    $output .= '<div class="swiper-slide">';
                        
                        $output .= $item;
                        
                    $output .= '</div>';
                }
            $output .= '</div>';
            
            // Pagination
            if ($config['pagination'])
            {
                $output .= '<div class="swiper-pagination"></div>';
            }
            
            // Navigation buttons
            if ($config['controls'])
            {
                $output .= '<div class="swiper-button-prev"></div>';
                $output .= '<div class="swiper-button-next"></div>';
            }
            
            // Scrollbar
            if ($config['pagination'] == 'progressbar')
            {
                $output .= '<div class="swiper-scrollbar"></div>';
            }
            
        $output .= '</div>';
        
        // Add css and javascript files
        $css_url = 'https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css';
        $js_url = 'https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js';
        
        TfResource::add_resource($css_url, 'css');
        
        TfResource::add_resource($js_url, 'js', array());
        
        // Add javascript
        $script = 'const swiper = new Swiper(\'.swiper\', {
                  direction: \'horizontal\',
                  loop: \'' . $config['loop'] . '\',
                  effect: \'' . $config['effect'] . '\',
                  slidesPerView: ' . $config['slides_per_view'] . ',
                  spaceBetween: ' . $config['space_between'] . ',
                
                  pagination: {
                    el: \'.swiper-pagination\',
                    type: \'' . $config['pagination'] . '\',
                  },
                
                  navigation: {
                    nextEl: \'.swiper-button-next\',
                    prevEl: \'.swiper-button-prev\',
                  },
                
                  scrollbar: {
                    el: \'.swiper-scrollbar\',
                  },'
                  
                  . $auto_play . '
                });';
                    
        // Run script after HTML code
        $output .= '<script>' . $script . '</script>';
        
        return $output;
    }
}