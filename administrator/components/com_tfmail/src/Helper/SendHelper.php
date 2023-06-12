<?php
 /*
 * @package		TF Mail Component
 * @license		GNU General Public License version 2 or later; see LICENSE.txt
 */

namespace TechFry\Component\TfMail\Administrator\Helper;

defined('_JEXEC') or die;

use Joomla\CMS\Component\ComponentHelper;
use Joomla\CMS\Factory;
use Joomla\CMS\Router\Route;
use Joomla\CMS\Uri\Uri;
use Joomla\Component\Content\Site\Helper\RouteHelper;
use Joomla\CMS\Helper\TagsHelper;
use Joomla\CMS\Mail\MailHelper;
use TechFry\Library\TfUser;
use TechFry\Library\TfArticle;
use TechFry\Library\TfDb;
use TechFry\Library\TfDynamic;

class SendHelper
{
    public static $email = array(); // Array to store mail subject, html_body, text_body
    
    public static $mail;
    
    public static $user;
    
    public static $params;
    
    public static $replaces;
    
    // 01. Send email
    public static function send_mail($mail_id, $user_id, $replaces = array())
    {
        self::$replaces = $replaces;
        
        // A. Prepare subject and body before sending
        self::pre_send($mail_id, $user_id);
        
        $mailer = Factory::getMailer();
        
        // B. Set from
        // From details from global configuration
        $config = Factory::getConfig();
        
		$from_email = self::$params->get('mail_from_email', $config->get('mailfrom'));
        $from_name = self::$params->get('mail_from_name', $config->get('fromname'));
        
        // C. Add reply to email
        if (self::$params->get('mail_reply_to') != null)
        {
            $mailer->addReplyTo(self::$params->get('mail_reply_to'));
        }
        
        // D1. Add return path
        if (self::$params->get('mail_return_path') != null)
        {
            $mailer->setSender(self::$params->get('mail_return_path'));
        }
      	
      	// D2. Set from after setting sender
      	$mailer->setFrom($from_email, $from_name, false);
        
        // E. Add recipient
        $mailer->addRecipient(self::$user->email);
        
        // F. Set subject, body, alt body
        $mailer->setSubject(self::$email['subject']);
        $mailer->setBody(self::$email['html_body']);
        $mailer->AltBody = self::$email['text_body'];
        
        // G. Add attachments
        if (self::$mail->attach != '' && self::$mail->attach != '-1')
        {
            $mailer->addAttachment(self::$params->get('mail_attach_folder') . '/' . self::$mail->attach);
        }
        
        // H. Add List-Unsubscribe Header
        if (self::$params->get('list_unsub'))
        {
            $mailer->addCustomHeader('List-Unsubscribe', '<mailto: ' . self::$params->get('mail_reply_to') . '?subject=Unsubscribe>');
        }
        
        // I. Set html, encoding, charset
        $mailer->isHtml(true);
        $mailer->Encoding = 'base64';
        $mailer->CharSet = 'UTF-8';
        
      	// J. SMTP
      	$use_smtp = self::$params->get('use_smtp', 0);
      	if ($use_smtp)
        {
        	$auth = 1;
            $host = self::$params->get('smtphost');
            $user = self::$params->get('smtpuser');
            $pass = self::$params->get('smtppass');
            $secure = self::$params->get('smtpsecure');
            $port = self::$params->get('smtpport', 25);
      	
        	$mailer->useSmtp($auth, $host, $user, $pass, $secure, $port);
        }
      
      	// K. DKIM
      	
      
        $send = $mailer->send();
        
        return $send;
    }
    
