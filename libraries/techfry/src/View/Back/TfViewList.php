<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library\View\Back;

\defined('_JEXEC') or die;

use Joomla\CMS\Factory;
use Joomla\CMS\Language\Associations;
use Joomla\CMS\Language\LanguageHelper;
use Joomla\CMS\HTML\HTMLHelper;
use Joomla\CMS\Language\Multilanguage;
use Joomla\CMS\Language\Text;
use Joomla\CMS\MVC\View\GenericDataException;
use Joomla\CMS\Layout\LayoutHelper;
use Joomla\CMS\MVC\View\HtmlView as BaseHtmlView;
use Joomla\CMS\Router\Route;
use Joomla\CMS\Session\Session;
use Joomla\CMS\Toolbar\Toolbar;
use Joomla\CMS\Toolbar\ToolbarHelper;

class TfViewList extends TfView
{
    // View class for backend list
  	protected $items;
  	protected $pagination;
    protected $state;
    public $filterForm;
    public $activeFilters;
  	private $isEmptyState = false;
  
    // Define in template file
    public $columns = array('id', 'published');
    public $ths = array(); // Depreciated
  	public $theads = array();
  	public $tbody = array();
    public $tr = array();
    
    public $table_name;
    public $form_view;
  
    public $total;
    
    public $listOrder;
    public $listDirn;
    
    public $childbar;
  
    public $es_add = true; // Depreciated - Checking for new in toolbar_buttons array

    public function display($tpl = null)
	{
		$this->initiate_list();
        
    	// Display template
		parent::display($tpl);
	}
    
    public function initiate_list()
    {
      	$this->initiate_view();
        
        // Table name from model
        $this->table_name = $this->getModel()->table_name;
        
        // Form view name
        if (empty($this->form_view))
        {
            $this->form_view = substr($this->view_name, 0, -1);
        }
        
        // Get data from model
        $this->items = $this->get('Items');
      	$this->pagination = $this->get('Pagination');
        $this->state = $this->get('State');
        
        // Adding Filters
        $this->filterForm = $this->get('FilterForm');
        $this->activeFilters = $this->get('ActiveFilters');
      
      	$this->total = $this->get('Total');
        
      	// Empty state layout
        if (\is_countable($this->items))
        {
            if (!\count($this->items) && $this->isEmptyState = $this->get('IsEmptyState'))
    		{
    			$this->setLayout('emptystate');
    		}
        }
      
        if ($this->filterForm)
        {
        	$this->listOrder = $this->escape($this->state->get('list.ordering'));
        	$this->listDirn = $this->escape($this->state->get('list.direction'));  
        }
        
      	// $saveOrder = $listOrder == 'a.ordering';
    }
    
