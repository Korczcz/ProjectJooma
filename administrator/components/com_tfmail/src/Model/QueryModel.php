<?php
 /*
 * @package		TF Mail Component
 * @license		GNU General Public License version 2 or later; see LICENSE.txt
 */

namespace TechFry\Component\TfMail\Administrator\Model;

defined('_JEXEC') or die;

use TechFry\Library\Model\TfModelQuery;

class QueryModel extends TfModelQuery
{
	public function get_query_form()
	{
	    parent::get_query_form();
	    
	    // Statistics filter
	    $element = '<field name="note03" type="note" label="Statistics" class="text-muted" showon="query_type:users[AND]tool:update,replace,delete,string,date,numeric" />';
        $this->set_field($element, 'filters');
	    
	    $element = '<field name="filterstats" type="subform" label="COM_TF_CUSTOM_FIELDS" multiple="true" 
                layout="joomla.form.field.subform.repeatable-table" filter="raw" hiddenLabel="true" 
                formsource="administrator/components/com_tfmail/forms/subform_filterstats.xml" showon="query_type:users[AND]tool:update,replace,delete,string,date,numeric" />';
        $this->set_field($element, 'filters');
        
        // Aggregate statistics filter
        $element = '<field name="note04" type="note" label="Aggregate Statistics" class="text-muted" showon="query_type:users[AND]tool:update,replace,delete,string,date,numeric" />';
        $this->set_field($element, 'filters');
	    
	    $element = '<field name="filterstats_aggr" type="subform" label="COM_TF_CUSTOM_FIELDS" multiple="true" 
                layout="joomla.form.field.subform.repeatable-table" filter="raw" hiddenLabel="true" 
                formsource="administrator/components/com_tfmail/forms/subform_filterstats_aggr.xml" showon="query_type:users[AND]tool:update,replace,delete,string,date,numeric" />';
        $this->set_field($element, 'filters');
	}
	
}