    // 02. 
    public static function pre_send($mail_id, $user_id)
    {
        self::$user = Factory::getUser($user_id);
        
        self::$mail = TfDb::get_item('tfm_mail', $mail_id);
        
        self::$params = ComponentHelper::getParams('com_tfmail');
        
        self::$email['html_body'] = self::$mail->description;
        self::$email['subject'] = self::$mail->title;
        
        // A. Check for empty text version
        if (empty(self::$mail->text_body))
        {
            self::$email['text_body'] = strip_tags(self::$mail->description);
        }
        
        // B. Add footer to mail body
        if (!empty(self::$params->get('email_footer')))
        {
            self::$email['html_body'] .= self::$params->get('email_footer');
            self::$email['text_body'] .= strip_tags(self::$params->get('email_footer'));
        }
        
        // C. Replace format in mail subject
        self::replaceSubjectFormat();
        
        // D. Replace user and content format in mail body
        self::replaceBodyFormat();
        
        // E. Convert Relative URLs to Absolute URLs
        self::convertUrls();
        
        // F. Convert links for statistics
        if (self::$params->get('mail_clicks'))
        {
            self::add_link_tracking();
        }
        
        // G. Add code to track email opens
        if (self::$params->get('mail_opens'))
        {
            $uri = Uri::getInstance();
            $root = $uri->root();
            $track_link = $root . 'index.php?option=com_tfmail&&task=track.open&mailid=' . self::$mail->id . '&userid=' . self::$user->id;
            self::$email['html_body'] .= '<img src="' . $track_link . '" width="1" height="1" alt="" />';
        }
        
        // H. Replace
        self::replace_text();
        
        // I. Add html tag
        self::add_html();
    }
    
    // 03. Replace user info and others in mail body before sending
    public static function replaceSubjectFormat()
    {
        // User Information
      	self::$email['subject'] = TfDynamic::user(self::$email['subject'], self::$user->id);
        
        // Current Date
      	self::$email['subject'] = TfDynamic::dates(self::$email['subject'], self::$params->get('date_format'));
    }
    