    protected function addToolbar()
    {
        $this->toolbar = Toolbar::getInstance();
      
      	// 01. Title
      	ToolbarHelper::title(Text::_(strtoupper($this->option) . '_MANAGER_' . strtoupper($this->view_name)), $this->icon);
        
      	// 02. Back
        if (in_array('back', $this->toolbar_buttons))
        {
            ToolbarHelper::back();
        }
        
      	// 03. Dashboard
        if (in_array('dashboard', $this->toolbar_buttons))
        {
            $this->toolbar->linkButton('Dashboard')
                ->text('COM_TF_DASHBOARD')
                ->url('index.php?option=' . $this->option . '&view=dashboard')
                ->icon('fas fa-th');
        }
        
      	// 04. Select / New
        if (in_array('select', $this->toolbar_buttons))
        {
            $this->toolbar->linkButton('new', 'JTOOLBAR_NEW')
				->url('index.php?option=' . $this->option . '&view=select&layout=default&select_type=' . $this->form_view)
				->buttonClass('btn btn-success')
				->icon('icon-new');
        }
        elseif (in_array('new', $this->toolbar_buttons))
        {
            $this->toolbar->addNew($this->form_view . '.add');
        }
        
      	// 05. Dropdown
        $dropdown = $this->toolbar->dropdownButton('status-group')
            ->text('JTOOLBAR_CHANGE_STATUS')
            ->toggleSplit(false)
            ->icon('icon-ellipsis-h')
            ->buttonClass('btn btn-action')
            ->listCheck(false);
            
        $this->childbar = $dropdown->getChildToolbar();
      
      	if (in_array('publish', $this->toolbar_buttons))
        {
        	$this->childbar->publish($this->view_name . '.publish')->listCheck(true);
            $this->childbar->unpublish($this->view_name . '.unpublish')->listCheck(true);
        	$this->childbar->archive($this->view_name . '.archive')->listCheck(true);  
        }
      
      	if (in_array('trash', $this->toolbar_buttons) && $this->filterForm && $this->state->get('filter.published') != -2)
        {
        	$this->childbar->trash($this->view_name . '.trash')->listCheck(true);
        }
      
      	if (in_array('batch', $this->toolbar_buttons))
        {
         	$this->childbar->popupButton('batch', 'JTOOLBAR_BATCH')
                    ->selector('collapseModal')
                    ->listCheck(true); 
        }
      
      	if (in_array('delete', $this->toolbar_buttons))
        {
        	$this->childbar->delete($this->view_name . '.delete')
            				->text('JTOOLBAR_DELETE')
            				->message('JGLOBAL_CONFIRM_DELETE')
            				->icon('fas fa-trash-alt')
            				->listCheck(true); 	 
        }
      	
      	// Checks for records in table before truncate
      	if (in_array('empty', $this->toolbar_buttons))
        {
        	$this->childbar->standardButton('empty')
                             ->text('COM_TF_TRUNCATE_TABLE')
                             ->task($this->view_name . '.deleteTable')
                             ->icon('icon-trash')
                             ->listCheck(false); 	 
        }
      
      	if (in_array('truncate', $this->toolbar_buttons))
        {
        	$this->childbar->standardButton('empty')
                             ->text('COM_TF_TRUNCATE_TABLE')
                             ->task($this->view_name . '.truncateTable')
                             ->icon('icon-trash')
                             ->listCheck(false); 	 
        }
      
      	if (in_array('import', $this->toolbar_buttons))
        {
        	$this->childbar->linkButton('import')
                            ->url(Route::_('index.php?option=' . $this->option . '&view=import&type=' . $this->table_name))
            				->text('COM_TF_TOOLBAR_IMPORT')
            				->icon('icon-upload')
            				->listCheck(false);  
        }
      
      	if (in_array('export', $this->toolbar_buttons))
        {
         	$this->childbar->linkButton('export')
            				->url(Route::_('index.php?option=' . $this->option . '&view=export&type=' . $this->table_name))
            				->text('COM_TF_TOOLBAR_EXPORT')
            				->icon('icon-download')
            				->listCheck(false); 
        }
      	
		if (in_array('query', $this->toolbar_buttons))
        {
         	$this->childbar->linkButton('query')
                            ->url(Route::_('index.php?option=' . $this->option . '&view=query&type=' . $this->table_name))
            				->text('COM_TF_TOOLBAR_QUERY')
            				->icon('icon-database')
            				->listCheck(false); 
        }
        
      	// Empty Trash
        if (!$this->isEmptyState && $this->filterForm && $this->state->get('filter.published') == -2)
		{
			$this->toolbar->delete($this->view_name . '.delete', 'JTOOLBAR_EMPTY_TRASH')
				->message('JGLOBAL_CONFIRM_DELETE')
				->listCheck(true);
		}
        
        $this->custom_toolbar_buttons();

        if ($this->user->authorise('core.admin', $this->option) || $this->user->authorise('core.options', $this->option))
        {
            // ToolbarHelper::preferences($this->option);
          	$this->toolbar->preferences($this->option);
        }
        
        if ($this->help_url)
        {
        	$this->toolbar->help('', false, $this->help_url);
        }
    }
    
    // Start displaying list layout
    public function display_list_layout()
    {
        $wa = $this->document->getWebAssetManager();
      
       	$wa->useScript('table.columns')
          	->useScript('multiselect');
        
        echo '<form action="' . Route::_('index.php?option=' . $this->option . '&view=' . $this->view_name) . '" method="post" id="adminForm" name="adminForm">';
        echo '<div class="row">';
      	echo '<div class="col-md-12">';
        echo '<div id="j-main-container" class="j-main-container">';
        
        if ($this->filterForm)
        {
        	echo LayoutHelper::render('joomla.searchtools.default', array('view' => $this));  
        }
        
        if (empty($this->items))
        {
            echo $this->get_no_results_msg();
        }
        else
        {
            echo '<table class="table table-striped table-hover itemList">';
            	echo $this->add_thead();
          		echo $this->add_tbody();
            echo '</table>';
          
          	echo $this->pagination->getListFooter();
        }
      
      	echo '<input type="hidden" name="task" value="">';
        echo '<input type="hidden" name="boxchecked" value="0">';
        echo HTMLHelper::_('form.token');
      	echo '</div>';
      	echo '</div>';
        echo '</div>';
        echo '</form>';
    }
    
    // Empty state layout
    public function es_layout()
    {
        $displayData = array(
            'title' => Text::_(strtoupper($this->option) . '_MANAGER_' . strtoupper($this->view_name)),
	        'textPrefix' => strtoupper($this->option . '_' . $this->view_name),
	        'helpURL' => $this->help_url,
	        'icon' => $this->icon);
      
      	if (in_array('new', $this->toolbar_buttons))
        {
            $displayData['createURL'] = 'index.php?option=' . $this->option . '&task=' . $this->form_view . '.add';
        }
        
        echo LayoutHelper::render('joomla.content.emptystate', $displayData);
    }
    
