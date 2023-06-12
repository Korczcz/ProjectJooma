<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library\View\Air;

defined('_JEXEC') or die;

class Plain
{
    public static $fw;
  
  	// Alternative to accordion or tabs
    public static function get_output($items, $config = array(), $fw = 'bs')
    {
        // config - show_heading
      
      	if (empty($items))
        {
        	return;  
        }
      
      	$show_heading = (isset($config['show_heading']) && !$config['show_heading']) ? 0 : 1;
        
        $output = '';
        
        foreach ($items as $item)
        {
            if ($show_heading)
            {
            	$output .= '<h3>' . $item[0] . '</h3>';
            }
          	
            $output .= $item[1];
        }
        
        return $output;
    }
}