    // 04. Replace user info and other format in mail body before sending
    public static function replaceBodyFormat()
    {
        $uri = Uri::getInstance();
        
        // Generate otpkey from register date
        $date = Factory::getDate(self::$user->registerDate);
        $otpkey = $date->toUnix();
        
        // A. Unsubscribe, Modify and Reset Link
        $user_link = 'otpkey=' . $otpkey . '&id=' . self::$user->id;
        
        $linku = self::unsub_link($user_link);
        $linkm = self::modify_link($user_link);
        $linkr = self::reset_link($user_link);
        
        self::$email['html_body'] = str_replace('{UNSUB}', $linku, self::$email['html_body']);
        self::$email['html_body'] = str_replace('{MODIFY}', $linkm, self::$email['html_body']);
        self::$email['html_body'] = str_replace('{RESET}', $linkr, self::$email['html_body']);
        self::$email['html_body'] = str_replace('{USER}', $user_link, self::$email['html_body']);
        
        self::$email['text_body'] = str_replace('{UNSUB}', self::$params->get('unsub') . "\n" . self::$params->get('unsub_url') . '?' . $user_link . "\n", self::$email['text_body']);
        self::$email['text_body'] = str_replace('{MODIFY}', self::$params->get('modify') . "\n" . self::$params->get('modify_url') . '?' . $user_link . "\n", self::$email['text_body']);
        self::$email['text_body'] = str_replace('{RESET}', self::$params->get('reset') . "\n" . self::$params->get('reset_url') . '?' . $user_link . "\n", self::$email['text_body']);
        self::$email['text_body'] = str_replace('<hr>', "\n----------\n", self::$email['text_body']);
        
        // B. User Information
      	self::$email['html_body'] = TfDynamic::user(self::$email['html_body'], self::$user->id);
      	self::$email['text_body'] = TfDynamic::user(self::$email['text_body'], self::$user->id);
        
        // C. User Custom Fields
      	self::$email['html_body'] = TfDynamic::custom_user(self::$email['html_body'], self::$user->id);
      	self::$email['text_body'] = TfDynamic::custom_user(self::$email['text_body'], self::$user->id);

        // D. Dates
      	self::$email['html_body'] = TfDynamic::dates(self::$email['html_body'], self::$params->get('date_format'));
      	self::$email['text_body'] = TfDynamic::dates(self::$email['text_body'], self::$params->get('date_format'));
        
        // E. Joomla Articles
        $regex = '/{JA\s([1-9][0-9]*)\s?([IF]?)\s?([YN]?)}/i'; // Example: {JA 36 I Y}, {JA 125 F N}
        preg_match_all($regex, self::$email['html_body'], $matches, PREG_SET_ORDER);
        if ($matches)
		{
			foreach ($matches as $match)
			{
				$id = trim($match[1]);
                $article = TfArticle::get_article($id);
                
                $slug = $article->id . ':' . $article->alias;
                $link = Route::link('site', RouteHelper::getArticleRoute($slug, $article->catid, $article->language));
                
                $html_cont = self::article_title($article->title, $link);
                if (strtoupper((trim($match[3])) == 'Y'))
                {
                    $html_cont .= self::article_image($article->images);
                }
                if (strtoupper(trim($match[2])) == 'I')
                {
                    $html_cont .= $article->introtext;
                    $html_cont .= self::article_read_more($link);
                }
                if (strtoupper(trim($match[2])) == 'F')
                {
                    $html_cont .= $article->introtext . $article->fulltext;
                }
                
				self::$email['html_body'] = str_replace($match[0], $html_cont, self::$email['html_body']);
				
				$text_cont = "\n----------\n" . $article->title . "\n----------\n" . strip_tags($html_cont); // Title will appear two times
				self::$email['text_body'] = str_replace($match[0], $text_cont, self::$email['text_body']);
			}
		}
		
		// F. Joomla Categories
		$regex = '/{JC\s([1-9][0-9]*)\s([1-9])}/i'; // Example: {JC 13 3}
        preg_match_all($regex, self::$email['html_body'], $matches, PREG_SET_ORDER);
        if ($matches)
		{
			foreach ($matches as $match)
			{
				$id = trim($match[1]);
				$num = trim($match[2]);
				$articles = self::getArticles($id, $num);

				self::$email['html_body'] = str_replace($match[0], $articles, self::$email['html_body']);
				
				self::$email['text_body'] = str_replace($match[0], $articles, self::$email['text_body']);
			}
		}
		
		// G. Joomla Tag
		$regex = '/{JT\s([1-9][0-9]*)\s([1-9])}/i'; // Example: {JT 28 3}
        preg_match_all($regex, self::$email['html_body'], $matches, PREG_SET_ORDER);
        if ($matches)
		{
			foreach ($matches as $match)
			{
				$tag_id = trim($match[1]);
				$num = trim($match[2]);
				$articles = self::getArticlesByTag($tag_id, $num);

				self::$email['html_body'] = str_replace($match[0], $articles, self::$email['html_body']);
				
				self::$email['text_body'] = str_replace($match[0], $articles, self::$email['text_body']);
			}
		}
		
		// H. Any joomla table which contains user id column
		$regex = '/{ANY\s([a-z]+)\s([a-z|_]+)\s([a-z|_]+)}/i'; // Example: {ANY column_name table_name user_id}
		preg_match_all($regex, self::$email['html_body'], $matches, PREG_SET_ORDER);
		if ($matches)
		{
		    foreach ($matches as $match)
		    {
		        $select = trim($match[1]);
		        $table = trim($match[2]);
		        $userid_column = trim($match[3]);
		        
		        $records = TfDb::get_items($table, array(array($userid_column, '=', self::$user->id)), 'id DESC', 1);
		        
	            $record = $records[0];
	        
	            self::$email['html_body'] = str_replace($match[0], $record->$select, self::$email['html_body']);
	        
	            self::$email['text_body'] = str_replace($match[0], $record->$select, self::$email['text_body']);
		    }
		}
		
		// I. Insert column from any joomla table with specific id
		$regex = '/{JTABLE\s([a-z]+)\s([a-z|_]+)\s([1-9][0-9]*)}/i'; // Example: {JTABLE column_name table_name 6}
		preg_match_all($regex, self::$email['html_body'], $matches, PREG_SET_ORDER);
		if ($matches)
		{
		    foreach ($matches as $match)
		    {
		        $select = trim($match[1]);
		        $table = trim($match[2]);
		        $id = trim($match[3]);
		        
		        $record = TfDb::get_item($table, $id);
	        
	            self::$email['html_body'] = str_replace($match[0], $record->$select, self::$email['html_body']);
	        
	            self::$email['text_body'] = str_replace($match[0], $record->$select, self::$email['text_body']);
		    }
		}
		
		// J. Custom replacement from 3rd party components
      	if (is_array(self::$replaces))
        {
        	foreach (self::$replaces as $k => $v)
			{
		    	self::$email['html_body'] = str_replace('{' . $k . '}', $v, self::$email['html_body']);
            	self::$email['text_body'] = str_replace('{' . $k . '}', $v, self::$email['text_body']);
			}
        }
		
		// K. Table of Contents
		$toc = self::toc();
        self::$email['html_body'] = str_replace('{TOC}', $toc['html'], self::$email['html_body']);
        self::$email['text_body'] = str_replace('{TOC}', $toc['text'], self::$email['text_body']);
        
        // L. Links
        $regex = '/{LINK\s([1-9][0-9]*)}/i'; // // Example: {LINK 4}
        preg_match_all($regex, self::$email['html_body'], $matches, PREG_SET_ORDER);
        if ($matches)
		{
			foreach ($matches as $match)
			{
				$id = trim($match[1]);
				$link = self::getLink($id);

				self::$email['html_body'] = str_replace($match[0], $link, self::$email['html_body']);
				
				self::$email['text_body'] = str_replace($match[0], $link, self::$email['text_body']);
			}
		}
		
		// M. Random Links
        $regex = '/{RLINK\s([1-9][0-9,]*)}/i'; // Example: {RLINK 4,5,7}
		preg_match_all($regex, self::$email['html_body'], $matches, PREG_SET_ORDER);
		if ($matches)
		{
			foreach ($matches as $match)
			{
				$ids = explode(',', trim($match[1]));
				
				$link = self::getRandomLink($ids);

				self::$email['html_body'] = str_replace($match[0], $link, self::$email['html_body']);
				
    			self::$email['text_body'] = str_replace($match[0], $link, self::$email['text_body']);
			}
		}
		
		// N. If Conditions
		$regex = '/{IF\s([a-zA-Z]+):([a-zA-Z]+):([0-9]+)\s(.*)}(.*){\/IF}}/i'; // Example: {IF USER:CUSTOM:12 Joomla}Some content{/IF}
		preg_match_all($regex, self::$email['html_body'], $matches, PREG_SET_ORDER);
		if ($matches)
		{
		    foreach ($matches as $match)
		    {
		        $value = $match[4];
		        
		        $custom_value = TfUser::get_custom_field(trim($match[3]), self::$user->id);
		        if ($custom_value == $value)
		        {
		            self::$email['html_body'] = str_replace($match[0], $match[5], self::$email['html_body']);
    			    self::$email['text_body'] = str_replace($match[0], $match[5], self::$email['text_body']);
		        }
		        else
		        {
		            self::$email['html_body'] = str_replace($match[0], '', self::$email['html_body']);
    			    self::$email['text_body'] = str_replace($match[0], '', self::$email['text_body']);
		        }
		    }
		}
		
    }
    
