<?php
 /*
 * @package		TF Mail Component
 * @license		GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;

use TechFry\Library\View\Air\Flex;
use TechFry\Library\View\Air\Button;

$btn_class = Button::get_class(array(), $this->framework);

$this->start_page_layout();

    $action_buttons = array();
    
    if ($this->params->get('enable_google', 0))
    {
        $action_buttons[] = array('Join with Google', 'social.google', $btn_class, 'fa-brands fa-google');
    }
    
    if ($this->params->get('enable_linkedin', 0))
    {
        $action_buttons[] = array('Join with Linkedin', 'social.linkedin', $btn_class, 'fa-brands fa-linkedin-in');
    }
    
    if ($this->params->get('enable_facebook', 0))
    {
        $action_buttons[] = array('Join with Facebook', 'social.facebook', $btn_class, 'fa-brands fa-facebook-f');
    }
    
    if ($this->params->get('enable_github', 0))
    {
        $action_buttons[] = array('Join with Github', 'social.github', $btn_class, 'fa-brands fa-github');
    }
    
    if (!empty($action_buttons))
    {
        $flex = Flex::get_class(array(), false, $this->framework);
      	
      	echo '<div class="' . $flex . '" style="margin-bottom:12px;">';
            echo $this->action_buttons($action_buttons);
        echo '</div>';
    }
    
    if ($this->params->get('enable_form', 1))
    {
        echo $this->loadTemplate('form');
    }

$this->end_page_layout();
?>
