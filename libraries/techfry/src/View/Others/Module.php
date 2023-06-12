<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library\View\Others;

defined('_JEXEC') or die;

use Joomla\CMS\Factory;
use Joomla\CMS\Helper\ModuleHelper;

class Module
{
    public static function get_output($module_id, $config = array())
    {
        $output  = '';
        
        $module = self::get_module($module_id);

        $file = $module->module;
		$custom	= substr($file, 0, 4) == 'mod_' ? 0 : 1;
		$module->user = $custom;
		$module->name = $custom ? $module->title : substr($file, 4);
		$module->style = null;
		$module->position	= strtolower($module->position);
		$clean[$module->id]	= $module;
		
		$output .= ModuleHelper::renderModule($module, array('style' => 'none'));
        
        return $output;
    }
    
    // Get module
	private static function get_module($module_id)
	{
		$app = Factory::getApplication();
		$user = Factory::getUser();
		$groups	= implode(',', $user->getAuthorisedViewLevels());
		$lang = Factory::getLanguage()->getTag();
		$clientId = (int) $app->getClientId();

		$db	= Factory::getDbo();
		$query = $db->getQuery(true);
		$query->select('m.id, m.title, m.module, m.position, m.ordering, m.content, m.showtitle, m.params');
		$query->from('#__modules AS m');
		$query->where('m.published = 1');

		$query->where('m.id = ' . $module_id);

		$date = Factory::getDate();
		$now = $date->toSql();
		
		$query->where('(m.publish_up IS NULL OR m.publish_up <= '.$db->Quote($now).')');
		$query->where('(m.publish_down IS NULL OR m.publish_down >= '.$db->Quote($now).')');

		$query->where('m.access IN ('.$groups.')');
		$query->where('m.client_id = '. $clientId);

		// Filter by language
		if ($app->isClient('site') && $app->getLanguageFilter())
		{
			$query->where('m.language IN (' . $db->Quote($lang) . ',' . $db->Quote('*') . ')');
		}

		// Set the query
		$db->setQuery($query);

		return $db->loadObject();
	}
}