    // 05. Convert Relative URLs to Absolute URLs for anchors and images
    public static function convertUrls()
    {
        self::$email['html_body'] = MailHelper::convertRelativeToAbsoluteUrls(self::$email['html_body']);
    }
    
    // 06. Add utm parameters to links
    public static function add_link_tracking()
    {
        $dom = new \domDocument;
      	$dom->loadHTML(mb_convert_encoding(self::$email['html_body'], 'HTML-ENTITIES', 'UTF-8'));
        $dom->preserveWhiteSpace = false;
        
        $links = $dom->getElementsByTagName('a');
        
        foreach ($links as $link)
        {
            $href = $link->getAttribute('href');
            
            if (strpos($href, '?') == false)
            {
                $redirect = base64_encode($href);
                $uri = Uri::getInstance();
                $root = $uri->root();
                $url = $root . 'index.php?option=com_tfmail&task=track.click&mailid=' . self::$mail->id . '&userid=' . self::$user->id . '&redirect=' . $redirect;
                
                $link->setAttribute('href', $url);
                self::$email['html_body'] = $dom->saveHTML();
            }
        }
    }
    
    // 07. Generates table of contents based on header 
    public static function toc()
    {
        $dom = new \domDocument;
        $dom->loadHTML(mb_convert_encoding(self::$email['html_body'], 'HTML-ENTITIES', 'UTF-8'));
        $dom->preserveWhiteSpace = false;
        
        $toc = array();
        $toc['html'] = '<ol>';
        $toc['text'] = "\n";
        
        foreach ($dom->getElementsByTagName('*') as $element)
        {
            if ($element->tagName == 'h2' || $element->tagName == 'h3')
            {
                $toc['html'] .= '<li>' . $element->nodeValue . '</li>';
                $toc['text'] .= "- " . $element->nodeValue . "\n";
            }
        }
        
        $toc['html'] .= '</ol>';
        $toc['text'] .= "\n";
        
        return $toc;
    }
    
