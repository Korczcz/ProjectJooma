<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library\View\Front;

defined('_JEXEC') or die;

use Joomla\CMS\Factory;
use Joomla\CMS\Language\Text;
use Joomla\CMS\Router\Route;
use Joomla\CMS\Uri\Uri;
use Joomla\CMS\Document\Feed\FeedItem;

class TfViewFeed extends TfView
{
    public $items;
    
    public $doc;
    
    public $base_item_link; // Feed item link without id
    
    public $current_link; // List of records link

    public function initiate_feed()
    {
        $this->app = Factory::getApplication();
        
		$this->doc = Factory::getDocument();

		$siteEmail = $this->app->get('mailfrom');
		
		$this->doc->link = $this->current_link;
		
		$this->app->input->set('limit', $this->app->get('feed_limit'));
		
		$rows = $this->get('Items');
		
		foreach ($rows as $row)
		{
		    // A. Title of Feed Item
			$title = $this->escape($row->title);
			$title = html_entity_decode($title, ENT_COMPAT, 'UTF-8');
			
			// B. Link of Feed Item
            $link = $this->base_item_link . '&id=' . $row->id;
			
			// C. Description of Feed Item
			$description = '';

			// C1. Image in description
			if (!empty($row->image))
			{
				$image = preg_match('/http/', $row->image) ? $row->image : URI::root() . $row->image;
				$description = '<p><img src="' . $image . '" /></p>';
			}

            // C2. Text in description
            $desc = htmlspecialchars(trim(strip_tags($row->description)));
            $feed_summary_limit = $this->getModel()->get_param('feed_summary_limit');
            if (strlen($desc) > $feed_summary_limit)
            {
                $position = strpos($desc, ' ', $feed_summary_limit);
                $desc = substr($desc, 0, $position);
            }
			$description .= $desc;
			
			// C3. Read more in description
			if ($this->getModel()->get_param('feed_show_readmore'))
			{
			    $description .= '<p><a target="_blank" href="' . $link . '">' . Text::_('COM_TF_FEED_READMORE') . '</a></p>';
			}
		    
		    // Load individual item
			$item = new FeedItem;
			$item->title = $title;
			$item->link = Route::_($link);
			
			if (isset($row->modified) && !empty($row->modified))
			{
			    $item->date = $row->modified;
			}
			else
			{
			    $item->date = $row->created;
			}
			
			$item->authorEmail = $siteEmail;
			
			$item->description = '<div>' . $description . '</div>';
			
			// Loads item info into rss array
			$this->doc->addItem($item);
		}
    }
}