<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library;

defined('_JEXEC') or die;

use Joomla\CMS\Factory;
use Joomla\CMS\Image\Image;
use Joomla\CMS\Filter\OutputFilter;
use Joomla\CMS\Filesystem\File;
use Joomla\CMS\Filesystem\Folder;

class TfImg
{
    public static $image;
  
  	public static $text;
    
    public static $image_filters = array(
        'GRAYSCALE' => IMG_FILTER_GRAYSCALE,
        'NEGATE' => IMG_FILTER_NEGATE,
        'BRIGHTNESS' => IMG_FILTER_BRIGHTNESS,
        'CONTRAST' => IMG_FILTER_CONTRAST,
        'COLORIZE' => IMG_FILTER_COLORIZE,
        'EDGEDETECT' => IMG_FILTER_EDGEDETECT,
        'EMBOSS' => IMG_FILTER_EMBOSS,
        'GAUSSIAN_BLUR' => IMG_FILTER_GAUSSIAN_BLUR,
        'SELECTIVE_BLUR' => IMG_FILTER_SELECTIVE_BLUR,
        'MEAN_REMOVAL' => IMG_FILTER_MEAN_REMOVAL,
        'SMOOTH' => IMG_FILTER_SMOOTH,
        'PIXELATE' => IMG_FILTER_PIXELATE,
        'SCATTER' => IMG_FILTER_SCATTER
        );
    
    // 01. Save image from url to path
	public static function get_img($url, $path)
	{
	    $fp = fopen($path, 'wb');
	    
        $ch = curl_init($url);
        curl_setopt($ch, CURLOPT_FILE, $fp);
 	    curl_setopt($ch, CURLOPT_HEADER, 0);
 	    
 	    $data = curl_exec($ch);
 	    
        curl_close($ch);
    	
    	fclose($fp);
    	
    	return $data;
    }
    
    // 02. Resize image
    public static function resize_image($path, $width, $total)
    {
        $size = getimagesize($path);
        
        $r1 = ($size[0])/($size[1]); // Width to Height Ratio
        
        // Calculate desired ratio
        $r2 = ($width * $width)/$total;
        
        if ($r1 < $r2)
        {
            $new_width = $width;
        }
        else
        {
            $new_width = ceil(sqrt($total * $r1));
        }
        
        // Load image file  
        $image = self::load_image($path);
        
        // Use imagescale() function to scale the image
        $new_image = imagescale($image, $new_width);
        
        // Save image
        self::save_image($new_image, $path);
        
        imagedestroy($image);
        
        return $new_width;
    }
    
    // 03. Returns random image from folder
    public static function reset_image($folder = 'images')
    {
        $images = self::get_images($folder);
        
        $i = count($images);
	    $random = mt_rand(0, $i - 1);
	
	    $image = $images[$random];
	    
	    $image_url = $folder . '/' . $image;
    
        return $image_url;
    }
    
    // 04. Create image
    public static function create_image($title, $options = array(), $img_name = null, $introtext = '')
    {
        // $options array - width, height, bg_color, text_color, src_folder, pct, dst_folder, font_base_url, fonttype
        // For adding text from title - text_type, add_text, remove_words
        
        $image_name = OutputFilter::stringURLSafe($title);
        
        $width = $options['width'];
        $height = $options['height'];
        
        // A. Create image canvas
        self::create_blank_image($width, $height);
        
        // B. Background color
        self::image_fill($options['bg_color']);
        
        // C. Add random image to canvas
        if (!empty($options['src_folder']))
        {
            $random_image = self::reset_image($options['src_folder']);
            
            self::copy_image(JPATH_ROOT . '/' . $random_image, $width, $height, $options['pct']);
        }
        
        // D. Add text to image
        if ($options['add_text'])
        {
            // Delete some words
            if (!empty($options['remove_words']))
            {
                $remove_words = explode(',', $options['remove_words']);
                foreach ($remove_words as $word)
                {
                    $title = str_ireplace(trim($word), '', $title);
                }
                $title = trim($title);
                
                // Image name from new title
                $image_name = OutputFilter::stringURLSafe($title);
            }
            self::$text = ($options['text_type'] == 'introtext') ? trim(strip_tags($introtext)) : $title;
            
            $font = JPATH_ROOT . '/' . $options['font_base_url'] . '/' . $options['fonttype'] . '.ttf';
          
          	$font_size = self::calculate_font_size($font, self::$text, $options['width']);
            
            self::image_text(self::$text, $options['text_color'], $font, $font_size);
        }
        
        // E. Save image
        // If $img_name is provided, use that instead of creating name from title
        $image_name = $img_name ?? $image_name;
        $dst = JPATH_ROOT . '/' . $options['dst_folder'] . '/' . $image_name . '.jpg';
        
        self::save_image(self::$image, $dst);
        
        imagedestroy(self::$image);
        
        return $image_name;
    }
    
    // 05. Filter image
    public static function filter_image($path, $filter = '')
    {
        if (empty($filter))
        {
            return;
        }
        
        $filter = strtoupper($filter);
        
        $image = self::load_image($path);
        
        $result = imagefilter($image, self::$image_filters[$filter]);
        
        self::save_image($image, $path);
        
        imagedestroy($image);
        
        return $result;
    }
    
    public static function convert_image_to_webp($image_url)
    {
        $path = pathinfo($image_url);
        
        $dest = JPATH_ROOT . '/' . $path['dirname'] . '/' . $path['filename'] . '.webp';
        
        $image = self::load_image(JPATH_ROOT . '/' . $image_url);
		
        // Create new webp image
        imagewebp($image, $dest);

        imagedestroy($image);
        
        // New image URL with webp
        $new_image_url = $path['dirname'] . '/' . $path['filename'] . '.webp';
        
        // Delete original file
        self::delete_image($image_url);
        
        return $new_image_url;
    }
    
