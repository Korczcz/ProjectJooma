<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library;

defined('_JEXEC') or die;

use Joomla\CMS\Factory;
use Joomla\CMS\Router\Route;
use Joomla\CMS\Uri\Uri;
use Joomla\CMS\Language\Text;
use Joomla\CMS\HTML\HTMLHelper;

class TfHtml
{
    // General: simple, text, heading, date, image, link, list, table
    
    // 01. Simple
    public static function simple($text = '', $display = true)
    {
        if ($text == '')
        {
            return;
        }
        
        $output = $text;
        
        return self::action($output, $display);
    }
    
    // 02. Text
    public static function text($text = '', $tag = 'p', $style = '', $display = true)
    {
        if ($text == '')
        {
            return;
        }
        
        $class = $style ? ' class="' . trim($style) . '"' : '';
        
        $output = '<' . $tag . $class . '>';
            $output .= $text;
        $output .= '</' . $tag . '>';
        
        return self::action($output, $display);
    }
    
    // 03. Heading
    public static function heading($text = '', $level = 'h1', $style = '', $display = true)
    {
        if ($text == '')
        {
            return;
        }
        
        return self::text($text, $level, $style, $display);
    }
    
    // 04. Date
    public static function display_date($date, $format = 'F d, Y', $display = true)
    {
        if (empty($date))
        {
            return;
        }
        
        $date_to_format = Factory::getDate($date);
        
        $output = '<p><small class="text-muted"><i class="far fa-calendar-alt"></i> ';
            $output .= $date_to_format->format($format);
        $output .= '</small></p>';
        
        return self::action($output, $display);
    }
    
    // 05. Image
    public static function image($src, $alt = '', $style = '', $display = true)
    {
        if (empty($src))
        {
            return;
        }
        
        $image = HTMLHelper::cleanImageURL($src);
        $image_info = getimagesize($image->url);
        
        if (!$image_info)
        {
            return;
        }
        
        $is_amp = self::check_amp();
        
        if ($is_amp)
        {
            $output = '<amp-img class="img-thumbnail" layout="responsive" width="' . $image_info[0] . '" height="' . $image_info[1] . '"
                title="' . $alt . '" src="' . htmlspecialchars($image->url) . '" alt="' . $alt . '"></amp-img>';
        }
        else
        {
            $class = $style ? ' class="' . trim($style) . '"' : '';
            $title = $alt ? ' title="' . trim($alt) . '"' : '';
            $alt_text = $alt ? ' alt="' . trim($alt) . '"' : '';
            
            $output = '<img' . $class . ' src="' . $image->url . '"' . $title . $alt_text . ' />';
        }
        
        return self::action($output, $display);
    }
    
    // 06A. Link in same window
    public static function display_link($text = '', $url = '#', $style = 'text-decoration-none', $display = true)
    {
        if ($text == '')
        {
            return;
        }
        
        $class = $style ? ' class="' . trim($style) . '"' : '';
        
        $output = '<a' . $class . ' href="' . $url . '" title="' . $text . '">' . $text . '</a>';
        
        return self::action($output, $display);
    }
    
    // 06B. Link in new window
    public static function display_link_new($text = '', $url = '#', $style = 'text-decoration-none', $display = true)
    {
        if ($text == '')
        {
            return;
        }
        
        $class = $style ? ' class="' . trim($style) . '"' : '';
        
        $output = '<a' . $class . ' href="' . $url . '" title="' . $text . '" target="_blank">' . $text . '</a>';
        
        return self::action($output, $display);
    }
    
    // 07. List
    public static function display_list($items, $tag = 'ul', $list_style = '', $item_style = '', $display = true)
    {
        if (empty($items))
        {
            return;
        }
        
        $list_class = $list_style ? ' class="' . trim($list_style) . '"' : '';
        $item_class = $item_style ? ' class="' . trim($item_style) . '"' : '';

        $output = '<' . $tag . $list_class . '>';
        
        foreach ($items as $item)
        {
            $output .= '<li' . $item_class . '>';
                $output .= $item;
            $output .= '</li>';
        }
        
        $output .= '</' . $tag . '>';
        
        return self::action($output, $display);
    }
    
    // 08. Table
    public static function table($items, $style = 'table table-striped table-hover', $theads = array(), $display = true)
    {
        if (empty($items))
        {
            return;
        }
        
        $class = $style ? ' class="' . trim($style) . '"' : '';
        $output = '<table' . $class . '>';
        
        if (!empty($theads))
        {
            $output .= '<thead><tr>';
            foreach ($theads as $thead)
            {
                $output .= '<th scope="col" class="text-start">' . $thead . '</th>';
            }
            $output .= '</tr></thead>';
        }
        
        foreach ($items as $item)
        {
            $output .= '<tr>';
            foreach ($item as $v)
            {
                $output .= '<td>' . $v . '</td>';
            }
            $output .= '</tr>';
        }
        $output .= '</table>';
        
        return self::action($output, $display);
    }
    
// *****************************************************************************
    
    public static function check_amp()
    {
        // Check if AMP is enabled in template option
        $app = Factory::getApplication('site');
        
        $template = $app->getTemplate(true);
        $enable_amp = $template->params->get('enable_amp', 0);
        
        if (!$enable_amp)
        {
            return false;
        }
        
        // Check for v query string in URL
        $uri = Uri::getInstance();
        $v = '';
        if ($uri->hasVar('v'))
        {
            $v = $uri->getVar('v');
        }
        
        if ($v != 'amp')
        {
            return false;
        }
        
        return true;
    }
    
    public static function action($output, $display = true)
    {
        if ($display)
        {
            echo $output;
            
            return true;
        }
        else
        {
            return $output;
        }
    }
}