<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library\View\Air;

defined('_JEXEC') or die;

use Joomla\CMS\HTML\HTMLHelper;

class Section
{
	use UtilityTrait;
  
  	public static $section;
  
  	public static function get_style($section, $with_style = true, $fw = 'bs')
    {
        if (!is_array($section))
        {
            $section = (array) $section;
        }
        
        $style = '';
        if ($section['bg_image'])
        {
            $image = HTMLHelper::cleanImageURL($section['bg_image']);
            $style = ' style="background-image: url(\'' . $image->url . '\');background-size:cover;"';
        }
        
        return $style;
    }
  
  	public static function get_class_uk()
    {
     	self::get_class_common();
        
        if (self::$section['bg_image'])
        {
            self::$class .= ' bg-image ' . self::$section['bg_attach'] . ' ' . self::$section['bg_blend'];
        }
    }
  
  	public static function get_class_bs()
    {
    	self::get_class_common();
    }
  
  	public static function get_class_amp()
    {
     	self::get_class_common();
    }
  
  	public static function get_class_common()
    {
    	self::$section = self::$config;
        
      	if (isset(self::$section['section_bg']) && !empty(self::$section['section_bg']))
        {
        	$bg = Background::get_classes(self::$fw);
      		self::$section['section_bg'] = $bg[self::$section['section_bg']];  
        }
      
      	if (isset(self::$section['section_padding']) && !empty(self::$section['section_padding']))
        {
        	$padding = Padding::get_classes(self::$fw);
          	self::$section['section_padding'] = $padding[self::$section['section_padding']];
        }
      	
      	if (isset(self::$section['section_margin']) && !empty(self::$section['section_margin']))
        {
        	$margin = Margin::get_classes(self::$fw);
      		self::$section['section_margin'] = $margin[self::$section['section_margin']];  
        }
      	
     	if (isset(self::$section['align']) && !empty(self::$section['align']))
        {
        	$align = Align::get_classes(self::$fw);
      		self::$section['align'] = $align[self::$section['align']];
        }
      	
      	if (isset(self::$section['section_text']) && !empty(self::$section['section_text']))
        {
        	$text = Texts::get_classes(self::$fw);
      		self::$section['section_text'] = $text[self::$section['section_text']];  
        }
      
      	self::$class = '';
      	foreach (self::$section as $k => $classes)
        {
        	if (in_array($k, array('section_class', 'section_padding', 'section_margin', 'align', 'section_text', 'section_bg')))
          	self::$class .= $classes . ' ';
        }
    }
}