<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library\View\Air;

defined('_JEXEC') or die;

class Countdown
{
    // Countdown
    public static function get_output($content, $properties = array(), $config = array())
    {
        // Content - countdown_date, finished_text
        // Properties - 
        // Config -
        
        if (empty($content))
        {
            return;
        }
        
        if (!is_array($content))
        {
            $content = (array) $content;
        }
        
        $output .= '<div class="countdown text-center d-flex justify-content-center"></div>';
        
        // Javascript
        $output .= self::js($content['countdown_date'], $content['finished_text']);
        
        return $output;
    }
    
    private static function js($date, $finished_text)
    {
        $output = '';
        
        $output .= '<script>';
        $output .= 'const countdown = document.querySelector(\'.countdown\');';
        $output .= 'const launchDate = new Date(\'' . $date . '\').getTime();';
        
        $output .= 'const intvl = setInterval(() => {const now = new Date().getTime();const distance = launchDate - now;';
        
        $output .= 'const days = Math.floor(distance / (1000 * 60 * 60 * 24));';
        $output .= 'const hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));';
        $output .= 'const mins = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));';
        $output .= 'const seconds = Math.floor((distance % (1000 * 60)) / 1000);';
        
        $output .= 'console.log(seconds);';
        
        $output .= 'countdown.innerHTML = `
                      <div class="p-3 m-3 border fs-3">${days}<span class="d-block fs-6">Days</span></div>
                      <div class="p-3 m-3 border fs-3">${hours}<span class="d-block fs-6">Hours</span></div>
                      <div class="p-3 m-3 border fs-3">${mins}<span class="d-block fs-6">Minutes</span></div>
                      <div class="p-3 m-3 border fs-3">${seconds}<span class="d-block fs-6">Seconds</span></div>
                      `;';
                      
        $output .= 'if (distance < 0) {clearInterval(intvl);countdown.innerHTML = \'' . $finished_text . '\';}';
        
        $output .= '}, 1000);';
        
        $output .= '</script>';
        
        return $output;
    }
}