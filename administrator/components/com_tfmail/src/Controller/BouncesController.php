<?php
 /*
 * @package		TF Mail Component
 * @license		GNU General Public License version 2 or later; see LICENSE.txt
 */

namespace TechFry\Component\TfMail\Administrator\Controller;

defined('_JEXEC') or die;

use TechFry\Library\Controller\TfControllerAdmin;

class BouncesController extends TfControllerAdmin
{
    public function getModel($name = 'Bounce', $prefix = 'Administrator', $config = array('ignore_request' => true))
    {
        $model = parent::getModel($name, $prefix, $config);

        return $model;
    }
}