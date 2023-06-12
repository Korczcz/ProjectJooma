<?php
 /*
 * @package		TF Mail Component
 * @license		GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;

echo '<code>' . nl2br(htmlspecialchars($this->email['text_body'])) . '</code>';
?>