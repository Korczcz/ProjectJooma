<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library;

use Joomla\CMS\Factory;
use Joomla\CMS\Table\Table;
use Joomla\CMS\Table\Content;
use Joomla\CMS\Categories\Categories;
use Joomla\CMS\Categories\CategoryNode;
use Joomla\CMS\Helper\TagsHelper;

// Script for Joomla Articles, Categories and Tags

class TfArticle
{
    // 01. Returns article id from alias
    public static function find_article($alias, $catid = null)
    {
        $db = Factory::getDbo();
        $query = $db->getQuery(true);
        
        $query->select($db->quoteName('id'))
            ->from($db->quoteName('#__content'))
            ->where($db->quoteName('alias') . ' = '. $db->quote($alias));
            
        if ($catid != null)
        {
            $query->andWhere($db->quoteName('catid') . ' = '. $db->quote($catid));
        }
            
        $db->setQuery($query);
        
        $article_id = $db->loadResult();
        
        return $article_id ? $article_id : false;
    }
            
    // 02. Create new joomla article from $data array
    public static function create_article($data)
    {
        // $data array - title, catid, introtext are required
        
        $app = Factory::getApplication();
        $mvcFactory = $app->bootComponent('com_content')->getMVCFactory();
        $articleModel = $mvcFactory->createModel('Article', 'Administrator', array('ignore_request' => true));
        
        if (!isset($data['language']))
        {
            $data['language'] = '*';
        }
        
        $data['id'] = 0;
        
        $data['created'] = Factory::getDate()->toSQL();
        $data['modified'] = Factory::getDate()->toSQL();
        
        if (!$articleModel->save($data))
        {
            $app->enqueueMessage($articleModel->getError(), 'error');
            
            return false;
        }
        
        $article_id = self::get_last_id();
        
        return $article_id;
    }
            
    // 03. Update existing joomla article
    public static function update_article($data)
    {
        $app = Factory::getApplication();

        if (!$data['id'])
        {
            $app->enqueueMessage('Article ID is not set.', 'error');
            
            return false;
        }
        
        $mvcFactory = $app->bootComponent('com_content')->getMVCFactory();
        $articleModel = $mvcFactory->createModel('Article', 'Administrator', array('ignore_request' => true));
        
        if (!isset($data['tags']))
        {
            $th = new TagsHelper();
            $currentTags = $th->getTagIds($data['id'], 'com_content.article');
            $data['tags'] = explode(',', $currentTags);
        }
        
        $data['modified'] = Factory::getDate()->toSql();
        
        if (!$articleModel->save($data))
        {
            $app->enqueueMessage($articleModel->getError(), 'error');
            
            return false;
        }

        return true;
    }
    
    // 04. Save article custom field - Depreciated (Use TfField)
    public static function save_custom_field($field_id, $article_id, $value)
    {
        $fieldModel = Factory::getApplication()->bootComponent('com_fields')->getMVCFactory()->createModel('Field', 'Administrator', ['ignore_request' => true]);
        
        $result = $fieldModel->setFieldValue($field_id, $article_id, $value);
        
        return $result;
    }
    
    // 05. Get article custom field - Depreciated (Use TfField)
    public static function get_custom_field($field_id, $article_id)
    {
        $fieldModel = Factory::getApplication()->bootComponent('com_fields')->getMVCFactory()->createModel('Field', 'Administrator', ['ignore_request' => true]);
        
        $value = $fieldModel->getFieldValue($field_id, $article_id);
        
        return $value;
    }
    
    // 06. Filter articles
    public static function filter_articles($filters, $articlefilters)
    {
        $db = Factory::getDbo();
        $query = $db->getQuery(true);
        
        $query
            ->select($db->quoteName(array('a.id')))
            ->from($db->quoteName('#__content', 'a'))
            ->where($db->quoteName('a.id') . ' > ' . $db->quote(0))
            ->order('a.id ASC');
        
        // Joomla Content Table
        if (is_string($filters))
        {
            $filters = json_decode($filters);
        }
        $filters_arr = (array) $filters;
            
        if (!empty($filters_arr))
        {
            foreach ($filters_arr as $filter_obj)
            {
                $filter = (array) $filter_obj;
                
                // Case 1: Filter value is given
                if (($filter['where_field'] != '') && ($filter['where_value'] != ''))
                {
                    if ($filter['isDate'])
                    {
                        $date = Factory::getDate('now -' . $filter['where_value'] . ' day');
                        $filter['where_value'] = $date->toSQL();
                    }
                    
                    $query->andWhere($db->quoteName('a.' . $filter['where_field']) . ' ' . $filter['where_operator'] . ' ' . $db->quote($filter['where_value']));
                }
                // Case 2: Filter value is not given (Example: IS NULL)
                elseif (!empty($filter['where_field']) && empty($filter['where_value']))
                {
                    $query->andWhere($db->quoteName('a.' . $filter['where_field']) . ' ' . $filter['where_operator']);
                }
            }
        }
        
        // Content Custom Fields
        if (is_array(json_decode($articlefilters, true)) && (json_last_error() == JSON_ERROR_NONE))
        {
            $articlefilters = json_decode($articlefilters);
        }
        $articlefilters_arr = (array) $articlefilters;
        
        if (!empty($articlefilters_arr))
        {
            foreach ($articlefilters_arr as $filter_obj)
            {
                $filter = (array) $filter_obj;
                
                if (is_numeric($filter['where_field']))
                {
                    $query->join('INNER', $db->quoteName('#__fields_values', 'c') . ' ON (' . $db->quoteName('a.id') . ' = ' . $db->quoteName('c.item_id') . ')')
                        ->andWhere($db->quoteName('c.field_id') . ' = ' . $db->quote($filter['where_field']))
                        ->andWhere($db->quoteName('c.value') . ' ' . $filter['where_operator'] . ' ' . $db->quote($filter['where_value']));
                }
            }
        }
    
        $db->setQuery($query);
        
        $articles = $db->loadColumn();
        
        return $articles;
    }
    
