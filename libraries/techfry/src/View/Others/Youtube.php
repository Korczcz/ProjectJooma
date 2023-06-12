<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library\View\Others;

defined('_JEXEC') or die;

class Youtube
{
    public static function get_output($video_id, $config = array())
    {
        // config - size, width, height
        
        if ($video_id == '')
        {
            return;
        }
        
        $width_height_atts = ($config['size'] == 'fixed') ? 'width="' . $config['width'] . '" height="' . $config['height'] . '"' : '';
        unset($config['size']);
        unset($config['width']);
        unset($config['height']);
        
        $query = $video_id . '?' . http_build_query($config);
        $autoplay_att = $config['autoplay'] ? ' allow="autoplay; encrypted-media"' : '';
        
        $output = '<iframe ' . $width_height_atts . ' src="https://www.youtube.com/embed/' . $query .'" frameborder="0"' . $autoplay_att . ' allowfullscreen></iframe>';
        
        if ($size == 'responsive')
        {
            $output = '<div class="embed-responsive">' . $output . '</div>';
        }
        
        return $output;
    }
}