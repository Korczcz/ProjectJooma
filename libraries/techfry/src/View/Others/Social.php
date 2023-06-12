<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library\View\Others;

defined('_JEXEC') or die;

use Joomla\CMS\Uri\Uri;
use Joomla\CMS\Language\Text;

class Social
{
    public static function get_output($channels, $config = array())
    {
        // config
        
        if (empty($channels))
        {
            return;
        }
        
        $uri = Uri::getInstance();
		$current_url = $uri->toString();
        
        $output  = '';
        
		$output .= '<ul class="list-inline">';

		if (\in_array('facebook', $channels)) 
		{
			$output .= '<li>';
			$output .= '<a onClick="window.open(\'http://www.facebook.com/sharer.php?u=' . $current_url . '\',\'Facebook\',\'width=600,height=300,left=\'+(screen.availWidth/2-300)+\',top=\'+(screen.availHeight/2-150)+\'\'); return false;" href="http://www.facebook.com/sharer.php?u=' . $current_url . '">';
			$output .= '<i class="fab fa-facebook-f" aria-hidden="true"></i>';
			if ($show_social_names) 
			{
				$output .= '<span>' . Text::_('COM_TFPAGEBUILDER_SOCIALSHARE_FACEBOOK') . '</span>';
			}
			$output .= '</a>';
			$output .= '</li>';
		}

		if (\in_array('twitter', $channels)) 
		{
			$output .= '<li>';
			$output .= '<a onClick="window.open(\'http://twitter.com/share?url=' . urlencode($current_url) . '&amp;text=' . str_replace(" ", "%20", $page_title) . '\',\'Twitter share\',\'width=600,height=300,left=\'+(screen.availWidth/2-300)+\',top=\'+(screen.availHeight/2-150)+\'\'); return false;" href="http://twitter.com/share?url=' . $current_url . '&amp;text=' . str_replace(" ", "%20", $page_title) . '">';
			$output .= '<i class="fab fa-twitter" aria-hidden="true"></i>';
			if ($show_social_names) 
			{
				$output .= '<span>' . Text::_('COM_TFPAGEBUILDER_SOCIALSHARE_TWITTER') . '</span>';
			}
			$output .= '</a>';
			$output .= '</li>';
		}

		if (\in_array('linkedin', $channels)) 
		{
			$output .= '<li>';
			$output .= '<a onClick="window.open(\'http://www.linkedin.com/shareArticle?mini=true&url=' . $current_url . '\',\'Linkedin\',\'width=585,height=666,left=\'+(screen.availWidth/2-292)+\',top=\'+(screen.availHeight/2-333)+\'\'); return false;" href="http://www.linkedin.com/shareArticle?mini=true&url=' . $current_url . '" >';
			$output .= '<i class="fab fa-linkedin" aria-hidden="true"></i>';
			if ($show_social_names) 
			{
				$output .= '<span>' . Text::_('COM_TFPAGEBUILDER_SOCIALSHARE_LINKEDIN') . '</span>';
			}
			$output .= '</a>';
			$output .= '</li>';
		}

		if (in_array('pinterest', $channels)) 
		{
			$output .= '<li>';
			$output .= '<a onClick="window.open(\'http://pinterest.com/pin/create/button/?url=' . $current_url . '&amp;description=' . $page_title . '\',\'Pinterest\',\'width=585,height=666,left=\'+(screen.availWidth/2-292)+\',top=\'+(screen.availHeight/2-333)+\'\'); return false;" href="http://pinterest.com/pin/create/button/?url=' . $current_url . '&amp;description=' . $page_title . '" >';
			$output .= '<i class="fab fa-pinterest" aria-hidden="true"></i>';
			if ($show_social_names == 1)
			{
				$output .= '<span>' . Text::_('COM_TFPAGEBUILDER_SOCIALSHARE_PINTEREST') . '</span>';
			}
			$output .= '</a>';
			$output .= '</li>';
		}

		if (in_array('whatsapp', $channels)) 
		{
			$output .= '<li>';
			$output .= '<a href="whatsapp://send?text=' . $current_url . '" >';
			$output .= '<i class="fab fa-whatsapp" aria-hidden="true"></i>';
			if ($show_social_names == 1) 
			{
				$output .= '<span>' . Text::_('COM_TFPAGEBUILDER_SOCIALSHARE_WHATSAPP') . '</span>';
			}
			$output .= '</a>';
			$output .= '</li>';
		}

		$output .= '</ul>';

		return $output;
    }
}