    // Create image canvas
    public static function create_blank_image($width, $height)
    {
        self::$image = imagecreatetruecolor($width, $height);
        
        if (self::$image == false)
        {
            self::set_message('Error in creating image');
        }
    }
    
    // Fill image with color
    public static function image_fill($color)
    {
        $image_color = self::get_image_color($color);
        
        imagefill(self::$image, 0, 0, $image_color);
    }
    
    public static function get_image_color($color)
    {
        list($r1, $g1, $b1) = sscanf($color, "#%02x%02x%02x");
        
        $image_color = imagecolorallocate(self::$image, $r1, $g1, $b1);
        
        return $image_color;
    }
    
    public static function copy_image($path, $src_width, $src_height, $pct)
    {
        $src_image = self::load_image($path);
        
        $dst_x = 0;
        $dst_y = 0;
        $src_x = 0;
        $src_y = 0;
        
        // $result = imagecopy(self::$image, $src_image, $dst_x, $dst_y, $src_x, $src_y, $src_width, $src_height);
        $result = imagecopymerge(self::$image, $src_image, $dst_x, $dst_y, $src_x, $src_y, $src_width, $src_height, $pct);
        
        imagedestroy($src_image);
        
        if ($result == false)
        {
            self::set_message('Error in copying image');
        }
    }
    
    // Add text to image
    public static function image_text($text, $text_color, $font, $font_size)
    {
        if (empty($text))
        {
            return;
        }
        
        $tb = self::text_box($text, $font, $font_size);
        
        // Center align text
        $width = imagesx(self::$image);
        $height = imagesy(self::$image);
        
        $x = ($width - $tb['width'])/2;
        $y = ($height - $tb['height'])/2;
        
        $image_color = self::get_image_color($text_color);
        
        imagettftext(self::$image, $font_size, 0, $x, $y, $image_color, $font, $text);
    }
    
    // Get text box width and height
    public static function text_box($text, $font, $font_size)
    {
        $box = imagettfbbox($font_size, 0, $font, $text);
        
        $tb['width'] = abs($box[4] - $box[0]);
        
        $tb['height'] = abs($box[5] - $box[1]);
        
        return $tb;
    }
    
    public static function delete_image($image_url)
    {
        File::delete(JPATH_ROOT . '/' . $image_url);
    }
    
    // Load image based on its extension
    public static function load_image($path)
    {
        $ext = pathinfo($path, PATHINFO_EXTENSION);
        
        switch ($ext)
        {
            case 'jpeg' :
                $image = imagecreatefromjpeg($path);
                break;
            
            case 'jpg' :
                $image = imagecreatefromjpeg($path);
                break;
            
            case 'png' :
                $image = imagecreatefrompng($path);
                break;
            
            case 'webp' :
                $image = imagecreatefromwebp($path);
                break;
            
            case 'gif' :
                $image = imagecreatefromgif($path);
        }
        
        if ($image == false)
        {
            self::set_message('Unable to load image: ' . $path);
        }
	    
	    return $image;
    }
    
    // Save image based on its extension
    public static function save_image($image, $destination)
    {
        $ext = pathinfo($destination, PATHINFO_EXTENSION);
	    
	    switch ($ext)
        {
            case 'jpeg' :
                $result = imagejpeg($image, $destination);
                break;
            
            case 'jpg' :
                $result = imagejpeg($image, $destination);
                break;
            
            case 'png' :
                $result = imagepng($image, $destination);
                break;
            
            case 'webp' :
                $result = imagewebp($image, $destination);
                break;
            
            case 'gif' :
                $result = imagegif($image, $destination);
        }
        
        if ($result == false)
        {
            self::set_message('Error in saving image.');
        }
    }
  
  	public static function calculate_font_size($font, $text, $total_width)
    {
    	$available_width = $total_width - 50;
      
      	$fs = 120;
      	while ($fs > 35)
        {          
          	$box = imagettfbbox($fs, 0, $font, $text);
        	$tb['width'] = abs($box[4] - $box[0]);
        	$tb['height'] = abs($box[5] - $box[1]);
          
          	if ($tb['width'] > $available_width)
        	{
        		$fs = $fs - 5;
        	}
      		else
      		{
        		return $fs;
      		}
        }
      
      	if ($tb['width'] > $available_width)
        {
      		$lines = ceil($tb['width']/$available_width);
          	$break_point = floor(strlen(self::$text)/$lines);
          
          	self::$text = wordwrap(self::$text, $break_point);
        }
      
		return $fs;
    }
    
    // Returns array of image filenames in a folder
    public static function get_images($folder)
    {
        $dir = JPATH_ROOT . '/' . $folder;
        
        if (is_dir($dir))
        {
            if ($handle = opendir($dir))
			{
				while (false !== ($file = readdir($handle)))
				{
					if ($file !== '.' && $file !== '..' && $file !== 'index.html')
					{
						$files[] = $file;
					}
				}
			}
			
			closedir($handle);
			
			$i = 0;
			
			foreach ($files as $img)
			{
				if (!is_dir($dir . '/' . $img))
				{
					$images[$i] = $img;
					$i++;
				}
			}
			
        }
        
        return $images;
    }
    
    public static function create_folder($path)
    {
        // $path is: JPATH_SITE . '/images/folder_name';
        
        $result = Folder::create($path);
        
        return $result;
    }
    
    // Get image properties
    public static function get_image_properties($path)
    {
        $data = Image::getImageFileProperties($path);
        
        return $data;
    }
    
    public static function set_message($message)
    {
        Factory::getApplication()->enqueueMessage($message);
    }
}