    // Add table head in list layout
    public function add_thead($layout = 'default')
    {
        echo '<thead><tr>';
            if (in_array('id', $this->columns) && $layout == 'default')
            {
                echo '<td>' . HTMLHelper::_('grid.checkall') . '</td>';
            }
      
      		if (in_array('ordering', $this->columns))
            {
                echo '<th>' . HTMLHelper::_('searchtools.sort', 'JGRID_HEADING_ORDERING', 'a.ordering', $this->listDirn, $this->listOrder) . '</th>';
            }
            
            if (in_array('published', $this->columns))
            {
                echo '<th>' . HTMLHelper::_('searchtools.sort', 'JSTATUS', 'a.published', $this->listDirn, $this->listOrder) . '</th>';
            }
      
      		if (in_array('title', $this->columns))
            {
                echo '<th>' . HTMLHelper::_('searchtools.sort', 'JGLOBAL_TITLE', 'a.title', $this->listDirn, $this->listOrder) . '</th>';
            }
      
      		foreach ($this->theads as $h => $thead)
            {
                echo '<th>';
              	echo empty($thead) ? Text::_($h) : HTMLHelper::_('searchtools.sort', $h, $thead, $this->listDirn, $this->listOrder);
                echo '</th>';
            }
      
      		if (in_array('access', $this->columns))
            {
                echo '<th>' . HTMLHelper::_('searchtools.sort', 'JGRID_HEADING_ACCESS', 'a.access', $this->listDirn, $this->listOrder) . '</th>';
            }
      
      		if (in_array('created_by', $this->columns))
            {
                echo '<th>' . HTMLHelper::_('searchtools.sort', 'JGLOBAL_EMAIL', 'a.created_by', $this->listDirn, $this->listOrder) . '</th>';
            }
      
      		if (in_array('created', $this->columns))
            {
                echo '<th>' . HTMLHelper::_('searchtools.sort', 'JGLOBAL_CREATED', 'a.created', $this->listDirn, $this->listOrder) . '</th>';
            }
      
      		if (in_array('modified', $this->columns))
            {
                echo '<th>' . HTMLHelper::_('searchtools.sort', 'JGLOBAL_MODIFIED', 'a.modified', $this->listDirn, $this->listOrder) . '</th>';
            }
      
      		if (in_array('hits', $this->columns))
            {
                echo '<th>' . HTMLHelper::_('searchtools.sort', 'JGLOBAL_HITS', 'a.hits', $this->listDirn, $this->listOrder) . '</th>';
            }
            
            if (in_array('id', $this->columns))
            {
                echo '<th>' . HTMLHelper::_('searchtools.sort', 'JGRID_HEADING_ID', 'a.id', $this->listDirn, $this->listOrder) . '</th>';
            }
        
        echo '</tr></thead>';
    }
  
  	// Add table body in list layouts
  	public function add_tbody()
    {
    	echo '<tbody>';
      		foreach ($this->items as $i => $row)
            {
             	echo '<tr>';
              
              	if (in_array('id', $this->columns))
            	{
                	echo '<td>' . HTMLHelper::_('grid.id', $i, $row->id) . '</td>';
            	}
              
              	if (in_array('ordering', $this->columns))
            	{
                	echo '<td>' . $row->ordering . '</td>';
            	}
              
              	if (in_array('published', $this->columns))
            	{
                	echo '<td>' . $this->get_status($row->published) . '</td>';
            	}
              
              	foreach ($this->tbody[$i] as $col)
                {
                	echo '<td>'	. $col . '</td>';
                }
              
              	if (in_array('access', $this->columns))
            	{
                	echo '<td>' . $this->get_access($row->access) . '</td>';
            	}
              
              	if (in_array('created_by', $this->columns))
            	{
                	echo '<td>' . $this->get_user($row->created_by) . '</td>';
            	}
              
              	if (in_array('created', $this->columns))
            	{
                	echo '<td>' . $this->get_date($row->created) . '</td>';
            	}
              
              	if (in_array('modified', $this->columns))
            	{
                	echo '<td>' . $this->get_date($row->modified) . '</td>';
            	}
              
              	if (in_array('hits', $this->columns))
            	{
                	echo '<td>' . $this->get_number($row->hits, 'info') . '</td>';
            	}
              
              	if (in_array('id', $this->columns))
            	{
                	echo '<td>' . $row->id . '</td>';
            	}
              	echo '</tr>';
            }
      	echo '</tbody>';
    }
    
