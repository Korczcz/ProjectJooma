<?php
 /*
 * @package		TF Mail Component
 * @license		GNU General Public License version 2 or later; see LICENSE.txt
 */

namespace TechFry\Component\TfMail\Administrator\Helper;

defined('_JEXEC') or die;

use Joomla\CMS\Factory;

// Email Reading Script

class EmailHelper
{
    public static $inbox;
    
    public static $mbox;
    
    public static $emails = array();
    
    public static $message = array();
    
    // 01. Connect to email server
    public static function connection($email = array())
    {
        // $email is array - server, port, username, password
        
        $mailbox = '{' . $email['server'] . ':' . $email['port'] . '/imap/ssl/novalidate-cert}INBOX';
        $username = $email['username'];
        $password = $email['password'];
        
        $imap = imap_open($mailbox, $username, $password) or die('Cannot connect to email: ' . imap_last_error());
        
        return $imap;
    }
    
    // 02. Check mailbox and return total messages
    public static function check($imap)
    {
        $mbox = imap_check($imap);
        
        return $mbox->Nmsgs;
    }
    
    // 03. Read emails and returns array of message numbers
    public static function read($imap, $order = 0)
    {
        $emails = imap_search($imap, 'ALL');
        
        if ($order)
        {
            rsort($emails);
        }
        
        return $emails;
    }
    
    // 04. Returns email message information
    public static function analyse($imap, $emails, $msg_number = 0)
    {
        self::$message['header'] = imap_headerinfo($imap, $emails[$msg_number]);
        
        $s = imap_fetchstructure($imap, $emails[$msg_number]); // Returns object
        // $s->parts is an array of objects
        
        // For simple message, $s->parts is not set
        if (!isset($s->parts))
        {
            self::getpart($imap, $emails[$msg_number], $s, 0);
        }
        // Multipart message: cycle through each part
        else
        {
            $parts = array();
            foreach ($s->parts as $part_n => $p)
            {
                self::getpart($imap, $emails[$msg_number], $p, $part_n + 1);
            }
        }
        
        imap_delete($imap, $emails[$msg_number]);
        
        return self::$message;
    }
    
    // 05. Used by analyse email
    protected static function getpart($imap, $mid, $p, $part_n)
    {
        // A. For simple message, use imap_body, else use imap_fetchbody
        $data = ($part_n) ? imap_fetchbody($imap, $mid, $part_n) : imap_body($imap, $mid);
    
        // B. Encoding
        // Quoted-Printable Encoding
        if ($p->encoding == 4)
        {
            $data = quoted_printable_decode($data);
        }
        // Base64 Encoding
        else if ($p->encoding == 3)
        {
            $data = base64_decode($data);
        }
        
        // C. Email Parameters
        $eparams = array();
        if ($p->ifparameters)
        {
            foreach ($p->parameters as $x)
            {
                $eparams[strtolower($x->attribute)] = $x->value;
            }
        }
        if ($p->ifdparameters)
        {
            foreach ($p->dparameters as $x)
            {
                $eparams[strtolower($x->attribute)] = $x->value;
            }
        }
        
        // D. Attachments
        if (isset($eparams['filename']) || isset($eparams['name']))
        {
            $filename = ($eparams['filename']) ? $eparams['filename'] : $eparams['name'];
            self::$message['attachments'][$filename] = $data;
        }
        
        // E. Text Messaage (Type 0 is text, 1 is multipart, 2 is message)
        if ($p->type == 0 && $data)
        {
            if (strtolower($p->subtype) == 'plain')
            {
                self::$message['plain_msg'] = trim($data) . "\n\n";
            }
            else
            {
                self::$message['html_msg'] = $data . '<br><br>';
            }
            self::$message['charset'] = $eparams['charset'];
        }
        elseif ($p->type == 2 && $data)
        {
            self::$message['plain_msg'] .= $data . "\n\n";
        }
        
        // F. Subparts Recursion
        if (isset($p->parts))
        {
            foreach ($p->parts as $part_n2 => $p2)
            {
                self::getpart($imap, $mid, $p2, $part_n . '.' . ($part_n2 + 1));
            }
        }
    }
    
    // 06.
    public static function del($imap)
    {
        imap_expunge($imap);
    }
    
    // 07.
    public static function close($imap)
    {
        imap_close($imap);
    }
}