    // 07. Returns array of tag names associated with article
    public static function get_tags($article_id)
    {
        $th = new TagsHelper();
        $currentTags = $th->getTagIds($article_id, 'com_content.article');
        
        $currentTagnames = $th->getTagNames(explode(',', $currentTags));
        
        return $currentTagnames;
    }
    
    // 08. Category information
    public static function get_category($catid)
    {
        $extension = 'content';
        
        $categories = Categories::getInstance($extension, array('access' => false, 'published' => 0));
        
        $category = $categories->get($catid);
        
        return $category;
    }
    
    // 09. Get ID of last article
    public static function get_last_id()
    {
        $db = Factory::getDbo();
        $query = $db->getQuery(true);
        
        $query->select('id')
            ->from($db->quoteName('#__content'))
            ->order('id DESC')
            ->setLimit('1');
        
        $db->setQuery($query);

		$result = $db->loadResult();
        
        return $result;
    }
    
    // 10. Get article by ID
    public static function get_article($article_id)
    {
        $db = Factory::getDbo();
		$query = $db->getQuery(true);
		
		$query->select('*')
		    ->from($db->quoteName('#__content'))
		    ->where($db->quoteName('id') . ' = ' . $db->quote($article_id));

	    $db->setQuery($query);
	    
        $article = $db->loadObject();
	    
	    return $article;
    }
    
    // 11. Get articles by category
    public static function get_articles_by_category($category_id, $order = 'id DESC', $limit = 12)
    {
        $today = Factory::getDate();
        
        $db = Factory::getDbo();
		$query = $db->getQuery(true);
		
		$query->select($db->quoteName(array('id', 'title', 'alias', 'introtext', 'fulltext', 'state', 'access', 'images', 'catid', 'language', 'publish_up')))
		    ->from($db->quoteName('#__content'))
		    ->where($db->quoteName('catid') . ' = ' . $category_id)
		    ->andWhere($db->quoteName('state') . ' = '. $db->quote('1'))
		    ->andWhere($db->quoteName('publish_up') . ' < ' . $db->quote($today))
		    ->order($order)
		    ->setLimit($limit);

	    $db->setQuery($query);
	    
        $articles = $db->loadObjectList();
        
        return $articles;
    }
    
    // 12. Get articles by tag
    public static function get_articles_by_tag($tag_id, $order = 'id DESC', $limit = 12)
    {
        $typesr = null;
        $includeChildren = false;
        $orderByOption = 'c.core_title';
        $orderDir = 'ASC';
        $anyOrAll = true;
        $languageFilter = 'all';
        $stateFilter = '0,1';
        
        $th = new TagsHelper();
        
        $query = $th->getTagItemsQuery($tag_id, $typesr, $includeChildren, $orderByOption, $orderDir, $anyOrAll, $languageFilter, $stateFilter);
        
        $db = Factory::getDbo();
        
        $db->setQuery($query);
        
        $articles = $db->loadObjectList();
        
        return $articles;
    }
    
    // 13. Get fields
    public static function get_fields($article_id = null)
    {
        if ($article_id == null)
        {
            $fields = FieldsHelper::getFields('com_content.article');
        }
        else
        {
            $item = self::get_article($article_id);
            $fields = FieldsHelper::getFields('com_content.article', $item);
        }
        
        return $fields;
    }
    
    // 14. Render fields
    public static function render_fields($article_id)
    {
        $output = '';
        
        $item = self::get_article($article_id);
        $fields = FieldsHelper::getFields('com_content.article', $item);
        foreach ($fields as $field)
        {
            $output .= FieldsHelper::render('com_content.article', 'field.render', array('field' => $field));
        }
        
        return $output;
    }
    
    // 15. Find category for alias and parent id
    public static function find_category($alias, $parent_id = null, $extension = 'com_content')
    {
        $conditions = array(
            array('alias', '=', $alias),
            array('extension', '=', $extension)
            );
            
        if ($parent_id)
        {
            $conditions[] = array('parent_id', '=', $parent_id);
        }
        
        $category = TfDb::get_record('categories', $conditions, null, array('id'));
        
        return $category->id ? $category->id : false;
    }
    
    // 16. Find tag for alias
    public static function find_tag($alias)
    {
        $conditions = array(
            array('alias', '=', $alias)
            );
        
        $tag = TfDb::get_record('tags', $conditions, null, array('id'));
        
        return $category->id ? $category->id : false;
    }
}