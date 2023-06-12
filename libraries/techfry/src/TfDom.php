<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library;

defined('_JEXEC') or die;

use Joomla\CMS\Factory;

class TfDom
{
    public static function get_dom($code, $source_type = 'html')
    {
        $dom = new \domDocument;
      
      	if ($source_type == 'html')
        {
        	$code = mb_convert_encoding($code, "HTML-ENTITIES", 'UTF-8');
        
        	$dom->preserveWhiteSpace = false;
        	$dom->loadHTML($code, LIBXML_HTML_NOIMPLIED | LIBXML_HTML_NODEFDTD);  
        }
      	elseif ($source_type == 'xml')
        {
        	$dom->loadXML($code);  
        }
        
        return $dom;
    }
    
    // 01. Method to get array of HTML elements
    public static function get_html($html, $tag, $attr_name = '', $attr_value = '', $elem_value = '', $source_type = 'html')
    {
        $dom = self::get_dom($html, $source_type);
        
        $xpath = new \DOMXpath($dom);
      	$q = '//' . $tag;
      	if ($attr_name)
        {
        	$q .= '[@' . $attr_name;
          	if ($attr_value)
            {
            	$q .= '="' . $attr_value . '"';
            }
          	$q .= ']';
        }

      	$contents = $xpath->query($q);
      
        if ($contents->length == 0)
        { 
            return false;
        }
        
        foreach ($contents as $content)
        {
	        if (!$elem_value || strpos($content->nodeValue, $elem_value) !== false)
            {
            	$html_arr[] = $dom->saveHTML($content);  
            }
        }
        
        return $html_arr;
    }
    
    // 02. Method to get array of element values
    public static function get_value($code, $tag, $attr_name = '', $attr_value = '', $elem_value = '', $source_type = 'html')
    {
        $dom = self::get_dom($code, $source_type);
      
      	$xpath = new \DOMXpath($dom);
      	$q = '//' . $tag;
      	if ($attr_name)
        {
        	$q .= '[@' . $attr_name;
          	if ($attr_value)
            {
            	$q .= '="' . $attr_value . '"';
            }
          	$q .= ']';
        }
      
      	$contents = $xpath->query($q);
      	
        if ($contents->length == 0)
        { 
            return false;
        }
        
        foreach ($contents as $content)
        {
            if (!$elem_value || strpos($content->nodeValue, $elem_value) !== false)
            {
          		$values[] = $content->nodeValue;
            }
        }
        
        return $values;
    }
            
    // 03. Method to get array of attribute values
    public static function get_attr($code, $tag, $target, $attr_name = '', $attr_value = '', $elem_value = '', $source_type = 'html')
    {
        $dom = self::get_dom($code, $source_type);
        
        $xpath = new \DOMXpath($dom);
      	$q = '//' . $tag;
      	if ($attr_name)
        {
        	$q .= '[@' . $attr_name;
          	if ($attr_value)
            {
            	$q .= '="' . $attr_value . '"';
            }
          	$q .= ']';
        }
      
      	$contents = $xpath->query($q);
        
        if ($contents->length == 0)
        {
            return false;
        }
        
        foreach ($contents as $content)
        {
            if (!$elem_value || strpos($content->nodeValue, $elem_value) !== false)
            {
            	$attr_values[] = $content->getAttribute($target);  
            }
        }
        
        return $attr_values;
    }
    
    // 04. Function to remove all attributes from HTML except some
	public static function rem_attr($html, $noremove = array())
	{
        $dom = self::get_dom($html);
        
        $xpath = new \DOMXPath($dom);
        $nodes = $xpath->query('//@*');
        
        foreach ($nodes as $node)
        {
            if (!in_array($node->nodeName, $noremove))
            {
                $node->parentNode->removeAttribute($node->nodeName);
            }
        }
        
        return $dom->saveHTML();
	}
	        
	// 05. Function to add attribute to specific tag
	public static function add_attr($html, $tag, $attr, $attr_value)
    {
        $dom = self::get_dom($html);
	    
        $nodes = $dom->getElementsByTagName($tag);
        
        if (is_array($attr_value))
        {
            foreach ($nodes as $k => $node)
            {   
                $node->setAttribute($attr, $attr_value[$k]);
            }
        }
        else
        {
            foreach ($nodes as $node)
            {   
                $node->setAttribute($attr, $attr_value);
            }
        }
        
        return $dom->saveHTML();
	}
            