    public function modal_layout($js_file)
    {
        HTMLHelper::_('script', $this->option . '/' . $js_file, array('version' => 'auto', 'relative' => true));
        
        $default_function = 'jSelect' . ucwords($this->form_view);
        $function = $this->input->getCmd('function', $default_function);
        
        $onclick   = $this->escape($function);
        $multilang = Multilanguage::isEnabled();
        
        echo '<form action="index.php?option=' . $this->option . '&view=' . $this->view_name . '&layout=modal&tmpl=component&function=' . $function; 
        echo '&' . Session::getFormToken() . '=1" method="post" id="adminForm" name="adminForm">';
        
        echo LayoutHelper::render('joomla.searchtools.default', array('view' => $this));
        
        if (empty($this->items))
        {
            echo $this->get_no_results_msg();
        }
        else
        {
            $this->ths = array(array('JGLOBAL_TITLE', 'a.title'));
            
            echo '<table class="table table-striped table-hover">';
            
                echo $this->add_thead('modal');
                
                echo '<tbody>';
                
                foreach ($this->items as $i => $item)
                {
                    if ($item->language && $multilang)
					{
						$tag = strlen($item->language);
						if ($tag == 5)
						{
							$lang = substr($item->language, 0, 2);
						}
						elseif ($tag == 6)
						{
							$lang = substr($item->language, 0, 3);
						}
						else {
							$lang = '';
						}
					}
					elseif (!$multilang)
					{
						$lang = '';
					}
                    
                    echo '<tr>';
                        echo '<td>' . $this->get_binary($item->published) . '</td>';
                        
                        echo '<th>';
                            $link = 'index.php?option=' . $this->option . '&view=' . $this->form_view . '&id=' . $item->id;
							    $attribs = 'data-function="' . $this->escape($onclick) . '"'
								. ' data-id="' . $item->id . '"'
								. ' data-title="' . $this->escape($item->title) . '"'
								. ' data-uri="' . $link . '"'
								. ' data-language="' . $this->escape($lang) . '"';
								
								echo '<a class="select-link" href="javascript:void(0)" ' . $attribs . '>' . $this->escape($item->title) . '</a>';
								
                        echo '</th>';
                        
                        echo '<td>' . (int) $item->id . '</td>';
                    echo '</tr>';
                }
                
                echo '</tbody>';
                
            echo '</table>';
        }
        
        echo $this->pagination->getListFooter();
        
        echo '<input type="hidden" name="task" value="">';
        echo '<input type="hidden" name="boxchecked" value="0">';
        echo '<input type="hidden" name="forcedLanguage" value="' . $this->input->get('forcedLanguage', '', 'CMD') . '">';
        echo HTMLHelper::_('form.token');

        echo '</form>';
    }
    
    public function get_lang($item)
    {
        $output .= '<small>' . LayoutHelper::render('joomla.content.language', $item) . '</small>';
        
        return $output;
    }
    
    public function get_assoc($item_id, $context)
    {
		$html = '';

		if ($associations = Associations::getAssociations($this->option, '#__' . $this->table_name, $context, (int) $item_id, 'id', 'alias', ''))
		{
			foreach ($associations as $tag => $associated)
			{
				$associations[$tag] = (int) $associated->id;
			}

			// Get the associated menu items
			$db = Factory::getDbo();
			
			$query = $db->getQuery(true)
				->select('a.*')
				->select('l.sef as lang_sef')
				->select('l.lang_code')
				->from('#__' . $this->table_name . ' as a')
				->where('a.id IN (' . implode(',', array_values($associations)) . ')')
				->join('LEFT', '#__languages as l ON a.language=l.lang_code')
				->select('l.image')
				->select('l.title as language_title');
				
			$db->setQuery($query);

			$items = $db->loadObjectList('id');

			if ($items)
			{
				$languages = LanguageHelper::getContentLanguages(array(0, 1));
				$content_languages = array_column($languages, 'lang_code');
				
				foreach ($items as &$item)
				{
					if (in_array($item->lang_code, $content_languages))
					{
					    $text = $item->lang_sef ? strtoupper($item->lang_sef) : 'XX';
					    
    					$url = Route::_('index.php?option=' . $this->option . '&view=' . $this->form_view . '&layout=edit&id=' . (int) $item->id);
    
    					$tooltip = htmlspecialchars($item->greeting, ENT_QUOTES, 'UTF-8') . '<br />' . Text::sprintf('JCATEGORY_SPRINTF', $item->category_title);
    					
    					$classes = 'badge bg-info';
    
    					$item->link = '<a href="' . $url . '" title="' . $item->language_title . '" class="' . $classes
    						. '" data-content="' . $tooltip . '" data-placement="top">'
    						. $text . '</a>';
					}
					else
					{
						Factory::getApplication()->enqueueMessage(Text::sprintf('JGLOBAL_ASSOCIATIONS_CONTENTLANGUAGE_WARNING', $item->lang_code), 'warning');
					}
				}
			}

			$html = LayoutHelper::render('joomla.content.associations', $items);
		}
        
		return $html;
    }
}