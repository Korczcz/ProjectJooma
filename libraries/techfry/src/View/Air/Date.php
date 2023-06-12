<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library\View\Air;

defined('_JEXEC') or die;

use Joomla\CMS\Factory;
use Joomla\CMS\HTML\HTMLHelper;
use TechFry\Library\View\Html\TfHtml;

class Date
{
    public static function get_output($date, $config = array('format' => 'F d, Y', 'relative' => false))
    {
        if (empty($date))
        {
            return;
        }
        
        $date_to_format = Factory::getDate($date);
        
        $output = '<p><small class="text-muted"><i class="far fa-calendar-alt"></i> ';
      		if ($config['relative'])
            {
            	$output .= HTMLHelper::_('date.relative', $date);
            }
      		else
            {
            	$output .= $date_to_format->format($config['format']);  
            }
        $output .= '</small></p>';
        
        return $output;
    }
  
  	public static function get_format($date, $format = 'F d, Y')
    {
        if (empty($date))
        {
            return;
        }
        
        $date_to_format = Factory::getDate($date);
        
        $output = '';
      
       	$output .= $date_to_format->format($format);
        
        return $output;
    }
}