    // 06. Function to remove complete element
	public static function rem_element($html, $tag, $attr = null, $attr_value = null)
	{
        $dom = self::get_dom($html);
        
        $list = $dom->getElementsByTagName($tag);
        
        for ($i = $list->length; --$i >= 0;)
        {
            $node = $list->item($i);
            
            if ($attr != null)
            {
                if ($node->getAttribute($attr) == $attr_value)
                {
                    $node->parentNode->removeChild($node);
                }
            }
            elseif ($attr == null)
            {
                $node->parentNode->removeChild($node);
            }
        }

        return $dom->saveHTML();
    }
	
	// 07. Scan - Method to return array of names of unique tags in html or xml
	public static function get_tags($code, $source_type = 'html')
	{
	    $dom = self::get_dom($code, $source_type);
      
      	$xpath = new \DOMXpath($dom);
      	
	    // $elements = $dom->getElementsByTagName('*');
      	$elements = $xpath->query('//*');
      
	    $tag_names[] = array();
	    
	    foreach ($elements as $element)
	    {
	    	if (!array_key_exists($element->tagName, $tag_names))
	        {
              	$tag_names[$element->tagName]['tag_name'] = $element->tagName;
              	$tag_names[$element->tagName]['total'] = 1;
              	$tag_names[$element->tagName]['with_attr'] = 0;
              	if ($element->attributes->length)
                {
                	$tag_names[$element->tagName]['with_attr']++;  
                }
	        }
          	else
          	{
              	$tag_names[$element->tagName]['total']++;
              	if ($element->attributes->length)
                {
                	$tag_names[$element->tagName]['with_attr']++;  
                }
          	}
	    }
	    
	    return $tag_names;
	}
  	
  	// 08. Scan for specific html or xml tag
  	public static function tag_scan($code, $tag, $attr_name = '', $attr_value = '', $value = '', $source_type = 'html')
	{
	    $dom = self::get_dom($code, $source_type);
      
      	$xpath = new \DOMXpath($dom);
      	$q = '//' . $tag;
      	if ($attr_name)
        {
        	$q .= '[@' . $attr_name;
          	if ($attr_value)
            {
            	$q .= '="' . $attr_value . '"';
            }
          	$q .= ']';
        }
      
      	$elements = $xpath->query($q);
      	
		Factory::getApplication()->enqueueMessage('XPath: ' . $q);
      
	    $info[] = array();
	    foreach ($elements as $i => $element)
	    {
         	if (!$value || strpos($element->nodeValue, $value) !== false)
            {
          		if ($element->attributes->length)
                {
                    $info[$i]['attributes'] = $element->attributes->length;
                    for ($num = 0; $num < $element->attributes->length; $num++)
                    {
                        $info[$i]['attr_names'] .= '<small>';
                      	$info[$i]['attr_names'] .= $element->attributes->item($num)->nodeName . '=' . $element->attributes->item($num)->nodeValue . '<br>';
                      	$info[$i]['attr_names'] .= '</small>';
                    }
                }
              	else
                {
                	$info[$i]['attributes'] = 0;
                  	$info[$i]['attr_names'] = '';
                }

                $info[$i]['parent'] = $element->parentNode->tagName;
                // $info[$i]['node_path'] = $element->getNodePath();
              
              	$info[$i]['node_value'] = '<small>' . substr($element->nodeValue, 0, 200) . '</small>';
            }
	    }
	    
	    return $info;
	}
  	
  	// 09.
  	public static function attr_scan($code, $attr_name, $attr_value = '', $source_type = 'html')
	{
	    $dom = self::get_dom($code, $source_type);
      
      	$xpath = new \DOMXpath($dom);
      
      	$q = '//@' . $attr_name;
      	if ($attr_value)
        {
        	$q .= '="' . $attr_value . '"';
        }
      	
      	$elements = $xpath->query($q);
      
      	Factory::getApplication()->enqueueMessage('XPath: ' . $q);
      
	    $info[] = array();
	    foreach ($elements as $i => $element)
	    {
          	$info[$i]['tag'] = $element->ownerElement->tagName;
          	$info[$i]['value'] = $element->nodeValue;
          	$info[$i]['node_path'] = $element->getNodePath();
	    }
	    
	    return $info;
	}
}