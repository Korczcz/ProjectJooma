<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library\View\Others;

defined('_JEXEC') or die;

use TechFry\Library\TfResource;
use TechFry\Library\View\Html\TfHtml;

class Map
{
    // Open Street Map and Leaflet JS - Latitude, Longitude, Marker Text
    public static function get_output($item, $config = array())
    {
        // item - latitude, longitude
        // config - height, zoom
        
        if (empty($item))
        {
            // return;
        }
        
        $output = '<div id="map" style="height:' . $config['height'] . 'px"></div>';
        
        $script = 'var map = L.map(\'map\').setView([' . $item['latitude'] . ', ' . $item['longitude'] . '], ' . $config['zoom'] . ');';
        $script .= 'L.tileLayer(\'https://tile.openstreetmap.org/{z}/{x}/{y}.png\', {
                        maxZoom: 19,
                        attribution: \'&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>\'
                    }).addTo(map);';
        $script .= 'var marker = L.marker([' . $item['latitude'] . ', ' . $item['longitude'] . ']).addTo(map);';
        
        $output .= TfHtml::get_js($script);
        
		// Add CSS and Javascript
        $css_url = 'https://unpkg.com/leaflet@1.9.2/dist/leaflet.css';
        
        $js_url = 'https://unpkg.com/leaflet@1.9.2/dist/leaflet.js';
        
        TfResource::add_resource($css_url, 'css');
        
        TfResource::add_resource($js_url, 'js', array());

		return $output;
    }
}