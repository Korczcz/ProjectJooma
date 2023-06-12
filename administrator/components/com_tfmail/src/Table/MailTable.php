<?php
 /*
 * @package		TF Mail Component
 * @license		GNU General Public License version 2 or later; see LICENSE.txt
 */

namespace TechFry\Component\TfMail\Administrator\Table;

defined('_JEXEC') or die;

use Joomla\CMS\Table\Table;
use Joomla\Database\DatabaseDriver;

class MailTable extends Table
{
    function __construct(DatabaseDriver $db)
    {
        parent::__construct('#__tfm_mail', 'id', $db);
    }
}