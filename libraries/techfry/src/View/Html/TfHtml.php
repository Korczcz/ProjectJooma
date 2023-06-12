<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library\View\Html;

defined('_JEXEC') or die;

use Joomla\CMS\HTML\HTMLHelper;

class TfHtml
{
    public static function get_doctype()
    {
        $output = '<!doctype html>';
        
        return $output;
    }
    
    public static function get_html_open($lang = '', $is_amp = false, $doctype = true)
    {
        $output = '';
        
        if ($doctype)
        {
            $output .= self::get_doctype() . "\n";
        }
        
        $output .= '<html';
        
        if ($is_amp)
        {
            $output .= ' amp';    
        }
        
        if (!empty($lang))
        {
            $output .= ' lang="' . $lang . '"';
        }
        
        $output .= '>' . "\n";
        
        return $output;
    }
    
    public static function get_element($content, $tag = 'p', $attribs = array())
    {
        if ($content == '')
        {
            return;
        }
        
        $attributes = '';
        
        if (!empty($attribs))
        {
            foreach ($attribs as $k => $v)
            {
                if ($v != '')
                {
                    $attributes .= ' ' . $k . '=' . '"' . $v . '"';
                }
              	else // boolean attribute
                {
                	$attributes .= ' ' . $k;  
                }
            }
        }
        
        $output = '<' . $tag . $attributes . '>';
            $output .= $content;
        $output .= '</' . $tag . '>';
        
        return $output;
    }
    
    public static function get_open_tag($tag, $attribs = array())
    {
        $attributes = '';
        
        if (!empty($attribs))
        {
            foreach ($attribs as $k => $v)
            {
                $attributes .= ' ' . $k . '=' . '"' . $v . '"';
            }
        }
        
        $output = '<' . $tag . $attributes . '>' . "\n";
        
        return $output;
    }
    
    public static function get_heading($text, $level = 'h1', $attribs = array())
    {
        return self::get_element($text, $level, $attribs);
    }
    
    public static function get_link($text, $href = '#', $attribs = array())
    {
        $array = array(
            'href' => $href,
            'title' => $text
            );
        
        $attribs = array_merge($array, $attribs);
        
        return self::get_element($text, 'a', $attribs);
    }
    
    public static function get_image($src, $alt, $attribs = array())
    {
        if ($src == '')
        {
            return;
        }
      
      	// For Absolute URLs
      	if (isset(parse_url($src)['host']))
        {
        	$image_url = $src;	
        }
      	else
        {
        	$image = HTMLHelper::cleanImageURL($src);
        	$image_url = $image->url;
          	$src = '/' . $image_url;
        }
      
      	$image_info = getimagesize($image_url);  
        
        if (!$image_info)
        {
            return;
        }

        $array = array(
            'src' => $src,
            'alt' => $alt
            );
            
        $attribs = array_merge($array, $attribs);
        
        return self::get_open_tag('img', $attribs);
    }
    
    public static function get_table($rows = array(), $style = '', $theads = array())
    {
        if (empty($rows))
        {
            return;
        }
        
        $class = $style ? ' class="' . $style . '"' : '';
        
        $output = '<table' . $class . '>';
        
        if (!empty($theads))
        {
            $output .= '<thead><tr>';
            foreach ($theads as $thead)
            {
                $output .= '<th>' . $thead . '</th>';
            }
            $output .= '</tr></thead>';
        }
        
        foreach ($rows as $row)
        {
            $output .= '<tr>';
          		$row = is_array($row) ? $row : (array) $row;
                foreach ($row as $col)
                {
                    $output .= '<td>' . $col . '</td>';
                }
            $output .= '</tr>';
        }
        
        $output .= '</table>';
        
        return $output;
    }
    
    public static function get_ul_list($items, $list_style = '', $item_style = '')
    {
        if (empty($items))
        {
            return;
        }
        
        $list_class = $list_style ? ' class="' . trim($list_style) . '"' : '';
        
        $item_class = $item_style ? ' class="' . trim($item_style) . '"' : '';

        $output = '<ul'. $list_class . '>';
        
        foreach ($items as $item)
        {
            $output .= '<li' . $item_class . '>';
                $output .= $item;
            $output .= '</li>';
        }
        
        $output .= '</ul>';
        
        return $output;
    }
    
    public static function get_ol_list($items, $list_style = '', $item_style = '')
    {
        if (empty($items))
        {
            return;
        }
        
        $list_class = $list_style ? ' class="' . trim($list_style) . '"' : '';
        
        $item_class = $item_style ? ' class="' . trim($item_style) . '"' : '';

        $output = '<ol'. $list_class . '>';
        
        foreach ($items as $item)
        {
            $output .= '<li' . $item_class . '>';
                $output .= $item;
            $output .= '</li>';
        }
        
        $output .= '</ol>';
        
        return $output;
    }
    
    public static function get_div($content, $class = '')
    {
        return self::get_element($content, 'div', array('class' => $class));
    }
    
    public static function get_span($content, $class = '')
    {
        return self::get_element($content, 'span', array('class' => $class));
    }
    
    public static function get_title($title)
    {
        return self::get_element($title, 'title');
    }
    
    public static function get_favicon($href = '')
    {
        if (empty($href))
        {
            return;
        }
        
        $attribs = array(
            'rel' => 'icon',
            'type' => 'image/x-icon',
            'href' => $href
            );
        
        return self::get_open_tag('link', $attribs);
    }
    
    public static function get_stylesheet($href = '')
    {
        if (empty($href))
        {
            return;
        }
        
        $attribs = array(
            'rel' => 'stylesheet',
            'type' => 'text/css',
            'href' => $href
            );
        
        return self::get_open_tag('link', $attribs);
    }
    
    public static function get_js($code)
    {
        $output = '<script>';
        
            $output .= $code;
            
        $output .= '</script>';
        
        return $output;
    }
    
    public static function get_style($code)
    {
        $output = '<style>';
        
            $output .= $code;
            
        $output .= '</style>';
        
        return $output;
    }
    
    public static function get_css($selector, $defs = array())
    {
        $output = $selector . ' {';
        
        if (!empty($defs))
        {
            foreach ($defs as $k => $v)
            {
                $output .= $k . ':' . $v . ';';    
            }
        }
        
        $output .= '}';
        
        return $output;
    }
    
    public static function get_meta($name, $content)
    {
        $attribs = array(
            'name' => $name,
            'content' => $content
            );
        
        return self::get_open_tag('meta', $attribs);
    }
    
    public static function get_responsive()
    {
        return self::get_meta('viewport', 'width=device-width, initial-scale=1.0');
    }
    
    public static function get_charset($charset = 'UTF-8')
    {
        return self::get_open_tag('meta', array('charset' => $charset));
    }
}