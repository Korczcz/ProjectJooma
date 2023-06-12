<?php
 /*
 * @package		TF Mail Component
 * @license		GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;

use TechFry\Library\TfDb;

$fgs = TfDb::get_items('fields_groups', array(array('context', '=', 'com_users.user')));

foreach ($fgs as $fg)
{
    $filedset_name = 'fields-' . $fg->id;
    echo $this->render_fieldset($this->fieldsets[$filedset_name]);
}
?>