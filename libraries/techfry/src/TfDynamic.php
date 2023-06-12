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

class TfDynamic
{
  	// 01. User Information from Users Table
  	public static function user($str, $user_id = null)
    {
    	$user = ($user_id) ? Factory::getUser($user_id) : Factory::getUser();
      
      	// Direct fields - {NAME}, {EMAIL}, {USERNAME}
      	$str = str_replace('{NAME}', $user->name, $str);
      	$str = str_replace('{EMAIL}', $user->email, $str);
      	$str = str_replace('{USERNAME}', $user->username, $str);
      
      	$regex = '/{USER\s([a-zA-Z]+)}/i'; // Example: {USER name}, {USER email}
      	preg_match_all($regex, $str, $matches, PREG_SET_ORDER);
      
      	if ($matches)
		{
          	foreach ($matches as $match)
			{
				$prop = trim($match[1]);
				$str = str_replace($match[0], $user->$prop, $str);
			}
		}

      	return $str;
    }
  
  	// 02. User Custom Fields
  	public static function custom_user($str, $user_id = null)
    {
      	if ($user_id == null)
        {
          	$user_id = Factory::getUser()->id;  
        }
      
      	$regex = '/{CUSTOM\s([1-9][0-9]*)}/i'; // Example: {CUSTOM 12}
      	preg_match_all($regex, $str, $matches, PREG_SET_ORDER);
      
      	if ($matches)
		{          
          	foreach ($matches as $match)
			{
				$custom_value = TfUser::get_custom_field(trim($match[1]), $user_id);
				$str = str_replace($match[0], $custom_value, $str);
			}
		}
      
      	return $str;
    }
  
  	// 03. Current Date - {DATE}, {YEAR}, {MONTH}
  	public static function dates($str, $date_format = 'd M Y')
    {
    	$today = Factory::getDate()->format($date_format);
      	$year = Factory::getDate()->format('Y');
        $month = Factory::getDate()->format('F');
      	
      	$str = str_replace('{DATE}', $today, $str);
      	$str = str_replace('{MONTH}', $month, $str);
      	$str = str_replace('{YEAR}', $year, $str);
      
      	return $str;
    }
  
  	// 04. Joomla Global Information
  	public static function config($str)
    {
    	$regex = '/{GLOBAL\s([a-zA-Z]+)}/i'; // Example: {GLOBAL sitename}, {GLOBAL mailfrom}, {GLOBAL fromname}
      	preg_match_all($regex, $str, $matches, PREG_SET_ORDER);
      
      	if ($matches)
		{
			$config = Factory::getConfig();

          	foreach ($matches as $match)
			{
				$field = trim($match[1]);
				$value = $config->get($field);
              
				$str = str_replace($match[0], $value, $str);
			}
		}
      
      	return $str;
    }
  
  	// Replace array keys by values
  	public static function fields($str, $arr = array())
    {
      	$regex = '/{FIELD\s([a-zA-Z]+)}/i'; // Example:
      
      	preg_match_all($regex, $str, $matches, PREG_SET_ORDER);
      
      	if ($matches)
		{
          	foreach ($matches as $match)
			{
				$field = trim($match[1]);
				$value = $arr[$field];
              
				$str = str_replace($match[0], $value, $str);
			}
		}
      
      	return $str;
    }
  	
  	// Replace single article
  	public static function article($str, $display = array())
    {
     	if (empty($display))
        {
        	$display = array(
              'title'=> '',
              'readmore' => ''
              );
        }
      
      	$regex = '/{JA\s([1-9][0-9]*)\s?([IF]?)\s?([YN]?)}/i'; // Example: {JA 36 I Y}, {JA 125 F N}
      	preg_match_all($regex, $str, $matches, PREG_SET_ORDER);
      
      	if ($matches)
        {
        	foreach ($matches as $match)
            {
             	$article_id = trim($match[1]);
              	$article = TfArticle::get_article($article_id);
              	
              	$html = '';
              	if (array_key_exists('title', $display))
                {
                	$html .= '<h3>' . $article->title . '</h3>';  
                }
              	
              	if (strtoupper((trim($match[3])) == 'Y'))
                {
                    $images = json_decode($article->images);
                  	$uri = Uri::getInstance();
                  
                  	$html .= '<img src="' . $uri->root() . $images->image_intro . '" alt="' . $article->title . '">';
                }
              
              	if (strtoupper(trim($match[2])) == 'I')
                {
                    $html .= $article->introtext;
                  	if (array_key_exists('readmore', $display))
                    {
                    	$slug = $article->id . ':' . $article->alias;
                		$link = Route::link('site', RouteHelper::getArticleRoute($slug, $article->catid, $article->language));
                      
                      	$html .= '<p><a href="' . $link . '">Read More</a></p>'; 
                    }
                }
              	elseif (strtoupper(trim($match[2])) == 'F')
                {
                	$html .= $article->introtext . $article->fulltext;
                }
              
              	$str = str_replace($match[0], $html, $str);
            }
        }
      
      	return $str;
    }
}