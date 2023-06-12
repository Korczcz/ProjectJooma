<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library\View\Air;

defined('_JEXEC') or die;

class Grid
{
    public static $classes = array();
  
  	public static $grid = array();
  	
  	public static function get_classes($fw = 'bs')
    {
     	$function_name = 'get_classes_' . $fw;
      
      	self::$function_name();
      
      	return self::$classes;
    }
  
  	public static function get_classes_bs()
    {
    	self::$classes = array(
          'grid_class' => 'row',
		  'col_25' => 'col-3',
		  'col_75' => 'col-9',
          'col_auto' => array('1' => 'col-12', '2' => 'col-6', '3' => 'col-4', '4' => 'col-3')
          );
    }
  
  	public static function get_classes_uk()
    {
     	self::$classes = array(
          'grid_class' => 'uk-grid',
		  'col_25' => 'uk-width-1-4',
		  'col_75' => 'uk-width-3-4',
          'col_auto' => array('1' => 'uk-width-1-1', '2' => 'uk-width-1-2', '3' => 'uk-width-1-3', '4' => 'uk-width-1-4')
          );
    }
  
  	public static function get_grid($type, $fw = 'bs')
    {
    	$function_name = 'get_grid_' . $fw;
      
      	self::$function_name($type);
      
      	return self::$grid;
    }
  
  	public static function get_grid_bs($type)
    {
    	switch ($type)
        {
        	case 1 :
            	self::$grid = array('row' => 'row gy-3', 'col1' => 'col-12', 'col2' => '', 'col3' => '', 'col4' => '');
            	break;
            
       		case 2 :
            	self::$grid = array('row' => 'row gy-3', 'col1' => 'col-12 col-md-6', 'col2' => 'col-12 col-md-6', 'col3' => '', 'col4' => '');
            	break;
            
            case 3 :
            	self::$grid = array('row' => 'row gy-3', 'col1' => 'col-12 col-lg-4', 'col2' => 'col-12 col-lg-4', 'col3' => 'col-12 col-lg-4', 'col4' => '');
            	break;
            
       		case 4 :
            	self::$grid = array('row' => 'row gy-3', 'col1' => 'col-12 col-md-6 col-lg-3', 'col2' => 'col-12 col-md-6 col-lg-3', 'col3' => 'col-12 col-md-6 col-lg-3', 'col4' => 'col-12 col-md-6 col-lg-3');
            	break;
            
            case 5 :
            	self::$grid = array('row' => 'row gy-3', 'col1' => 'col-12 col-md-8', 'col2' => 'col-12 col-md-4', 'col3' => '', 'col4' => '');
            	break;
            
       		case 6 :
            	self::$grid = array('row' => 'row gy-3', 'col1' => 'col-12 col-md-4', 'col2' => 'col-12 col-md-8', 'col3' => '', 'col4' => '');
            	break;
            
            case 7 :
            	self::$grid = array('row' => 'row gy-3', 'col1' => 'col-12 col-md-12 col-lg-6', 'col2' => 'col-12 col-md-6 col-lg-3', 'col3' => 'col-12 col-md-6 col-lg-3', 'col4' => '');
            	break;
            
       		case 8 :
            	self::$grid = array('row' => 'row gy-3', 'col1' => 'col-12 col-md-6 col-lg-3', 'col2' => 'col-12 col-md-6 col-lg-3', 'col3' => 'col-12 col-md-12 col-lg-6', 'col4' => '');
            	break;
            
            case 9 :
            	self::$grid = array('row' => 'row gy-3', 'col1' => 'col-12 col-lg-3', 'col2' => 'col-12 col-lg-6', 'col3' => 'col-12 col-lg-3', 'col4' => '');
            	break;
        }
    }
  
  	public static function get_grid_uk($type)
    {
    	switch ($type)
        {
        	case 1 :
            	self::$grid = array('row' => 'uk-grid', 'col1' => 'uk-width-1-1', 'col2' => '', 'col3' => '', 'col4' => '');
            	break;
            
       		case 2 :
            	self::$grid = array('row' => 'uk-grid', 'col1' => 'uk-width-1-2@s', 'col2' => 'uk-width-1-2@s', 'col3' => '', 'col4' => '');
            	break;
            
            case 3 :
            	self::$grid = array('row' => 'uk-grid', 'col1' => 'uk-width-1-3@m', 'col2' => 'uk-width-1-3@m', 'col3' => 'uk-width-1-3@m', 'col4' => '');
            	break;
            
       		case 4 :
            	self::$grid = array('row' => 'uk-grid', 'col1' => 'uk-width-1-4@m', 'col2' => 'uk-width-1-4@m', 'col3' => 'uk-width-1-4@m', 'col4' => 'uk-width-1-4@m');
            	break;
            
            case 5 :
            	self::$grid = array('row' => 'uk-grid', 'col1' => 'uk-width-2-3@s', 'col2' => 'uk-width-1-3@s', 'col3' => '', 'col4' => '');
            	break;
            
       		case 6 :
            	self::$grid = array('row' => 'uk-grid', 'col1' => 'uk-width-1-3@s', 'col2' => 'uk-width-2-3@s', 'col3' => '', 'col4' => '');
            	break;
            
            case 7 :
            	self::$grid = array('row' => 'uk-grid', 'col1' => 'uk-width-1-2@s', 'col2' => 'uk-width-1-4@s', 'col3' => 'uk-width-1-4@s', 'col4' => '');
            	break;
            
       		case 8 :
            	self::$grid = array('row' => 'uk-grid', 'col1' => 'uk-width-1-4@s', 'col2' => 'uk-width-1-4@s', 'col3' => 'uk-width-1-2@s', 'col4' => '');
            	break;
            
            case 9 :
            	self::$grid = array('row' => 'uk-grid', 'col1' => 'uk-width-1-4@s', 'col2' => 'uk-width-1-2@s', 'col3' => 'uk-width-1-4@s', 'col4' => '');
            	break;
        }
    }
  
  	public static function get_grid_names()
    {
    	$array = array('None', 'One Column', 'Two Equal Columns', 'Three Equal Columns', 'Four Equal Columns',
                      'Two Columns: 2-1', 'Two Columns: 1-2', 'Three Columns: 2-1-1', 'Three Columns: 1-1-2', 'Three Columns: 1-2-1');
      
      	return $array;  
    }
}