    // 08. Add html tag
    public static function add_html()
    {
        if (strpos(self::$email['html_body'], '<html>') === false)
        {
            self::$email['html_body'] = '<html>' . self::$email['html_body'] . '</html>';
        }
    }
    
    // 10.
    public static function replace_text()
    {
        $replaces = self::$params->get('replace');
        
        if (is_array($replaces))
        {
        	foreach ($replaces as $replace)
            {
                if (is_array($replace))
                {
                    foreach ($replace as $value)
                    {
                        if ($value['replace_type'] == 1)
                        {
                            self::$email['html_body'] = str_ireplace($value['find'], $value['rep'], self::$email['html_body']);
                            self::$email['text_body'] = str_ireplace($value['find'], $value['rep'], self::$email['text_body']);
                        }
                        elseif ($value['replace_type'] == 2)
                        {
                            $pattern = '/' . $value['find'] . '/i';
                            self::$email['html_body'] = preg_replace($pattern, $value['rep'], self::$email['html_body']);
                            self::$email['text_body'] = preg_replace($pattern, $value['rep'], self::$email['text_body']);
                        }
                    }
                }
            }  
        }
    }
    
    // 11. Get Articles from Joomla Category
    public static function getArticles($id, $num)
    {
        $order = self::$params->get('auto_ordering') . ' ' . self::$params->get('auto_direction');
        $latest_articles = self::$params->get('auto_latest_articles');
        
        $articles = TfArticle::get_articles_by_category($id, $order, $num);
        
        $output = '';
        foreach ($articles as $article)
        {
            if ($article->publish_up > Factory::getDate()->modify('-' . $latest_articles . ' days'))
            {
                $uri = Uri::getInstance();
                
                $slug = $article->id . ':' . $article->alias;
                $link = Route::link('site', RouteHelper::getArticleRoute($slug, $article->catid, $article->language));
                
                $output .= self::article_title($article->title, $link);
                
                if (self::$params->get('auto_show_introtext')) :
                    if (self::$params->get('auto_intro_limit') != 0)
                    {
                        $article->introtext = htmlspecialchars(trim(strip_tags($article->introtext)));
                        
                        if (strlen($article->introtext) > self::$params->get('auto_intro_limit'))
                        {
                            $position = strpos($article->introtext, ' ', self::$params->get('auto_intro_limit'));
                            $article->introtext = substr($article->introtext, 0, $position);
                        }
                    $article->introtext .= ' ...';
                    }
                    $output .= '<p>' . $article->introtext . '</p>';
                endif;
                
                $output .= self::article_read_more($link);
            }
        }
	    
	    return $output;
    }
    
    // 12. Get articles based on Joomla Tag
    public static function getArticlesByTag($tag_id, $num)
    {
        $articles = TfArticle::get_articles_by_tag($tag_id);
        
        $output = '';
        
        // To Do: Use random condition based on ordering
        $random_keys = array_rand($articles, $num);
        shuffle($random_keys);
        
        foreach ($random_keys as $rk)
        {
            $uri = Uri::getInstance();

            $link = Route::link('site', 'index.php?option=com_content&catid=' . $articles[$rk]->core_catid . '&view=article&id=' . $articles[$rk]->content_item_id);
            
            $output .= self::article_title($articles[$rk]->core_title, $link);
            
            if (self::$params->get('auto_show_introtext')) :
                if (self::$params->get('auto_intro_limit') != 0)
                {
                    $articles[$rk]->core_body = htmlspecialchars(trim(strip_tags($articles[$rk]->core_body)));
                    
                    if (strlen($articles[$rk]->core_body) > self::$params->get('auto_intro_limit'))
                    {
                        $position = strpos($articles[$rk]->core_body, ' ', self::$params->get('auto_intro_limit'));
                        $articles[$rk]->core_body = substr($articles[$rk]->core_body, 0, $position);
                    }
                $articles[$rk]->core_body .= ' ...';
                }
                $output .= '<p>' . $articles[$rk]->core_body . '</p>';
            endif;
            
            $output .= self::article_read_more($link);
        }
        
        return $output;
    }
    
    public static function getLink($id)
    {
        if (!empty(self::$params->get('styles_links')))
        {
            $style = ' style="' . self::$params->get('styles_links') . '"';
        }
        else
        {
            $style = '';
        }
        
        $link = TfDb::get_item('tfm_links', $id);

        $output = '<a' . $style . ' href="' . $link->link_url . '" title="' . $link->link_text . '">' . $link->link_text . '</a>';
        
        return $output;
    }
    
    public static function getRandomLink($ids)
    {
        if (!empty(self::$params->get('styles_links')))
        {
            $style = ' style="' . self::$params->get('styles_links') . '"';
        }
        else
        {
            $style = '';
        }
        
        shuffle($ids);
        
        $link = TfDb::get_item('tfm_links', $ids[0]);

        $output = '<a' . $style . ' href="' . $link->link_url . '" title="' . $link->link_text . '">' . $link->link_text . '</a>';
        
        return $output;
    }
    
// *****************************************************************************
    
    // Article Read More Link
    public static function article_read_more($link)
    {
        if (!self::$params->get('auto_readmore'))
        {
            return;
        }
        
        if (!empty(self::$params->get('styles_readmore')))
        {
            $style = ' style="' . self::$params->get('styles_readmore') . '"';
        }
        else
        {
            $style = '';
        }
        
        $output = '<p><a' . $style . ' href="' . $link . '">' . self::$params->get('auto_readmore_label') . '</a></p>';
        
        return $output;
    }
    
    // Article Title
    public static function article_title($title, $link)
    {
        if (!self::$params->get('auto_item_title'))
        {
            return;
        }

        if (!empty(self::$params->get('styles_heading')))
        {
            $style = ' style="' . self::$params->get('styles_heading') . '"';
        }
        else
        {
            $style = '';
        }
        $htag = self::$params->get('auto_item_heading');
        
        if (self::$params->get('auto_linked_title'))
        {
            $title = '<a href="' . $link . '">' . $title . '</a>';
        }
        
        $output = '<' . $htag . $style . '>' . $title . '</' . $htag . '>';
        
        return $output;
    }
    
    // Article Image
    public static function article_image($images)
    {
        $uri = Uri::getInstance();
        
        $images = json_decode($images);
        
        if (!empty(self::$params->get('styles_image')))
        {
            $style = ' style="' . self::$params->get('styles_image') . '"';
        }
        else
        {
            $style = '';
        }
        
        $output = '<img' . $style . ' src="' . $uri->root() . $images->image_intro . '" />';
    
        return $output;
    }
    
    // Unsubscribe Link
    public static function unsub_link($user_link)
    {
        if (!empty(self::$params->get('styles_unsub')))
        {
            $style = ' style="' . self::$params->get('styles_unsub') . '"';
        }
        else
        {
            $style = '';
        }
        
        $output = '<a' . $style . ' href="' . self::$params->get('unsub_url') . '?' . $user_link . '">' . self::$params->get('unsub') . '</a>';
        
        return $output;
    }
    
    // Modify Link
    public static function modify_link($user_link)
    {
        if (!empty(self::$params->get('styles_modify')))
        {
            $style = ' style="' . self::$params->get('styles_modify') . '"';
        }
        else
        {
            $style = '';
        }
        
        $output = '<a' . $style . ' href="' . self::$params->get('modify_url') . '?' . $user_link . '">' . self::$params->get('modify') . '</a>';
        
        return $output;
    }
    
    // Reset password Link
    public static function reset_link($user_link)
    {
        if (!empty(self::$params->get('styles_reset')))
        {
            $style = ' style="' . self::$params->get('styles_reset') . '"';
        }
        else
        {
            $style = '';
        }
        
        $url = 'index.php?option=com_tfmail&task=set.reset_pass&' . $user_link;
        $output = '<a' . $style . ' href="' . $url . '">' . self::$params->get('reset') . '</a>';
        
        return $output;
    }
}