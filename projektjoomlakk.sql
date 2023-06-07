-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 07 Cze 2023, 09:50
-- Wersja serwera: 10.4.22-MariaDB
-- Wersja PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `projektjoomlakk`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `buf3w_action_logs`
--

CREATE TABLE `buf3w_action_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `message_language_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `log_date` datetime NOT NULL,
  `extension` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL DEFAULT 0,
  `item_id` int(11) NOT NULL DEFAULT 0,
  `ip_address` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0.0.0.0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `buf3w_action_logs`
--

INSERT INTO `buf3w_action_logs` (`id`, `message_language_key`, `message`, `log_date`, `extension`, `user_id`, `item_id`, `ip_address`) VALUES
(1, 'PLG_ACTIONLOG_JOOMLA_USER_LOGGED_IN', '{\"action\":\"login\",\"userid\":588,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=588\",\"app\":\"PLG_ACTIONLOG_JOOMLA_APPLICATION_SITE\"}', '2023-06-06 05:54:25', 'com_users', 588, 0, 'COM_ACTIONLOGS_DISABLED'),
(2, 'PLG_ACTIONLOG_JOOMLA_USER_LOGGED_OUT', '{\"action\":\"logout\",\"id\":588,\"userid\":588,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=588\",\"app\":\"PLG_ACTIONLOG_JOOMLA_APPLICATION_SITE\"}', '2023-06-06 05:56:16', 'com_users', 588, 588, 'COM_ACTIONLOGS_DISABLED'),
(3, 'PLG_ACTIONLOG_JOOMLA_USER_LOGGED_IN', '{\"action\":\"login\",\"userid\":588,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=588\",\"app\":\"PLG_ACTIONLOG_JOOMLA_APPLICATION_SITE\"}', '2023-06-06 05:56:29', 'com_users', 588, 0, 'COM_ACTIONLOGS_DISABLED'),
(4, 'PLG_ACTIONLOG_JOOMLA_USER_LOGGED_IN', '{\"action\":\"login\",\"userid\":588,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=588\",\"app\":\"PLG_ACTIONLOG_JOOMLA_APPLICATION_ADMINISTRATOR\"}', '2023-06-06 05:57:14', 'com_users', 588, 0, 'COM_ACTIONLOGS_DISABLED'),
(5, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_ADDED', '{\"action\":\"add\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MEDIA\",\"id\":0,\"title\":\"Tama.webp\",\"itemlink\":\"index.php?option=com_media&path=local-images:\\/\",\"userid\":588,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=588\"}', '2023-06-06 06:05:54', 'com_media.file', 588, 0, 'COM_ACTIONLOGS_DISABLED'),
(6, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_ADDED', '{\"action\":\"add\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MEDIA\",\"id\":0,\"title\":\"tama1.jpg\",\"itemlink\":\"index.php?option=com_media&path=local-images:\\/\",\"userid\":588,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=588\"}', '2023-06-06 06:07:38', 'com_media.file', 588, 0, 'COM_ACTIONLOGS_DISABLED'),
(7, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_ADDED', '{\"action\":\"add\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MEDIA\",\"id\":0,\"title\":\"tama2.jpeg\",\"itemlink\":\"index.php?option=com_media&path=local-images:\\/\",\"userid\":588,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=588\"}', '2023-06-06 06:36:15', 'com_media.file', 588, 0, 'COM_ACTIONLOGS_DISABLED'),
(8, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_ADDED', '{\"action\":\"add\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_ARTICLE\",\"id\":1,\"title\":\"Rosjanie wysadzili zapor\\u0119\",\"itemlink\":\"index.php?option=com_content&task=article.edit&id=1\",\"userid\":588,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=588\"}', '2023-06-06 06:37:25', 'com_content.article', 588, 1, 'COM_ACTIONLOGS_DISABLED'),
(9, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_ADDED', '{\"action\":\"add\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_CATEGORY\",\"id\":8,\"title\":\"Wojna\",\"itemlink\":\"index.php?option=com_categories&task=category.edit&id=8\",\"userid\":588,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=588\"}', '2023-06-06 06:54:12', 'com_categories.category', 588, 8, 'COM_ACTIONLOGS_DISABLED'),
(10, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED', '{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_ARTICLE\",\"id\":\"1\",\"title\":\"Rosjanie wysadzili zapor\\u0119\",\"itemlink\":\"index.php?option=com_content&task=article.edit&id=1\",\"userid\":588,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=588\"}', '2023-06-06 06:54:12', 'com_content.article', 588, 1, 'COM_ACTIONLOGS_DISABLED'),
(11, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":588,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=588\",\"userid\":588,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=588\",\"table\":\"#__content\"}', '2023-06-06 06:54:12', 'com_checkin', 588, 588, 'COM_ACTIONLOGS_DISABLED'),
(12, 'PLG_ACTIONLOG_JOOMLA_USER_LOGGED_IN', '{\"action\":\"login\",\"userid\":588,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=588\",\"app\":\"PLG_ACTIONLOG_JOOMLA_APPLICATION_ADMINISTRATOR\"}', '2023-06-06 08:07:00', 'com_users', 588, 0, 'COM_ACTIONLOGS_DISABLED'),
(13, 'PLG_ACTIONLOG_JOOMLA_USER_LOGGED_IN', '{\"action\":\"login\",\"userid\":588,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=588\",\"app\":\"PLG_ACTIONLOG_JOOMLA_APPLICATION_SITE\"}', '2023-06-06 08:09:25', 'com_users', 588, 0, 'COM_ACTIONLOGS_DISABLED'),
(14, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_ADDED', '{\"action\":\"add\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MEDIA\",\"id\":0,\"title\":\"123.webp\",\"itemlink\":\"index.php?option=com_media&path=local-images:\\/\",\"userid\":588,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=588\"}', '2023-06-06 08:22:08', 'com_media.file', 588, 0, 'COM_ACTIONLOGS_DISABLED'),
(15, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_ADDED', '{\"action\":\"add\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MEDIA\",\"id\":0,\"title\":\"1234.webp\",\"itemlink\":\"index.php?option=com_media&path=local-images:\\/\",\"userid\":588,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=588\"}', '2023-06-06 08:25:55', 'com_media.file', 588, 0, 'COM_ACTIONLOGS_DISABLED'),
(16, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_ADDED', '{\"action\":\"add\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MEDIA\",\"id\":0,\"title\":\"546456.jpg\",\"itemlink\":\"index.php?option=com_media&path=local-images:\\/\",\"userid\":588,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=588\"}', '2023-06-06 08:30:23', 'com_media.file', 588, 0, 'COM_ACTIONLOGS_DISABLED'),
(17, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_ADDED', '{\"action\":\"add\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_ARTICLE\",\"id\":2,\"title\":\"Sprzeczne doniesienia o Polakach na froncie\",\"itemlink\":\"index.php?option=com_content&task=article.edit&id=2\",\"userid\":588,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=588\"}', '2023-06-06 08:30:59', 'com_content.article', 588, 2, 'COM_ACTIONLOGS_DISABLED'),
(18, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_ADDED', '{\"action\":\"add\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MEDIA\",\"id\":0,\"title\":\"gasdgdsgsgs.jpg\",\"itemlink\":\"index.php?option=com_media&path=local-images:\\/\",\"userid\":588,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=588\"}', '2023-06-06 09:14:51', 'com_media.file', 588, 0, 'COM_ACTIONLOGS_DISABLED'),
(19, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_ADDED', '{\"action\":\"add\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MEDIA\",\"id\":0,\"title\":\"Lithuanian_Stingers.jpg\",\"itemlink\":\"index.php?option=com_media&path=local-images:\\/\",\"userid\":588,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=588\"}', '2023-06-06 09:19:41', 'com_media.file', 588, 0, 'COM_ACTIONLOGS_DISABLED'),
(20, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_ADDED', '{\"action\":\"add\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_ARTICLE\",\"id\":3,\"title\":\"Ostrze ukrai\\u0144skiej w\\u0142\\u00f3czni\",\"itemlink\":\"index.php?option=com_content&task=article.edit&id=3\",\"userid\":588,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=588\"}', '2023-06-06 09:19:59', 'com_content.article', 588, 3, 'COM_ACTIONLOGS_DISABLED'),
(21, 'PLG_ACTIONLOG_JOOMLA_USER_LOGGED_IN', '{\"action\":\"login\",\"userid\":588,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=588\",\"app\":\"PLG_ACTIONLOG_JOOMLA_APPLICATION_SITE\"}', '2023-06-07 07:15:10', 'com_users', 588, 0, 'COM_ACTIONLOGS_DISABLED'),
(22, 'PLG_ACTIONLOG_JOOMLA_USER_LOGGED_IN', '{\"action\":\"login\",\"userid\":588,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=588\",\"app\":\"PLG_ACTIONLOG_JOOMLA_APPLICATION_ADMINISTRATOR\"}', '2023-06-07 07:17:05', 'com_users', 588, 0, 'COM_ACTIONLOGS_DISABLED'),
(23, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_ADDED', '{\"action\":\"add\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MEDIA\",\"id\":0,\"title\":\"250lb.webp\",\"itemlink\":\"index.php?option=com_media&path=local-images:\\/\",\"userid\":588,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=588\"}', '2023-06-07 07:30:33', 'com_media.file', 588, 0, 'COM_ACTIONLOGS_DISABLED'),
(24, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_ADDED', '{\"action\":\"add\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MEDIA\",\"id\":0,\"title\":\"1000-lb-Sisters-Tammy-Slaton-Amy-Slaton-5489-800x445.jpg\",\"itemlink\":\"index.php?option=com_media&path=local-images:\\/\",\"userid\":588,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=588\"}', '2023-06-07 07:32:28', 'com_media.file', 588, 0, 'COM_ACTIONLOGS_DISABLED'),
(25, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_ADDED', '{\"action\":\"add\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_ARTICLE\",\"id\":4,\"title\":\"Siostry wielkiej wagi\",\"itemlink\":\"index.php?option=com_content&task=article.edit&id=4\",\"userid\":588,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=588\"}', '2023-06-07 07:32:36', 'com_content.article', 588, 4, 'COM_ACTIONLOGS_DISABLED'),
(26, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_ADDED', '{\"action\":\"add\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_CATEGORY\",\"id\":9,\"title\":\"Social Media\",\"itemlink\":\"index.php?option=com_categories&task=category.edit&id=9\",\"userid\":588,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=588\"}', '2023-06-07 07:32:58', 'com_categories.category', 588, 9, 'COM_ACTIONLOGS_DISABLED'),
(27, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED', '{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_ARTICLE\",\"id\":\"4\",\"title\":\"Siostry wielkiej wagi\",\"itemlink\":\"index.php?option=com_content&task=article.edit&id=4\",\"userid\":588,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=588\"}', '2023-06-07 07:32:58', 'com_content.article', 588, 4, 'COM_ACTIONLOGS_DISABLED'),
(28, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":588,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=588\",\"userid\":588,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=588\",\"table\":\"#__content\"}', '2023-06-07 07:32:58', 'com_checkin', 588, 588, 'COM_ACTIONLOGS_DISABLED'),
(29, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_ADDED', '{\"action\":\"add\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MEDIA\",\"id\":0,\"title\":\"z29498988AMPTikTok-zwalnia----Polski-dzial-badan-i-rozwoju-uci.jpg\",\"itemlink\":\"index.php?option=com_media&path=local-images:\\/\",\"userid\":588,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=588\"}', '2023-06-07 07:40:31', 'com_media.file', 588, 0, 'COM_ACTIONLOGS_DISABLED'),
(30, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_ADDED', '{\"action\":\"add\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MEDIA\",\"id\":0,\"title\":\"tiktok-1-mld-uzytkownikow.png\",\"itemlink\":\"index.php?option=com_media&path=local-images:\\/\",\"userid\":588,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=588\"}', '2023-06-07 07:40:35', 'com_media.file', 588, 0, 'COM_ACTIONLOGS_DISABLED'),
(31, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_ADDED', '{\"action\":\"add\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_ARTICLE\",\"id\":5,\"title\":\"TikTok\\u00a0szykuje zmiany\",\"itemlink\":\"index.php?option=com_content&task=article.edit&id=5\",\"userid\":588,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=588\"}', '2023-06-07 07:40:46', 'com_content.article', 588, 5, 'COM_ACTIONLOGS_DISABLED'),
(32, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_ADDED', '{\"action\":\"add\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MEDIA\",\"id\":0,\"title\":\"408653.jpg\",\"itemlink\":\"index.php?option=com_media&path=local-images:\\/\",\"userid\":588,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=588\"}', '2023-06-07 07:48:43', 'com_media.file', 588, 0, 'COM_ACTIONLOGS_DISABLED'),
(33, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_ADDED', '{\"action\":\"add\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MEDIA\",\"id\":0,\"title\":\"lbDk9kqTURBXy9jY2VkZWJmODVlMWJiZmYxNGI5Yzk4NDA0YzQxNGI3YS5qcGVnkpUDAMxszQwmzQbVkwXNBLDNAljeAAGhMAE.jpg\",\"itemlink\":\"index.php?option=com_media&path=local-images:\\/\",\"userid\":588,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=588\"}', '2023-06-07 07:48:50', 'com_media.file', 588, 0, 'COM_ACTIONLOGS_DISABLED'),
(34, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_ADDED', '{\"action\":\"add\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_ARTICLE\",\"id\":6,\"title\":\"Facebook na \\\"czarnej li\\u015bcie\\\"\",\"itemlink\":\"index.php?option=com_content&task=article.edit&id=6\",\"userid\":588,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=588\"}', '2023-06-07 07:49:03', 'com_content.article', 588, 6, 'COM_ACTIONLOGS_DISABLED');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `buf3w_action_logs_extensions`
--

CREATE TABLE `buf3w_action_logs_extensions` (
  `id` int(10) UNSIGNED NOT NULL,
  `extension` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `buf3w_action_logs_extensions`
--

INSERT INTO `buf3w_action_logs_extensions` (`id`, `extension`) VALUES
(1, 'com_banners'),
(2, 'com_cache'),
(3, 'com_categories'),
(4, 'com_config'),
(5, 'com_contact'),
(6, 'com_content'),
(7, 'com_installer'),
(8, 'com_media'),
(9, 'com_menus'),
(10, 'com_messages'),
(11, 'com_modules'),
(12, 'com_newsfeeds'),
(13, 'com_plugins'),
(14, 'com_redirect'),
(15, 'com_tags'),
(16, 'com_templates'),
(17, 'com_users'),
(18, 'com_checkin'),
(19, 'com_scheduler');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `buf3w_action_logs_users`
--

CREATE TABLE `buf3w_action_logs_users` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `notify` tinyint(3) UNSIGNED NOT NULL,
  `extensions` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `buf3w_action_log_config`
--

CREATE TABLE `buf3w_action_log_config` (
  `id` int(10) UNSIGNED NOT NULL,
  `type_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `type_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `id_holder` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title_holder` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text_prefix` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `buf3w_action_log_config`
--

INSERT INTO `buf3w_action_log_config` (`id`, `type_title`, `type_alias`, `id_holder`, `title_holder`, `table_name`, `text_prefix`) VALUES
(1, 'article', 'com_content.article', 'id', 'title', '#__content', 'PLG_ACTIONLOG_JOOMLA'),
(2, 'article', 'com_content.form', 'id', 'title', '#__content', 'PLG_ACTIONLOG_JOOMLA'),
(3, 'banner', 'com_banners.banner', 'id', 'name', '#__banners', 'PLG_ACTIONLOG_JOOMLA'),
(4, 'user_note', 'com_users.note', 'id', 'subject', '#__user_notes', 'PLG_ACTIONLOG_JOOMLA'),
(5, 'media', 'com_media.file', '', 'name', '', 'PLG_ACTIONLOG_JOOMLA'),
(6, 'category', 'com_categories.category', 'id', 'title', '#__categories', 'PLG_ACTIONLOG_JOOMLA'),
(7, 'menu', 'com_menus.menu', 'id', 'title', '#__menu_types', 'PLG_ACTIONLOG_JOOMLA'),
(8, 'menu_item', 'com_menus.item', 'id', 'title', '#__menu', 'PLG_ACTIONLOG_JOOMLA'),
(9, 'newsfeed', 'com_newsfeeds.newsfeed', 'id', 'name', '#__newsfeeds', 'PLG_ACTIONLOG_JOOMLA'),
(10, 'link', 'com_redirect.link', 'id', 'old_url', '#__redirect_links', 'PLG_ACTIONLOG_JOOMLA'),
(11, 'tag', 'com_tags.tag', 'id', 'title', '#__tags', 'PLG_ACTIONLOG_JOOMLA'),
(12, 'style', 'com_templates.style', 'id', 'title', '#__template_styles', 'PLG_ACTIONLOG_JOOMLA'),
(13, 'plugin', 'com_plugins.plugin', 'extension_id', 'name', '#__extensions', 'PLG_ACTIONLOG_JOOMLA'),
(14, 'component_config', 'com_config.component', 'extension_id', 'name', '', 'PLG_ACTIONLOG_JOOMLA'),
(15, 'contact', 'com_contact.contact', 'id', 'name', '#__contact_details', 'PLG_ACTIONLOG_JOOMLA'),
(16, 'module', 'com_modules.module', 'id', 'title', '#__modules', 'PLG_ACTIONLOG_JOOMLA'),
(17, 'access_level', 'com_users.level', 'id', 'title', '#__viewlevels', 'PLG_ACTIONLOG_JOOMLA'),
(18, 'banner_client', 'com_banners.client', 'id', 'name', '#__banner_clients', 'PLG_ACTIONLOG_JOOMLA'),
(19, 'application_config', 'com_config.application', '', 'name', '', 'PLG_ACTIONLOG_JOOMLA'),
(20, 'task', 'com_scheduler.task', 'id', 'title', '#__scheduler_tasks', 'PLG_ACTIONLOG_JOOMLA');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `buf3w_assets`
--

CREATE TABLE `buf3w_assets` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'Primary Key',
  `parent_id` int(11) NOT NULL DEFAULT 0 COMMENT 'Nested set parent.',
  `lft` int(11) NOT NULL DEFAULT 0 COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT 0 COMMENT 'Nested set rgt.',
  `level` int(10) UNSIGNED NOT NULL COMMENT 'The cached level in the nested tree.',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The unique name for the asset.\n',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The descriptive title for the asset.',
  `rules` varchar(5120) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JSON encoded access control.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `buf3w_assets`
--

INSERT INTO `buf3w_assets` (`id`, `parent_id`, `lft`, `rgt`, `level`, `name`, `title`, `rules`) VALUES
(1, 0, 0, 193, 0, 'root.1', 'Root Asset', '{\"core.login.site\":{\"6\":1,\"2\":1},\"core.login.admin\":{\"6\":1},\"core.login.api\":{\"8\":1},\"core.login.offline\":{\"6\":1},\"core.admin\":{\"8\":1},\"core.manage\":{\"7\":1},\"core.create\":{\"6\":1,\"3\":1},\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1},\"core.edit.own\":{\"6\":1,\"3\":1}}'),
(2, 1, 1, 2, 1, 'com_admin', 'com_admin', '{}'),
(3, 1, 3, 6, 1, 'com_banners', 'com_banners', '{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1}}'),
(4, 1, 7, 8, 1, 'com_cache', 'com_cache', '{\"core.admin\":{\"7\":1},\"core.manage\":{\"7\":1}}'),
(5, 1, 9, 10, 1, 'com_checkin', 'com_checkin', '{\"core.admin\":{\"7\":1},\"core.manage\":{\"7\":1}}'),
(6, 1, 11, 12, 1, 'com_config', 'com_config', '{}'),
(7, 1, 13, 16, 1, 'com_contact', 'com_contact', '{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1}}'),
(8, 1, 17, 54, 1, 'com_content', 'com_content', '{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.execute.transition\":{\"6\":1,\"5\":1}}'),
(9, 1, 55, 56, 1, 'com_cpanel', 'com_cpanel', '{}'),
(10, 1, 57, 58, 1, 'com_installer', 'com_installer', '{\"core.manage\":{\"7\":0},\"core.delete\":{\"7\":0},\"core.edit.state\":{\"7\":0}}'),
(11, 1, 59, 62, 1, 'com_languages', 'com_languages', '{\"core.admin\":{\"7\":1}}'),
(12, 11, 60, 61, 2, 'com_languages.language.1', 'English (en-GB)', '{}'),
(13, 1, 63, 64, 1, 'com_login', 'com_login', '{}'),
(14, 1, 65, 66, 1, 'com_mails', 'com_mails', '{}'),
(15, 1, 67, 68, 1, 'com_media', 'com_media', '{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":{\"5\":1}}'),
(16, 1, 69, 72, 1, 'com_menus', 'com_menus', '{\"core.admin\":{\"7\":1}}'),
(17, 1, 73, 74, 1, 'com_messages', 'com_messages', '{\"core.admin\":{\"7\":1},\"core.manage\":{\"7\":1}}'),
(18, 1, 75, 148, 1, 'com_modules', 'com_modules', '{\"core.admin\":{\"7\":1}}'),
(19, 1, 149, 152, 1, 'com_newsfeeds', 'com_newsfeeds', '{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1}}'),
(20, 1, 153, 154, 1, 'com_plugins', 'com_plugins', '{\"core.admin\":{\"7\":1}}'),
(21, 1, 155, 156, 1, 'com_redirect', 'com_redirect', '{\"core.admin\":{\"7\":1}}'),
(23, 1, 157, 158, 1, 'com_templates', 'com_templates', '{\"core.admin\":{\"7\":1}}'),
(24, 1, 163, 166, 1, 'com_users', 'com_users', '{\"core.admin\":{\"7\":1}}'),
(26, 1, 167, 168, 1, 'com_wrapper', 'com_wrapper', '{}'),
(27, 8, 18, 19, 2, 'com_content.category.2', 'Uncategorised', '{}'),
(28, 3, 4, 5, 2, 'com_banners.category.3', 'Uncategorised', '{}'),
(29, 7, 14, 15, 2, 'com_contact.category.4', 'Uncategorised', '{}'),
(30, 19, 150, 151, 2, 'com_newsfeeds.category.5', 'Uncategorised', '{}'),
(32, 24, 164, 165, 2, 'com_users.category.7', 'Uncategorised', '{}'),
(33, 1, 169, 170, 1, 'com_finder', 'com_finder', '{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1}}'),
(34, 1, 171, 172, 1, 'com_joomlaupdate', 'com_joomlaupdate', '{}'),
(35, 1, 173, 174, 1, 'com_tags', 'com_tags', '{}'),
(36, 1, 175, 176, 1, 'com_contenthistory', 'com_contenthistory', '{}'),
(37, 1, 177, 178, 1, 'com_ajax', 'com_ajax', '{}'),
(38, 1, 179, 180, 1, 'com_postinstall', 'com_postinstall', '{}'),
(39, 18, 76, 77, 2, 'com_modules.module.1', 'Main Menu', '{}'),
(40, 18, 78, 79, 2, 'com_modules.module.2', 'Login', '{}'),
(41, 18, 80, 81, 2, 'com_modules.module.3', 'Popular Articles', '{}'),
(42, 18, 82, 83, 2, 'com_modules.module.4', 'Recently Added Articles', '{}'),
(43, 18, 84, 85, 2, 'com_modules.module.8', 'Toolbar', '{}'),
(44, 18, 86, 87, 2, 'com_modules.module.9', 'Notifications', '{}'),
(45, 18, 88, 89, 2, 'com_modules.module.10', 'Logged-in Users', '{}'),
(46, 18, 90, 91, 2, 'com_modules.module.12', 'Admin Menu', '{}'),
(49, 18, 96, 97, 2, 'com_modules.module.15', 'Title', '{}'),
(50, 18, 98, 99, 2, 'com_modules.module.16', 'Login Form', '{}'),
(51, 18, 100, 101, 2, 'com_modules.module.17', 'Breadcrumbs', '{}'),
(52, 18, 102, 103, 2, 'com_modules.module.79', 'Multilanguage status', '{}'),
(53, 18, 106, 107, 2, 'com_modules.module.86', 'Joomla Version', '{}'),
(54, 16, 70, 71, 2, 'com_menus.menu.1', 'Main Menu', '{}'),
(55, 18, 110, 111, 2, 'com_modules.module.87', 'Sample Data', '{}'),
(56, 8, 20, 37, 2, 'com_content.workflow.1', 'COM_WORKFLOW_BASIC_WORKFLOW', '{}'),
(57, 56, 21, 22, 3, 'com_content.stage.1', 'COM_WORKFLOW_BASIC_STAGE', '{}'),
(58, 56, 23, 24, 3, 'com_content.transition.1', 'Unpublish', '{}'),
(59, 56, 25, 26, 3, 'com_content.transition.2', 'Publish', '{}'),
(60, 56, 27, 28, 3, 'com_content.transition.3', 'Trash', '{}'),
(61, 56, 29, 30, 3, 'com_content.transition.4', 'Archive', '{}'),
(62, 56, 31, 32, 3, 'com_content.transition.5', 'Feature', '{}'),
(63, 56, 33, 34, 3, 'com_content.transition.6', 'Unfeature', '{}'),
(64, 56, 35, 36, 3, 'com_content.transition.7', 'Publish & Feature', '{}'),
(65, 1, 159, 160, 1, 'com_privacy', 'com_privacy', '{}'),
(66, 1, 161, 162, 1, 'com_actionlogs', 'com_actionlogs', '{}'),
(67, 18, 92, 93, 2, 'com_modules.module.88', 'Latest Actions', '{}'),
(68, 18, 94, 95, 2, 'com_modules.module.89', 'Privacy Dashboard', '{}'),
(70, 18, 104, 105, 2, 'com_modules.module.103', 'Site', '{}'),
(71, 18, 108, 109, 2, 'com_modules.module.104', 'System', '{}'),
(72, 18, 112, 113, 2, 'com_modules.module.91', 'System Dashboard', '{}'),
(73, 18, 114, 115, 2, 'com_modules.module.92', 'Content Dashboard', '{}'),
(74, 18, 116, 117, 2, 'com_modules.module.93', 'Menus Dashboard', '{}'),
(75, 18, 118, 119, 2, 'com_modules.module.94', 'Components Dashboard', '{}'),
(76, 18, 120, 121, 2, 'com_modules.module.95', 'Users Dashboard', '{}'),
(77, 18, 122, 123, 2, 'com_modules.module.99', 'Frontend Link', '{}'),
(78, 18, 124, 125, 2, 'com_modules.module.100', 'Messages', '{}'),
(79, 18, 126, 127, 2, 'com_modules.module.101', 'Post Install Messages', '{}'),
(80, 18, 128, 129, 2, 'com_modules.module.102', 'User Status', '{}'),
(82, 18, 130, 131, 2, 'com_modules.module.105', '3rd Party', '{}'),
(83, 18, 132, 133, 2, 'com_modules.module.106', 'Help Dashboard', '{}'),
(84, 18, 134, 135, 2, 'com_modules.module.107', 'Privacy Requests', '{}'),
(85, 18, 136, 137, 2, 'com_modules.module.108', 'Privacy Status', '{}'),
(86, 18, 138, 139, 2, 'com_modules.module.96', 'Popular Articles', '{}'),
(87, 18, 140, 141, 2, 'com_modules.module.97', 'Recently Added Articles', '{}'),
(88, 18, 142, 143, 2, 'com_modules.module.98', 'Logged-in Users', '{}'),
(89, 18, 144, 145, 2, 'com_modules.module.90', 'Login Support', '{}'),
(90, 1, 181, 182, 1, 'com_scheduler', 'com_scheduler', '{}'),
(91, 1, 183, 184, 1, 'com_associations', 'com_associations', '{}'),
(92, 1, 185, 186, 1, 'com_categories', 'com_categories', '{}'),
(93, 1, 187, 188, 1, 'com_fields', 'com_fields', '{}'),
(94, 1, 189, 190, 1, 'com_workflow', 'com_workflow', '{}'),
(95, 1, 191, 192, 1, 'com_guidedtours', 'com_guidedtours', '{}'),
(96, 18, 146, 147, 2, 'com_modules.module.109', 'Guided Tours', '{}'),
(97, 98, 39, 40, 3, 'com_content.article.1', 'Rosjanie wysadzili zaporę', '{}'),
(98, 8, 38, 45, 2, 'com_content.category.8', 'Wojna', '{}'),
(99, 98, 41, 42, 3, 'com_content.article.2', 'Sprzeczne doniesienia o Polakach na froncie', '{}'),
(100, 98, 43, 44, 3, 'com_content.article.3', 'Ostrze ukraińskiej włóczni', '{}'),
(101, 102, 47, 48, 3, 'com_content.article.4', 'Siostry wielkiej wagi', '{}'),
(102, 8, 46, 53, 2, 'com_content.category.9', 'Social Media', '{}'),
(103, 102, 49, 50, 3, 'com_content.article.5', 'TikTok szykuje zmiany', '{}'),
(104, 102, 51, 52, 3, 'com_content.article.6', 'Facebook na \"czarnej liście\"', '{}');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `buf3w_associations`
--

CREATE TABLE `buf3w_associations` (
  `id` int(11) NOT NULL COMMENT 'A reference to the associated item.',
  `context` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The context of the associated item.',
  `key` char(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The key for the association computed from an md5 on associated ids.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `buf3w_banners`
--

CREATE TABLE `buf3w_banners` (
  `id` int(11) NOT NULL,
  `cid` int(11) NOT NULL DEFAULT 0,
  `type` int(11) NOT NULL DEFAULT 0,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `imptotal` int(11) NOT NULL DEFAULT 0,
  `impmade` int(11) NOT NULL DEFAULT 0,
  `clicks` int(11) NOT NULL DEFAULT 0,
  `clickurl` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `state` tinyint(4) NOT NULL DEFAULT 0,
  `catid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `custombannercode` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sticky` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `ordering` int(11) NOT NULL DEFAULT 0,
  `metakey` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `own_prefix` tinyint(4) NOT NULL DEFAULT 0,
  `metakey_prefix` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `purchase_type` tinyint(4) NOT NULL DEFAULT -1,
  `track_clicks` tinyint(4) NOT NULL DEFAULT -1,
  `track_impressions` tinyint(4) NOT NULL DEFAULT -1,
  `checked_out` int(10) UNSIGNED DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL,
  `reset` datetime DEFAULT NULL,
  `created` datetime NOT NULL,
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_by` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified` datetime NOT NULL,
  `modified_by` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `version` int(10) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `buf3w_banner_clients`
--

CREATE TABLE `buf3w_banner_clients` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `contact` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `extrainfo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` tinyint(4) NOT NULL DEFAULT 0,
  `checked_out` int(10) UNSIGNED DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `metakey` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `own_prefix` tinyint(4) NOT NULL DEFAULT 0,
  `metakey_prefix` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `purchase_type` tinyint(4) NOT NULL DEFAULT -1,
  `track_clicks` tinyint(4) NOT NULL DEFAULT -1,
  `track_impressions` tinyint(4) NOT NULL DEFAULT -1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `buf3w_banner_tracks`
--

CREATE TABLE `buf3w_banner_tracks` (
  `track_date` datetime NOT NULL,
  `track_type` int(10) UNSIGNED NOT NULL,
  `banner_id` int(10) UNSIGNED NOT NULL,
  `count` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `buf3w_categories`
--

CREATE TABLE `buf3w_categories` (
  `id` int(11) NOT NULL,
  `asset_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'FK to the #__assets table.',
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `lft` int(11) NOT NULL DEFAULT 0,
  `rgt` int(11) NOT NULL DEFAULT 0,
  `level` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `path` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `extension` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `published` tinyint(4) NOT NULL DEFAULT 0,
  `checked_out` int(10) UNSIGNED DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `access` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `params` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `metadesc` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'The meta description for the page.',
  `metakey` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'The keywords for the page.',
  `metadata` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'JSON encoded metadata properties.',
  `created_user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_time` datetime NOT NULL,
  `modified_user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `modified_time` datetime NOT NULL,
  `hits` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `version` int(10) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `buf3w_categories`
--

INSERT INTO `buf3w_categories` (`id`, `asset_id`, `parent_id`, `lft`, `rgt`, `level`, `path`, `extension`, `title`, `alias`, `note`, `description`, `published`, `checked_out`, `checked_out_time`, `access`, `params`, `metadesc`, `metakey`, `metadata`, `created_user_id`, `created_time`, `modified_user_id`, `modified_time`, `hits`, `language`, `version`) VALUES
(1, 0, 0, 0, 15, 0, '', 'system', 'ROOT', 'root', '', '', 1, NULL, NULL, 1, '{}', '', '', '{}', 588, '2023-06-06 05:52:04', 588, '2023-06-06 05:52:04', 0, '*', 1),
(2, 27, 1, 1, 2, 1, 'uncategorised', 'com_content', 'Uncategorised', 'uncategorised', '', '', 1, 588, '2023-06-07 07:32:43', 1, '{\"category_layout\":\"\",\"image\":\"\",\"workflow_id\":\"use_default\"}', '', '', '{\"author\":\"\",\"robots\":\"\"}', 588, '2023-06-06 05:52:04', 588, '2023-06-06 05:52:04', 0, '*', 1),
(3, 28, 1, 3, 4, 1, 'uncategorised', 'com_banners', 'Uncategorised', 'uncategorised', '', '', 1, NULL, NULL, 1, '{\"category_layout\":\"\",\"image\":\"\"}', '', '', '{\"author\":\"\",\"robots\":\"\"}', 588, '2023-06-06 05:52:04', 588, '2023-06-06 05:52:04', 0, '*', 1),
(4, 29, 1, 5, 6, 1, 'uncategorised', 'com_contact', 'Uncategorised', 'uncategorised', '', '', 1, NULL, NULL, 1, '{\"category_layout\":\"\",\"image\":\"\"}', '', '', '{\"author\":\"\",\"robots\":\"\"}', 588, '2023-06-06 05:52:04', 588, '2023-06-06 05:52:04', 0, '*', 1),
(5, 30, 1, 7, 8, 1, 'uncategorised', 'com_newsfeeds', 'Uncategorised', 'uncategorised', '', '', 1, NULL, NULL, 1, '{\"category_layout\":\"\",\"image\":\"\"}', '', '', '{\"author\":\"\",\"robots\":\"\"}', 588, '2023-06-06 05:52:04', 588, '2023-06-06 05:52:04', 0, '*', 1),
(7, 32, 1, 9, 10, 1, 'uncategorised', 'com_users', 'Uncategorised', 'uncategorised', '', '', 1, NULL, NULL, 1, '{\"category_layout\":\"\",\"image\":\"\"}', '', '', '{\"author\":\"\",\"robots\":\"\"}', 588, '2023-06-06 05:52:04', 588, '2023-06-06 05:52:04', 0, '*', 1),
(8, 98, 1, 11, 12, 1, 'wojna', 'com_content', 'Wojna', 'wojna', '', NULL, 1, NULL, NULL, 1, NULL, '', '', '', 588, '2023-06-06 06:54:12', 588, '2023-06-06 06:54:12', 0, '*', 1),
(9, 102, 1, 13, 14, 1, 'social-media', 'com_content', 'Social Media', 'social-media', '', NULL, 1, NULL, NULL, 1, NULL, '', '', '', 588, '2023-06-07 07:32:58', 588, '2023-06-07 07:32:58', 0, '*', 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `buf3w_contact_details`
--

CREATE TABLE `buf3w_contact_details` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `con_position` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `suburb` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postcode` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telephone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fax` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `misc` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_to` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_con` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `published` tinyint(4) NOT NULL DEFAULT 0,
  `checked_out` int(10) UNSIGNED DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `ordering` int(11) NOT NULL DEFAULT 0,
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `catid` int(11) NOT NULL DEFAULT 0,
  `access` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `webpage` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `sortname1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `sortname2` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `sortname3` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `language` varchar(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `created_by` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified` datetime NOT NULL,
  `modified_by` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `metakey` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `metadesc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadata` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `featured` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Set if contact is featured.',
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL,
  `version` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `hits` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `buf3w_content`
--

CREATE TABLE `buf3w_content` (
  `id` int(10) UNSIGNED NOT NULL,
  `asset_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'FK to the #__assets table.',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `introtext` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `fulltext` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` tinyint(4) NOT NULL DEFAULT 0,
  `catid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created` datetime NOT NULL,
  `created_by` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified` datetime NOT NULL,
  `modified_by` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `checked_out` int(10) UNSIGNED DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL,
  `images` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `urls` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `attribs` varchar(5120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `ordering` int(11) NOT NULL DEFAULT 0,
  `metakey` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `metadesc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `access` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `hits` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `metadata` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `featured` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Set if article is featured.',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The language code for the article.',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `buf3w_content`
--

INSERT INTO `buf3w_content` (`id`, `asset_id`, `title`, `alias`, `introtext`, `fulltext`, `state`, `catid`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `images`, `urls`, `attribs`, `version`, `ordering`, `metakey`, `metadesc`, `access`, `hits`, `metadata`, `featured`, `language`, `note`) VALUES
(1, 97, 'Rosjanie wysadzili zaporę', 'rosjanie-wysadzili-zapore', '<h1 class=\"article--title i1xAmRvR\" style=\"text-align: center;\">Rosjanie wysadzili zaporę. \"Poziom krytyczny za 5 godzin\"</h1>\r\n<p>Niepokojące doniesienia z Ukrainy. Po wysadzeniu przez wojska rosyjskie zapory wodnej na Dnieprze w okupowanej Nowej Kachowce, władze obwodu chersońskiego ogłosiły ewakuację mieszkańców zagrożonych zalaniem terenów. Za pięć godzin woda ma osiągnąć poziom krytyczny.</p>\r\n', '\r\n<p style=\"text-align: left;\"><img src=\"images/tama2.jpeg#joomlaImage://local-images/tama2.jpeg?width=3745&amp;height=2497\" width=\"1263\" height=\"842\" /></p>\r\n<p style=\"text-align: left;\">\"Skala zniszczeń, prędkość i ilość wody oraz prawdopodobne obszary powodzi są ustalane\" – poinformowała ukraińska armia na Facebooku.</p>\r\n<div class=\"article--text iFQN8OU2 iYwaUr3X\">\r\n<h2 style=\"text-align: center;\">Wysadzona zapora w Nowej Kachowce. Ewakuacja mieszkańców</h2>\r\n</div>\r\n<div class=\"article--text iFQN8OU2 iYwaUr3X\">\r\n<p>Po wysadzeniu<strong> zapory wodnej na Dnieprze</strong> w okupowanej Nowej Kachowce, władze obwodu chersońskiego ogłosiły ewakuację mieszkańców zagrożonych zalaniem terenów i ostrzegły, że za pięć godzin woda osiągnie poziom krytyczny.</p>\r\n</div>\r\n<p>\"Rosyjska armia dokonała kolejnego aktu terroru – wysadziła Kachowską Elektrownię Wodną. Za pięć godzin woda osiągnie poziom krytyczny\" - oświadczył szef Chersońskiej Wojskowej Administracji Obwodowej Ołeksandr Prokudin.</p>\r\n<div class=\"article--text iFQN8OU2 iYwaUr3X\">\r\n<h2 style=\"text-align: center;\">Zapora w Nowej Kachowce wysadzona. Chersoń zagrożony</h2>\r\n</div>\r\n<div class=\"article--text iFQN8OU2 iYwaUr3X\">\r\n<p>Według MSW Ukrainy po wysadzeniu zapory elektrowni w Nowej Kachowce <strong>w strefie zagrożonej zalaniem</strong> znajduje się co najmniej 10 miejscowości na prawym, zachodnim brzegu Dniepru. Są to: Mykołajiwka, Olhiwka, Lowo, Tiahynka, Poniatiwka, Iwaniwka, Tokariwka, Prydniprowskie, Sadowe i częściowo miasto Chersoń.</p>\r\n</div>\r\n<div>\r\n<div class=\"article--text iFQN8OU2 iYwaUr3X\">\r\n<p>Nowa Kachowka położona jest w odległości około 70 km. od Chersonia.</p>\r\n</div>\r\n</div>\r\n<div>\r\n<div class=\"article--text iFQN8OU2 iYwaUr3X\">\r\n<p>Już w październiku ubiegłego roku prezydent Ukrainy Wołodymyr Zełenski ostrzegał, że jeśli siły rosyjskie przerwą zaporę w elektrowni wodnej w Nowej Kachowce, to w strefie zalania znajdzie się ponad 80 miejscowości, tym miasto Chersoń.</p>\r\n</div>\r\n</div>', 1, 8, '2023-06-06 06:37:25', 588, '', '2023-06-06 06:54:12', 588, 588, '2023-06-06 08:09:05', '2023-06-06 06:37:25', NULL, '{\"image_intro\":\"images\\/Tama.webp#joomlaImage:\\/\\/local-images\\/Tama.webp?width=800&height=490\",\"image_intro_alt\":\"tama\",\"float_intro\":\"\",\"image_intro_caption\":\"\",\"image_fulltext\":\"images\\/tama1.jpg#joomlaImage:\\/\\/local-images\\/tama1.jpg?width=1200&height=630\",\"image_fulltext_alt\":\"\",\"float_fulltext\":\"\",\"image_fulltext_caption\":\"\"}', '{\"urla\":\"\",\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":\"\",\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":\"\",\"urlctext\":\"\",\"targetc\":\"\"}', '{\"article_layout\":\"\",\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_page_title\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', 2, 2, '', '', 1, 1, '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\"}', 0, '*', ''),
(2, 99, 'Sprzeczne doniesienia o Polakach na froncie', 'sprzeczne-doniesienia-o-polakach-na-froncie', '<h1 class=\"article--title i1xAmRvR\" style=\"text-align: center;\" data-reactid=\"319\">Sprzeczne doniesienia o Polakach na froncie. \"Ukraina ma nóż na gardle\"</h1>\r\n<p>- Moskwa wykorzystała to do lobbowania przekazów o \"krwawych Polakach\", \"mordercach cywili\", którzy rzekomo odpowiadają za śmierć rosyjskiej ludności - mówi dr Michał Marek w rozmowie z WP, odnosząc się do doniesień o tym, że Polacy mieli być wśród walczących w obwodzie biełgorodzkim.</p>\r\n', '\r\n<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" title=\"Przeciwnicy Putina z Legionu Wolność Rosji\" src=\"images/123.webp#joomlaImage://local-images/123.webp?width=800&amp;height=533\" alt=\"wojsko\" width=\"800\" height=\"533\" /></p>\r\n<p>W niedzielę rano na telegramowym kanale Polskiego Korpusu Ochotniczego pojawił się wpis na temat akcji w obwodzie biełgorodzkim. \"Wszyscy zadają nam jedno pytanie, czy braliśmy udział w operacji na terenie obwodu biełgorodzkiego… <strong>Odpowiedź jest jednoznaczna: oczywiście, że tak!</strong>\" - można było przeczytać we wpisie.</p>\r\n<p>Przypomnijmy, że siły Rosyjskiego Ochotniczego Korpusu oraz Legionu \"Wolność Rosji\", walczące w wojnie po stronie Ukrainy, przed kilkoma dniami wkroczyły na teren obwodu biełgorodzkiego w Rosji. We wpisie Polskiego Korpusu Ochotniczego dodano, że mieli oni brać udział w <strong>wypełnieniu \"zadania bojowego\" wraz z Rosyjskim Korpusem Ochotniczym</strong>.</p>\r\n<div class=\"article--text iFQN8OU2 iYwaUr3X\" data-reactid=\"383\">\r\n<h2 style=\"text-align: center;\" data-reactid=\"384\">\"Dla naszego oddziału był to zaszczyt\"</h2>\r\n</div>\r\n<div class=\"article--text iFQN8OU2 iYwaUr3X\" data-reactid=\"385\">\r\n<p>\"Łączą nas nie tylko więzy braterstwa broni, ale także osobiste przyjaźnie i koleżeństwo\" - zapewnili polscy ochotnicy. Dalej napisano: \"W akcji wzięła udział pierwsza grupa szturmowa Korpusu. <strong>Wszyscy wrócili z zadania cali i zdrowi</strong>. Wyznaczone zadanie wykonano pomyślnie. Możemy wskazać, że jako pierwsi, razem z jedną z grup bojowych RDK, dotarliśmy do miejsca przeznaczenia. Dla naszego oddziału był to zaszczyt uczestniczyć w tego typu operacji, choćby ze względu na historyczne znaczenie tego typu działań\".</p>\r\n<div data-reactid=\"392\">\r\n<div class=\"article--text iFQN8OU2 iYwaUr3X\" data-reactid=\"393\">\r\n<p>Dlaczego takie informacje pojawiły się z opóźnieniem? Autorzy wpisu napisali, że zostały one <strong>celowo opublikowane teraz ze względów bezpieczeństwa</strong>.</p>\r\n</div>\r\n</div>\r\n<div data-reactid=\"394\">\r\n<div class=\"article--text iFQN8OU2 iYwaUr3X\" data-reactid=\"395\">\r\n<p>Po pewnym czasie wpisy zniknęły z kanału na Telegramie. Pojawiło się natomiast <strong>oficjalne oświadczenie w tej sprawie Rosyjskiego Korpusu Ochotniczego</strong>. Napisano w nim: \"Nasi towarzysze broni z Polskiego Korpusu Ochotniczego rzeczywiście walczą ramię w ramię z nami o wolność i niepodległość Ukrainy od wielu miesięcy. Wspólnie przeprowadziliśmy już szereg operacji w rejonach <strong>orechowskim, zaporoskim i bachmuckim</strong>. Chłopcy spisali się znakomicie i wykazali się wysokim poziomem motywacji i wyszkolenia\".</p>\r\n<div class=\"article--text iFQN8OU2 iYwaUr3X\" data-reactid=\"406\">\r\n<h2 style=\"text-align: center;\" data-reactid=\"407\">Żaryn: brak powiązania z Siłami Zbrojnymi RP</h2>\r\n</div>\r\n<div class=\"article--text iFQN8OU2 iYwaUr3X\" data-reactid=\"408\">\r\n<p>Bardzo szybko przyszło dementi ze stron polskich władz. \"Opisywany w mediach Polski Korpus Ochotniczy nie jest w żaden sposób powiązany z Siłami Zbrojnymi RP ani żadną instytucją RP. <strong>Działań polskich ochotników wspierających Ukrainę w walce z Rosją nie należy utożsamiać z władzami RP</strong>\" - napisał na Twitterze Stanisław Żaryn, sekretarz stanu w KPRM, zastępca ministra koordynatora służb specjalnych, pełnomocnik rządu ds. bezpieczeństwa przestrzeni informacyjnej Rzeczypospolitej Polskiej.</p>\r\n<div class=\"article--text iFQN8OU2 iYwaUr3X\" data-reactid=\"417\">\r\n<h2 style=\"text-align: center;\" data-reactid=\"418\">\"Każdy walczy o swoje\"</h2>\r\n</div>\r\n<div class=\"article--text iFQN8OU2 iYwaUr3X\" data-reactid=\"419\">\r\n<p>- Podchodziłbym do tego z dużą rezerwą - mówi Maciej Matysiak, pułkownik rezerwy, ekspert fundacji Stratpoints, były zastępca szefa <a class=\"seolinker\" href=\"https://wiadomosci.wp.pl/skw-sluzba-kontrwywiadu-wojskowego-6172756444919937c\" rel=\"noopener noreferrer seolink\">Służby Kontrwywiadu Wojskowego</a>, w rozmowie z Wirtualną Polską.</p>\r\n<p>I zaznacza, że to wszystko ma na celu przeciąganie liny. - Nie wykluczam, że mogą być takie trendy po stronie ukraińskiej - inspirowane przez Rosjan, ale i sami Ukraińcy mogli o tym pomyśleć - by popychać trochę kraje NATO, by stały się częścią konfliktu. <strong>Ukraina ma, bezsprzecznie, nóż na gardle</strong> - dodaje.</p>\r\n<p>- <strong>Spowodowanie przez Ukrainę sytuacji, w której Sojusz wszedłby aktywnie w konflikt, wiele by im rozwiązało. </strong>Dla Rosjan niewykluczone, że ten scenariusz byłby bardzo korzystny, także propagandowo. Pytanie o to, co kto tak naprawdę rozgrywa - zaznacza rozmówca WP.</p>\r\n<div class=\"article--text iFQN8OU2 iYwaUr3X\" data-reactid=\"440\">\r\n<h2 style=\"text-align: center;\" data-reactid=\"441\">\"Lobbowanie przekazów o \'krwawych Polakach\'\"</h2>\r\n</div>\r\n<div class=\"article--text iFQN8OU2 iYwaUr3X\" data-reactid=\"442\">\r\n<p>Dr Michał Marek, autor monografii \"Operacja Ukraina\" i ekspert w dziedzinie dezinformacji, w rozmowie z Wirtualną Polską podkreśla, że \"rosyjskie działanie dezinformacyjne, dotyczące obecności obywateli RP na terenie obwodu biełgorodzkiego, sprowadziły się do wzmacniania negatywnych odczuć Rosjan względem Polski i Polaków\".</p>\r\n<p>- Moskwa wykorzystała daną kwestię do lobbowania przekazów o \"krwawych Polakach\", \"mordercach cywili\", którzy<strong> rzekomo odpowiadają za śmierć rosyjskiej ludności </strong>- mówi. I dodaje, że doprowadziła także swoich obywateli \"do stanu, w którym są oni skłonni uwierzyć, iż Polacy zajmują się na froncie m.in. obcinaniem głów rosyjskim jeńcom\".</p>\r\n<div data-reactid=\"460\">\r\n<div class=\"article--text iFQN8OU2 iYwaUr3X\" data-reactid=\"461\">\r\n<h2 style=\"text-align: center;\" data-reactid=\"462\">Rosjanie będą to wykorzystywać</h2>\r\n</div>\r\n<div class=\"article--text iFQN8OU2 iYwaUr3X\" data-reactid=\"463\">\r\n<p>Dr Michał Marek podkreśla, że \"prorosyjscy propagandyści działający w polskiej infosferze rezonowali m.in. rosyjskie komentarze dotyczące możliwości przekroczenia granicy z Polską przez grupę czeczeńskich żołnierzy (podległych Siłom Zbrojnym Federacji Rosyjskiej)\".</p>\r\n</div>\r\n</div>\r\n<div data-reactid=\"464\">\r\n<div class=\"article--text iFQN8OU2 iYwaUr3X\" data-reactid=\"465\">\r\n<p>- W danym kontekście warto podkreślić, iż Rosjanie będą wykorzystywać przyszłe podobne wydarzenia, <strong>aby przekonywać Polaków, iż wsparcie udzielane przez Warszawę Kijowowi sprowadza na Polaków widmo wojny </strong>- ostrzega ekspert.</p>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>', 1, 8, '2023-06-06 08:30:59', 588, '', '2023-06-06 08:30:59', 588, NULL, NULL, '2023-06-06 08:30:59', NULL, '{\"image_intro\":\"images\\/1234.webp#joomlaImage:\\/\\/local-images\\/1234.webp?width=1200&height=800\",\"image_intro_alt\":\"\",\"float_intro\":\"\",\"image_intro_caption\":\"\",\"image_fulltext\":\"images\\/546456.jpg#joomlaImage:\\/\\/local-images\\/546456.jpg?width=4300&height=2867\",\"image_fulltext_alt\":\"\",\"float_fulltext\":\"\",\"image_fulltext_caption\":\"\"}', '{\"urla\":\"\",\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":\"\",\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":\"\",\"urlctext\":\"\",\"targetc\":\"\"}', '{\"article_layout\":\"\",\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_page_title\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', 1, 1, '', '', 1, 0, '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\"}', 0, '*', ''),
(3, 100, 'Ostrze ukraińskiej włóczni', 'ostrze-ukrainskiej-wloczni', '<h1 class=\"article--title i1xAmRvR\" style=\"text-align: center;\">\"Ostrze ukraińskiej włóczni\". Oni mają przełamać Rosjan</h1>\r\n<p>Wyszkolone przez NATO jednostki armii Ukrainy dysponują nie tylko wiedzą i praktycznymi umiejętnościami, ale również zachodnią technologią. To te elitarne szeregi będą stanowiły największy potencjał w kontrofensywie Ukrainy. Żołnierze i żołnierki 47 Oddzielnej Brygady Zmechanizowanej są gotowi na sygnał do działania.</p>\r\n', '\r\n<p><img src=\"images/546456.jpg#joomlaImage://local-images/546456.jpg?width=4300&amp;height=2867\" width=\"788\" height=\"525\" /><br /><br /><span style=\"font-size: 1rem;\">Walkę poprowadzą brygady uzbrojone nie tylko w zachodnią broń, ale także w zachodnie know-how, zebrane podczas miesięcy szkoleń mających na celu przekształcenie ukraińskiej armii w nowoczesną siłę, wyszkoloną w najbardziej zaawansowanych taktykach wojennych NATO .</span></p>\r\n<p><span style=\"font-size: 1rem;\">Jak opisuje \"The Washington Post\", podczas gdy regularna armia Ukrainy walczyła z okupantem na wielu frontach, 47. Oddzielna Brygada Zmechanizowana przygotowywała się do następnej fazy wojny w bazie NATO w Niemczech.<br /></span></p>\r\n<div>\r\n<div class=\"article--text iFQN8OU2 iYwaUr3X\">\r\n<p>Dowództwo brygady szkoliło się w pracowniach komputerowych, gdzie na ekranach można było analizować strategiczne posunięcia i rozważać decyzje, które przychodzi im także podejmować w realnym życiu na wojnie. Zastępca dowódcy major Iwan Szalamaha i inni wojskowi korzystali z programów, które przypominały gry wojenne.</p>\r\n<div>\r\n<div class=\"article--text iFQN8OU2 iYwaUr3X\">\r\n<p>Takie symulacje pomagają zobaczyć na chłodno ogólny obraz wojskowych operacji. - Rozumiesz, gdzie i jakie były twoje niedociągnięcia. Zwracasz uwagę na rzeczy, które mogą być przeoczone i przyczynić się do niepowodzenia - mówi Szalamaha.</p>\r\n</div>\r\n</div>\r\n<div>\r\n<div class=\"article--text iFQN8OU2 iYwaUr3X\">\r\n<p>Teraz gry wojenne się skończyły. Jednostka trafiła już do Ukrainy gdzie oczekuje na rozkazy.</p>\r\n</div>\r\n</div>\r\n<div>\r\n<div class=\"article--text iFQN8OU2 iYwaUr3X\">\r\n<p>Podobne szkolenia od zeszłego lata zapewniała obrońcom Ukrainy Wielka Brytania. Do Niemiec natomiast wysłano nie poszczególnych rekrutów, ale już sformowane jednostki ukraińskie, aby nauczyły się spójnego działanie wewnątrz grupy, ale także interoperacyjności między różnymi oddziałami.</p>\r\n<p>- Potrzebujemy kursów szkoleniowych na poziomie kompanii, plutonu, batalionu z technikami, z ich bojowymi wozami piechoty, z dowódcą, który zrozumie, jak kierować swoimi siłami, wspierać artylerię, wspierać operacje rozpoznawcze – mówi minister obrony Ukrainy Ołeksij Reznikow.</p>\r\n<p>Żołnierze 47. brygady przeszli też szkolenia techniczne w obsłudze broni lub pojazdów.</p>\r\n<p>32-letni szeregowiec powiedział \"The Washington Post\", że pozostaje w kontakcie z niektórymi amerykańskimi instruktorami, których spotkał podczas kursu. - W Niemczech naprawdę dali nam szansę poczuć, jak to będzie. Jako lider zespołu mogę dowodzić 5-7 osobami. Kidy masz do czynienia z liczniejszymi grupami, potrzebujesz więcej praktyki. A dowodzenie batalionem jest naprawdę trudne - powiedział żołnierz.</p>\r\n</div>\r\n</div>\r\n</div>\r\n</div>', 1, 8, '2023-06-06 09:19:59', 588, '', '2023-06-06 09:19:59', 588, NULL, NULL, '2023-06-06 09:19:59', NULL, '{\"image_intro\":\"images\\/gasdgdsgsgs.jpg#joomlaImage:\\/\\/local-images\\/gasdgdsgsgs.jpg?width=5334&height=3364\",\"image_intro_alt\":\"\",\"float_intro\":\"\",\"image_intro_caption\":\"\",\"image_fulltext\":\"images\\/Lithuanian_Stingers.jpg#joomlaImage:\\/\\/local-images\\/Lithuanian_Stingers.jpg?width=840&height=594\",\"image_fulltext_alt\":\"\",\"float_fulltext\":\"\",\"image_fulltext_caption\":\"\"}', '{\"urla\":\"\",\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":\"\",\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":\"\",\"urlctext\":\"\",\"targetc\":\"\"}', '{\"article_layout\":\"\",\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_page_title\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', 1, 0, '', '', 1, 0, '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\"}', 0, '*', ''),
(4, 101, 'Siostry wielkiej wagi', 'siostry-wielkiej-wagi', '<h1 style=\"text-align: center;\">\"Siostry wielkiej wagi\" przeszły spektakularną metamorfozę. Zrzuciły już ćwierć tony</h1>\r\n<p>Amy i Tammy Slaton, siostry znane z programu \"Siostry wielkiej wagi\", zawalczyły o swoje zdrowie i sylwetki. Amerykanki, które zmagają się z otyłością, zrzuciły łącznie ponad 250 kilogramów.</p>\r\n<h2 id=\"siostry-walcza-z-otyloscia\">Siostry walczą z otyłością</h2>\r\n<p>Amy Slaton-Halterman i jej siostra Tammy Slaton z Dixon w USA są zdeterminowane, by wygrać z <a href=\"https://portal.abczdrowie.pl/otylosc\">otyłością</a> i już mają pierwsze sukcesy.Amerykanki znane z programu \"Siostry wielkiej wagi\" przeszły spektakularną metomorfozę. Od czasu, kiedy wyemitowano pierwszy odcinek (w 2020 roku), łącznie zrzuciły 250 kilogramów.</p>\r\n<p><strong>Przed tą niezwykłą przemianą Tammy ważyła 325 kilogramów, jej siostra Amy - 180 kilogramów</strong>.</p>\r\n<p>Ich walkę o zdrowie można śledzić w mediach społecznościowych, a program z udziałem sióstr stał się hitem.</p>\r\n<p>Nie obyło się jednak bez kryzysowych chwil. Pod koniec 2021 roku stan zdrowia Tammy był bardzo ciężki, a rodzina bała się, że kobieta nie zdoła z tego wyjść.</p>\r\n<p>Jak tłumaczyli lekarze, <strong>jej płuca zaczęły być niewydolne</strong>, co mogło skończyć się tragedią. Na szczęście kobietę udało się ją uratować.</p>\r\n<h2 id=\"wielka-metamorfoza\">Wielka metamorfoza</h2>\r\n<p>Otyłość jest uważana za pandemię XXI wieku, a chorych, którzy się z nią zmagają, gwałtownie przybywa. <strong>W Polsce nadwagę ma już 3 na 5 dorosłych, a co 4. jest otyły</strong>.</p>\r\n<p>Otyłość ma wpływ na funkcjonowanie całego organizmu i może przyczynić się do wielu chorób. Zwiększa ryzyko zapaleń stawów i kości, <a href=\"https://portal.abczdrowie.pl/choroby-ukladu-krazenia\">chorób sercowo-naczyniowych</a>, <a href=\"https://portal.abczdrowie.pl/nadcisnienie-tetnicze\">nadciśnienia tętniczego</a>, <a href=\"https://portal.abczdrowie.pl/cukrzyca-typu-2\">cukrzycy typu 2</a>, <a href=\"https://portal.abczdrowie.pl/bezdech-senny\">bezdechu sennego</a>.</p>\r\n<p>Poważnym problemem ludzi, którzy walczą z otyłością mogą być także <a href=\"https://portal.abczdrowie.pl/zylaki-konczyn-dolnych\">żylaki kończyn dolnych</a> oraz wzrost ryzyka <a href=\"https://portal.abczdrowie.pl/udar-mozgu\">udaru mózgu</a>, nowotworów czy <a href=\"https://portal.abczdrowie.pl/bezplodnosc\">bezpłodności</a>.</p>\r\n<p>Dlatego Amerykanki postanowiły walczyć o zdrowie. Do tej pory słynne siostry zrobiły ogromny postęp w swojej walce. <strong>Razem straciły ponad 250 kilogramów</strong>. Kobiety, które nie mogły się poruszać bez wózka i tlenu, mogą coraz łatwiej żyć.</p>\r\n<p>Amy spełnia się też w roli matki. Kobieta urodziła dwoje dzieci i chętnie dzieli się nowymi doświadczenami w mediach społecznościowych.</p>\r\n<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"https://v.wpimg.pl/eXkwLnBuSjkKFTpdbQ5HLElNbgcrV0l6HlV2TG06Sm5dTjRebQUKKh8WIEMjFwYiDwUjGSsQSy8bFCgAbAUJdwIaLQknNgQ7AxJjXHJHVndbQmNdc1oENRJaNkMmDww9CBwlCy8qXDwKEmJDOkUcaBMPfBc7RUsoBRBuEw\" alt=\"Amy urodziła niedawno drugie dziecko\" /></p>\r\n<p> </p>\r\n<p> </p>\r\n<div class=\"article__textbox wvdxqce t6etug9 bqzsno3 jmzr05p\">\r\n<div id=\"c64802fa70d5855\" class=\"wwz5k4i\"></div>\r\n</div>', '', 1, 9, '2023-06-07 07:32:36', 588, '', '2023-06-07 07:32:58', 588, NULL, NULL, '2023-06-07 07:32:36', NULL, '{\"image_intro\":\"images\\/250lb.webp#joomlaImage:\\/\\/local-images\\/250lb.webp?width=916&height=471\",\"image_intro_alt\":\"\",\"float_intro\":\"\",\"image_intro_caption\":\"\",\"image_fulltext\":\"images\\/1000-lb-Sisters-Tammy-Slaton-Amy-Slaton-5489-800x445.jpg#joomlaImage:\\/\\/local-images\\/1000-lb-Sisters-Tammy-Slaton-Amy-Slaton-5489-800x445.jpg?width=800&height=445\",\"image_fulltext_alt\":\"\",\"float_fulltext\":\"\",\"image_fulltext_caption\":\"\"}', '{\"urla\":\"\",\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":\"\",\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":\"\",\"urlctext\":\"\",\"targetc\":\"\"}', '{\"article_layout\":\"\",\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_page_title\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', 2, 2, '', '', 1, 0, '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\"}', 0, '*', ''),
(5, 103, 'TikTok szykuje zmiany', 'tiktok-szykuje-zmiany', '<h1 class=\"C3ct\" style=\"text-align: center;\">TikTok szykuje zmiany. Obejmą najmłodszych użytkowników</h1>\r\n<p>TikTok od dawna jest krytykowany za niedostateczną ochronę swoich najmłodszych użytkowników, dlatego teraz serwis wprowadzi nowe mechanizmy chroniące dzieci przed pedofilią w sieci. Firma ogłosiła w środę, że konta użytkowników poniżej 16 roku domyślnie będą miały najsilniejsze ustawienia prywatności.</p>\r\n', '\r\n<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"https://v.wpimg.pl/YmMyOGYudgwsGzl0dg57GW9DbS4wV3VPOFt1ZXZEa1V9AWAuNBJ3CSIbPSIpBzYKPxgiPncFNUIEFC4gPAZ2IygOPGhoRWladEFgcz1Dal4vSylqbUNpWmBNLXE7WDtYL0tiJmlNaF8rTC0ka00_QycJKGUk\" alt=\"fot. Unsplash\" width=\"783\" height=\"522\" /></p>\r\n<div class=\"RDe3\">\r\n<p>Zmiany zostaną zastosowane automatycznie względem wszystkich kont utworzonych przez osoby poniżej 16 roku życia i oznaczają, że konta staną się prywatne. Co za tym idzie, wszystkie prośby o możliwość ich obserwowania będzie trzeba zatwierdzać samodzielnie.</p>\r\n</div>\r\n<div class=\"RDe3\">\r\n<p>Profile oznaczone jako prywatne nie mogą również być oznaczane w materiałach wideo nagrywanych w ramach funkcji \"Duet\", która często była wykorzystywana przez pedofilów do łączenia swoich ofiar z materiałami pornograficznymi.</p>\r\n<div class=\"RDe3\">\r\n<ul>\r\n<li>Prawo do prywatności i bezpieczeństwo naszej społeczności to najwyższy priorytet dla TikToka. Szczególny nacisk kładziemy na prywatność i bezpieczeństwo naszych młodszych użytkowników i dlatego dla nich wprowadzamy te znaczące zmiany - powiedziała cytowana przez serwis Busiess Insider dyrektor prywatności TikToka dla regionu Europy, Bliskiego Wschodu i Afryki Elaine Fox.</li>\r\n</ul>\r\n</div>\r\n<div class=\"RDe3\">\r\n<p>Zdaniem TikToka, ma to pomóc w eliminowaniu potencjalnych pedofilów, ponieważ ograniczy im możliwość obserwowania nieletnich oraz przesyłania im wiadomości prywatnych. Eksperci mają jednak co do tego wątpliwości. Cytowana również przez BI duńska ekspertka ds. bezpieczeństwa dzieci i młodzieży Eva Fog Noer powiedziała, że <em>zamiana działania głównych funkcji aplikacji i blokowanie możliwości korzystania z nich nie jest dobrym rozwiązaniem</em></p>\r\n</div>\r\n<div class=\"RDe3\">\r\n<p>Zdaniem ekspertki młodzież z łatwością ominie obostrzenia TikToka i będzie zakładać konta, podając fałszywą datę urodzenia. Nie wiadomo dokładnie, jakiej liczby kont będą dotyczyć zmiany zapowiedziane przez TikTok. Według szacunków \"New York Times\" w sierpniu 2020 TikTok miał ponad 49 mln użytkowników w USA, z czego ponad jedną trzecią stanowiły osoby poniżej 14 roku życia.</p>\r\n</div>\r\n</div>', 1, 9, '2023-06-07 07:40:46', 588, '', '2023-06-07 07:40:46', 588, NULL, NULL, '2023-06-07 07:40:46', NULL, '{\"image_intro\":\"images\\/z29498988AMPTikTok-zwalnia----Polski-dzial-badan-i-rozwoju-uci.jpg#joomlaImage:\\/\\/local-images\\/z29498988AMPTikTok-zwalnia----Polski-dzial-badan-i-rozwoju-uci.jpg?width=1200&height=800\",\"image_intro_alt\":\"\",\"float_intro\":\"\",\"image_intro_caption\":\"\",\"image_fulltext\":\"images\\/tiktok-1-mld-uzytkownikow.png#joomlaImage:\\/\\/local-images\\/tiktok-1-mld-uzytkownikow.png?width=1080&height=518\",\"image_fulltext_alt\":\"\",\"float_fulltext\":\"\",\"image_fulltext_caption\":\"\"}', '{\"urla\":\"\",\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":\"\",\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":\"\",\"urlctext\":\"\",\"targetc\":\"\"}', '{\"article_layout\":\"\",\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_page_title\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', 1, 1, '', '', 1, 0, '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\"}', 0, '*', ''),
(6, 104, 'Facebook na \"czarnej liście\"', 'facebook-na-czarnej-liscie', '<h1 class=\"sc-1mskw74-0 sc-7eqdwf-0 iPHSOH\" style=\"text-align: center;\">Facebook na \"czarnej liście\". Duży bank nie będzie kupował akcji</h1>\r\n<p>Już trzeci dzień z rzędu w dół lecą notowania akcji Facebooka.</p>\r\n<p>Przez to wartość rynkowa firmy spadła o kilkadziesiąt miliardów dolarów. Do czasu wyjaśnienia afery z Cambridge Analytica, z inwestycji w akcje spółki Marka Zuckerberga rezygnują niektóre fundusze Nordea Banku.</p>\r\n', '\r\n<div class=\"sc-1mskw74-0 sc-7eqdwf-0 sc-1fanasd-0 bbIjFG sc-1kwzqcy-0 ckLauT\">\r\n<p><img src=\"https://v.wpimg.pl/QUJDREVGfjQrJiR2eTxzIWh-cCw_ZX13P2ZoZ3lwaWEyaz8qOCIoez00MSE4aSE5ZS19LXl1Y2VlKyA8MXRjY3JzZGs8NzZ3Nw\" alt=\"Wizerunek Facebooka mocno podupadł po wybuchu afery z Cambridge Analytica.\" /></p>\r\n<p>Największy bank w Skandynawii i jedna z największych grup finansowych w Europie zdecydowała o umieszczeniu akcji Facebooka na \"czarnej liście\". Władze Nordea Banku ogłosiły, że m.in. należące do niego fundusze inwestycyjne o zrównoważonym profilu ryzyka nie będą mogły aż do odwołania kupować udziałów w w Facebooku.</p>\r\n</div>\r\n<div class=\"sc-1mskw74-0 sc-7eqdwf-0 sc-1fanasd-0 bbIjFG sc-1kwzqcy-0 ckLauT\">\r\n<p>Jak donosi agencja Bloomberg, jest to rodzaj \"kwarantanny\", jaki bank nałożył na akcje. Potrwa ona do momentu, aż opadną emocje wśród inwestorów i popularny serwis społecznościowy wyjaśni wszystkie wątpliwości w związku z aferą odkrytą przez dziennikarzy śledczych \"New York Timesa\" oraz \"Observera\".</p>\r\n<p>Przypomnijmy, że dane blisko 50 mln użytkowników Facebooka miały zostać nielegalnie użyte przez firmę Cambridge Analytica w kampanii wyborczej w 2016 roku. Posłużyły do \"promowania\" Donalda Trumpa lub jak mówią niektórzy - do zmanipulowania wyborców. Firma miała za to zainkasować niemal 9 mln dolarów.</p>\r\n<p>Sprawa wyszła na jaw w weekend. Akcje Facebooka tylko w poniedziałek poleciały w dół aż o 7 proc. Tak panicznej reakcji inwestorów posiadających papiery firmy nie widzieliśmy od września 2012 roku. W jeden dzień wartość spółki zmalała aż o 40 mld dolarów.</p>\r\n<div class=\"sc-1mskw74-0 sc-7eqdwf-0 sc-1fanasd-0 bbIjFG sc-1kwzqcy-0 ckLauT\">\r\n<p>Sytuacja ciągle jest napięta. Również we wtorek notowania firmy były pod presją, tracąc ostatecznie 2,5 proc. Początek środowej sesji również przynosi delikatne spadki. Władze Nordei widząc to, stwierdziły, że bezpieczniej będzie wstrzymać się na razie z inwestycjami w akcje Facebooka.</p>\r\n</div>\r\n<div class=\"sc-1mskw74-0 sc-7eqdwf-0 sc-1fanasd-0 bbIjFG sc-1kwzqcy-0 ckLauT\">\r\n<p>Emocje starają się tonować przedstawiciele Facebooka, którzy odrzucają zarzuty o niedopełnienie obowiązków i luki w systemie ochrony danych użytkowników. Wkrótkim oświadczeniu wskazują, że zostali oszukani przez Cambridge Analytica. To jednak nie przekonuje inwestorów.</p>\r\n</div>\r\n</div>', 1, 9, '2023-06-07 07:49:03', 588, '', '2023-06-07 07:49:03', 588, NULL, NULL, '2023-06-07 07:49:03', NULL, '{\"image_intro\":\"images\\/408653.jpg#joomlaImage:\\/\\/local-images\\/408653.jpg?width=1600&height=1033\",\"image_intro_alt\":\"\",\"float_intro\":\"\",\"image_intro_caption\":\"\",\"image_fulltext\":\"images\\/lbDk9kqTURBXy9jY2VkZWJmODVlMWJiZmYxNGI5Yzk4NDA0YzQxNGI3YS5qcGVnkpUDAMxszQwmzQbVkwXNBLDNAljeAAGhMAE.jpg#joomlaImage:\\/\\/local-images\\/lbDk9kqTURBXy9jY2VkZWJmODVlMWJiZmYxNGI5Yzk4NDA0YzQxNGI3YS5qcGVnkpUDAMxszQwmzQbVkwXNBLDNAljeAAGhMAE.jpg?width=1200&height=600\",\"image_fulltext_alt\":\"\",\"float_fulltext\":\"\",\"image_fulltext_caption\":\"\"}', '{\"urla\":\"\",\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":\"\",\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":\"\",\"urlctext\":\"\",\"targetc\":\"\"}', '{\"article_layout\":\"\",\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_page_title\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', 1, 0, '', '', 1, 0, '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\"}', 0, '*', '');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `buf3w_contentitem_tag_map`
--

CREATE TABLE `buf3w_contentitem_tag_map` (
  `type_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `core_content_id` int(10) UNSIGNED NOT NULL COMMENT 'PK from the core content table',
  `content_item_id` int(11) NOT NULL COMMENT 'PK from the content type table',
  `tag_id` int(10) UNSIGNED NOT NULL COMMENT 'PK from the tag table',
  `tag_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Date of most recent save for this tag-item',
  `type_id` mediumint(9) NOT NULL COMMENT 'PK from the content_type table'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Maps items from content tables to tags';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `buf3w_content_frontpage`
--

CREATE TABLE `buf3w_content_frontpage` (
  `content_id` int(11) NOT NULL DEFAULT 0,
  `ordering` int(11) NOT NULL DEFAULT 0,
  `featured_up` datetime DEFAULT NULL,
  `featured_down` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `buf3w_content_rating`
--

CREATE TABLE `buf3w_content_rating` (
  `content_id` int(11) NOT NULL DEFAULT 0,
  `rating_sum` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `rating_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `lastip` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `buf3w_content_types`
--

CREATE TABLE `buf3w_content_types` (
  `type_id` int(10) UNSIGNED NOT NULL,
  `type_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `type_alias` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `table` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `rules` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `field_mappings` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `router` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `content_history_options` varchar(5120) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'JSON string for com_contenthistory options'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `buf3w_content_types`
--

INSERT INTO `buf3w_content_types` (`type_id`, `type_title`, `type_alias`, `table`, `rules`, `field_mappings`, `router`, `content_history_options`) VALUES
(1, 'Article', 'com_content.article', '{\"special\":{\"dbtable\":\"#__content\",\"key\":\"id\",\"type\":\"ArticleTable\",\"prefix\":\"Joomla\\\\Component\\\\Content\\\\Administrator\\\\Table\\\\\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"Joomla\\\\CMS\\\\Table\\\\\",\"config\":\"array()\"}}', '', '{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"state\",\"core_alias\":\"alias\",\"core_created_time\":\"created\",\"core_modified_time\":\"modified\",\"core_body\":\"introtext\", \"core_hits\":\"hits\",\"core_publish_up\":\"publish_up\",\"core_publish_down\":\"publish_down\",\"core_access\":\"access\", \"core_params\":\"attribs\", \"core_featured\":\"featured\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"images\", \"core_urls\":\"urls\", \"core_version\":\"version\", \"core_ordering\":\"ordering\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"catid\", \"asset_id\":\"asset_id\", \"note\":\"note\"}, \"special\":{\"fulltext\":\"fulltext\"}}', 'ContentHelperRoute::getArticleRoute', '{\"formFile\":\"administrator\\/components\\/com_content\\/forms\\/article.xml\", \"hideFields\":[\"asset_id\",\"checked_out\",\"checked_out_time\",\"version\"],\"ignoreChanges\":[\"modified_by\", \"modified\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\", \"ordering\"],\"convertToInt\":[\"publish_up\", \"publish_down\", \"featured\", \"ordering\"],\"displayLookup\":[{\"sourceColumn\":\"catid\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"created_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"} ]}'),
(2, 'Contact', 'com_contact.contact', '{\"special\":{\"dbtable\":\"#__contact_details\",\"key\":\"id\",\"type\":\"ContactTable\",\"prefix\":\"Joomla\\\\Component\\\\Contact\\\\Administrator\\\\Table\\\\\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"Joomla\\\\CMS\\\\Table\\\\\",\"config\":\"array()\"}}', '', '{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"name\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created\",\"core_modified_time\":\"modified\",\"core_body\":\"address\", \"core_hits\":\"hits\",\"core_publish_up\":\"publish_up\",\"core_publish_down\":\"publish_down\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"featured\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"image\", \"core_urls\":\"webpage\", \"core_version\":\"version\", \"core_ordering\":\"ordering\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"catid\", \"asset_id\":\"null\"}, \"special\":{\"con_position\":\"con_position\",\"suburb\":\"suburb\",\"state\":\"state\",\"country\":\"country\",\"postcode\":\"postcode\",\"telephone\":\"telephone\",\"fax\":\"fax\",\"misc\":\"misc\",\"email_to\":\"email_to\",\"default_con\":\"default_con\",\"user_id\":\"user_id\",\"mobile\":\"mobile\",\"sortname1\":\"sortname1\",\"sortname2\":\"sortname2\",\"sortname3\":\"sortname3\"}}', 'ContactHelperRoute::getContactRoute', '{\"formFile\":\"administrator\\/components\\/com_contact\\/forms\\/contact.xml\",\"hideFields\":[\"default_con\",\"checked_out\",\"checked_out_time\",\"version\"],\"ignoreChanges\":[\"modified_by\", \"modified\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\"],\"convertToInt\":[\"publish_up\", \"publish_down\", \"featured\", \"ordering\"], \"displayLookup\":[ {\"sourceColumn\":\"created_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"catid\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"} ] }'),
(3, 'Newsfeed', 'com_newsfeeds.newsfeed', '{\"special\":{\"dbtable\":\"#__newsfeeds\",\"key\":\"id\",\"type\":\"NewsfeedTable\",\"prefix\":\"Joomla\\\\Component\\\\Newsfeeds\\\\Administrator\\\\Table\\\\\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"Joomla\\\\CMS\\\\Table\\\\\",\"config\":\"array()\"}}', '', '{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"name\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created\",\"core_modified_time\":\"modified\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"publish_up\",\"core_publish_down\":\"publish_down\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"featured\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"images\", \"core_urls\":\"link\", \"core_version\":\"version\", \"core_ordering\":\"ordering\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"catid\", \"asset_id\":\"null\"}, \"special\":{\"numarticles\":\"numarticles\",\"cache_time\":\"cache_time\",\"rtl\":\"rtl\"}}', 'NewsfeedsHelperRoute::getNewsfeedRoute', '{\"formFile\":\"administrator\\/components\\/com_newsfeeds\\/forms\\/newsfeed.xml\",\"hideFields\":[\"asset_id\",\"checked_out\",\"checked_out_time\",\"version\"],\"ignoreChanges\":[\"modified_by\", \"modified\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\"],\"convertToInt\":[\"publish_up\", \"publish_down\", \"featured\", \"ordering\"],\"displayLookup\":[{\"sourceColumn\":\"catid\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"created_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"} ]}'),
(4, 'User', 'com_users.user', '{\"special\":{\"dbtable\":\"#__users\",\"key\":\"id\",\"type\":\"User\",\"prefix\":\"Joomla\\\\CMS\\\\Table\\\\\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"Joomla\\\\CMS\\\\Table\\\\\",\"config\":\"array()\"}}', '', '{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"name\",\"core_state\":\"null\",\"core_alias\":\"username\",\"core_created_time\":\"registerDate\",\"core_modified_time\":\"lastvisitDate\",\"core_body\":\"null\", \"core_hits\":\"null\",\"core_publish_up\":\"null\",\"core_publish_down\":\"null\",\"access\":\"null\", \"core_params\":\"params\", \"core_featured\":\"null\", \"core_metadata\":\"null\", \"core_language\":\"null\", \"core_images\":\"null\", \"core_urls\":\"null\", \"core_version\":\"null\", \"core_ordering\":\"null\", \"core_metakey\":\"null\", \"core_metadesc\":\"null\", \"core_catid\":\"null\", \"asset_id\":\"null\"}, \"special\":{}}', '', ''),
(5, 'Article Category', 'com_content.category', '{\"special\":{\"dbtable\":\"#__categories\",\"key\":\"id\",\"type\":\"CategoryTable\",\"prefix\":\"Joomla\\\\Component\\\\Categories\\\\Administrator\\\\Table\\\\\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"Joomla\\\\CMS\\\\Table\\\\\",\"config\":\"array()\"}}', '', '{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created_time\",\"core_modified_time\":\"modified_time\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"null\",\"core_publish_down\":\"null\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"null\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"null\", \"core_urls\":\"null\", \"core_version\":\"version\", \"core_ordering\":\"null\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"parent_id\", \"asset_id\":\"asset_id\"}, \"special\":{\"parent_id\":\"parent_id\",\"lft\":\"lft\",\"rgt\":\"rgt\",\"level\":\"level\",\"path\":\"path\",\"extension\":\"extension\",\"note\":\"note\"}}', 'ContentHelperRoute::getCategoryRoute', '{\"formFile\":\"administrator\\/components\\/com_categories\\/forms\\/category.xml\", \"hideFields\":[\"asset_id\",\"checked_out\",\"checked_out_time\",\"version\",\"lft\",\"rgt\",\"level\",\"path\",\"extension\"], \"ignoreChanges\":[\"modified_user_id\", \"modified_time\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\", \"path\"],\"convertToInt\":[\"publish_up\", \"publish_down\"], \"displayLookup\":[{\"sourceColumn\":\"created_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"parent_id\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}]}'),
(6, 'Contact Category', 'com_contact.category', '{\"special\":{\"dbtable\":\"#__categories\",\"key\":\"id\",\"type\":\"CategoryTable\",\"prefix\":\"Joomla\\\\Component\\\\Categories\\\\Administrator\\\\Table\\\\\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"Joomla\\\\CMS\\\\Table\\\\\",\"config\":\"array()\"}}', '', '{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created_time\",\"core_modified_time\":\"modified_time\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"null\",\"core_publish_down\":\"null\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"null\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"null\", \"core_urls\":\"null\", \"core_version\":\"version\", \"core_ordering\":\"null\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"parent_id\", \"asset_id\":\"asset_id\"}, \"special\":{\"parent_id\":\"parent_id\",\"lft\":\"lft\",\"rgt\":\"rgt\",\"level\":\"level\",\"path\":\"path\",\"extension\":\"extension\",\"note\":\"note\"}}', 'ContactHelperRoute::getCategoryRoute', '{\"formFile\":\"administrator\\/components\\/com_categories\\/forms\\/category.xml\", \"hideFields\":[\"asset_id\",\"checked_out\",\"checked_out_time\",\"version\",\"lft\",\"rgt\",\"level\",\"path\",\"extension\"], \"ignoreChanges\":[\"modified_user_id\", \"modified_time\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\", \"path\"],\"convertToInt\":[\"publish_up\", \"publish_down\"], \"displayLookup\":[{\"sourceColumn\":\"created_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"parent_id\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}]}'),
(7, 'Newsfeeds Category', 'com_newsfeeds.category', '{\"special\":{\"dbtable\":\"#__categories\",\"key\":\"id\",\"type\":\"CategoryTable\",\"prefix\":\"Joomla\\\\Component\\\\Categories\\\\Administrator\\\\Table\\\\\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"Joomla\\\\CMS\\\\Table\\\\\",\"config\":\"array()\"}}', '', '{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created_time\",\"core_modified_time\":\"modified_time\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"null\",\"core_publish_down\":\"null\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"null\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"null\", \"core_urls\":\"null\", \"core_version\":\"version\", \"core_ordering\":\"null\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"parent_id\", \"asset_id\":\"asset_id\"}, \"special\":{\"parent_id\":\"parent_id\",\"lft\":\"lft\",\"rgt\":\"rgt\",\"level\":\"level\",\"path\":\"path\",\"extension\":\"extension\",\"note\":\"note\"}}', 'NewsfeedsHelperRoute::getCategoryRoute', '{\"formFile\":\"administrator\\/components\\/com_categories\\/forms\\/category.xml\", \"hideFields\":[\"asset_id\",\"checked_out\",\"checked_out_time\",\"version\",\"lft\",\"rgt\",\"level\",\"path\",\"extension\"], \"ignoreChanges\":[\"modified_user_id\", \"modified_time\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\", \"path\"],\"convertToInt\":[\"publish_up\", \"publish_down\"], \"displayLookup\":[{\"sourceColumn\":\"created_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"parent_id\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}]}'),
(8, 'Tag', 'com_tags.tag', '{\"special\":{\"dbtable\":\"#__tags\",\"key\":\"tag_id\",\"type\":\"TagTable\",\"prefix\":\"Joomla\\\\Component\\\\Tags\\\\Administrator\\\\Table\\\\\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"Joomla\\\\CMS\\\\Table\\\\\",\"config\":\"array()\"}}', '', '{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created_time\",\"core_modified_time\":\"modified_time\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"null\",\"core_publish_down\":\"null\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"featured\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"images\", \"core_urls\":\"urls\", \"core_version\":\"version\", \"core_ordering\":\"null\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"null\", \"asset_id\":\"null\"}, \"special\":{\"parent_id\":\"parent_id\",\"lft\":\"lft\",\"rgt\":\"rgt\",\"level\":\"level\",\"path\":\"path\"}}', 'TagsHelperRoute::getTagRoute', '{\"formFile\":\"administrator\\/components\\/com_tags\\/forms\\/tag.xml\", \"hideFields\":[\"checked_out\",\"checked_out_time\",\"version\", \"lft\", \"rgt\", \"level\", \"path\", \"urls\", \"publish_up\", \"publish_down\"],\"ignoreChanges\":[\"modified_user_id\", \"modified_time\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\", \"path\"],\"convertToInt\":[\"publish_up\", \"publish_down\"], \"displayLookup\":[{\"sourceColumn\":\"created_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}, {\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}, {\"sourceColumn\":\"modified_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}]}'),
(9, 'Banner', 'com_banners.banner', '{\"special\":{\"dbtable\":\"#__banners\",\"key\":\"id\",\"type\":\"BannerTable\",\"prefix\":\"Joomla\\\\Component\\\\Banners\\\\Administrator\\\\Table\\\\\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"Joomla\\\\CMS\\\\Table\\\\\",\"config\":\"array()\"}}', '', '{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"name\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created\",\"core_modified_time\":\"modified\",\"core_body\":\"description\", \"core_hits\":\"null\",\"core_publish_up\":\"publish_up\",\"core_publish_down\":\"publish_down\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"null\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"images\", \"core_urls\":\"link\", \"core_version\":\"version\", \"core_ordering\":\"ordering\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"catid\", \"asset_id\":\"null\"}, \"special\":{\"imptotal\":\"imptotal\", \"impmade\":\"impmade\", \"clicks\":\"clicks\", \"clickurl\":\"clickurl\", \"custombannercode\":\"custombannercode\", \"cid\":\"cid\", \"purchase_type\":\"purchase_type\", \"track_impressions\":\"track_impressions\", \"track_clicks\":\"track_clicks\"}}', '', '{\"formFile\":\"administrator\\/components\\/com_banners\\/forms\\/banner.xml\", \"hideFields\":[\"checked_out\",\"checked_out_time\",\"version\", \"reset\"],\"ignoreChanges\":[\"modified_by\", \"modified\", \"checked_out\", \"checked_out_time\", \"version\", \"imptotal\", \"impmade\", \"reset\"], \"convertToInt\":[\"publish_up\", \"publish_down\", \"ordering\"], \"displayLookup\":[{\"sourceColumn\":\"catid\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}, {\"sourceColumn\":\"cid\",\"targetTable\":\"#__banner_clients\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}, {\"sourceColumn\":\"created_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"modified_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"} ]}'),
(10, 'Banners Category', 'com_banners.category', '{\"special\":{\"dbtable\":\"#__categories\",\"key\":\"id\",\"type\":\"CategoryTable\",\"prefix\":\"Joomla\\\\Component\\\\Categories\\\\Administrator\\\\Table\\\\\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"Joomla\\\\CMS\\\\Table\\\\\",\"config\":\"array()\"}}', '', '{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created_time\",\"core_modified_time\":\"modified_time\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"null\",\"core_publish_down\":\"null\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"null\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"null\", \"core_urls\":\"null\", \"core_version\":\"version\", \"core_ordering\":\"null\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"parent_id\", \"asset_id\":\"asset_id\"}, \"special\": {\"parent_id\":\"parent_id\",\"lft\":\"lft\",\"rgt\":\"rgt\",\"level\":\"level\",\"path\":\"path\",\"extension\":\"extension\",\"note\":\"note\"}}', '', '{\"formFile\":\"administrator\\/components\\/com_categories\\/forms\\/category.xml\", \"hideFields\":[\"asset_id\",\"checked_out\",\"checked_out_time\",\"version\",\"lft\",\"rgt\",\"level\",\"path\",\"extension\"], \"ignoreChanges\":[\"modified_user_id\", \"modified_time\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\", \"path\"], \"convertToInt\":[\"publish_up\", \"publish_down\"], \"displayLookup\":[{\"sourceColumn\":\"created_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"parent_id\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}]}'),
(11, 'Banner Client', 'com_banners.client', '{\"special\":{\"dbtable\":\"#__banner_clients\",\"key\":\"id\",\"type\":\"ClientTable\",\"prefix\":\"Joomla\\\\Component\\\\Banners\\\\Administrator\\\\Table\\\\\"}}', '', '', '', '{\"formFile\":\"administrator\\/components\\/com_banners\\/forms\\/client.xml\", \"hideFields\":[\"checked_out\",\"checked_out_time\"], \"ignoreChanges\":[\"checked_out\", \"checked_out_time\"], \"convertToInt\":[], \"displayLookup\":[]}'),
(12, 'User Notes', 'com_users.note', '{\"special\":{\"dbtable\":\"#__user_notes\",\"key\":\"id\",\"type\":\"NoteTable\",\"prefix\":\"Joomla\\\\Component\\\\Users\\\\Administrator\\\\Table\\\\\"}}', '', '', '', '{\"formFile\":\"administrator\\/components\\/com_users\\/forms\\/note.xml\", \"hideFields\":[\"checked_out\",\"checked_out_time\", \"publish_up\", \"publish_down\"],\"ignoreChanges\":[\"modified_user_id\", \"modified_time\", \"checked_out\", \"checked_out_time\"], \"convertToInt\":[\"publish_up\", \"publish_down\"],\"displayLookup\":[{\"sourceColumn\":\"catid\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}, {\"sourceColumn\":\"created_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}, {\"sourceColumn\":\"user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}, {\"sourceColumn\":\"modified_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}]}'),
(13, 'User Notes Category', 'com_users.category', '{\"special\":{\"dbtable\":\"#__categories\",\"key\":\"id\",\"type\":\"CategoryTable\",\"prefix\":\"Joomla\\\\Component\\\\Categories\\\\Administrator\\\\Table\\\\\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"Joomla\\\\CMS\\\\Table\\\\\",\"config\":\"array()\"}}', '', '{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created_time\",\"core_modified_time\":\"modified_time\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"null\",\"core_publish_down\":\"null\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"null\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"null\", \"core_urls\":\"null\", \"core_version\":\"version\", \"core_ordering\":\"null\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"parent_id\", \"asset_id\":\"asset_id\"}, \"special\":{\"parent_id\":\"parent_id\",\"lft\":\"lft\",\"rgt\":\"rgt\",\"level\":\"level\",\"path\":\"path\",\"extension\":\"extension\",\"note\":\"note\"}}', '', '{\"formFile\":\"administrator\\/components\\/com_categories\\/forms\\/category.xml\", \"hideFields\":[\"checked_out\",\"checked_out_time\",\"version\",\"lft\",\"rgt\",\"level\",\"path\",\"extension\"], \"ignoreChanges\":[\"modified_user_id\", \"modified_time\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\", \"path\"], \"convertToInt\":[\"publish_up\", \"publish_down\"], \"displayLookup\":[{\"sourceColumn\":\"created_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}, {\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"parent_id\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}]}');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `buf3w_extensions`
--

CREATE TABLE `buf3w_extensions` (
  `extension_id` int(11) NOT NULL,
  `package_id` int(11) NOT NULL DEFAULT 0 COMMENT 'Parent package ID for extensions installed as a package.',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `element` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `changelogurl` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `folder` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_id` tinyint(4) NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT 0,
  `access` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `protected` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'Flag to indicate if the extension is protected. Protected extensions cannot be disabled.',
  `locked` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'Flag to indicate if the extension is locked. Locked extensions cannot be uninstalled.',
  `manifest_cache` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `custom_data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `checked_out` int(10) UNSIGNED DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `ordering` int(11) DEFAULT 0,
  `state` int(11) DEFAULT 0,
  `note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `buf3w_extensions`
--

INSERT INTO `buf3w_extensions` (`extension_id`, `package_id`, `name`, `type`, `element`, `changelogurl`, `folder`, `client_id`, `enabled`, `access`, `protected`, `locked`, `manifest_cache`, `params`, `custom_data`, `checked_out`, `checked_out_time`, `ordering`, `state`, `note`) VALUES
(1, 0, 'com_wrapper', 'component', 'com_wrapper', NULL, '', 1, 1, 1, 0, 1, '{\"name\":\"com_wrapper\",\"type\":\"component\",\"creationDate\":\"2006-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2007 Open Source Matters, Inc.\\n\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_WRAPPER_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Component\\\\Wrapper\",\"filename\":\"wrapper\"}', '', '', NULL, NULL, 0, 0, NULL),
(2, 0, 'com_admin', 'component', 'com_admin', NULL, '', 1, 1, 1, 1, 1, '{\"name\":\"com_admin\",\"type\":\"component\",\"creationDate\":\"2006-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_ADMIN_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Component\\\\Admin\"}', '', '', NULL, NULL, 0, 0, NULL),
(3, 0, 'com_banners', 'component', 'com_banners', NULL, '', 1, 1, 1, 0, 1, '{\"name\":\"com_banners\",\"type\":\"component\",\"creationDate\":\"2006-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_BANNERS_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Component\\\\Banners\",\"filename\":\"banners\"}', '{\"purchase_type\":\"3\",\"track_impressions\":\"0\",\"track_clicks\":\"0\",\"metakey_prefix\":\"\",\"save_history\":\"1\",\"history_limit\":10}', '', NULL, NULL, 0, 0, NULL),
(4, 0, 'com_cache', 'component', 'com_cache', NULL, '', 1, 1, 1, 1, 1, '{\"name\":\"com_cache\",\"type\":\"component\",\"creationDate\":\"2006-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_CACHE_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Component\\\\Cache\"}', '', '', NULL, NULL, 0, 0, NULL),
(5, 0, 'com_categories', 'component', 'com_categories', NULL, '', 1, 1, 1, 1, 1, '{\"name\":\"com_categories\",\"type\":\"component\",\"creationDate\":\"2007-12\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2007 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_CATEGORIES_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Component\\\\Categories\"}', '', '', NULL, NULL, 0, 0, NULL),
(6, 0, 'com_checkin', 'component', 'com_checkin', NULL, '', 1, 1, 1, 1, 1, '{\"name\":\"com_checkin\",\"type\":\"component\",\"creationDate\":\"2006-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_CHECKIN_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Component\\\\Checkin\"}', '', '', NULL, NULL, 0, 0, NULL),
(7, 0, 'com_contact', 'component', 'com_contact', NULL, '', 1, 1, 1, 0, 1, '{\"name\":\"com_contact\",\"type\":\"component\",\"creationDate\":\"2006-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_CONTACT_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Component\\\\Contact\",\"filename\":\"contact\"}', '{\"contact_layout\":\"_:default\",\"show_contact_category\":\"hide\",\"save_history\":\"1\",\"history_limit\":10,\"show_contact_list\":\"0\",\"presentation_style\":\"sliders\",\"show_tags\":\"1\",\"show_info\":\"1\",\"show_name\":\"1\",\"show_position\":\"1\",\"show_email\":\"0\",\"show_street_address\":\"1\",\"show_suburb\":\"1\",\"show_state\":\"1\",\"show_postcode\":\"1\",\"show_country\":\"1\",\"show_telephone\":\"1\",\"show_mobile\":\"1\",\"show_fax\":\"1\",\"show_webpage\":\"1\",\"show_image\":\"1\",\"show_misc\":\"1\",\"image\":\"\",\"allow_vcard\":\"0\",\"show_articles\":\"0\",\"articles_display_num\":\"10\",\"show_profile\":\"0\",\"show_user_custom_fields\":[\"-1\"],\"show_links\":\"0\",\"linka_name\":\"\",\"linkb_name\":\"\",\"linkc_name\":\"\",\"linkd_name\":\"\",\"linke_name\":\"\",\"contact_icons\":\"0\",\"icon_address\":\"\",\"icon_email\":\"\",\"icon_telephone\":\"\",\"icon_mobile\":\"\",\"icon_fax\":\"\",\"icon_misc\":\"\",\"category_layout\":\"_:default\",\"show_category_title\":\"1\",\"show_description\":\"1\",\"show_description_image\":\"0\",\"maxLevel\":\"-1\",\"show_subcat_desc\":\"1\",\"show_empty_categories\":\"0\",\"show_cat_items\":\"1\",\"show_cat_tags\":\"1\",\"show_base_description\":\"1\",\"maxLevelcat\":\"-1\",\"show_subcat_desc_cat\":\"1\",\"show_empty_categories_cat\":\"0\",\"show_cat_items_cat\":\"1\",\"filter_field\":\"0\",\"show_pagination_limit\":\"0\",\"show_headings\":\"1\",\"show_image_heading\":\"0\",\"show_position_headings\":\"1\",\"show_email_headings\":\"0\",\"show_telephone_headings\":\"1\",\"show_mobile_headings\":\"0\",\"show_fax_headings\":\"0\",\"show_suburb_headings\":\"1\",\"show_state_headings\":\"1\",\"show_country_headings\":\"1\",\"show_pagination\":\"2\",\"show_pagination_results\":\"1\",\"initial_sort\":\"ordering\",\"captcha\":\"\",\"show_email_form\":\"1\",\"show_email_copy\":\"0\",\"banned_email\":\"\",\"banned_subject\":\"\",\"banned_text\":\"\",\"validate_session\":\"1\",\"custom_reply\":\"0\",\"redirect\":\"\",\"show_feed_link\":\"1\",\"sef_ids\":1,\"custom_fields_enable\":\"1\"}', '', NULL, NULL, 0, 0, NULL),
(8, 0, 'com_cpanel', 'component', 'com_cpanel', NULL, '', 1, 1, 1, 1, 1, '{\"name\":\"com_cpanel\",\"type\":\"component\",\"creationDate\":\"2007-06\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2007 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_CPANEL_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Component\\\\Cpanel\"}', '', '', NULL, NULL, 0, 0, NULL),
(9, 0, 'com_installer', 'component', 'com_installer', NULL, '', 1, 1, 1, 1, 1, '{\"name\":\"com_installer\",\"type\":\"component\",\"creationDate\":\"2006-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_INSTALLER_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Component\\\\Installer\"}', '{\"cachetimeout\":\"6\",\"minimum_stability\":\"4\"}', '', NULL, NULL, 0, 0, NULL),
(10, 0, 'com_languages', 'component', 'com_languages', NULL, '', 1, 1, 1, 1, 1, '{\"name\":\"com_languages\",\"type\":\"component\",\"creationDate\":\"2006-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_LANGUAGES_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Component\\\\Languages\"}', '{\"administrator\":\"en-GB\",\"site\":\"en-GB\"}', '', NULL, NULL, 0, 0, NULL),
(11, 0, 'com_login', 'component', 'com_login', NULL, '', 1, 1, 1, 1, 1, '{\"name\":\"com_login\",\"type\":\"component\",\"creationDate\":\"2006-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_LOGIN_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Component\\\\Login\"}', '', '', NULL, NULL, 0, 0, NULL),
(12, 0, 'com_media', 'component', 'com_media', NULL, '', 1, 1, 0, 1, 1, '{\"name\":\"com_media\",\"type\":\"component\",\"creationDate\":\"2006-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_MEDIA_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Component\\\\Media\",\"filename\":\"media\"}', '{\"upload_maxsize\":\"10\",\"file_path\":\"images\",\"image_path\":\"images\",\"restrict_uploads\":\"1\",\"allowed_media_usergroup\":\"3\",\"restrict_uploads_extensions\":\"bmp,gif,jpg,jpeg,png,webp,ico,mp3,m4a,mp4a,ogg,mp4,mp4v,mpeg,mov,odg,odp,ods,odt,pdf,png,ppt,txt,xcf,xls,csv\",\"check_mime\":\"1\",\"image_extensions\":\"bmp,gif,jpg,png,jpeg,webp\",\"audio_extensions\":\"mp3,m4a,mp4a,ogg\",\"video_extensions\":\"mp4,mp4v,mpeg,mov,webm\",\"doc_extensions\":\"odg,odp,ods,odt,pdf,ppt,txt,xcf,xls,csv\",\"ignore_extensions\":\"\",\"upload_mime\":\"image\\/jpeg,image\\/gif,image\\/png,image\\/bmp,image\\/webp,audio\\/ogg,audio\\/mpeg,audio\\/mp4,video\\/mp4,video\\/webm,video\\/mpeg,video\\/quicktime,application\\/msword,application\\/excel,application\\/pdf,application\\/powerpoint,text\\/plain,application\\/x-zip\"}', '', NULL, NULL, 0, 0, NULL),
(13, 0, 'com_menus', 'component', 'com_menus', NULL, '', 1, 1, 1, 1, 1, '{\"name\":\"com_menus\",\"type\":\"component\",\"creationDate\":\"2006-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_MENUS_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Component\\\\Menus\",\"filename\":\"menus\"}', '{\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\"}', '', NULL, NULL, 0, 0, NULL),
(14, 0, 'com_messages', 'component', 'com_messages', NULL, '', 1, 1, 1, 1, 1, '{\"name\":\"com_messages\",\"type\":\"component\",\"creationDate\":\"2006-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_MESSAGES_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Component\\\\Messages\"}', '', '', NULL, NULL, 0, 0, NULL),
(15, 0, 'com_modules', 'component', 'com_modules', NULL, '', 1, 1, 1, 1, 1, '{\"name\":\"com_modules\",\"type\":\"component\",\"creationDate\":\"2006-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_MODULES_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Component\\\\Modules\",\"filename\":\"modules\"}', '', '', NULL, NULL, 0, 0, NULL),
(16, 0, 'com_newsfeeds', 'component', 'com_newsfeeds', NULL, '', 1, 1, 1, 0, 1, '{\"name\":\"com_newsfeeds\",\"type\":\"component\",\"creationDate\":\"2006-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_NEWSFEEDS_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Component\\\\Newsfeeds\",\"filename\":\"newsfeeds\"}', '{\"newsfeed_layout\":\"_:default\",\"save_history\":\"1\",\"history_limit\":5,\"show_feed_image\":\"1\",\"show_feed_description\":\"1\",\"show_item_description\":\"1\",\"feed_character_count\":\"0\",\"feed_display_order\":\"des\",\"float_first\":\"right\",\"float_second\":\"right\",\"show_tags\":\"1\",\"category_layout\":\"_:default\",\"show_category_title\":\"1\",\"show_description\":\"1\",\"show_description_image\":\"1\",\"maxLevel\":\"-1\",\"show_empty_categories\":\"0\",\"show_subcat_desc\":\"1\",\"show_cat_items\":\"1\",\"show_cat_tags\":\"1\",\"show_base_description\":\"1\",\"maxLevelcat\":\"-1\",\"show_empty_categories_cat\":\"0\",\"show_subcat_desc_cat\":\"1\",\"show_cat_items_cat\":\"1\",\"filter_field\":\"1\",\"show_pagination_limit\":\"1\",\"show_headings\":\"1\",\"show_articles\":\"0\",\"show_link\":\"1\",\"show_pagination\":\"1\",\"show_pagination_results\":\"1\",\"sef_ids\":1}', '', NULL, NULL, 0, 0, NULL),
(17, 0, 'com_plugins', 'component', 'com_plugins', NULL, '', 1, 1, 1, 1, 1, '{\"name\":\"com_plugins\",\"type\":\"component\",\"creationDate\":\"2006-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_PLUGINS_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Component\\\\Plugins\"}', '', '', NULL, NULL, 0, 0, NULL),
(18, 0, 'com_templates', 'component', 'com_templates', NULL, '', 1, 1, 1, 1, 1, '{\"name\":\"com_templates\",\"type\":\"component\",\"creationDate\":\"2006-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_TEMPLATES_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Component\\\\Templates\"}', '{\"template_positions_display\":\"0\",\"upload_limit\":\"10\",\"image_formats\":\"gif,bmp,jpg,jpeg,png,webp\",\"source_formats\":\"txt,less,ini,xml,js,php,css,scss,sass,json\",\"font_formats\":\"woff,woff2,ttf,otf\",\"compressed_formats\":\"zip\",\"difference\":\"SideBySide\"}', '', NULL, NULL, 0, 0, NULL),
(19, 0, 'com_content', 'component', 'com_content', NULL, '', 1, 1, 0, 1, 1, '{\"name\":\"com_content\",\"type\":\"component\",\"creationDate\":\"2006-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_CONTENT_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Component\\\\Content\",\"filename\":\"content\"}', '{\"article_layout\":\"_:default\",\"show_title\":\"1\",\"link_titles\":\"1\",\"show_intro\":\"1\",\"info_block_position\":\"0\",\"info_block_show_title\":\"1\",\"show_category\":\"1\",\"link_category\":\"1\",\"show_parent_category\":\"0\",\"link_parent_category\":\"0\",\"show_associations\":\"0\",\"flags\":\"1\",\"show_author\":\"1\",\"link_author\":\"0\",\"show_create_date\":\"0\",\"show_modify_date\":\"0\",\"show_publish_date\":\"1\",\"show_item_navigation\":\"1\",\"show_readmore\":\"1\",\"show_readmore_title\":\"1\",\"readmore_limit\":100,\"show_tags\":\"1\",\"record_hits\":\"1\",\"show_hits\":\"1\",\"show_noauth\":\"0\",\"urls_position\":0,\"captcha\":\"\",\"show_publishing_options\":\"1\",\"show_article_options\":\"1\",\"show_configure_edit_options\":\"1\",\"show_permissions\":\"1\",\"show_associations_edit\":\"1\",\"save_history\":\"1\",\"history_limit\":10,\"show_urls_images_frontend\":\"0\",\"show_urls_images_backend\":\"1\",\"targeta\":0,\"targetb\":0,\"targetc\":0,\"float_intro\":\"left\",\"float_fulltext\":\"left\",\"category_layout\":\"_:blog\",\"show_category_title\":\"0\",\"show_description\":\"0\",\"show_description_image\":\"0\",\"maxLevel\":\"1\",\"show_empty_categories\":\"0\",\"show_no_articles\":\"1\",\"show_category_heading_title_text\":\"1\",\"show_subcat_desc\":\"1\",\"show_cat_num_articles\":\"0\",\"show_cat_tags\":\"1\",\"show_base_description\":\"1\",\"maxLevelcat\":\"-1\",\"show_empty_categories_cat\":\"0\",\"show_subcat_desc_cat\":\"1\",\"show_cat_num_articles_cat\":\"1\",\"num_leading_articles\":1,\"blog_class_leading\":\"\",\"num_intro_articles\":4,\"blog_class\":\"\",\"num_columns\":1,\"multi_column_order\":\"0\",\"num_links\":4,\"show_subcategory_content\":\"0\",\"link_intro_image\":\"0\",\"show_pagination_limit\":\"1\",\"filter_field\":\"hide\",\"show_headings\":\"1\",\"list_show_date\":\"0\",\"date_format\":\"\",\"list_show_hits\":\"1\",\"list_show_author\":\"1\",\"display_num\":\"10\",\"orderby_pri\":\"order\",\"orderby_sec\":\"rdate\",\"order_date\":\"published\",\"show_pagination\":\"2\",\"show_pagination_results\":\"1\",\"show_featured\":\"show\",\"show_feed_link\":\"1\",\"feed_summary\":\"0\",\"feed_show_readmore\":\"0\",\"sef_ids\":1,\"custom_fields_enable\":\"1\",\"workflow_enabled\":\"0\"}', '', NULL, NULL, 0, 0, NULL),
(20, 0, 'com_config', 'component', 'com_config', NULL, '', 1, 1, 0, 1, 1, '{\"name\":\"com_config\",\"type\":\"component\",\"creationDate\":\"2006-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_CONFIG_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Component\\\\Config\",\"filename\":\"config\"}', '{\"filters\":{\"1\":{\"filter_type\":\"NH\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"9\":{\"filter_type\":\"NH\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"6\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"7\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"2\":{\"filter_type\":\"NH\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"3\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"4\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"5\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"8\":{\"filter_type\":\"NONE\",\"filter_tags\":\"\",\"filter_attributes\":\"\"}}}', '', NULL, NULL, 0, 0, NULL),
(21, 0, 'com_redirect', 'component', 'com_redirect', NULL, '', 1, 1, 0, 0, 1, '{\"name\":\"com_redirect\",\"type\":\"component\",\"creationDate\":\"2006-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_REDIRECT_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Component\\\\Redirect\"}', '', '', NULL, NULL, 0, 0, NULL),
(22, 0, 'com_users', 'component', 'com_users', NULL, '', 1, 1, 0, 1, 1, '{\"name\":\"com_users\",\"type\":\"component\",\"creationDate\":\"2006-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_USERS_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Component\\\\Users\",\"filename\":\"users\"}', '{\"allowUserRegistration\":\"0\",\"new_usertype\":\"2\",\"guest_usergroup\":\"9\",\"sendpassword\":\"0\",\"useractivation\":\"2\",\"mail_to_admin\":\"1\",\"captcha\":\"\",\"frontend_userparams\":\"1\",\"site_language\":\"0\",\"change_login_name\":\"0\",\"reset_count\":\"10\",\"reset_time\":\"1\",\"minimum_length\":\"12\",\"minimum_integers\":\"0\",\"minimum_symbols\":\"0\",\"minimum_uppercase\":\"0\",\"save_history\":\"1\",\"history_limit\":5,\"mailSubjectPrefix\":\"\",\"mailBodySuffix\":\"\"}', '', NULL, NULL, 0, 0, NULL),
(23, 0, 'com_finder', 'component', 'com_finder', NULL, '', 1, 1, 0, 0, 1, '{\"name\":\"com_finder\",\"type\":\"component\",\"creationDate\":\"2011-08\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2011 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_FINDER_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Component\\\\Finder\",\"filename\":\"finder\"}', '{\"enabled\":\"0\",\"show_description\":\"1\",\"description_length\":255,\"allow_empty_query\":\"0\",\"show_url\":\"1\",\"show_autosuggest\":\"1\",\"show_suggested_query\":\"1\",\"show_explained_query\":\"1\",\"show_advanced\":\"1\",\"show_advanced_tips\":\"1\",\"expand_advanced\":\"0\",\"show_date_filters\":\"0\",\"sort_order\":\"relevance\",\"sort_direction\":\"desc\",\"highlight_terms\":\"1\",\"opensearch_name\":\"\",\"opensearch_description\":\"\",\"batch_size\":\"50\",\"title_multiplier\":\"1.7\",\"text_multiplier\":\"0.7\",\"meta_multiplier\":\"1.2\",\"path_multiplier\":\"2.0\",\"misc_multiplier\":\"0.3\",\"stem\":\"1\",\"stemmer\":\"snowball\",\"enable_logging\":\"0\"}', '', NULL, NULL, 0, 0, NULL),
(24, 0, 'com_joomlaupdate', 'component', 'com_joomlaupdate', NULL, '', 1, 1, 0, 1, 1, '{\"name\":\"com_joomlaupdate\",\"type\":\"component\",\"creationDate\":\"2021-08\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2012 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.3\",\"description\":\"COM_JOOMLAUPDATE_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Component\\\\Joomlaupdate\"}', '{\"updatesource\":\"default\",\"customurl\":\"\"}', '', NULL, NULL, 0, 0, NULL),
(25, 0, 'com_tags', 'component', 'com_tags', NULL, '', 1, 1, 1, 0, 1, '{\"name\":\"com_tags\",\"type\":\"component\",\"creationDate\":\"2013-12\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2013 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_TAGS_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Component\\\\Tags\",\"filename\":\"tags\"}', '{\"tag_layout\":\"_:default\",\"save_history\":\"1\",\"history_limit\":5,\"show_tag_title\":\"0\",\"tag_list_show_tag_image\":\"0\",\"tag_list_show_tag_description\":\"0\",\"tag_list_image\":\"\",\"tag_list_orderby\":\"title\",\"tag_list_orderby_direction\":\"ASC\",\"show_headings\":\"0\",\"tag_list_show_date\":\"0\",\"tag_list_show_item_image\":\"0\",\"tag_list_show_item_description\":\"0\",\"tag_list_item_maximum_characters\":0,\"return_any_or_all\":\"1\",\"include_children\":\"0\",\"maximum\":200,\"tag_list_language_filter\":\"all\",\"tags_layout\":\"_:default\",\"all_tags_orderby\":\"title\",\"all_tags_orderby_direction\":\"ASC\",\"all_tags_show_tag_image\":\"0\",\"all_tags_show_tag_description\":\"0\",\"all_tags_tag_maximum_characters\":20,\"all_tags_show_tag_hits\":\"0\",\"filter_field\":\"1\",\"show_pagination_limit\":\"1\",\"show_pagination\":\"2\",\"show_pagination_results\":\"1\",\"tag_field_ajax_mode\":\"1\",\"show_feed_link\":\"1\"}', '', NULL, NULL, 0, 0, NULL),
(26, 0, 'com_contenthistory', 'component', 'com_contenthistory', NULL, '', 1, 1, 1, 0, 1, '{\"name\":\"com_contenthistory\",\"type\":\"component\",\"creationDate\":\"2013-05\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2013 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_CONTENTHISTORY_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Component\\\\Contenthistory\",\"filename\":\"contenthistory\"}', '', '', NULL, NULL, 0, 0, NULL),
(27, 0, 'com_ajax', 'component', 'com_ajax', NULL, '', 1, 1, 1, 1, 1, '{\"name\":\"com_ajax\",\"type\":\"component\",\"creationDate\":\"2013-08\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2013 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_AJAX_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"ajax\"}', '', '', NULL, NULL, 0, 0, NULL),
(28, 0, 'com_postinstall', 'component', 'com_postinstall', NULL, '', 1, 1, 1, 1, 1, '{\"name\":\"com_postinstall\",\"type\":\"component\",\"creationDate\":\"2013-09\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2013 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_POSTINSTALL_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Component\\\\Postinstall\"}', '', '', NULL, NULL, 0, 0, NULL),
(29, 0, 'com_fields', 'component', 'com_fields', NULL, '', 1, 1, 1, 0, 1, '{\"name\":\"com_fields\",\"type\":\"component\",\"creationDate\":\"2016-03\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_FIELDS_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Component\\\\Fields\",\"filename\":\"fields\"}', '', '', NULL, NULL, 0, 0, NULL),
(30, 0, 'com_associations', 'component', 'com_associations', NULL, '', 1, 1, 1, 0, 1, '{\"name\":\"com_associations\",\"type\":\"component\",\"creationDate\":\"2017-01\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2017 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_ASSOCIATIONS_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Component\\\\Associations\"}', '', '', NULL, NULL, 0, 0, NULL),
(31, 0, 'com_privacy', 'component', 'com_privacy', NULL, '', 1, 1, 1, 0, 1, '{\"name\":\"com_privacy\",\"type\":\"component\",\"creationDate\":\"2018-05\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"COM_PRIVACY_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Component\\\\Privacy\",\"filename\":\"privacy\"}', '', '', NULL, NULL, 0, 0, NULL),
(32, 0, 'com_actionlogs', 'component', 'com_actionlogs', NULL, '', 1, 1, 1, 0, 1, '{\"name\":\"com_actionlogs\",\"type\":\"component\",\"creationDate\":\"2018-05\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"COM_ACTIONLOGS_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Component\\\\Actionlogs\"}', '{\"ip_logging\":0,\"csv_delimiter\":\",\",\"loggable_extensions\":[\"com_banners\",\"com_cache\",\"com_categories\",\"com_checkin\",\"com_config\",\"com_contact\",\"com_content\",\"com_installer\",\"com_media\",\"com_menus\",\"com_messages\",\"com_modules\",\"com_newsfeeds\",\"com_plugins\",\"com_redirect\",\"com_scheduler\",\"com_tags\",\"com_templates\",\"com_users\"]}', '', NULL, NULL, 0, 0, NULL),
(33, 0, 'com_workflow', 'component', 'com_workflow', NULL, '', 1, 1, 0, 1, 1, '{\"name\":\"com_workflow\",\"type\":\"component\",\"creationDate\":\"2017-06\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_WORKFLOW_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Component\\\\Workflow\"}', '{}', '', NULL, NULL, 0, 0, NULL),
(34, 0, 'com_mails', 'component', 'com_mails', NULL, '', 1, 1, 1, 1, 1, '{\"name\":\"com_mails\",\"type\":\"component\",\"creationDate\":\"2019-01\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_MAILS_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Component\\\\Mails\"}', '', '', NULL, NULL, 0, 0, NULL),
(35, 0, 'com_scheduler', 'component', 'com_scheduler', NULL, '', 1, 1, 1, 0, 1, '{\"name\":\"com_scheduler\",\"type\":\"component\",\"creationDate\":\"2021-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2021 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.1.0\",\"description\":\"COM_SCHEDULER_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Component\\\\Scheduler\"}', '{}', '', NULL, NULL, 0, 0, NULL),
(36, 0, 'com_guidedtours', 'component', 'com_guidedtours', NULL, '', 1, 1, 0, 0, 1, '{\"name\":\"com_guidedtours\",\"type\":\"component\",\"creationDate\":\"2023-02\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2023 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.3.0\",\"description\":\"COM_GUIDEDTOURS_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Component\\\\Guidedtours\"}', '{}', '', NULL, NULL, 0, 0, NULL),
(37, 0, 'lib_joomla', 'library', 'joomla', NULL, '', 0, 1, 1, 1, 1, '{\"name\":\"lib_joomla\",\"type\":\"library\",\"creationDate\":\"2008-01\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2008 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"https:\\/\\/www.joomla.org\",\"version\":\"13.1\",\"description\":\"LIB_JOOMLA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"joomla\"}', '', '', NULL, NULL, 0, 0, NULL),
(38, 0, 'lib_phpass', 'library', 'phpass', NULL, '', 0, 1, 1, 1, 1, '{\"name\":\"lib_phpass\",\"type\":\"library\",\"creationDate\":\"2004-01\",\"author\":\"Solar Designer\",\"copyright\":\"\",\"authorEmail\":\"solar@openwall.com\",\"authorUrl\":\"https:\\/\\/www.openwall.com\\/phpass\\/\",\"version\":\"0.3\",\"description\":\"LIB_PHPASS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"phpass\"}', '', '', NULL, NULL, 0, 0, NULL),
(39, 0, 'mod_articles_archive', 'module', 'mod_articles_archive', NULL, '', 0, 1, 1, 0, 1, '{\"name\":\"mod_articles_archive\",\"type\":\"module\",\"creationDate\":\"2006-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_ARTICLES_ARCHIVE_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Module\\\\ArticlesArchive\",\"filename\":\"mod_articles_archive\"}', '', '', NULL, NULL, 0, 0, NULL),
(40, 0, 'mod_articles_latest', 'module', 'mod_articles_latest', NULL, '', 0, 1, 1, 0, 1, '{\"name\":\"mod_articles_latest\",\"type\":\"module\",\"creationDate\":\"2004-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_LATEST_NEWS_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Module\\\\ArticlesLatest\",\"filename\":\"mod_articles_latest\"}', '', '', NULL, NULL, 0, 0, NULL),
(41, 0, 'mod_articles_popular', 'module', 'mod_articles_popular', NULL, '', 0, 1, 1, 0, 1, '{\"name\":\"mod_articles_popular\",\"type\":\"module\",\"creationDate\":\"2006-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_POPULAR_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Module\\\\ArticlesPopular\",\"filename\":\"mod_articles_popular\"}', '', '', NULL, NULL, 0, 0, NULL),
(42, 0, 'mod_banners', 'module', 'mod_banners', NULL, '', 0, 1, 1, 0, 1, '{\"name\":\"mod_banners\",\"type\":\"module\",\"creationDate\":\"2006-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_BANNERS_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Module\\\\Banners\",\"filename\":\"mod_banners\"}', '', '', NULL, NULL, 0, 0, NULL),
(43, 0, 'mod_breadcrumbs', 'module', 'mod_breadcrumbs', NULL, '', 0, 1, 1, 0, 1, '{\"name\":\"mod_breadcrumbs\",\"type\":\"module\",\"creationDate\":\"2006-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_BREADCRUMBS_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Module\\\\Breadcrumbs\",\"filename\":\"mod_breadcrumbs\"}', '', '', NULL, NULL, 0, 0, NULL),
(44, 0, 'mod_custom', 'module', 'mod_custom', NULL, '', 0, 1, 1, 0, 1, '{\"name\":\"mod_custom\",\"type\":\"module\",\"creationDate\":\"2004-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_CUSTOM_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_custom\"}', '', '', NULL, NULL, 0, 0, NULL),
(45, 0, 'mod_feed', 'module', 'mod_feed', NULL, '', 0, 1, 1, 0, 1, '{\"name\":\"mod_feed\",\"type\":\"module\",\"creationDate\":\"2005-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_FEED_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Module\\\\Feed\",\"filename\":\"mod_feed\"}', '', '', NULL, NULL, 0, 0, NULL),
(46, 0, 'mod_footer', 'module', 'mod_footer', NULL, '', 0, 1, 1, 0, 1, '{\"name\":\"mod_footer\",\"type\":\"module\",\"creationDate\":\"2006-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_FOOTER_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Module\\\\Footer\",\"filename\":\"mod_footer\"}', '', '', NULL, NULL, 0, 0, NULL),
(47, 0, 'mod_login', 'module', 'mod_login', NULL, '', 0, 1, 1, 0, 1, '{\"name\":\"mod_login\",\"type\":\"module\",\"creationDate\":\"2006-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_LOGIN_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Module\\\\Login\",\"filename\":\"mod_login\"}', '', '', NULL, NULL, 0, 0, NULL),
(48, 0, 'mod_menu', 'module', 'mod_menu', NULL, '', 0, 1, 1, 0, 1, '{\"name\":\"mod_menu\",\"type\":\"module\",\"creationDate\":\"2004-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_MENU_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Module\\\\Menu\",\"filename\":\"mod_menu\"}', '', '', NULL, NULL, 0, 0, NULL),
(49, 0, 'mod_articles_news', 'module', 'mod_articles_news', NULL, '', 0, 1, 1, 0, 1, '{\"name\":\"mod_articles_news\",\"type\":\"module\",\"creationDate\":\"2006-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_ARTICLES_NEWS_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Module\\\\ArticlesNews\",\"filename\":\"mod_articles_news\"}', '', '', NULL, NULL, 0, 0, NULL),
(50, 0, 'mod_random_image', 'module', 'mod_random_image', NULL, '', 0, 1, 1, 0, 1, '{\"name\":\"mod_random_image\",\"type\":\"module\",\"creationDate\":\"2006-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_RANDOM_IMAGE_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Module\\\\RandomImage\",\"filename\":\"mod_random_image\"}', '', '', NULL, NULL, 0, 0, NULL),
(51, 0, 'mod_related_items', 'module', 'mod_related_items', NULL, '', 0, 1, 1, 0, 1, '{\"name\":\"mod_related_items\",\"type\":\"module\",\"creationDate\":\"2004-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_RELATED_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Module\\\\RelatedItems\",\"filename\":\"mod_related_items\"}', '', '', NULL, NULL, 0, 0, NULL),
(52, 0, 'mod_stats', 'module', 'mod_stats', NULL, '', 0, 1, 1, 0, 1, '{\"name\":\"mod_stats\",\"type\":\"module\",\"creationDate\":\"2004-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_STATS_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Module\\\\Stats\",\"filename\":\"mod_stats\"}', '', '', NULL, NULL, 0, 0, NULL),
(53, 0, 'mod_syndicate', 'module', 'mod_syndicate', NULL, '', 0, 1, 1, 0, 1, '{\"name\":\"mod_syndicate\",\"type\":\"module\",\"creationDate\":\"2006-05\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_SYNDICATE_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Module\\\\Syndicate\",\"filename\":\"mod_syndicate\"}', '', '', NULL, NULL, 0, 0, NULL),
(54, 0, 'mod_users_latest', 'module', 'mod_users_latest', NULL, '', 0, 1, 1, 0, 1, '{\"name\":\"mod_users_latest\",\"type\":\"module\",\"creationDate\":\"2009-12\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2009 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_USERS_LATEST_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Module\\\\UsersLatest\",\"filename\":\"mod_users_latest\"}', '', '', NULL, NULL, 0, 0, NULL),
(55, 0, 'mod_whosonline', 'module', 'mod_whosonline', NULL, '', 0, 1, 1, 0, 1, '{\"name\":\"mod_whosonline\",\"type\":\"module\",\"creationDate\":\"2004-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_WHOSONLINE_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Module\\\\Whosonline\",\"filename\":\"mod_whosonline\"}', '', '', NULL, NULL, 0, 0, NULL),
(56, 0, 'mod_wrapper', 'module', 'mod_wrapper', NULL, '', 0, 1, 1, 0, 1, '{\"name\":\"mod_wrapper\",\"type\":\"module\",\"creationDate\":\"2004-10\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_WRAPPER_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Module\\\\Wrapper\",\"filename\":\"mod_wrapper\"}', '', '', NULL, NULL, 0, 0, NULL),
(57, 0, 'mod_articles_category', 'module', 'mod_articles_category', NULL, '', 0, 1, 1, 0, 1, '{\"name\":\"mod_articles_category\",\"type\":\"module\",\"creationDate\":\"2010-02\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2010 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_ARTICLES_CATEGORY_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Module\\\\ArticlesCategory\",\"filename\":\"mod_articles_category\"}', '', '', NULL, NULL, 0, 0, NULL),
(58, 0, 'mod_articles_categories', 'module', 'mod_articles_categories', NULL, '', 0, 1, 1, 0, 1, '{\"name\":\"mod_articles_categories\",\"type\":\"module\",\"creationDate\":\"2010-02\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2010 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_ARTICLES_CATEGORIES_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Module\\\\ArticlesCategories\",\"filename\":\"mod_articles_categories\"}', '', '', NULL, NULL, 0, 0, NULL),
(59, 0, 'mod_languages', 'module', 'mod_languages', NULL, '', 0, 1, 1, 0, 1, '{\"name\":\"mod_languages\",\"type\":\"module\",\"creationDate\":\"2010-02\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2010 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.5.0\",\"description\":\"MOD_LANGUAGES_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Module\\\\Languages\",\"filename\":\"mod_languages\"}', '', '', NULL, NULL, 0, 0, NULL),
(60, 0, 'mod_finder', 'module', 'mod_finder', NULL, '', 0, 1, 0, 0, 1, '{\"name\":\"mod_finder\",\"type\":\"module\",\"creationDate\":\"2011-08\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2011 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_FINDER_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Module\\\\Finder\",\"filename\":\"mod_finder\"}', '', '', NULL, NULL, 0, 0, NULL),
(61, 0, 'mod_custom', 'module', 'mod_custom', NULL, '', 1, 1, 1, 0, 1, '{\"name\":\"mod_custom\",\"type\":\"module\",\"creationDate\":\"2004-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_CUSTOM_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_custom\"}', '', '', NULL, NULL, 0, 0, NULL),
(62, 0, 'mod_feed', 'module', 'mod_feed', NULL, '', 1, 1, 1, 0, 1, '{\"name\":\"mod_feed\",\"type\":\"module\",\"creationDate\":\"2005-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_FEED_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Module\\\\Feed\",\"filename\":\"mod_feed\"}', '', '', NULL, NULL, 0, 0, NULL),
(63, 0, 'mod_latest', 'module', 'mod_latest', NULL, '', 1, 1, 1, 0, 1, '{\"name\":\"mod_latest\",\"type\":\"module\",\"creationDate\":\"2004-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_LATEST_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Module\\\\Latest\",\"filename\":\"mod_latest\"}', '', '', NULL, NULL, 0, 0, NULL),
(64, 0, 'mod_logged', 'module', 'mod_logged', NULL, '', 1, 1, 1, 0, 1, '{\"name\":\"mod_logged\",\"type\":\"module\",\"creationDate\":\"2005-01\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_LOGGED_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Module\\\\Logged\",\"filename\":\"mod_logged\"}', '', '', NULL, NULL, 0, 0, NULL),
(65, 0, 'mod_login', 'module', 'mod_login', NULL, '', 1, 1, 1, 0, 1, '{\"name\":\"mod_login\",\"type\":\"module\",\"creationDate\":\"2005-03\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_LOGIN_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Module\\\\Login\",\"filename\":\"mod_login\"}', '', '', NULL, NULL, 0, 0, NULL),
(66, 0, 'mod_loginsupport', 'module', 'mod_loginsupport', NULL, '', 1, 1, 1, 0, 1, '{\"name\":\"mod_loginsupport\",\"type\":\"module\",\"creationDate\":\"2019-06\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"MOD_LOGINSUPPORT_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Module\\\\Loginsupport\",\"filename\":\"mod_loginsupport\"}', '', '', NULL, NULL, 0, 0, NULL),
(67, 0, 'mod_menu', 'module', 'mod_menu', NULL, '', 1, 1, 1, 0, 1, '{\"name\":\"mod_menu\",\"type\":\"module\",\"creationDate\":\"2006-03\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_MENU_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Module\\\\Menu\",\"filename\":\"mod_menu\"}', '', '', NULL, NULL, 0, 0, NULL),
(68, 0, 'mod_popular', 'module', 'mod_popular', NULL, '', 1, 1, 1, 0, 1, '{\"name\":\"mod_popular\",\"type\":\"module\",\"creationDate\":\"2004-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_POPULAR_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Module\\\\Popular\",\"filename\":\"mod_popular\"}', '', '', NULL, NULL, 0, 0, NULL),
(69, 0, 'mod_quickicon', 'module', 'mod_quickicon', NULL, '', 1, 1, 1, 0, 1, '{\"name\":\"mod_quickicon\",\"type\":\"module\",\"creationDate\":\"2005-11\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_QUICKICON_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Module\\\\Quickicon\",\"filename\":\"mod_quickicon\"}', '', '', NULL, NULL, 0, 0, NULL),
(70, 0, 'mod_frontend', 'module', 'mod_frontend', NULL, '', 1, 1, 1, 0, 1, '{\"name\":\"mod_frontend\",\"type\":\"module\",\"creationDate\":\"2019-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"MOD_FRONTEND_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_frontend\"}', '', '', NULL, NULL, 0, 0, NULL),
(71, 0, 'mod_messages', 'module', 'mod_messages', NULL, '', 1, 1, 1, 0, 1, '{\"name\":\"mod_messages\",\"type\":\"module\",\"creationDate\":\"2019-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"MOD_MESSAGES_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_messages\"}', '', '', NULL, NULL, 0, 0, NULL),
(72, 0, 'mod_post_installation_messages', 'module', 'mod_post_installation_messages', NULL, '', 1, 1, 1, 0, 1, '{\"name\":\"mod_post_installation_messages\",\"type\":\"module\",\"creationDate\":\"2019-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"MOD_POST_INSTALLATION_MESSAGES_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_post_installation_messages\"}', '', '', NULL, NULL, 0, 0, NULL),
(73, 0, 'mod_user', 'module', 'mod_user', NULL, '', 1, 1, 1, 0, 1, '{\"name\":\"mod_user\",\"type\":\"module\",\"creationDate\":\"2019-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"MOD_USER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_user\"}', '', '', NULL, NULL, 0, 0, NULL),
(74, 0, 'mod_title', 'module', 'mod_title', NULL, '', 1, 1, 1, 0, 1, '{\"name\":\"mod_title\",\"type\":\"module\",\"creationDate\":\"2005-11\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_TITLE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_title\"}', '', '', NULL, NULL, 0, 0, NULL),
(75, 0, 'mod_toolbar', 'module', 'mod_toolbar', NULL, '', 1, 1, 1, 0, 1, '{\"name\":\"mod_toolbar\",\"type\":\"module\",\"creationDate\":\"2005-11\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_TOOLBAR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_toolbar\"}', '', '', NULL, NULL, 0, 0, NULL),
(76, 0, 'mod_multilangstatus', 'module', 'mod_multilangstatus', NULL, '', 1, 1, 1, 0, 1, '{\"name\":\"mod_multilangstatus\",\"type\":\"module\",\"creationDate\":\"2011-09\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2011 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_MULTILANGSTATUS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_multilangstatus\"}', '{\"cache\":\"0\"}', '', NULL, NULL, 0, 0, NULL),
(77, 0, 'mod_version', 'module', 'mod_version', NULL, '', 1, 1, 1, 0, 1, '{\"name\":\"mod_version\",\"type\":\"module\",\"creationDate\":\"2012-01\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2012 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_VERSION_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Module\\\\Version\",\"filename\":\"mod_version\"}', '{\"cache\":\"0\"}', '', NULL, NULL, 0, 0, NULL),
(78, 0, 'mod_stats_admin', 'module', 'mod_stats_admin', NULL, '', 1, 1, 1, 0, 1, '{\"name\":\"mod_stats_admin\",\"type\":\"module\",\"creationDate\":\"2004-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_STATS_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Module\\\\StatsAdmin\",\"filename\":\"mod_stats_admin\"}', '{\"serverinfo\":\"0\",\"siteinfo\":\"0\",\"counter\":\"0\",\"increase\":\"0\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\"}', '', NULL, NULL, 0, 0, NULL),
(79, 0, 'mod_tags_popular', 'module', 'mod_tags_popular', NULL, '', 0, 1, 1, 0, 1, '{\"name\":\"mod_tags_popular\",\"type\":\"module\",\"creationDate\":\"2013-01\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2013 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.1.0\",\"description\":\"MOD_TAGS_POPULAR_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Module\\\\TagsPopular\",\"filename\":\"mod_tags_popular\"}', '{\"maximum\":\"5\",\"timeframe\":\"alltime\",\"owncache\":\"1\"}', '', NULL, NULL, 0, 0, NULL);
INSERT INTO `buf3w_extensions` (`extension_id`, `package_id`, `name`, `type`, `element`, `changelogurl`, `folder`, `client_id`, `enabled`, `access`, `protected`, `locked`, `manifest_cache`, `params`, `custom_data`, `checked_out`, `checked_out_time`, `ordering`, `state`, `note`) VALUES
(80, 0, 'mod_tags_similar', 'module', 'mod_tags_similar', NULL, '', 0, 1, 1, 0, 1, '{\"name\":\"mod_tags_similar\",\"type\":\"module\",\"creationDate\":\"2013-01\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2013 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.1.0\",\"description\":\"MOD_TAGS_SIMILAR_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Module\\\\TagsSimilar\",\"filename\":\"mod_tags_similar\"}', '{\"maximum\":\"5\",\"matchtype\":\"any\",\"owncache\":\"1\"}', '', NULL, NULL, 0, 0, NULL),
(81, 0, 'mod_sampledata', 'module', 'mod_sampledata', NULL, '', 1, 1, 1, 0, 1, '{\"name\":\"mod_sampledata\",\"type\":\"module\",\"creationDate\":\"2017-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2017 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.8.0\",\"description\":\"MOD_SAMPLEDATA_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Module\\\\Sampledata\",\"filename\":\"mod_sampledata\"}', '{}', '', NULL, NULL, 0, 0, NULL),
(82, 0, 'mod_latestactions', 'module', 'mod_latestactions', NULL, '', 1, 1, 1, 0, 1, '{\"name\":\"mod_latestactions\",\"type\":\"module\",\"creationDate\":\"2018-05\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"MOD_LATESTACTIONS_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Module\\\\LatestActions\",\"filename\":\"mod_latestactions\"}', '{}', '', NULL, NULL, 0, 0, NULL),
(83, 0, 'mod_privacy_dashboard', 'module', 'mod_privacy_dashboard', NULL, '', 1, 1, 1, 0, 1, '{\"name\":\"mod_privacy_dashboard\",\"type\":\"module\",\"creationDate\":\"2018-06\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"MOD_PRIVACY_DASHBOARD_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Module\\\\PrivacyDashboard\",\"filename\":\"mod_privacy_dashboard\"}', '{}', '', NULL, NULL, 0, 0, NULL),
(84, 0, 'mod_submenu', 'module', 'mod_submenu', NULL, '', 1, 1, 1, 0, 1, '{\"name\":\"mod_submenu\",\"type\":\"module\",\"creationDate\":\"2006-02\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_SUBMENU_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Module\\\\Submenu\",\"filename\":\"mod_submenu\"}', '{}', '', NULL, NULL, 0, 0, NULL),
(85, 0, 'mod_privacy_status', 'module', 'mod_privacy_status', NULL, '', 1, 1, 1, 0, 1, '{\"name\":\"mod_privacy_status\",\"type\":\"module\",\"creationDate\":\"2019-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"MOD_PRIVACY_STATUS_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Module\\\\PrivacyStatus\",\"filename\":\"mod_privacy_status\"}', '{}', '', NULL, NULL, 0, 0, NULL),
(86, 0, 'mod_guidedtours', 'module', 'mod_guidedtours', NULL, '', 1, 1, 1, 0, 1, '{\"name\":\"mod_guidedtours\",\"type\":\"module\",\"creationDate\":\"2023-02\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2023 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.3.0\",\"description\":\"MOD_GUIDEDTOURS_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Module\\\\GuidedTours\",\"filename\":\"mod_guidedtours\"}', '{}', '', NULL, NULL, 0, 0, NULL),
(87, 0, 'plg_actionlog_joomla', 'plugin', 'joomla', NULL, 'actionlog', 0, 1, 1, 0, 1, '{\"name\":\"plg_actionlog_joomla\",\"type\":\"plugin\",\"creationDate\":\"2018-05\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_ACTIONLOG_JOOMLA_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Actionlog\\\\Joomla\",\"filename\":\"joomla\"}', '{}', '', NULL, NULL, 1, 0, NULL),
(88, 0, 'plg_api-authentication_basic', 'plugin', 'basic', NULL, 'api-authentication', 0, 0, 1, 0, 1, '{\"name\":\"plg_api-authentication_basic\",\"type\":\"plugin\",\"creationDate\":\"2005-11\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_API-AUTHENTICATION_BASIC_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\ApiAuthentication\\\\Basic\",\"filename\":\"basic\"}', '{}', '', NULL, NULL, 1, 0, NULL),
(89, 0, 'plg_api-authentication_token', 'plugin', 'token', NULL, 'api-authentication', 0, 1, 1, 0, 1, '{\"name\":\"plg_api-authentication_token\",\"type\":\"plugin\",\"creationDate\":\"2019-11\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2020 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_API-AUTHENTICATION_TOKEN_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\ApiAuthentication\\\\Token\",\"filename\":\"token\"}', '{}', '', NULL, NULL, 2, 0, NULL),
(90, 0, 'plg_authentication_cookie', 'plugin', 'cookie', NULL, 'authentication', 0, 1, 1, 0, 1, '{\"name\":\"plg_authentication_cookie\",\"type\":\"plugin\",\"creationDate\":\"2013-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2013 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_AUTHENTICATION_COOKIE_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Authentication\\\\Cookie\",\"filename\":\"cookie\"}', '', '', NULL, NULL, 1, 0, NULL),
(91, 0, 'plg_authentication_joomla', 'plugin', 'joomla', NULL, 'authentication', 0, 1, 1, 1, 1, '{\"name\":\"plg_authentication_joomla\",\"type\":\"plugin\",\"creationDate\":\"2005-11\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_AUTHENTICATION_JOOMLA_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Authentication\\\\Joomla\",\"filename\":\"joomla\"}', '', '', NULL, NULL, 2, 0, NULL),
(92, 0, 'plg_authentication_ldap', 'plugin', 'ldap', NULL, 'authentication', 0, 0, 1, 0, 1, '{\"name\":\"plg_authentication_ldap\",\"type\":\"plugin\",\"creationDate\":\"2005-11\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_LDAP_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Authentication\\\\Ldap\",\"filename\":\"ldap\"}', '{\"host\":\"\",\"port\":\"389\",\"use_ldapV3\":\"0\",\"negotiate_tls\":\"0\",\"no_referrals\":\"0\",\"auth_method\":\"bind\",\"base_dn\":\"\",\"search_string\":\"\",\"users_dn\":\"\",\"username\":\"admin\",\"password\":\"bobby7\",\"ldap_fullname\":\"fullName\",\"ldap_email\":\"mail\",\"ldap_uid\":\"uid\"}', '', NULL, NULL, 3, 0, NULL),
(93, 0, 'plg_behaviour_taggable', 'plugin', 'taggable', NULL, 'behaviour', 0, 1, 1, 0, 1, '{\"name\":\"plg_behaviour_taggable\",\"type\":\"plugin\",\"creationDate\":\"2015-08\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_BEHAVIOUR_TAGGABLE_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Behaviour\\\\Taggable\",\"filename\":\"taggable\"}', '{}', '', NULL, NULL, 1, 0, NULL),
(94, 0, 'plg_behaviour_versionable', 'plugin', 'versionable', NULL, 'behaviour', 0, 1, 1, 0, 1, '{\"name\":\"plg_behaviour_versionable\",\"type\":\"plugin\",\"creationDate\":\"2015-08\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_BEHAVIOUR_VERSIONABLE_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Behaviour\\\\Versionable\",\"filename\":\"versionable\"}', '{}', '', NULL, NULL, 2, 0, NULL),
(95, 0, 'plg_captcha_recaptcha', 'plugin', 'recaptcha', NULL, 'captcha', 0, 0, 1, 0, 1, '{\"name\":\"plg_captcha_recaptcha\",\"type\":\"plugin\",\"creationDate\":\"2011-12\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2011 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.4.0\",\"description\":\"PLG_CAPTCHA_RECAPTCHA_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Captcha\\\\ReCaptcha\",\"filename\":\"recaptcha\"}', '{\"public_key\":\"\",\"private_key\":\"\",\"theme\":\"clean\"}', '', NULL, NULL, 1, 0, NULL),
(96, 0, 'plg_captcha_recaptcha_invisible', 'plugin', 'recaptcha_invisible', NULL, 'captcha', 0, 0, 1, 0, 1, '{\"name\":\"plg_captcha_recaptcha_invisible\",\"type\":\"plugin\",\"creationDate\":\"2017-11\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2017 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.8\",\"description\":\"PLG_CAPTCHA_RECAPTCHA_INVISIBLE_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Captcha\\\\InvisibleReCaptcha\",\"filename\":\"recaptcha_invisible\"}', '{\"public_key\":\"\",\"private_key\":\"\",\"theme\":\"clean\"}', '', NULL, NULL, 2, 0, NULL),
(97, 0, 'plg_content_confirmconsent', 'plugin', 'confirmconsent', NULL, 'content', 0, 0, 1, 0, 1, '{\"name\":\"plg_content_confirmconsent\",\"type\":\"plugin\",\"creationDate\":\"2018-05\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_CONTENT_CONFIRMCONSENT_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Content\\\\ConfirmConsent\",\"filename\":\"confirmconsent\"}', '{}', '', NULL, NULL, 1, 0, NULL),
(98, 0, 'plg_content_contact', 'plugin', 'contact', NULL, 'content', 0, 1, 1, 0, 1, '{\"name\":\"plg_content_contact\",\"type\":\"plugin\",\"creationDate\":\"2014-01\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2014 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.2.2\",\"description\":\"PLG_CONTENT_CONTACT_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Content\\\\Contact\",\"filename\":\"contact\"}', '', '', NULL, NULL, 2, 0, NULL),
(99, 0, 'plg_content_emailcloak', 'plugin', 'emailcloak', NULL, 'content', 0, 1, 1, 0, 1, '{\"name\":\"plg_content_emailcloak\",\"type\":\"plugin\",\"creationDate\":\"2005-11\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_CONTENT_EMAILCLOAK_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Content\\\\EmailCloak\",\"filename\":\"emailcloak\"}', '{\"mode\":\"1\"}', '', NULL, NULL, 3, 0, NULL),
(100, 0, 'plg_content_fields', 'plugin', 'fields', NULL, 'content', 0, 1, 1, 0, 1, '{\"name\":\"plg_content_fields\",\"type\":\"plugin\",\"creationDate\":\"2017-02\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2017 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_CONTENT_FIELDS_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Content\\\\Fields\",\"filename\":\"fields\"}', '', '', NULL, NULL, 4, 0, NULL),
(101, 0, 'plg_content_finder', 'plugin', 'finder', NULL, 'content', 0, 1, 1, 0, 1, '{\"name\":\"plg_content_finder\",\"type\":\"plugin\",\"creationDate\":\"2011-12\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2011 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_CONTENT_FINDER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"finder\"}', '', '', NULL, NULL, 5, 0, NULL),
(102, 0, 'plg_content_joomla', 'plugin', 'joomla', NULL, 'content', 0, 1, 1, 0, 1, '{\"name\":\"plg_content_joomla\",\"type\":\"plugin\",\"creationDate\":\"2010-11\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2010 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_CONTENT_JOOMLA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"joomla\"}', '', '', NULL, NULL, 6, 0, NULL),
(103, 0, 'plg_content_loadmodule', 'plugin', 'loadmodule', NULL, 'content', 0, 1, 1, 0, 1, '{\"name\":\"plg_content_loadmodule\",\"type\":\"plugin\",\"creationDate\":\"2005-11\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_LOADMODULE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"loadmodule\"}', '{\"style\":\"xhtml\"}', '', NULL, NULL, 7, 0, NULL),
(104, 0, 'plg_content_pagebreak', 'plugin', 'pagebreak', NULL, 'content', 0, 1, 1, 0, 1, '{\"name\":\"plg_content_pagebreak\",\"type\":\"plugin\",\"creationDate\":\"2005-11\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_CONTENT_PAGEBREAK_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"pagebreak\"}', '{\"title\":\"1\",\"multipage_toc\":\"1\",\"showall\":\"1\"}', '', NULL, NULL, 8, 0, NULL),
(105, 0, 'plg_content_pagenavigation', 'plugin', 'pagenavigation', NULL, 'content', 0, 1, 1, 0, 1, '{\"name\":\"plg_content_pagenavigation\",\"type\":\"plugin\",\"creationDate\":\"2006-01\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_PAGENAVIGATION_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"pagenavigation\"}', '{\"position\":\"1\"}', '', NULL, NULL, 9, 0, NULL),
(106, 0, 'plg_content_vote', 'plugin', 'vote', NULL, 'content', 0, 0, 1, 0, 1, '{\"name\":\"plg_content_vote\",\"type\":\"plugin\",\"creationDate\":\"2005-11\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_VOTE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"vote\"}', '', '', NULL, NULL, 10, 0, NULL),
(107, 0, 'plg_editors-xtd_article', 'plugin', 'article', NULL, 'editors-xtd', 0, 1, 1, 0, 1, '{\"name\":\"plg_editors-xtd_article\",\"type\":\"plugin\",\"creationDate\":\"2009-10\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2009 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_ARTICLE_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\EditorsXtd\\\\Article\",\"filename\":\"article\"}', '', '', NULL, NULL, 1, 0, NULL),
(108, 0, 'plg_editors-xtd_contact', 'plugin', 'contact', NULL, 'editors-xtd', 0, 1, 1, 0, 1, '{\"name\":\"plg_editors-xtd_contact\",\"type\":\"plugin\",\"creationDate\":\"2016-10\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_EDITORS-XTD_CONTACT_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\EditorsXtd\\\\Contact\",\"filename\":\"contact\"}', '', '', NULL, NULL, 2, 0, NULL),
(109, 0, 'plg_editors-xtd_fields', 'plugin', 'fields', NULL, 'editors-xtd', 0, 1, 1, 0, 1, '{\"name\":\"plg_editors-xtd_fields\",\"type\":\"plugin\",\"creationDate\":\"2017-02\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2017 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_EDITORS-XTD_FIELDS_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\EditorsXtd\\\\Fields\",\"filename\":\"fields\"}', '', '', NULL, NULL, 3, 0, NULL),
(110, 0, 'plg_editors-xtd_image', 'plugin', 'image', NULL, 'editors-xtd', 0, 1, 1, 0, 1, '{\"name\":\"plg_editors-xtd_image\",\"type\":\"plugin\",\"creationDate\":\"2004-08\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_IMAGE_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\EditorsXtd\\\\Image\",\"filename\":\"image\"}', '', '', NULL, NULL, 4, 0, NULL),
(111, 0, 'plg_editors-xtd_menu', 'plugin', 'menu', NULL, 'editors-xtd', 0, 1, 1, 0, 1, '{\"name\":\"plg_editors-xtd_menu\",\"type\":\"plugin\",\"creationDate\":\"2016-08\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_EDITORS-XTD_MENU_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\EditorsXtd\\\\Menu\",\"filename\":\"menu\"}', '', '', NULL, NULL, 5, 0, NULL),
(112, 0, 'plg_editors-xtd_module', 'plugin', 'module', NULL, 'editors-xtd', 0, 1, 1, 0, 1, '{\"name\":\"plg_editors-xtd_module\",\"type\":\"plugin\",\"creationDate\":\"2015-10\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2015 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.5.0\",\"description\":\"PLG_MODULE_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\EditorsXtd\\\\Module\",\"filename\":\"module\"}', '', '', NULL, NULL, 6, 0, NULL),
(113, 0, 'plg_editors-xtd_pagebreak', 'plugin', 'pagebreak', NULL, 'editors-xtd', 0, 1, 1, 0, 1, '{\"name\":\"plg_editors-xtd_pagebreak\",\"type\":\"plugin\",\"creationDate\":\"2004-08\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_EDITORSXTD_PAGEBREAK_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"pagebreak\"}', '', '', NULL, NULL, 7, 0, NULL),
(114, 0, 'plg_editors-xtd_readmore', 'plugin', 'readmore', NULL, 'editors-xtd', 0, 1, 1, 0, 1, '{\"name\":\"plg_editors-xtd_readmore\",\"type\":\"plugin\",\"creationDate\":\"2006-03\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_READMORE_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\EditorsXtd\\\\ReadMore\",\"filename\":\"readmore\"}', '', '', NULL, NULL, 8, 0, NULL),
(115, 0, 'plg_editors_codemirror', 'plugin', 'codemirror', NULL, 'editors', 0, 1, 1, 0, 1, '{\"name\":\"plg_editors_codemirror\",\"type\":\"plugin\",\"creationDate\":\"28 March 2011\",\"author\":\"Marijn Haverbeke\",\"copyright\":\"Copyright (C) 2014 - 2021 by Marijn Haverbeke <marijnh@gmail.com> and others\",\"authorEmail\":\"marijnh@gmail.com\",\"authorUrl\":\"https:\\/\\/codemirror.net\\/\",\"version\":\"5.65.12\",\"description\":\"PLG_CODEMIRROR_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Editors\\\\CodeMirror\",\"filename\":\"codemirror\"}', '{\"lineNumbers\":\"1\",\"lineWrapping\":\"1\",\"matchTags\":\"1\",\"matchBrackets\":\"1\",\"marker-gutter\":\"1\",\"autoCloseTags\":\"1\",\"autoCloseBrackets\":\"1\",\"autoFocus\":\"1\",\"theme\":\"default\",\"tabmode\":\"indent\"}', '', NULL, NULL, 1, 0, NULL),
(116, 0, 'plg_editors_none', 'plugin', 'none', NULL, 'editors', 0, 1, 1, 1, 1, '{\"name\":\"plg_editors_none\",\"type\":\"plugin\",\"creationDate\":\"2005-09\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_NONE_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Editors\\\\None\",\"filename\":\"none\"}', '', '', NULL, NULL, 2, 0, NULL),
(117, 0, 'plg_editors_tinymce', 'plugin', 'tinymce', NULL, 'editors', 0, 1, 1, 0, 1, '{\"name\":\"plg_editors_tinymce\",\"type\":\"plugin\",\"creationDate\":\"2005-08\",\"author\":\"Tiny Technologies, Inc\",\"copyright\":\"Tiny Technologies, Inc\",\"authorEmail\":\"N\\/A\",\"authorUrl\":\"https:\\/\\/www.tiny.cloud\",\"version\":\"5.10.7\",\"description\":\"PLG_TINY_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Editors\\\\TinyMCE\",\"filename\":\"tinymce\"}', '{\"configuration\":{\"toolbars\":{\"2\":{\"toolbar1\":[\"bold\",\"underline\",\"strikethrough\",\"|\",\"undo\",\"redo\",\"|\",\"bullist\",\"numlist\",\"|\",\"pastetext\"]},\"1\":{\"menu\":[\"edit\",\"insert\",\"view\",\"format\",\"table\",\"tools\"],\"toolbar1\":[\"bold\",\"italic\",\"underline\",\"strikethrough\",\"|\",\"alignleft\",\"aligncenter\",\"alignright\",\"alignjustify\",\"|\",\"formatselect\",\"|\",\"bullist\",\"numlist\",\"|\",\"outdent\",\"indent\",\"|\",\"undo\",\"redo\",\"|\",\"link\",\"unlink\",\"anchor\",\"code\",\"|\",\"hr\",\"table\",\"|\",\"subscript\",\"superscript\",\"|\",\"charmap\",\"pastetext\",\"preview\"]},\"0\":{\"menu\":[\"edit\",\"insert\",\"view\",\"format\",\"table\",\"tools\"],\"toolbar1\":[\"bold\",\"italic\",\"underline\",\"strikethrough\",\"|\",\"alignleft\",\"aligncenter\",\"alignright\",\"alignjustify\",\"|\",\"styleselect\",\"|\",\"formatselect\",\"fontselect\",\"fontsizeselect\",\"|\",\"searchreplace\",\"|\",\"bullist\",\"numlist\",\"|\",\"outdent\",\"indent\",\"|\",\"undo\",\"redo\",\"|\",\"link\",\"unlink\",\"anchor\",\"image\",\"|\",\"code\",\"|\",\"forecolor\",\"backcolor\",\"|\",\"fullscreen\",\"|\",\"table\",\"|\",\"subscript\",\"superscript\",\"|\",\"charmap\",\"emoticons\",\"media\",\"hr\",\"ltr\",\"rtl\",\"|\",\"cut\",\"copy\",\"paste\",\"pastetext\",\"|\",\"visualchars\",\"visualblocks\",\"nonbreaking\",\"blockquote\",\"template\",\"|\",\"print\",\"preview\",\"codesample\",\"insertdatetime\",\"removeformat\"]}},\"setoptions\":{\"2\":{\"access\":[\"1\"],\"skin\":\"0\",\"skin_admin\":\"0\",\"mobile\":\"0\",\"drag_drop\":\"1\",\"path\":\"\",\"entity_encoding\":\"raw\",\"lang_mode\":\"1\",\"text_direction\":\"ltr\",\"content_css\":\"1\",\"content_css_custom\":\"\",\"relative_urls\":\"1\",\"newlines\":\"0\",\"use_config_textfilters\":\"0\",\"invalid_elements\":\"script,applet,iframe\",\"valid_elements\":\"\",\"extended_elements\":\"\",\"resizing\":\"1\",\"resize_horizontal\":\"1\",\"element_path\":\"1\",\"wordcount\":\"1\",\"image_advtab\":\"0\",\"advlist\":\"1\",\"autosave\":\"1\",\"contextmenu\":\"1\",\"custom_plugin\":\"\",\"custom_button\":\"\"},\"1\":{\"access\":[\"6\",\"2\"],\"skin\":\"0\",\"skin_admin\":\"0\",\"mobile\":\"0\",\"drag_drop\":\"1\",\"path\":\"\",\"entity_encoding\":\"raw\",\"lang_mode\":\"1\",\"text_direction\":\"ltr\",\"content_css\":\"1\",\"content_css_custom\":\"\",\"relative_urls\":\"1\",\"newlines\":\"0\",\"use_config_textfilters\":\"0\",\"invalid_elements\":\"script,applet,iframe\",\"valid_elements\":\"\",\"extended_elements\":\"\",\"resizing\":\"1\",\"resize_horizontal\":\"1\",\"element_path\":\"1\",\"wordcount\":\"1\",\"image_advtab\":\"0\",\"advlist\":\"1\",\"autosave\":\"1\",\"contextmenu\":\"1\",\"custom_plugin\":\"\",\"custom_button\":\"\"},\"0\":{\"access\":[\"7\",\"4\",\"8\"],\"skin\":\"0\",\"skin_admin\":\"0\",\"mobile\":\"0\",\"drag_drop\":\"1\",\"path\":\"\",\"entity_encoding\":\"raw\",\"lang_mode\":\"1\",\"text_direction\":\"ltr\",\"content_css\":\"1\",\"content_css_custom\":\"\",\"relative_urls\":\"1\",\"newlines\":\"0\",\"use_config_textfilters\":\"0\",\"invalid_elements\":\"script,applet,iframe\",\"valid_elements\":\"\",\"extended_elements\":\"\",\"resizing\":\"1\",\"resize_horizontal\":\"1\",\"element_path\":\"1\",\"wordcount\":\"1\",\"image_advtab\":\"1\",\"advlist\":\"1\",\"autosave\":\"1\",\"contextmenu\":\"1\",\"custom_plugin\":\"\",\"custom_button\":\"\"}}},\"sets_amount\":3,\"html_height\":\"550\",\"html_width\":\"750\"}', '', NULL, NULL, 3, 0, NULL),
(118, 0, 'plg_extension_finder', 'plugin', 'finder', NULL, 'extension', 0, 1, 1, 0, 1, '{\"name\":\"plg_extension_finder\",\"type\":\"plugin\",\"creationDate\":\"2018-06\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_EXTENSION_FINDER_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Extension\\\\Finder\",\"filename\":\"finder\"}', '', '', NULL, NULL, 1, 0, NULL),
(119, 0, 'plg_extension_joomla', 'plugin', 'joomla', NULL, 'extension', 0, 1, 1, 0, 1, '{\"name\":\"plg_extension_joomla\",\"type\":\"plugin\",\"creationDate\":\"2010-05\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2010 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_EXTENSION_JOOMLA_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Extension\\\\Joomla\",\"filename\":\"joomla\"}', '', '', NULL, NULL, 2, 0, NULL),
(120, 0, 'plg_extension_namespacemap', 'plugin', 'namespacemap', NULL, 'extension', 0, 1, 1, 1, 1, '{\"name\":\"plg_extension_namespacemap\",\"type\":\"plugin\",\"creationDate\":\"2017-05\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2017 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_EXTENSION_NAMESPACEMAP_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Extension\\\\NamespaceMap\",\"filename\":\"namespacemap\"}', '{}', '', NULL, NULL, 3, 0, NULL),
(121, 0, 'plg_fields_calendar', 'plugin', 'calendar', NULL, 'fields', 0, 1, 1, 0, 1, '{\"name\":\"plg_fields_calendar\",\"type\":\"plugin\",\"creationDate\":\"2016-03\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_CALENDAR_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Fields\\\\Calendar\",\"filename\":\"calendar\"}', '', '', NULL, NULL, 1, 0, NULL),
(122, 0, 'plg_fields_checkboxes', 'plugin', 'checkboxes', NULL, 'fields', 0, 1, 1, 0, 1, '{\"name\":\"plg_fields_checkboxes\",\"type\":\"plugin\",\"creationDate\":\"2016-03\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_CHECKBOXES_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Fields\\\\Checkboxes\",\"filename\":\"checkboxes\"}', '', '', NULL, NULL, 2, 0, NULL),
(123, 0, 'plg_fields_color', 'plugin', 'color', NULL, 'fields', 0, 1, 1, 0, 1, '{\"name\":\"plg_fields_color\",\"type\":\"plugin\",\"creationDate\":\"2016-03\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_COLOR_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Fields\\\\Color\",\"filename\":\"color\"}', '', '', NULL, NULL, 3, 0, NULL),
(124, 0, 'plg_fields_editor', 'plugin', 'editor', NULL, 'fields', 0, 1, 1, 0, 1, '{\"name\":\"plg_fields_editor\",\"type\":\"plugin\",\"creationDate\":\"2016-03\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_EDITOR_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Fields\\\\Editor\",\"filename\":\"editor\"}', '{\"buttons\":0,\"width\":\"100%\",\"height\":\"250px\",\"filter\":\"JComponentHelper::filterText\"}', '', NULL, NULL, 4, 0, NULL),
(125, 0, 'plg_fields_imagelist', 'plugin', 'imagelist', NULL, 'fields', 0, 1, 1, 0, 1, '{\"name\":\"plg_fields_imagelist\",\"type\":\"plugin\",\"creationDate\":\"2016-03\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_IMAGELIST_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Fields\\\\Imagelist\",\"filename\":\"imagelist\"}', '', '', NULL, NULL, 5, 0, NULL),
(126, 0, 'plg_fields_integer', 'plugin', 'integer', NULL, 'fields', 0, 1, 1, 0, 1, '{\"name\":\"plg_fields_integer\",\"type\":\"plugin\",\"creationDate\":\"2016-03\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_INTEGER_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Fields\\\\Integer\",\"filename\":\"integer\"}', '{\"multiple\":\"0\",\"first\":\"1\",\"last\":\"100\",\"step\":\"1\"}', '', NULL, NULL, 6, 0, NULL),
(127, 0, 'plg_fields_list', 'plugin', 'list', NULL, 'fields', 0, 1, 1, 0, 1, '{\"name\":\"plg_fields_list\",\"type\":\"plugin\",\"creationDate\":\"2016-03\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_LIST_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Fields\\\\ListField\",\"filename\":\"list\"}', '', '', NULL, NULL, 7, 0, NULL),
(128, 0, 'plg_fields_media', 'plugin', 'media', NULL, 'fields', 0, 1, 1, 0, 1, '{\"name\":\"plg_fields_media\",\"type\":\"plugin\",\"creationDate\":\"2016-03\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_MEDIA_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Fields\\\\Media\",\"filename\":\"media\"}', '', '', NULL, NULL, 8, 0, NULL),
(129, 0, 'plg_fields_radio', 'plugin', 'radio', NULL, 'fields', 0, 1, 1, 0, 1, '{\"name\":\"plg_fields_radio\",\"type\":\"plugin\",\"creationDate\":\"2016-03\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_RADIO_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Fields\\\\Radio\",\"filename\":\"radio\"}', '', '', NULL, NULL, 9, 0, NULL),
(130, 0, 'plg_fields_sql', 'plugin', 'sql', NULL, 'fields', 0, 1, 1, 0, 1, '{\"name\":\"plg_fields_sql\",\"type\":\"plugin\",\"creationDate\":\"2016-03\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_SQL_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Fields\\\\SQL\",\"filename\":\"sql\"}', '', '', NULL, NULL, 10, 0, NULL),
(131, 0, 'plg_fields_subform', 'plugin', 'subform', NULL, 'fields', 0, 1, 1, 0, 1, '{\"name\":\"plg_fields_subform\",\"type\":\"plugin\",\"creationDate\":\"2017-06\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_FIELDS_SUBFORM_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Fields\\\\Subform\",\"filename\":\"subform\"}', '', '', NULL, NULL, 11, 0, NULL),
(132, 0, 'plg_fields_text', 'plugin', 'text', NULL, 'fields', 0, 1, 1, 0, 1, '{\"name\":\"plg_fields_text\",\"type\":\"plugin\",\"creationDate\":\"2016-03\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_TEXT_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Fields\\\\Text\",\"filename\":\"text\"}', '', '', NULL, NULL, 12, 0, NULL),
(133, 0, 'plg_fields_textarea', 'plugin', 'textarea', NULL, 'fields', 0, 1, 1, 0, 1, '{\"name\":\"plg_fields_textarea\",\"type\":\"plugin\",\"creationDate\":\"2016-03\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_TEXTAREA_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Fields\\\\Textarea\",\"filename\":\"textarea\"}', '{\"rows\":10,\"cols\":10,\"maxlength\":\"\",\"filter\":\"JComponentHelper::filterText\"}', '', NULL, NULL, 13, 0, NULL),
(134, 0, 'plg_fields_url', 'plugin', 'url', NULL, 'fields', 0, 1, 1, 0, 1, '{\"name\":\"plg_fields_url\",\"type\":\"plugin\",\"creationDate\":\"2016-03\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_URL_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Fields\\\\Url\",\"filename\":\"url\"}', '', '', NULL, NULL, 14, 0, NULL),
(135, 0, 'plg_fields_user', 'plugin', 'user', NULL, 'fields', 0, 1, 1, 0, 1, '{\"name\":\"plg_fields_user\",\"type\":\"plugin\",\"creationDate\":\"2016-03\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_USER_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Fields\\\\User\",\"filename\":\"user\"}', '', '', NULL, NULL, 15, 0, NULL),
(136, 0, 'plg_fields_usergrouplist', 'plugin', 'usergrouplist', NULL, 'fields', 0, 1, 1, 0, 1, '{\"name\":\"plg_fields_usergrouplist\",\"type\":\"plugin\",\"creationDate\":\"2016-03\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_USERGROUPLIST_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Fields\\\\UsergroupList\",\"filename\":\"usergrouplist\"}', '', '', NULL, NULL, 16, 0, NULL),
(137, 0, 'plg_filesystem_local', 'plugin', 'local', NULL, 'filesystem', 0, 1, 1, 0, 1, '{\"name\":\"plg_filesystem_local\",\"type\":\"plugin\",\"creationDate\":\"2017-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2017 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_FILESYSTEM_LOCAL_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Filesystem\\\\Local\",\"filename\":\"local\"}', '{}', '', NULL, NULL, 1, 0, NULL),
(138, 0, 'plg_finder_categories', 'plugin', 'categories', NULL, 'finder', 0, 1, 1, 0, 1, '{\"name\":\"plg_finder_categories\",\"type\":\"plugin\",\"creationDate\":\"2011-08\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2011 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_FINDER_CATEGORIES_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Finder\\\\Categories\",\"filename\":\"categories\"}', '', '', NULL, NULL, 1, 0, NULL),
(139, 0, 'plg_finder_contacts', 'plugin', 'contacts', NULL, 'finder', 0, 1, 1, 0, 1, '{\"name\":\"plg_finder_contacts\",\"type\":\"plugin\",\"creationDate\":\"2011-08\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2011 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_FINDER_CONTACTS_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Finder\\\\Contacts\",\"filename\":\"contacts\"}', '', '', NULL, NULL, 2, 0, NULL),
(140, 0, 'plg_finder_content', 'plugin', 'content', NULL, 'finder', 0, 1, 1, 0, 1, '{\"name\":\"plg_finder_content\",\"type\":\"plugin\",\"creationDate\":\"2011-08\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2011 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_FINDER_CONTENT_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Finder\\\\Content\",\"filename\":\"content\"}', '', '', NULL, NULL, 3, 0, NULL),
(141, 0, 'plg_finder_newsfeeds', 'plugin', 'newsfeeds', NULL, 'finder', 0, 1, 1, 0, 1, '{\"name\":\"plg_finder_newsfeeds\",\"type\":\"plugin\",\"creationDate\":\"2011-08\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2011 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_FINDER_NEWSFEEDS_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Finder\\\\Newsfeeds\",\"filename\":\"newsfeeds\"}', '', '', NULL, NULL, 4, 0, NULL),
(142, 0, 'plg_finder_tags', 'plugin', 'tags', NULL, 'finder', 0, 1, 1, 0, 1, '{\"name\":\"plg_finder_tags\",\"type\":\"plugin\",\"creationDate\":\"2013-02\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2013 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_FINDER_TAGS_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Finder\\\\Tags\",\"filename\":\"tags\"}', '', '', NULL, NULL, 5, 0, NULL),
(143, 0, 'plg_installer_folderinstaller', 'plugin', 'folderinstaller', NULL, 'installer', 0, 1, 1, 0, 1, '{\"name\":\"plg_installer_folderinstaller\",\"type\":\"plugin\",\"creationDate\":\"2016-05\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.6.0\",\"description\":\"PLG_INSTALLER_FOLDERINSTALLER_PLUGIN_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"folderinstaller\"}', '', '', NULL, NULL, 2, 0, NULL),
(144, 0, 'plg_installer_override', 'plugin', 'override', NULL, 'installer', 0, 1, 1, 0, 1, '{\"name\":\"plg_installer_override\",\"type\":\"plugin\",\"creationDate\":\"2018-06\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_INSTALLER_OVERRIDE_PLUGIN_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"override\"}', '', '', NULL, NULL, 4, 0, NULL),
(145, 0, 'plg_installer_packageinstaller', 'plugin', 'packageinstaller', NULL, 'installer', 0, 1, 1, 0, 1, '{\"name\":\"plg_installer_packageinstaller\",\"type\":\"plugin\",\"creationDate\":\"2016-05\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.6.0\",\"description\":\"PLG_INSTALLER_PACKAGEINSTALLER_PLUGIN_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"packageinstaller\"}', '', '', NULL, NULL, 1, 0, NULL),
(146, 0, 'plg_installer_urlinstaller', 'plugin', 'urlinstaller', NULL, 'installer', 0, 1, 1, 0, 1, '{\"name\":\"plg_installer_urlinstaller\",\"type\":\"plugin\",\"creationDate\":\"2016-05\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.6.0\",\"description\":\"PLG_INSTALLER_URLINSTALLER_PLUGIN_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"urlinstaller\"}', '', '', NULL, NULL, 3, 0, NULL),
(147, 0, 'plg_installer_webinstaller', 'plugin', 'webinstaller', NULL, 'installer', 0, 1, 1, 0, 1, '{\"name\":\"plg_installer_webinstaller\",\"type\":\"plugin\",\"creationDate\":\"2017-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_INSTALLER_WEBINSTALLER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"webinstaller\"}', '{\"tab_position\":\"1\"}', '', NULL, NULL, 5, 0, NULL),
(148, 0, 'plg_media-action_crop', 'plugin', 'crop', NULL, 'media-action', 0, 1, 1, 0, 1, '{\"name\":\"plg_media-action_crop\",\"type\":\"plugin\",\"creationDate\":\"2017-01\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2017 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_MEDIA-ACTION_CROP_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"crop\"}', '{}', '', NULL, NULL, 1, 0, NULL),
(149, 0, 'plg_media-action_resize', 'plugin', 'resize', NULL, 'media-action', 0, 1, 1, 0, 1, '{\"name\":\"plg_media-action_resize\",\"type\":\"plugin\",\"creationDate\":\"2017-01\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2017 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_MEDIA-ACTION_RESIZE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"resize\"}', '{}', '', NULL, NULL, 2, 0, NULL),
(150, 0, 'plg_media-action_rotate', 'plugin', 'rotate', NULL, 'media-action', 0, 1, 1, 0, 1, '{\"name\":\"plg_media-action_rotate\",\"type\":\"plugin\",\"creationDate\":\"2017-01\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2017 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_MEDIA-ACTION_ROTATE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"rotate\"}', '{}', '', NULL, NULL, 3, 0, NULL),
(151, 0, 'plg_privacy_actionlogs', 'plugin', 'actionlogs', NULL, 'privacy', 0, 1, 1, 0, 1, '{\"name\":\"plg_privacy_actionlogs\",\"type\":\"plugin\",\"creationDate\":\"2018-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_PRIVACY_ACTIONLOGS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"actionlogs\"}', '{}', '', NULL, NULL, 1, 0, NULL),
(152, 0, 'plg_privacy_consents', 'plugin', 'consents', NULL, 'privacy', 0, 1, 1, 0, 1, '{\"name\":\"plg_privacy_consents\",\"type\":\"plugin\",\"creationDate\":\"2018-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_PRIVACY_CONSENTS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"consents\"}', '{}', '', NULL, NULL, 2, 0, NULL),
(153, 0, 'plg_privacy_contact', 'plugin', 'contact', NULL, 'privacy', 0, 1, 1, 0, 1, '{\"name\":\"plg_privacy_contact\",\"type\":\"plugin\",\"creationDate\":\"2018-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_PRIVACY_CONTACT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"contact\"}', '{}', '', NULL, NULL, 3, 0, NULL),
(154, 0, 'plg_privacy_content', 'plugin', 'content', NULL, 'privacy', 0, 1, 1, 0, 1, '{\"name\":\"plg_privacy_content\",\"type\":\"plugin\",\"creationDate\":\"2018-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_PRIVACY_CONTENT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"content\"}', '{}', '', NULL, NULL, 4, 0, NULL),
(155, 0, 'plg_privacy_message', 'plugin', 'message', NULL, 'privacy', 0, 1, 1, 0, 1, '{\"name\":\"plg_privacy_message\",\"type\":\"plugin\",\"creationDate\":\"2018-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_PRIVACY_MESSAGE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"message\"}', '{}', '', NULL, NULL, 5, 0, NULL),
(156, 0, 'plg_privacy_user', 'plugin', 'user', NULL, 'privacy', 0, 1, 1, 0, 1, '{\"name\":\"plg_privacy_user\",\"type\":\"plugin\",\"creationDate\":\"2018-05\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_PRIVACY_USER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"user\"}', '{}', '', NULL, NULL, 6, 0, NULL),
(157, 0, 'plg_quickicon_joomlaupdate', 'plugin', 'joomlaupdate', NULL, 'quickicon', 0, 1, 1, 0, 1, '{\"name\":\"plg_quickicon_joomlaupdate\",\"type\":\"plugin\",\"creationDate\":\"2011-08\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2011 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_QUICKICON_JOOMLAUPDATE_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Quickicon\\\\Joomlaupdate\",\"filename\":\"joomlaupdate\"}', '', '', NULL, NULL, 1, 0, NULL),
(158, 0, 'plg_quickicon_extensionupdate', 'plugin', 'extensionupdate', NULL, 'quickicon', 0, 1, 1, 0, 1, '{\"name\":\"plg_quickicon_extensionupdate\",\"type\":\"plugin\",\"creationDate\":\"2011-08\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2011 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_QUICKICON_EXTENSIONUPDATE_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Quickicon\\\\Extensionupdate\",\"filename\":\"extensionupdate\"}', '', '', NULL, NULL, 2, 0, NULL),
(159, 0, 'plg_quickicon_overridecheck', 'plugin', 'overridecheck', NULL, 'quickicon', 0, 1, 1, 0, 1, '{\"name\":\"plg_quickicon_overridecheck\",\"type\":\"plugin\",\"creationDate\":\"2018-06\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_QUICKICON_OVERRIDECHECK_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Quickicon\\\\OverrideCheck\",\"filename\":\"overridecheck\"}', '', '', NULL, NULL, 3, 0, NULL),
(160, 0, 'plg_quickicon_downloadkey', 'plugin', 'downloadkey', NULL, 'quickicon', 0, 1, 1, 0, 1, '{\"name\":\"plg_quickicon_downloadkey\",\"type\":\"plugin\",\"creationDate\":\"2019-10\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_QUICKICON_DOWNLOADKEY_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Quickicon\\\\Downloadkey\",\"filename\":\"downloadkey\"}', '', '', NULL, NULL, 4, 0, NULL),
(161, 0, 'plg_quickicon_privacycheck', 'plugin', 'privacycheck', NULL, 'quickicon', 0, 1, 1, 0, 1, '{\"name\":\"plg_quickicon_privacycheck\",\"type\":\"plugin\",\"creationDate\":\"2018-06\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_QUICKICON_PRIVACYCHECK_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Quickicon\\\\PrivacyCheck\",\"filename\":\"privacycheck\"}', '{}', '', NULL, NULL, 5, 0, NULL),
(162, 0, 'plg_quickicon_phpversioncheck', 'plugin', 'phpversioncheck', NULL, 'quickicon', 0, 1, 1, 0, 1, '{\"name\":\"plg_quickicon_phpversioncheck\",\"type\":\"plugin\",\"creationDate\":\"2016-08\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_QUICKICON_PHPVERSIONCHECK_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Quickicon\\\\PhpVersionCheck\",\"filename\":\"phpversioncheck\"}', '', '', NULL, NULL, 6, 0, NULL),
(163, 0, 'plg_sampledata_blog', 'plugin', 'blog', NULL, 'sampledata', 0, 1, 1, 0, 1, '{\"name\":\"plg_sampledata_blog\",\"type\":\"plugin\",\"creationDate\":\"2017-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2017 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.8.0\",\"description\":\"PLG_SAMPLEDATA_BLOG_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"blog\"}', '', '', NULL, NULL, 1, 0, NULL),
(164, 0, 'plg_sampledata_multilang', 'plugin', 'multilang', NULL, 'sampledata', 0, 1, 1, 0, 1, '{\"name\":\"plg_sampledata_multilang\",\"type\":\"plugin\",\"creationDate\":\"2018-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_SAMPLEDATA_MULTILANG_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"multilang\"}', '', '', NULL, NULL, 2, 0, NULL);
INSERT INTO `buf3w_extensions` (`extension_id`, `package_id`, `name`, `type`, `element`, `changelogurl`, `folder`, `client_id`, `enabled`, `access`, `protected`, `locked`, `manifest_cache`, `params`, `custom_data`, `checked_out`, `checked_out_time`, `ordering`, `state`, `note`) VALUES
(165, 0, 'plg_system_accessibility', 'plugin', 'accessibility', NULL, 'system', 0, 0, 1, 0, 1, '{\"name\":\"plg_system_accessibility\",\"type\":\"plugin\",\"creationDate\":\"2020-02-15\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2020 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_SYSTEM_ACCESSIBILITY_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"accessibility\"}', '{}', '', NULL, NULL, 1, 0, NULL),
(166, 0, 'plg_system_actionlogs', 'plugin', 'actionlogs', NULL, 'system', 0, 1, 1, 0, 1, '{\"name\":\"plg_system_actionlogs\",\"type\":\"plugin\",\"creationDate\":\"2018-05\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_SYSTEM_ACTIONLOGS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"actionlogs\"}', '{}', '', NULL, NULL, 2, 0, NULL),
(167, 0, 'plg_system_cache', 'plugin', 'cache', NULL, 'system', 0, 0, 1, 0, 1, '{\"name\":\"plg_system_cache\",\"type\":\"plugin\",\"creationDate\":\"2007-02\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2007 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_CACHE_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\System\\\\Cache\",\"filename\":\"cache\"}', '{\"browsercache\":\"0\",\"cachetime\":\"15\"}', '', NULL, NULL, 3, 0, NULL),
(168, 0, 'plg_system_debug', 'plugin', 'debug', NULL, 'system', 0, 1, 1, 0, 1, '{\"name\":\"plg_system_debug\",\"type\":\"plugin\",\"creationDate\":\"2006-12\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_DEBUG_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\System\\\\Debug\",\"filename\":\"debug\"}', '{\"profile\":\"1\",\"queries\":\"1\",\"memory\":\"1\",\"language_files\":\"1\",\"language_strings\":\"1\",\"strip-first\":\"1\",\"strip-prefix\":\"\",\"strip-suffix\":\"\"}', '', NULL, NULL, 4, 0, NULL),
(169, 0, 'plg_system_fields', 'plugin', 'fields', NULL, 'system', 0, 1, 1, 0, 1, '{\"name\":\"plg_system_fields\",\"type\":\"plugin\",\"creationDate\":\"2016-03\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_SYSTEM_FIELDS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"fields\"}', '', '', NULL, NULL, 5, 0, NULL),
(170, 0, 'plg_system_highlight', 'plugin', 'highlight', NULL, 'system', 0, 1, 1, 0, 1, '{\"name\":\"plg_system_highlight\",\"type\":\"plugin\",\"creationDate\":\"2011-08\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2011 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SYSTEM_HIGHLIGHT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"highlight\"}', '', '', NULL, NULL, 6, 0, NULL),
(171, 0, 'plg_system_httpheaders', 'plugin', 'httpheaders', NULL, 'system', 0, 1, 1, 0, 1, '{\"name\":\"plg_system_httpheaders\",\"type\":\"plugin\",\"creationDate\":\"2017-10\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_SYSTEM_HTTPHEADERS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"httpheaders\"}', '{}', '', NULL, NULL, 7, 0, NULL),
(172, 0, 'plg_system_jooa11y', 'plugin', 'jooa11y', NULL, 'system', 0, 1, 1, 0, 1, '{\"name\":\"plg_system_jooa11y\",\"type\":\"plugin\",\"creationDate\":\"2022-02\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2021 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.2.0\",\"description\":\"PLG_SYSTEM_JOOA11Y_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"jooa11y\"}', '', '', NULL, NULL, 8, 0, NULL),
(173, 0, 'plg_system_languagecode', 'plugin', 'languagecode', NULL, 'system', 0, 0, 1, 0, 1, '{\"name\":\"plg_system_languagecode\",\"type\":\"plugin\",\"creationDate\":\"2011-11\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2011 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SYSTEM_LANGUAGECODE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"languagecode\"}', '', '', NULL, NULL, 9, 0, NULL),
(174, 0, 'plg_system_languagefilter', 'plugin', 'languagefilter', NULL, 'system', 0, 0, 1, 0, 1, '{\"name\":\"plg_system_languagefilter\",\"type\":\"plugin\",\"creationDate\":\"2010-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2010 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SYSTEM_LANGUAGEFILTER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"languagefilter\"}', '', '', NULL, NULL, 10, 0, NULL),
(175, 0, 'plg_system_log', 'plugin', 'log', NULL, 'system', 0, 1, 1, 0, 1, '{\"name\":\"plg_system_log\",\"type\":\"plugin\",\"creationDate\":\"2007-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2007 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_LOG_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"log\"}', '', '', NULL, NULL, 11, 0, NULL),
(176, 0, 'plg_system_logout', 'plugin', 'logout', NULL, 'system', 0, 1, 1, 0, 1, '{\"name\":\"plg_system_logout\",\"type\":\"plugin\",\"creationDate\":\"2009-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2009 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SYSTEM_LOGOUT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"logout\"}', '', '', NULL, NULL, 12, 0, NULL),
(177, 0, 'plg_system_logrotation', 'plugin', 'logrotation', NULL, 'system', 0, 1, 1, 0, 1, '{\"name\":\"plg_system_logrotation\",\"type\":\"plugin\",\"creationDate\":\"2018-05\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_SYSTEM_LOGROTATION_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"logrotation\"}', '{\"lastrun\":1686030750}', '', NULL, NULL, 13, 0, NULL),
(178, 0, 'plg_system_privacyconsent', 'plugin', 'privacyconsent', NULL, 'system', 0, 0, 1, 0, 1, '{\"name\":\"plg_system_privacyconsent\",\"type\":\"plugin\",\"creationDate\":\"2018-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_SYSTEM_PRIVACYCONSENT_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\System\\\\PrivacyConsent\",\"filename\":\"privacyconsent\"}', '{}', '', NULL, NULL, 14, 0, NULL),
(179, 0, 'plg_system_redirect', 'plugin', 'redirect', NULL, 'system', 0, 0, 1, 0, 1, '{\"name\":\"plg_system_redirect\",\"type\":\"plugin\",\"creationDate\":\"2009-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2009 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SYSTEM_REDIRECT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"redirect\"}', '', '', NULL, NULL, 15, 0, NULL),
(180, 0, 'plg_system_remember', 'plugin', 'remember', NULL, 'system', 0, 1, 1, 0, 1, '{\"name\":\"plg_system_remember\",\"type\":\"plugin\",\"creationDate\":\"2007-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2007 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_REMEMBER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"remember\"}', '', '', NULL, NULL, 16, 0, NULL),
(181, 0, 'plg_system_schedulerunner', 'plugin', 'schedulerunner', NULL, 'system', 0, 1, 1, 0, 1, '{\"name\":\"plg_system_schedulerunner\",\"type\":\"plugin\",\"creationDate\":\"2021-08\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2021 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.1\",\"description\":\"PLG_SYSTEM_SCHEDULERUNNER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"schedulerunner\"}', '{}', '', NULL, NULL, 17, 0, NULL),
(182, 0, 'plg_system_sef', 'plugin', 'sef', NULL, 'system', 0, 1, 1, 0, 1, '{\"name\":\"plg_system_sef\",\"type\":\"plugin\",\"creationDate\":\"2007-12\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2007 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SEF_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"sef\"}', '', '', NULL, NULL, 18, 0, NULL),
(183, 0, 'plg_system_sessiongc', 'plugin', 'sessiongc', NULL, 'system', 0, 1, 1, 0, 1, '{\"name\":\"plg_system_sessiongc\",\"type\":\"plugin\",\"creationDate\":\"2018-02\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.8.6\",\"description\":\"PLG_SYSTEM_SESSIONGC_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"sessiongc\"}', '', '', NULL, NULL, 19, 0, NULL),
(184, 0, 'plg_system_shortcut', 'plugin', 'shortcut', NULL, 'system', 0, 1, 1, 0, 1, '{\"name\":\"plg_system_shortcut\",\"type\":\"plugin\",\"creationDate\":\"2022-06\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2022 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.2.0\",\"description\":\"PLG_SYSTEM_SHORTCUT_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\System\\\\Shortcut\",\"filename\":\"shortcut\"}', '{}', '', NULL, NULL, 0, 0, NULL),
(185, 0, 'plg_system_skipto', 'plugin', 'skipto', NULL, 'system', 0, 1, 1, 0, 1, '{\"name\":\"plg_system_skipto\",\"type\":\"plugin\",\"creationDate\":\"2020-02\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_SYSTEM_SKIPTO_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"skipto\"}', '{}', '', NULL, NULL, 20, 0, NULL),
(186, 0, 'plg_system_stats', 'plugin', 'stats', NULL, 'system', 0, 0, 1, 0, 1, '{\"name\":\"plg_system_stats\",\"type\":\"plugin\",\"creationDate\":\"2013-11\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2013 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.5.0\",\"description\":\"PLG_SYSTEM_STATS_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\System\\\\Stats\",\"filename\":\"stats\"}', '{\"mode\":3,\"lastrun\":1686031416,\"unique_id\":\"8b109850414717d34f68d294faeecf07e8a9c712\",\"interval\":12}', '', NULL, NULL, 21, 0, NULL),
(187, 0, 'plg_system_task_notification', 'plugin', 'tasknotification', NULL, 'system', 0, 1, 1, 0, 1, '{\"name\":\"plg_system_task_notification\",\"type\":\"plugin\",\"creationDate\":\"2021-09\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2021 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.1\",\"description\":\"PLG_SYSTEM_TASK_NOTIFICATION_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"tasknotification\"}', '', '', NULL, NULL, 22, 0, NULL),
(188, 0, 'plg_system_updatenotification', 'plugin', 'updatenotification', NULL, 'system', 0, 1, 1, 0, 1, '{\"name\":\"plg_system_updatenotification\",\"type\":\"plugin\",\"creationDate\":\"2015-05\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2015 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.5.0\",\"description\":\"PLG_SYSTEM_UPDATENOTIFICATION_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"updatenotification\"}', '{\"lastrun\":1686122112}', '', NULL, NULL, 23, 0, NULL),
(189, 0, 'plg_system_webauthn', 'plugin', 'webauthn', NULL, 'system', 0, 1, 1, 0, 1, '{\"name\":\"plg_system_webauthn\",\"type\":\"plugin\",\"creationDate\":\"2019-07-02\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2020 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_SYSTEM_WEBAUTHN_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\System\\\\Webauthn\",\"filename\":\"webauthn\"}', '{}', '', NULL, NULL, 24, 0, NULL),
(190, 0, 'plg_task_check_files', 'plugin', 'checkfiles', NULL, 'task', 0, 1, 1, 0, 1, '{\"name\":\"plg_task_check_files\",\"type\":\"plugin\",\"creationDate\":\"2021-08\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2021 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.1\",\"description\":\"PLG_TASK_CHECK_FILES_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Task\\\\Checkfiles\",\"filename\":\"checkfiles\"}', '{}', '', NULL, NULL, 1, 0, NULL),
(191, 0, 'plg_task_demo_tasks', 'plugin', 'demotasks', NULL, 'task', 0, 1, 1, 0, 1, '{\"name\":\"plg_task_demo_tasks\",\"type\":\"plugin\",\"creationDate\":\"2021-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2021 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.1\",\"description\":\"PLG_TASK_DEMO_TASKS_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Task\\\\DemoTasks\",\"filename\":\"demotasks\"}', '{}', '', NULL, NULL, 2, 0, NULL),
(192, 0, 'plg_task_requests', 'plugin', 'requests', NULL, 'task', 0, 1, 1, 0, 1, '{\"name\":\"plg_task_requests\",\"type\":\"plugin\",\"creationDate\":\"2021-08\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2021 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.1\",\"description\":\"PLG_TASK_REQUESTS_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Task\\\\Requests\",\"filename\":\"requests\"}', '{}', '', NULL, NULL, 3, 0, NULL),
(193, 0, 'plg_task_site_status', 'plugin', 'sitestatus', NULL, 'task', 0, 1, 1, 0, 1, '{\"name\":\"plg_task_site_status\",\"type\":\"plugin\",\"creationDate\":\"2021-08\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2021 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.1\",\"description\":\"PLG_TASK_SITE_STATUS_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Task\\\\SiteStatus\",\"filename\":\"sitestatus\"}', '{}', '', NULL, NULL, 4, 0, NULL),
(194, 0, 'plg_multifactorauth_totp', 'plugin', 'totp', NULL, 'multifactorauth', 0, 1, 1, 0, 1, '{\"name\":\"plg_multifactorauth_totp\",\"type\":\"plugin\",\"creationDate\":\"2013-08\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2013 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.2.0\",\"description\":\"PLG_MULTIFACTORAUTH_TOTP_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Multifactorauth\\\\Totp\",\"filename\":\"totp\"}', '', '', NULL, NULL, 1, 0, NULL),
(195, 0, 'plg_multifactorauth_yubikey', 'plugin', 'yubikey', NULL, 'multifactorauth', 0, 1, 1, 0, 1, '{\"name\":\"plg_multifactorauth_yubikey\",\"type\":\"plugin\",\"creationDate\":\"2013-09\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2013 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.2.0\",\"description\":\"PLG_MULTIFACTORAUTH_YUBIKEY_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Multifactorauth\\\\Yubikey\",\"filename\":\"yubikey\"}', '', '', NULL, NULL, 2, 0, NULL),
(196, 0, 'plg_multifactorauth_webauthn', 'plugin', 'webauthn', NULL, 'multifactorauth', 0, 1, 1, 0, 1, '{\"name\":\"plg_multifactorauth_webauthn\",\"type\":\"plugin\",\"creationDate\":\"2022-05\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2022 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.2.0\",\"description\":\"PLG_MULTIFACTORAUTH_WEBAUTHN_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Multifactorauth\\\\Webauthn\",\"filename\":\"webauthn\"}', '', '', NULL, NULL, 3, 0, NULL),
(197, 0, 'plg_multifactorauth_email', 'plugin', 'email', NULL, 'multifactorauth', 0, 1, 1, 0, 1, '{\"name\":\"plg_multifactorauth_email\",\"type\":\"plugin\",\"creationDate\":\"2022-05\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2022 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.2.0\",\"description\":\"PLG_MULTIFACTORAUTH_EMAIL_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Multifactorauth\\\\Email\",\"filename\":\"email\"}', '', '', NULL, NULL, 4, 0, NULL),
(198, 0, 'plg_multifactorauth_fixed', 'plugin', 'fixed', NULL, 'multifactorauth', 0, 0, 1, 0, 1, '{\"name\":\"plg_multifactorauth_fixed\",\"type\":\"plugin\",\"creationDate\":\"2022-05\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2022 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.2.0\",\"description\":\"PLG_MULTIFACTORAUTH_FIXED_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Multifactorauth\\\\Fixed\",\"filename\":\"fixed\"}', '', '', NULL, NULL, 5, 0, NULL),
(199, 0, 'plg_user_contactcreator', 'plugin', 'contactcreator', NULL, 'user', 0, 0, 1, 0, 1, '{\"name\":\"plg_user_contactcreator\",\"type\":\"plugin\",\"creationDate\":\"2009-08\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2009 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_CONTACTCREATOR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"contactcreator\"}', '{\"autowebpage\":\"\",\"category\":\"4\",\"autopublish\":\"0\"}', '', NULL, NULL, 1, 0, NULL),
(200, 0, 'plg_user_joomla', 'plugin', 'joomla', NULL, 'user', 0, 1, 1, 0, 1, '{\"name\":\"plg_user_joomla\",\"type\":\"plugin\",\"creationDate\":\"2006-12\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_USER_JOOMLA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"joomla\"}', '{\"autoregister\":\"1\",\"mail_to_user\":\"1\",\"forceLogout\":\"1\"}', '', NULL, NULL, 2, 0, NULL),
(201, 0, 'plg_user_profile', 'plugin', 'profile', NULL, 'user', 0, 0, 1, 0, 1, '{\"name\":\"plg_user_profile\",\"type\":\"plugin\",\"creationDate\":\"2008-01\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2008 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_USER_PROFILE_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\User\\\\Profile\",\"filename\":\"profile\"}', '{\"register-require_address1\":\"1\",\"register-require_address2\":\"1\",\"register-require_city\":\"1\",\"register-require_region\":\"1\",\"register-require_country\":\"1\",\"register-require_postal_code\":\"1\",\"register-require_phone\":\"1\",\"register-require_website\":\"1\",\"register-require_favoritebook\":\"1\",\"register-require_aboutme\":\"1\",\"register-require_tos\":\"1\",\"register-require_dob\":\"1\",\"profile-require_address1\":\"1\",\"profile-require_address2\":\"1\",\"profile-require_city\":\"1\",\"profile-require_region\":\"1\",\"profile-require_country\":\"1\",\"profile-require_postal_code\":\"1\",\"profile-require_phone\":\"1\",\"profile-require_website\":\"1\",\"profile-require_favoritebook\":\"1\",\"profile-require_aboutme\":\"1\",\"profile-require_tos\":\"1\",\"profile-require_dob\":\"1\"}', '', NULL, NULL, 3, 0, NULL),
(202, 0, 'plg_user_terms', 'plugin', 'terms', NULL, 'user', 0, 0, 1, 0, 1, '{\"name\":\"plg_user_terms\",\"type\":\"plugin\",\"creationDate\":\"2018-06\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_USER_TERMS_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\User\\\\Terms\",\"filename\":\"terms\"}', '{}', '', NULL, NULL, 4, 0, NULL),
(203, 0, 'plg_user_token', 'plugin', 'token', NULL, 'user', 0, 1, 1, 0, 1, '{\"name\":\"plg_user_token\",\"type\":\"plugin\",\"creationDate\":\"2019-11\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2020 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_USER_TOKEN_XML_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\User\\\\Token\",\"filename\":\"token\"}', '{}', '', NULL, NULL, 5, 0, NULL),
(204, 0, 'plg_webservices_banners', 'plugin', 'banners', NULL, 'webservices', 0, 1, 1, 0, 1, '{\"name\":\"plg_webservices_banners\",\"type\":\"plugin\",\"creationDate\":\"2019-09\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_WEBSERVICES_BANNERS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"banners\"}', '{}', '', NULL, NULL, 1, 0, NULL),
(205, 0, 'plg_webservices_config', 'plugin', 'config', NULL, 'webservices', 0, 1, 1, 0, 1, '{\"name\":\"plg_webservices_config\",\"type\":\"plugin\",\"creationDate\":\"2019-09\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_WEBSERVICES_CONFIG_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"config\"}', '{}', '', NULL, NULL, 2, 0, NULL),
(206, 0, 'plg_webservices_contact', 'plugin', 'contact', NULL, 'webservices', 0, 1, 1, 0, 1, '{\"name\":\"plg_webservices_contact\",\"type\":\"plugin\",\"creationDate\":\"2019-09\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_WEBSERVICES_CONTACT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"contact\"}', '{}', '', NULL, NULL, 3, 0, NULL),
(207, 0, 'plg_webservices_content', 'plugin', 'content', NULL, 'webservices', 0, 1, 1, 0, 1, '{\"name\":\"plg_webservices_content\",\"type\":\"plugin\",\"creationDate\":\"2019-09\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_WEBSERVICES_CONTENT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"content\"}', '{}', '', NULL, NULL, 4, 0, NULL),
(208, 0, 'plg_webservices_installer', 'plugin', 'installer', NULL, 'webservices', 0, 1, 1, 0, 1, '{\"name\":\"plg_webservices_installer\",\"type\":\"plugin\",\"creationDate\":\"2020-06\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2020 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_WEBSERVICES_INSTALLER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"installer\"}', '{}', '', NULL, NULL, 5, 0, NULL),
(209, 0, 'plg_webservices_languages', 'plugin', 'languages', NULL, 'webservices', 0, 1, 1, 0, 1, '{\"name\":\"plg_webservices_languages\",\"type\":\"plugin\",\"creationDate\":\"2019-09\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_WEBSERVICES_LANGUAGES_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"languages\"}', '{}', '', NULL, NULL, 6, 0, NULL),
(210, 0, 'plg_webservices_media', 'plugin', 'media', NULL, 'webservices', 0, 1, 1, 0, 1, '{\"name\":\"plg_webservices_media\",\"type\":\"plugin\",\"creationDate\":\"2021-05\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2021 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.1.0\",\"description\":\"PLG_WEBSERVICES_MEDIA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"media\"}', '{}', '', NULL, NULL, 7, 0, NULL),
(211, 0, 'plg_webservices_menus', 'plugin', 'menus', NULL, 'webservices', 0, 1, 1, 0, 1, '{\"name\":\"plg_webservices_menus\",\"type\":\"plugin\",\"creationDate\":\"2019-09\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_WEBSERVICES_MENUS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"menus\"}', '{}', '', NULL, NULL, 7, 0, NULL),
(212, 0, 'plg_webservices_messages', 'plugin', 'messages', NULL, 'webservices', 0, 1, 1, 0, 1, '{\"name\":\"plg_webservices_messages\",\"type\":\"plugin\",\"creationDate\":\"2019-09\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_WEBSERVICES_MESSAGES_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"messages\"}', '{}', '', NULL, NULL, 8, 0, NULL),
(213, 0, 'plg_webservices_modules', 'plugin', 'modules', NULL, 'webservices', 0, 1, 1, 0, 1, '{\"name\":\"plg_webservices_modules\",\"type\":\"plugin\",\"creationDate\":\"2019-09\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_WEBSERVICES_MODULES_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"modules\"}', '{}', '', NULL, NULL, 9, 0, NULL),
(214, 0, 'plg_webservices_newsfeeds', 'plugin', 'newsfeeds', NULL, 'webservices', 0, 1, 1, 0, 1, '{\"name\":\"plg_webservices_newsfeeds\",\"type\":\"plugin\",\"creationDate\":\"2019-09\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_WEBSERVICES_NEWSFEEDS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"newsfeeds\"}', '{}', '', NULL, NULL, 10, 0, NULL),
(215, 0, 'plg_webservices_plugins', 'plugin', 'plugins', NULL, 'webservices', 0, 1, 1, 0, 1, '{\"name\":\"plg_webservices_plugins\",\"type\":\"plugin\",\"creationDate\":\"2019-09\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_WEBSERVICES_PLUGINS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"plugins\"}', '{}', '', NULL, NULL, 11, 0, NULL),
(216, 0, 'plg_webservices_privacy', 'plugin', 'privacy', NULL, 'webservices', 0, 1, 1, 0, 1, '{\"name\":\"plg_webservices_privacy\",\"type\":\"plugin\",\"creationDate\":\"2019-09\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_WEBSERVICES_PRIVACY_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"privacy\"}', '{}', '', NULL, NULL, 12, 0, NULL),
(217, 0, 'plg_webservices_redirect', 'plugin', 'redirect', NULL, 'webservices', 0, 1, 1, 0, 1, '{\"name\":\"plg_webservices_redirect\",\"type\":\"plugin\",\"creationDate\":\"2019-09\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_WEBSERVICES_REDIRECT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"redirect\"}', '{}', '', NULL, NULL, 13, 0, NULL),
(218, 0, 'plg_webservices_tags', 'plugin', 'tags', NULL, 'webservices', 0, 1, 1, 0, 1, '{\"name\":\"plg_webservices_tags\",\"type\":\"plugin\",\"creationDate\":\"2019-09\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_WEBSERVICES_TAGS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"tags\"}', '{}', '', NULL, NULL, 14, 0, NULL),
(219, 0, 'plg_webservices_templates', 'plugin', 'templates', NULL, 'webservices', 0, 1, 1, 0, 1, '{\"name\":\"plg_webservices_templates\",\"type\":\"plugin\",\"creationDate\":\"2019-09\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_WEBSERVICES_TEMPLATES_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"templates\"}', '{}', '', NULL, NULL, 15, 0, NULL),
(220, 0, 'plg_webservices_users', 'plugin', 'users', NULL, 'webservices', 0, 1, 1, 0, 1, '{\"name\":\"plg_webservices_users\",\"type\":\"plugin\",\"creationDate\":\"2019-09\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_WEBSERVICES_USERS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"users\"}', '{}', '', NULL, NULL, 16, 0, NULL),
(221, 0, 'plg_workflow_featuring', 'plugin', 'featuring', NULL, 'workflow', 0, 1, 1, 0, 1, '{\"name\":\"plg_workflow_featuring\",\"type\":\"plugin\",\"creationDate\":\"2020-03\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2020 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_WORKFLOW_FEATURING_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"featuring\"}', '{}', '', NULL, NULL, 1, 0, NULL),
(222, 0, 'plg_workflow_notification', 'plugin', 'notification', NULL, 'workflow', 0, 1, 1, 0, 1, '{\"name\":\"plg_workflow_notification\",\"type\":\"plugin\",\"creationDate\":\"2020-05\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2020 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_WORKFLOW_NOTIFICATION_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"notification\"}', '{}', '', NULL, NULL, 2, 0, NULL),
(223, 0, 'plg_workflow_publishing', 'plugin', 'publishing', NULL, 'workflow', 0, 1, 1, 0, 1, '{\"name\":\"plg_workflow_publishing\",\"type\":\"plugin\",\"creationDate\":\"2020-03\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2020 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_WORKFLOW_PUBLISHING_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"publishing\"}', '{}', '', NULL, NULL, 3, 0, NULL),
(224, 0, 'plg_system_guidedtours', 'plugin', 'guidedtours', NULL, 'system', 0, 1, 1, 0, 1, '{\"name\":\"plg_system_guidedtours\",\"type\":\"plugin\",\"creationDate\":\"2023-02\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2023 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.3.0\",\"description\":\"PLG_SYSTEM_GUIDEDTOURS_DESCRIPTION\",\"group\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\System\\\\GuidedTours\",\"filename\":\"guidedtours\"}', '{}', '', NULL, NULL, 15, 0, NULL),
(225, 0, 'atum', 'template', 'atum', NULL, '', 1, 1, 1, 0, 1, '{\"name\":\"atum\",\"type\":\"template\",\"creationDate\":\"2016-09\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"\",\"version\":\"1.0\",\"description\":\"TPL_ATUM_XML_DESCRIPTION\",\"group\":\"\",\"inheritable\":true,\"filename\":\"templateDetails\"}', '', '', NULL, NULL, 0, 0, NULL),
(226, 0, 'cassiopeia', 'template', 'cassiopeia', NULL, '', 0, 1, 1, 0, 1, '{\"name\":\"cassiopeia\",\"type\":\"template\",\"creationDate\":\"2017-02\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2017 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"\",\"version\":\"1.0\",\"description\":\"TPL_CASSIOPEIA_XML_DESCRIPTION\",\"group\":\"\",\"inheritable\":true,\"filename\":\"templateDetails\"}', '{\"logoFile\":\"\",\"fluidContainer\":\"0\",\"sidebarLeftWidth\":\"3\",\"sidebarRightWidth\":\"3\"}', '', NULL, NULL, 0, 0, NULL),
(227, 0, 'files_joomla', 'file', 'joomla', NULL, '', 0, 1, 1, 1, 1, '{\"name\":\"files_joomla\",\"type\":\"file\",\"creationDate\":\"2023-05\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.3.2\",\"description\":\"FILES_JOOMLA_XML_DESCRIPTION\",\"group\":\"\"}', '', '', NULL, NULL, 0, 0, NULL),
(228, 0, 'English (en-GB) Language Pack', 'package', 'pkg_en-GB', NULL, '', 0, 1, 1, 1, 1, '{\"name\":\"English (en-GB) Language Pack\",\"type\":\"package\",\"creationDate\":\"2023-05\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.3.2.1\",\"description\":\"en-GB language pack\",\"group\":\"\",\"filename\":\"pkg_en-GB\"}', '', '', NULL, NULL, 0, 0, NULL),
(229, 228, 'English (en-GB)', 'language', 'en-GB', NULL, '', 0, 1, 1, 1, 1, '{\"name\":\"English (en-GB)\",\"type\":\"language\",\"creationDate\":\"2023-05\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.3.2\",\"description\":\"en-GB site language\",\"group\":\"\"}', '', '', NULL, NULL, 0, 0, NULL),
(230, 228, 'English (en-GB)', 'language', 'en-GB', NULL, '', 1, 1, 1, 1, 1, '{\"name\":\"English (en-GB)\",\"type\":\"language\",\"creationDate\":\"2023-05\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.3.2\",\"description\":\"en-GB administrator language\",\"group\":\"\"}', '', '', NULL, NULL, 0, 0, NULL),
(231, 228, 'English (en-GB)', 'language', 'en-GB', NULL, '', 3, 1, 1, 1, 1, '{\"name\":\"English (en-GB)\",\"type\":\"language\",\"creationDate\":\"2023-05\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2020 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.3.2\",\"description\":\"en-GB api language\",\"group\":\"\"}', '', '', NULL, NULL, 0, 0, NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `buf3w_fields`
--

CREATE TABLE `buf3w_fields` (
  `id` int(10) UNSIGNED NOT NULL,
  `asset_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `context` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `group_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `default_value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'text',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` tinyint(4) NOT NULL DEFAULT 0,
  `required` tinyint(4) NOT NULL DEFAULT 0,
  `only_use_in_subform` tinyint(4) NOT NULL DEFAULT 0,
  `checked_out` int(10) UNSIGNED DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `ordering` int(11) NOT NULL DEFAULT 0,
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `fieldparams` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_time` datetime NOT NULL,
  `created_user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `modified_time` datetime NOT NULL,
  `modified_by` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `access` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `buf3w_fields_categories`
--

CREATE TABLE `buf3w_fields_categories` (
  `field_id` int(11) NOT NULL DEFAULT 0,
  `category_id` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `buf3w_fields_groups`
--

CREATE TABLE `buf3w_fields_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `asset_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `context` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` tinyint(4) NOT NULL DEFAULT 0,
  `checked_out` int(10) UNSIGNED DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `ordering` int(11) NOT NULL DEFAULT 0,
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created` datetime NOT NULL,
  `created_by` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `modified` datetime NOT NULL,
  `modified_by` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `access` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `buf3w_fields_values`
--

CREATE TABLE `buf3w_fields_values` (
  `field_id` int(10) UNSIGNED NOT NULL,
  `item_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Allow references to items which have strings as ids, eg. none db systems.',
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `buf3w_finder_filters`
--

CREATE TABLE `buf3w_finder_filters` (
  `filter_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` tinyint(4) NOT NULL DEFAULT 1,
  `created` datetime NOT NULL,
  `created_by` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified` datetime NOT NULL,
  `modified_by` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `checked_out` int(10) UNSIGNED DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `map_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `data` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `params` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `buf3w_finder_links`
--

CREATE TABLE `buf3w_finder_links` (
  `link_id` int(10) UNSIGNED NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `route` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `indexdate` datetime NOT NULL,
  `md5sum` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `published` tinyint(4) NOT NULL DEFAULT 1,
  `state` int(11) NOT NULL DEFAULT 1,
  `access` int(11) NOT NULL DEFAULT 0,
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `publish_start_date` datetime DEFAULT NULL,
  `publish_end_date` datetime DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `list_price` double UNSIGNED NOT NULL DEFAULT 0,
  `sale_price` double UNSIGNED NOT NULL DEFAULT 0,
  `type_id` int(11) NOT NULL,
  `object` mediumblob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `buf3w_finder_links`
--

INSERT INTO `buf3w_finder_links` (`link_id`, `url`, `route`, `title`, `description`, `indexdate`, `md5sum`, `published`, `state`, `access`, `language`, `publish_start_date`, `publish_end_date`, `start_date`, `end_date`, `list_price`, `sale_price`, `type_id`, `object`) VALUES
(1, 'index.php?option=com_content&view=article&id=1', 'index.php?option=com_content&view=article&id=1:rosjanie-wysadzili-zapore&catid=8', 'Rosjanie wysadzili zaporę', ' Rosjanie wysadzili zaporę. \"Poziom krytyczny za 5 godzin\" Niepokojące doniesienia z Ukrainy. Po wysadzeniu przez wojska rosyjskie zapory wodnej na Dnieprze w okupowanej Nowej Kachowce, władze obwodu chersońskiego ogłosiły ewakuację mieszkańców zagrożonych zalaniem terenów. Za pięć godzin woda ma osiągnąć poziom krytyczny. ', '2023-06-06 06:54:12', 'fa81fd86e94503f24b79ca8783fe9746', 1, 1, 1, '*', '2023-06-06 06:37:25', NULL, '2023-06-06 06:37:25', NULL, 0, 0, 3, 0x4f3a35323a224a6f6f6d6c615c436f6d706f6e656e745c46696e6465725c41646d696e6973747261746f725c496e64657865725c526573756c74223a31393a7b693a303b693a313b693a313b733a353a22656e2d4742223b693a323b733a3334313a2220526f736a616e69652077797361647a696c69207a61706f72c4992e2022506f7a696f6d206b72797479637a6e79207a61203520676f647a696e22204e6965706f6b6f6ac485636520646f6e69657369656e6961207a20556b7261696e792e20506f2077797361647a656e69752070727a657a20776f6a736b6120726f73796a736b6965207a61706f727920776f646e656a206e6120446e696570727a652077206f6b75706f77616e656a204e6f77656a204b6163686f7763652c2077c58261647a65206f62776f64752063686572736fc584736b6965676f206f67c5826f7369c58279206577616b7561636ac499206d6965737a6b61c58463c3b377207a6167726fc5bc6f6e796368207a616c616e69656d20746572656ec3b3772e205a61207069c499c48720676f647a696e20776f6461206d61206f7369c485676ec485c48720706f7a696f6d206b72797479637a6e792e20223b693a333b613a32373a7b733a323a226964223b693a313b733a353a22616c696173223b733a32353a22726f736a616e69652077797361647a696c69207a61706f7265223b733a373a2273756d6d617279223b733a3431383a223c683120636c6173733d2261727469636c652d2d7469746c6520693178416d52765222207374796c653d22746578742d616c69676e3a2063656e7465723b223e526f736a616e69652077797361647a696c69207a61706f72c4992e2022506f7a696f6d206b72797479637a6e79207a61203520676f647a696e223c2f68313e0d0a3c703e4e6965706f6b6f6ac485636520646f6e69657369656e6961207a20556b7261696e792e20506f2077797361647a656e69752070727a657a20776f6a736b6120726f73796a736b6965207a61706f727920776f646e656a206e6120446e696570727a652077206f6b75706f77616e656a204e6f77656a204b6163686f7763652c2077c58261647a65206f62776f64752063686572736fc584736b6965676f206f67c5826f7369c58279206577616b7561636ac499206d6965737a6b61c58463c3b377207a6167726fc5bc6f6e796368207a616c616e69656d20746572656ec3b3772e205a61207069c499c48720676f647a696e20776f6461206d61206f7369c485676ec485c48720706f7a696f6d206b72797479637a6e792e3c2f703e0d0a223b733a343a22626f6479223b733a323038353a220d0a3c70207374796c653d22746578742d616c69676e3a206c6566743b223e3c696d67207372633d22696d616765732f74616d61322e6a706567236a6f6f6d6c61496d6167653a2f2f6c6f63616c2d696d616765732f74616d61322e6a7065673f77696474683d3337343526616d703b6865696768743d32343937222077696474683d223132363322206865696768743d2238343222202f3e3c2f703e0d0a3c70207374796c653d22746578742d616c69676e3a206c6566743b223e22536b616c61207a6e69737a637a65c5842c207072c499646b6fc59bc4872069c2a0696c6fc59bc48720776f6479206f72617a2070726177646f706f646f626e65206f62737a61727920706f776f647a692073c48520757374616c616e652220e28093c2a0706f696e666f726d6f7761c5826120756b726169c584736b612061726d6961206e612046616365626f6f6b752e3c2f703e0d0a3c64697620636c6173733d2261727469636c652d2d74657874206946514e384f5532206959776155723358223e0d0a3c6832207374796c653d22746578742d616c69676e3a2063656e7465723b223e57797361647a6f6e61207a61706f72612077204e6f77656a204b6163686f7763652e204577616b7561636a61206d6965737a6b61c58463c3b3773c2f68323e0d0a3c2f6469763e0d0a3c64697620636c6173733d2261727469636c652d2d74657874206946514e384f5532206959776155723358223e0d0a3c703e506fc2a077797361647a656e69753c7374726f6e673ec2a07a61706f727920776f646e656ac2a06e6120446e696570727a653c2f7374726f6e673e2077c2a06f6b75706f77616e656a204e6f77656a204b6163686f7763652c2077c58261647a65206f62776f64752063686572736fc584736b6965676f206f67c5826f7369c58279206577616b7561636ac499206d6965737a6b61c58463c3b377207a6167726fc5bc6f6e796368207a616c616e69656d20746572656ec3b3772069c2a06f7374727a6567c582792c20c5bc65207a61207069c499c48720676f647a696e20776f6461206f7369c485676e696520706f7a696f6d206b72797479637a6e792e3c2f703e0d0a3c2f6469763e0d0a3c703e22526f73796a736b612061726d696120646f6b6f6e61c58261206b6f6c656a6e65676f20616b747520746572726f727520e28093c2a077797361647a69c58261204b6163686f77736bc48520456c656b74726f776e69c49920576f646ec4852e205a61207069c499c48720676f647a696e20776f6461206f7369c485676e696520706f7a696f6d206b72797479637a6e7922202dc2a06fc59b77696164637a79c58220737a65662043686572736fc584736b69656a20576f6a736b6f77656a2041646d696e6973747261636a69204f62776f646f77656a204fc582656b73616e64722050726f6b7564696e2e3c2f703e0d0a3c64697620636c6173733d2261727469636c652d2d74657874206946514e384f5532206959776155723358223e0d0a3c6832207374796c653d22746578742d616c69676e3a2063656e7465723b223e5a61706f72612077204e6f77656a204b6163686f7763652077797361647a6f6e612e2043686572736fc584207a6167726fc5bc6f6e793c2f68323e0d0a3c2f6469763e0d0a3c64697620636c6173733d2261727469636c652d2d74657874206946514e384f5532206959776155723358223e0d0a3c703e576564c5827567204d535720556b7261696e7920706f2077797361647a656e6975207a61706f727920656c656b74726f776e692077c2a04e6f77656a204b6163686f776365c2a03c7374726f6e673e772073747265666965207a6167726fc5bc6f6e656a207a616c616e69656d3c2f7374726f6e673ec2a07a6e616a64756a65207369c49920636f206e616a6d6e69656a203130206d69656a73636f776fc59b6369206e612070726177796d2c207a6163686f646e696d2062727a65677520446e69657072752e2053c48520746f3a204d796b6fc582616a69776b612c204f6c6869776b612c204c6f776f2c2054696168796e6b612c20506f6e69617469776b612c204977616e69776b612c20546f6b617269776b612c20507279646e6970726f77736b69652c205361646f77652069c2a0637ac499c59b63696f776f206d696173746f2043686572736fc5842e3c2f703e0d0a3c2f6469763e0d0a3c6469763e0d0a3c64697620636c6173733d2261727469636c652d2d74657874206946514e384f5532206959776155723358223e0d0a3c703e4e6f7761204b6163686f776b6120706fc5826fc5bc6f6e61206a6573742077c2a06f646c6567c5826fc59b6369206f6b6fc5826f203730206b6d2e206f64c2a043686572736f6e69612e3c2f703e0d0a3c2f6469763e0d0a3c2f6469763e0d0a3c6469763e0d0a3c64697620636c6173733d2261727469636c652d2d74657874206946514e384f5532206959776155723358223e0d0a3c703e4a75c5bc2077c2a07061c5ba647a6965726e696b75207562696567c58265676f20726f6b75207072657a7964656e7420556b7261696e7920576fc5826f64796d7972205a65c582656e736b69206f7374727a656761c5822c20c5bc65206a65c59b6c69207369c5827920726f73796a736b69652070727a657277c485207a61706f72c4992077c2a0656c656b74726f776e6920776f646e656a2077c2a04e6f77656a204b6163686f7763652c20746f2077c2a073747265666965207a616c616e6961207a6e616a647a6965207369c49920706f6e6164203830206d69656a73636f776fc59b63692c2074796d206d696173746f2043686572736fc5842e3c2f703e0d0a3c2f6469763e0d0a3c2f6469763e223b733a363a22696d61676573223b733a3333343a227b22696d6167655f696e74726f223a22696d616765735c2f54616d612e77656270236a6f6f6d6c61496d6167653a5c2f5c2f6c6f63616c2d696d616765735c2f54616d612e776562703f77696474683d383030266865696768743d343930222c22696d6167655f696e74726f5f616c74223a2274616d61222c22666c6f61745f696e74726f223a22222c22696d6167655f696e74726f5f63617074696f6e223a22222c22696d6167655f66756c6c74657874223a22696d616765735c2f74616d61312e6a7067236a6f6f6d6c61496d6167653a5c2f5c2f6c6f63616c2d696d616765735c2f74616d61312e6a70673f77696474683d31323030266865696768743d363330222c22696d6167655f66756c6c746578745f616c74223a22222c22666c6f61745f66756c6c74657874223a22222c22696d6167655f66756c6c746578745f63617074696f6e223a22227d223b733a353a226361746964223b693a383b733a31303a22637265617465645f6279223b693a3538383b733a31363a22637265617465645f62795f616c696173223b733a303a22223b733a383a226d6f646966696564223b733a31393a22323032332d30362d30362030363a35343a3132223b733a31313a226d6f6469666965645f6279223b693a3538383b733a363a22706172616d73223b4f3a32343a224a6f6f6d6c615c52656769737472795c5265676973747279223a333a7b733a373a22002a0064617461223b4f3a383a22737464436c617373223a38363a7b733a31343a2261727469636c655f6c61796f7574223b733a393a225f3a64656661756c74223b733a31303a2273686f775f7469746c65223b733a313a2231223b733a31313a226c696e6b5f7469746c6573223b733a313a2231223b733a31303a2273686f775f696e74726f223b733a313a2231223b733a31393a22696e666f5f626c6f636b5f706f736974696f6e223b733a313a2230223b733a32313a22696e666f5f626c6f636b5f73686f775f7469746c65223b733a313a2231223b733a31333a2273686f775f63617465676f7279223b733a313a2231223b733a31333a226c696e6b5f63617465676f7279223b733a313a2231223b733a32303a2273686f775f706172656e745f63617465676f7279223b733a313a2230223b733a32303a226c696e6b5f706172656e745f63617465676f7279223b733a313a2230223b733a31373a2273686f775f6173736f63696174696f6e73223b733a313a2230223b733a353a22666c616773223b733a313a2231223b733a31313a2273686f775f617574686f72223b733a313a2231223b733a31313a226c696e6b5f617574686f72223b733a313a2230223b733a31363a2273686f775f6372656174655f64617465223b733a313a2230223b733a31363a2273686f775f6d6f646966795f64617465223b733a313a2230223b733a31373a2273686f775f7075626c6973685f64617465223b733a313a2231223b733a32303a2273686f775f6974656d5f6e617669676174696f6e223b733a313a2231223b733a31333a2273686f775f726561646d6f7265223b733a313a2231223b733a31393a2273686f775f726561646d6f72655f7469746c65223b733a313a2231223b733a31343a22726561646d6f72655f6c696d6974223b693a3130303b733a393a2273686f775f74616773223b733a313a2231223b733a31313a227265636f72645f68697473223b733a313a2231223b733a393a2273686f775f68697473223b733a313a2231223b733a31313a2273686f775f6e6f61757468223b733a313a2230223b733a31333a2275726c735f706f736974696f6e223b693a303b733a373a2263617074636861223b733a303a22223b733a32333a2273686f775f7075626c697368696e675f6f7074696f6e73223b733a313a2231223b733a32303a2273686f775f61727469636c655f6f7074696f6e73223b733a313a2231223b733a32373a2273686f775f636f6e6669677572655f656469745f6f7074696f6e73223b733a313a2231223b733a31363a2273686f775f7065726d697373696f6e73223b733a313a2231223b733a32323a2273686f775f6173736f63696174696f6e735f65646974223b733a313a2231223b733a31323a22736176655f686973746f7279223b733a313a2231223b733a31333a22686973746f72795f6c696d6974223b693a31303b733a32353a2273686f775f75726c735f696d616765735f66726f6e74656e64223b733a313a2230223b733a32343a2273686f775f75726c735f696d616765735f6261636b656e64223b733a313a2231223b733a373a2274617267657461223b693a303b733a373a2274617267657462223b693a303b733a373a2274617267657463223b693a303b733a31313a22666c6f61745f696e74726f223b733a343a226c656674223b733a31343a22666c6f61745f66756c6c74657874223b733a343a226c656674223b733a31353a2263617465676f72795f6c61796f7574223b733a363a225f3a626c6f67223b733a31393a2273686f775f63617465676f72795f7469746c65223b733a313a2230223b733a31363a2273686f775f6465736372697074696f6e223b733a313a2230223b733a32323a2273686f775f6465736372697074696f6e5f696d616765223b733a313a2230223b733a383a226d61784c6576656c223b733a313a2231223b733a32313a2273686f775f656d7074795f63617465676f72696573223b733a313a2230223b733a31363a2273686f775f6e6f5f61727469636c6573223b733a313a2231223b733a33323a2273686f775f63617465676f72795f68656164696e675f7469746c655f74657874223b733a313a2231223b733a31363a2273686f775f7375626361745f64657363223b733a313a2231223b733a32313a2273686f775f6361745f6e756d5f61727469636c6573223b733a313a2230223b733a31333a2273686f775f6361745f74616773223b733a313a2231223b733a32313a2273686f775f626173655f6465736372697074696f6e223b733a313a2231223b733a31313a226d61784c6576656c636174223b733a323a222d31223b733a32353a2273686f775f656d7074795f63617465676f726965735f636174223b733a313a2230223b733a32303a2273686f775f7375626361745f646573635f636174223b733a313a2231223b733a32353a2273686f775f6361745f6e756d5f61727469636c65735f636174223b733a313a2231223b733a32303a226e756d5f6c656164696e675f61727469636c6573223b693a313b733a31383a22626c6f675f636c6173735f6c656164696e67223b733a303a22223b733a31383a226e756d5f696e74726f5f61727469636c6573223b693a343b733a31303a22626c6f675f636c617373223b733a303a22223b733a31313a226e756d5f636f6c756d6e73223b693a313b733a31383a226d756c74695f636f6c756d6e5f6f72646572223b733a313a2230223b733a393a226e756d5f6c696e6b73223b693a343b733a32343a2273686f775f73756263617465676f72795f636f6e74656e74223b733a313a2230223b733a31363a226c696e6b5f696e74726f5f696d616765223b733a313a2230223b733a32313a2273686f775f706167696e6174696f6e5f6c696d6974223b733a313a2231223b733a31323a2266696c7465725f6669656c64223b733a343a2268696465223b733a31333a2273686f775f68656164696e6773223b733a313a2231223b733a31343a226c6973745f73686f775f64617465223b733a313a2230223b733a31313a22646174655f666f726d6174223b733a303a22223b733a31343a226c6973745f73686f775f68697473223b733a313a2231223b733a31363a226c6973745f73686f775f617574686f72223b733a313a2231223b733a31313a22646973706c61795f6e756d223b733a323a223130223b733a31313a226f7264657262795f707269223b733a353a226f72646572223b733a31313a226f7264657262795f736563223b733a353a227264617465223b733a31303a226f726465725f64617465223b733a393a227075626c6973686564223b733a31353a2273686f775f706167696e6174696f6e223b733a313a2232223b733a32333a2273686f775f706167696e6174696f6e5f726573756c7473223b733a313a2231223b733a31333a2273686f775f6665617475726564223b733a343a2273686f77223b733a31343a2273686f775f666565645f6c696e6b223b733a313a2231223b733a31323a22666565645f73756d6d617279223b733a313a2230223b733a31383a22666565645f73686f775f726561646d6f7265223b733a313a2230223b733a373a227365665f696473223b693a313b733a32303a22637573746f6d5f6669656c64735f656e61626c65223b733a313a2231223b733a31363a22776f726b666c6f775f656e61626c6564223b733a313a2230223b7d733a31343a22002a00696e697469616c697a6564223b623a313b733a31323a22002a00736570617261746f72223b733a313a222e223b7d733a373a226d6574616b6579223b733a303a22223b733a383a226d65746164657363223b733a303a22223b733a383a226d65746164617461223b4f3a32343a224a6f6f6d6c615c52656769737472795c5265676973747279223a333a7b733a373a22002a0064617461223b4f3a383a22737464436c617373223a333a7b733a363a22726f626f7473223b733a303a22223b733a363a22617574686f72223b733a303a22223b733a363a22726967687473223b733a303a22223b7d733a31343a22002a00696e697469616c697a6564223b623a313b733a31323a22002a00736570617261746f72223b733a313a222e223b7d733a373a2276657273696f6e223b693a323b733a383a226f72646572696e67223b693a303b733a383a2263617465676f7279223b733a353a22576f6a6e61223b733a393a226361745f7374617465223b693a313b733a31303a226361745f616363657373223b693a313b733a343a22736c7567223b733a32373a22313a726f736a616e69652d77797361647a696c692d7a61706f7265223b733a373a22636174736c7567223b733a373a22383a776f6a6e61223b733a363a22617574686f72223b733a363a224b6163706572223b733a363a226c61796f7574223b733a373a2261727469636c65223b733a373a22636f6e74657874223b733a31393a22636f6d5f636f6e74656e742e61727469636c65223b733a383a22696d61676555726c223b733a37343a22696d616765732f54616d612e77656270236a6f6f6d6c61496d6167653a2f2f6c6f63616c2d696d616765732f54616d612e776562703f77696474683d383030266865696768743d343930223b733a383a22696d616765416c74223b733a343a2274616d61223b733a31303a226d657461617574686f72223b4e3b7d693a343b4e3b693a353b613a353a7b693a313b613a333a7b693a303b733a353a227469746c65223b693a313b733a383a227375627469746c65223b693a323b733a323a226964223b7d693a323b613a323a7b693a303b733a373a2273756d6d617279223b693a313b733a343a22626f6479223b7d693a333b613a383a7b693a303b733a343a226d657461223b693a313b733a31303a226c6973745f7072696365223b693a323b733a31303a2273616c655f7072696365223b693a333b733a373a226d6574616b6579223b693a343b733a383a226d65746164657363223b693a353b733a31303a226d657461617574686f72223b693a363b733a363a22617574686f72223b693a373b733a31363a22637265617465645f62795f616c696173223b7d693a343b613a323a7b693a303b733a343a2270617468223b693a313b733a353a22616c696173223b7d693a353b613a313a7b693a303b733a383a22636f6d6d656e7473223b7d7d693a363b733a313a222a223b693a373b4e3b693a383b4e3b693a393b733a31393a22323032332d30362d30362030363a33373a3235223b693a31303b4e3b693a31313b733a38303a22696e6465782e7068703f6f7074696f6e3d636f6d5f636f6e74656e7426766965773d61727469636c652669643d313a726f736a616e69652d77797361647a696c692d7a61706f72652663617469643d38223b693a31323b4e3b693a31333b733a31393a22323032332d30362d30362030363a33373a3235223b693a31343b693a313b693a31353b613a343a7b733a343a2254797065223b613a313a7b693a303b4f3a383a22737464436c617373223a363a7b733a353a227469746c65223b733a373a2241727469636c65223b733a353a227374617465223b693a313b733a363a22616363657373223b693a313b733a383a226c616e6775616765223b733a303a22223b733a363a226e6573746564223b623a303b733a323a226964223b693a333b7d7d733a363a22417574686f72223b613a313a7b693a303b4f3a383a22737464436c617373223a363a7b733a353a227469746c65223b733a363a224b6163706572223b733a353a227374617465223b693a313b733a363a22616363657373223b693a313b733a383a226c616e6775616765223b733a303a22223b733a363a226e6573746564223b623a303b733a323a226964223b693a353b7d7d733a383a2243617465676f7279223b613a313a7b693a303b4f3a383a22737464436c617373223a363a7b733a353a227469746c65223b733a353a22576f6a6e61223b733a353a227374617465223b693a313b733a363a22616363657373223b693a313b733a383a226c616e6775616765223b733a313a222a223b733a363a226e6573746564223b623a313b733a323a226964223b693a31313b7d7d733a383a224c616e6775616765223b613a313a7b693a303b4f3a383a22737464436c617373223a363a7b733a353a227469746c65223b733a313a222a223b733a353a227374617465223b693a313b733a363a22616363657373223b693a313b733a383a226c616e6775616765223b733a303a22223b733a363a226e6573746564223b623a303b733a323a226964223b693a393b7d7d7d693a31363b733a32363a22526f736a616e69652077797361647a696c69207a61706f72c499223b693a31373b693a333b693a31383b733a34363a22696e6465782e7068703f6f7074696f6e3d636f6d5f636f6e74656e7426766965773d61727469636c652669643d31223b7d),
(2, 'index.php?option=com_content&view=category&id=8', 'index.php?option=com_content&view=category&id=8', 'Wojna', '', '2023-06-06 06:54:12', '957daf470ce6b3cdc635c58520d9e60e', 1, 1, 1, '*', NULL, NULL, '2023-06-06 06:54:12', NULL, 0, 0, 1, 0x4f3a35323a224a6f6f6d6c615c436f6d706f6e656e745c46696e6465725c41646d696e6973747261746f725c496e64657865725c526573756c74223a31393a7b693a303b693a313b693a313b733a353a22656e2d4742223b693a323b733a303a22223b693a333b613a31373a7b733a323a226964223b693a383b733a353a22616c696173223b733a353a22776f6a6e61223b733a393a22657874656e73696f6e223b733a31313a22636f6d5f636f6e74656e74223b733a373a226d6574616b6579223b733a303a22223b733a383a226d65746164657363223b733a303a22223b733a383a226d65746164617461223b4f3a32343a224a6f6f6d6c615c52656769737472795c5265676973747279223a333a7b733a373a22002a0064617461223b4f3a383a22737464436c617373223a303a7b7d733a31343a22002a00696e697469616c697a6564223b623a303b733a31323a22002a00736570617261746f72223b733a313a222e223b7d733a333a226c6674223b693a31313b733a393a22706172656e745f6964223b693a313b733a353a226c6576656c223b693a313b733a363a22706172616d73223b4f3a32343a224a6f6f6d6c615c52656769737472795c5265676973747279223a333a7b733a373a22002a0064617461223b4f3a383a22737464436c617373223a303a7b7d733a31343a22002a00696e697469616c697a6564223b623a303b733a31323a22002a00736570617261746f72223b733a313a222e223b7d733a373a2273756d6d617279223b4e3b733a31303a22637265617465645f6279223b693a3538383b733a383a226d6f646966696564223b733a31393a22323032332d30362d30362030363a35343a3132223b733a31313a226d6f6469666965645f6279223b693a3538383b733a343a22736c7567223b733a373a22383a776f6a6e61223b733a363a226c61796f7574223b733a383a2263617465676f7279223b733a31303a226d657461617574686f72223b4e3b7d693a343b4e3b693a353b613a353a7b693a313b613a333a7b693a303b733a353a227469746c65223b693a313b733a383a227375627469746c65223b693a323b733a323a226964223b7d693a323b613a323a7b693a303b733a373a2273756d6d617279223b693a313b733a343a22626f6479223b7d693a333b613a383a7b693a303b733a343a226d657461223b693a313b733a31303a226c6973745f7072696365223b693a323b733a31303a2273616c655f7072696365223b693a333b733a343a226c696e6b223b693a343b733a373a226d6574616b6579223b693a353b733a383a226d65746164657363223b693a363b733a31303a226d657461617574686f72223b693a373b733a363a22617574686f72223b7d693a343b613a323a7b693a303b733a343a2270617468223b693a313b733a353a22616c696173223b7d693a353b613a313a7b693a303b733a383a22636f6d6d656e7473223b7d7d693a363b733a313a222a223b693a373b4e3b693a383b4e3b693a393b4e3b693a31303b4e3b693a31313b733a34373a22696e6465782e7068703f6f7074696f6e3d636f6d5f636f6e74656e7426766965773d63617465676f72792669643d38223b693a31323b4e3b693a31333b733a31393a22323032332d30362d30362030363a35343a3132223b693a31343b693a313b693a31353b613a323a7b733a343a2254797065223b613a313a7b693a303b4f3a383a22737464436c617373223a363a7b733a353a227469746c65223b733a383a2243617465676f7279223b733a353a227374617465223b693a313b733a363a22616363657373223b693a313b733a383a226c616e6775616765223b733a303a22223b733a363a226e6573746564223b623a303b733a323a226964223b693a31303b7d7d733a383a224c616e6775616765223b613a313a7b693a303b4f3a383a22737464436c617373223a363a7b733a353a227469746c65223b733a313a222a223b733a353a227374617465223b693a313b733a363a22616363657373223b693a313b733a383a226c616e6775616765223b733a303a22223b733a363a226e6573746564223b623a303b733a323a226964223b693a393b7d7d7d693a31363b733a353a22576f6a6e61223b693a31373b693a313b693a31383b733a34373a22696e6465782e7068703f6f7074696f6e3d636f6d5f636f6e74656e7426766965773d63617465676f72792669643d38223b7d),
(3, 'index.php?option=com_content&view=article&id=2', 'index.php?option=com_content&view=article&id=2:sprzeczne-doniesienia-o-polakach-na-froncie&catid=8', 'Sprzeczne doniesienia o Polakach na froncie', ' Sprzeczne doniesienia o Polakach na froncie. \"Ukraina ma nóż na gardle\" - Moskwa wykorzystała to do lobbowania przekazów o \"krwawych Polakach\", \"mordercach cywili\", którzy rzekomo odpowiadają za śmierć rosyjskiej ludności - mówi dr Michał Marek w rozmowie z WP, odnosząc się do doniesień o tym, że Polacy mieli być wśród walczących w obwodzie biełgorodzkim. ', '2023-06-06 08:30:59', 'c3612e010d3742a94a75ebf99f0fbfce', 1, 1, 1, '*', '2023-06-06 08:30:59', NULL, '2023-06-06 08:30:59', NULL, 0, 0, 3, 0x4f3a35323a224a6f6f6d6c615c436f6d706f6e656e745c46696e6465725c41646d696e6973747261746f725c496e64657865725c526573756c74223a31393a7b693a303b693a313b693a313b733a353a22656e2d4742223b693a323b733a3337393a22205370727a65637a6e6520646f6e69657369656e6961206f20506f6c616b616368206e612066726f6e6369652e2022556b7261696e61206d61206ec3b3c5bc206e6120676172646c6522202d204d6f736b77612077796b6f727a79737461c5826120746f20646f206c6f62626f77616e69612070727a656b617ac3b377206f20226b7277617779636820506f6c616b616368222c20226d6f726465726361636820637977696c69222c206b74c3b3727a7920727a656b6f6d6f206f64706f77696164616ac485207a6120c59b6d696572c48720726f73796a736b69656a206c75646e6fc59b6369202d206dc3b37769206472204d69636861c582204d6172656b207720726f7a6d6f776965207a2057502c206f646e6f737ac48563207369c49920646f20646f6e6965736965c584206f2074796d2c20c5bc6520506f6c616379206d69656c69206279c4872077c59b72c3b3642077616c637ac485637963682077206f62776f647a696520626965c582676f726f647a6b696d2e20223b693a333b613a32373a7b733a323a226964223b693a323b733a353a22616c696173223b733a34333a227370727a65637a6e6520646f6e69657369656e6961206f20706f6c616b616368206e612066726f6e636965223b733a373a2273756d6d617279223b733a3437353a223c683120636c6173733d2261727469636c652d2d7469746c6520693178416d52765222207374796c653d22746578742d616c69676e3a2063656e7465723b2220646174612d726561637469643d22333139223e5370727a65637a6e6520646f6e69657369656e6961206f20506f6c616b616368206e612066726f6e6369652e2022556b7261696e61206d61206ec3b3c5bc206e6120676172646c65223c2f68313e0d0a3c703e2d204d6f736b77612077796b6f727a79737461c5826120746f20646f206c6f62626f77616e69612070727a656b617ac3b377206f20226b7277617779636820506f6c616b616368222c20226d6f726465726361636820637977696c69222c206b74c3b3727a7920727a656b6f6d6f206f64706f77696164616ac485207a6120c59b6d696572c48720726f73796a736b69656a206c75646e6fc59b6369202d206dc3b37769206472204d69636861c582204d6172656b207720726f7a6d6f776965207a2057502c206f646e6f737ac48563207369c49920646f20646f6e6965736965c584206f2074796d2c20c5bc6520506f6c616379206d69656c69206279c4872077c59b72c3b3642077616c637ac485637963682077206f62776f647a696520626965c582676f726f647a6b696d2e3c2f703e0d0a223b733a343a22626f6479223b733a363738313a220d0a3c703e3c696d67207374796c653d22646973706c61793a20626c6f636b3b206d617267696e2d6c6566743a206175746f3b206d617267696e2d72696768743a206175746f3b22207469746c653d2250727a656369776e69637920507574696e61207a204c6567696f6e7520576f6c6e6fc59bc48720526f736a6922207372633d22696d616765732f3132332e77656270236a6f6f6d6c61496d6167653a2f2f6c6f63616c2d696d616765732f3132332e776562703f77696474683d38303026616d703b6865696768743d3533332220616c743d22776f6a736b6f222077696474683d2238303022206865696768743d2235333322202f3e3c2f703e0d0a3c703e57206e6965647a69656cc4992072616e6f206e612074656c656772616d6f77796d206b616e616c6520506f6c736b6965676f204b6f7270757375204f63686f746e69637a65676f20706f6a617769c582207369c4992077706973206e612074656d617420616b636a692077c2a06f62776f647a696520626965c582676f726f647a6b696d2e202257737a79736379207a6164616ac485206e616d206a65646e6f20707974616e69652c20637a79206272616c69c59b6d792075647a6961c5822077c2a06f70657261636a69206e6120746572656e6965206f62776f647520626965c582676f726f647a6b6965676fe280a6c2a03c7374726f6e673e4f64706f77696564c5ba206a657374206a65646e6f7a6e61637a6e613a206f637a797769c59b6369652c20c5bc652074616b213c2f7374726f6e673e22202dc2a06d6fc5bc6e61206279c5826f2070727a65637a797461c487207765207770697369652e3c2f703e0d0a3c703e50727a79706f6d6e696a6d792c20c5bc65207369c5827920526f73796a736b6965676f204f63686f746e69637a65676f204b6f7270757375206f72617a204c6567696f6e752022576f6c6e6fc59bc48720526f736a69222c2077616c637ac48563652077c2a0776f6a6e696520706f207374726f6e696520556b7261696e792c2070727a6564206b696c6b6f6d6120646e69616d69c2a0776b726f637a79c58279206e6120746572656e206f62776f647520626965c582676f726f647a6b6965676f2077c2a0526f736a692e2057652077706973696520506f6c736b6965676f204b6f7270757375204f63686f746e69637a65676f20646f64616e6f2c20c5bc65206d69656c69206f6e6920627261c4872075647a6961c5822077c2a03c7374726f6e673e77797065c5826e69656e697520227a6164616e696120626f6a6f7765676f22207772617a207ac2a0526f73796a736b696d204b6f72707573656d204f63686f746e69637a796d3c2f7374726f6e673e2e3c2f703e0d0a3c64697620636c6173733d2261727469636c652d2d74657874206946514e384f55322069597761557233582220646174612d726561637469643d22333833223e0d0a3c6832207374796c653d22746578742d616c69676e3a2063656e7465723b2220646174612d726561637469643d22333834223e22446c61206e61737a65676f206f64647a6961c58275206279c58220746f207a61737a637a7974223c2f68323e0d0a3c2f6469763e0d0a3c64697620636c6173733d2261727469636c652d2d74657874206946514e384f55322069597761557233582220646174612d726561637469643d22333835223e0d0a3c703e22c581c485637ac485206e6173206e69652074796c6b6f207769c4997a7920627261746572737477612062726f6e692c20616c652074616bc5bc65206f736f62697374652070727a796a61c5ba6e69652069c2a06b6f6c65c5bc65c5847374776f22202dc2a07a617065776e696c6920706f6c736379206f63686f746e6963792e2044616c656a206e61706973616e6f3a20225720616b636a6920777a69c499c582612075647a6961c582207069657277737a6120677275706120737a7475726d6f7761204b6f72707573752ec2a03c7374726f6e673e57737a79736379207772c3b363696c69207ac2a07a6164616e69612063616c692069c2a07a64726f77693c2f7374726f6e673e2e2057797a6e61637a6f6e65207a6164616e69652077796b6f6e616e6f20706f6d79c59b6c6e69652e204d6fc5bc656d792077736b617a61c4872c20c5bc65206a616b6f20706965727773692c2072617a656d207ac2a06a65646ec485207ac2a06772757020626f6a6f777963682052444b2c20646f7461726c69c59b6d7920646f206d69656a7363612070727a657a6e61637a656e69612e20446c61206e61737a65676f206f64647a6961c58275206279c58220746f207a61737a637a79742075637a6573746e69637a79c4872077c2a07465676f2074797075206f70657261636a692c2063686fc4876279207a6520777a676cc4996475206e6120686973746f7279637a6e65207a6e61637a656e6965207465676f207479707520647a6961c58261c584222e3c2f703e0d0a3c64697620646174612d726561637469643d22333932223e0d0a3c64697620636c6173733d2261727469636c652d2d74657874206946514e384f55322069597761557233582220646174612d726561637469643d22333933223e0d0a3c703e446c61637a65676f2074616b696520696e666f726d61636a6520706f6a617769c58279207369c499207ac2a06f70c3b3c5ba6e69656e69656d3f204175746f727a79207770697375206e61706973616c692c20c5bc65207a6f737461c58279206f6e65c2a03c7374726f6e673e63656c6f776f206f7075626c696b6f77616e6520746572617a207a6520777a676cc49964c3b3772062657a706965637a65c584737477613c2f7374726f6e673e2e3c2f703e0d0a3c2f6469763e0d0a3c2f6469763e0d0a3c64697620646174612d726561637469643d22333934223e0d0a3c64697620636c6173733d2261727469636c652d2d74657874206946514e384f55322069597761557233582220646174612d726561637469643d22333935223e0d0a3c703e506f207065776e796d20637a61736965207770697379207a6e696b6ec499c58279207ac2a06b616e61c58275206e612054656c656772616d69652e20506f6a617769c5826f207369c499206e61746f6d69617374c2a03c7374726f6e673e6f6669636a616c6e65206fc59b77696164637a656e69652077c2a074656a207370726177696520526f73796a736b6965676f204b6f7270757375204f63686f746e69637a65676f3c2f7374726f6e673e2e204e61706973616e6f2077c2a06e696d3a20224e61736920746f7761727a79737a652062726f6e69207ac2a0506f6c736b6965676f204b6f7270757375204f63686f746e69637a65676f20727a65637a797769c59b6369652077616c637ac4852072616d69c4992077c2a072616d69c499207ac2a06e616d69206fc2a0776f6c6e6fc59bc4872069c2a06e6965706f646c6567c5826fc59bc48720556b7261696e79206f64207769656c75206d69657369c49963792e20577370c3b36c6e69652070727a6570726f7761647a696c69c59b6d79206a75c5bc20737a65726567206f70657261636a692077c2a072656a6f6e616368c2a03c7374726f6e673e6f726563686f77736b696d2c207a61706f726f736b696d2069c2a0626163686d75636b696d3c2f7374726f6e673e2e204368c5826f7063792073706973616c69207369c499207a6e616b6f6d696369652069c2a077796b617a616c69207369c499207779736f6b696d20706f7a696f6d656d206d6f74797761636a692069c2a07779737a6b6f6c656e6961222e3c2f703e0d0a3c64697620636c6173733d2261727469636c652d2d74657874206946514e384f55322069597761557233582220646174612d726561637469643d22343036223e0d0a3c6832207374796c653d22746578742d616c69676e3a2063656e7465723b2220646174612d726561637469643d22343037223ec5bb6172796e3a206272616b20706f7769c4857a616e6961207a205369c582616d69205a62726f6a6e796d692052503c2f68323e0d0a3c2f6469763e0d0a3c64697620636c6173733d2261727469636c652d2d74657874206946514e384f55322069597761557233582220646174612d726561637469643d22343038223e0d0a3c703e426172647a6f20737a79626b6f2070727a79737ac5826f2064656d656e7469207a65207374726f6e20706f6c736b6963682077c58261647a2e20224f7069737977616e792077c2a06d65646961636820506f6c736b69204b6f72707573204f63686f746e69637a79206e6965206a6573742077c2a0c5bc6164656e2073706f73c3b36220706f7769c4857a616e79207ac2a05369c582616d69205a62726f6a6e796d6920525020616e6920c5bc61646ec48520696e7374797475636ac4852052502ec2a03c7374726f6e673e447a6961c58261c58420706f6c736b696368206f63686f746e696bc3b37720777370696572616ac4856379636820556b7261696ec4992077c2a077616c6365207ac2a0526f736ac485206e6965206e616c65c5bc792075746fc5bc73616d6961c487207ac2a077c58261647a616d692052503c2f7374726f6e673e22202dc2a06e6170697361c582206e6120547769747465727a65205374616e6973c582617720c5bb6172796e2c2073656b72657461727a207374616e752077c2a04b50524d2c207a617374c499706361206d696e6973747261206b6f6f7264796e61746f72612073c58275c5bc6220737065636a616c6e7963682c207065c5826e6f6d6f636e696b20727ac48564752064732e2062657a706965637a65c584737477612070727a657374727a656e6920696e666f726d6163796a6e656a20527a65637a79706f73706f6c6974656a20506f6c736b69656a2e3c2f703e0d0a3c64697620636c6173733d2261727469636c652d2d74657874206946514e384f55322069597761557233582220646174612d726561637469643d22343137223e0d0a3c6832207374796c653d22746578742d616c69676e3a2063656e7465723b2220646174612d726561637469643d22343138223e224b61c5bc64792077616c637a79206f2073776f6a65223c2f68323e0d0a3c2f6469763e0d0a3c64697620636c6173733d2261727469636c652d2d74657874206946514e384f55322069597761557233582220646174612d726561637469643d22343139223e0d0a3c703e2d20506f6463686f647a69c58262796d20646f207465676f207ac2a06475c5bcc4852072657a657277c485202dc2a06dc3b37769204d616369656a204d6174797369616b2c207075c5826b6f776e696b2072657a657277792c20656b73706572742066756e6461636a69205374726174706f696e74732c206279c58279207a617374c49970636120737a656661c2a03c6120636c6173733d2273656f6c696e6b65722220687265663d2268747470733a2f2f776961646f6d6f7363692e77702e706c2f736b772d736c757a62612d6b6f6e7472777977696164752d776f6a736b6f7765676f2d3631373237353634343439313939333763222072656c3d226e6f6f70656e6572206e6f72656665727265722073656f6c696e6b223e53c58275c5bc6279204b6f6e74727779776961647520576f6a736b6f7765676f3c2f613e2c2077c2a0726f7a6d6f776965207ac2a05769727475616c6ec48520506f6c736bc4852e3c2f703e0d0a3c703e49207a617a6e61637a612c20c5bc6520746f2077737a7973746b6f206d61206e612063656c752070727a656369c48567616e6965206c696e792e202dc2a04e69652077796b6c75637a616d2c20c5bc65206d6f67c485206279c4872074616b6965207472656e647920706f207374726f6e696520756b726169c584736b69656a202dc2a0696e737069726f77616e652070727a657a20526f736a616e2c20616c652069c2a073616d6920556b726169c5846379206d6f676c69206fc2a074796d20706f6d79c59b6c65c487202dc2a0627920706f7079636861c4872074726f6368c499206b72616a65204e41544f2c20627920737461c58279207369c49920637ac499c59b6369c485206b6f6e666c696b74752ec2a03c7374726f6e673e556b7261696e61206d612c2062657a7370727a65637a6e69652c206ec3b3c5bc206e6120676172646c653c2f7374726f6e673ec2a02dc2a0646f64616a652e3c2f703e0d0a3c703e2dc2a03c7374726f6e673e53706f776f646f77616e69652070727a657a20556b7261696ec499207379747561636a692c2077c2a06b74c3b372656a20536f6a75737a2077737a6564c582627920616b7479776e69652077c2a06b6f6e666c696b742c207769656c6520627920696d20726f7a7769c4857a61c5826f2ec2a03c2f7374726f6e673e446c6120526f736a616e206e696577796b6c75637a6f6e652c20c5bc652074656e207363656e61726975737a206279c582627920626172647a6f206b6f727a7973746e792c2074616bc5bc652070726f706167616e646f776f2e20507974616e6965206fc2a0746f2c20636f206b746f2074616b206e617072617764c49920726f7a6772797761202dc2a07a617a6e61637a6120726f7a6dc3b37763612057502e3c2f703e0d0a3c64697620636c6173733d2261727469636c652d2d74657874206946514e384f55322069597761557233582220646174612d726561637469643d22343430223e0d0a3c6832207374796c653d22746578742d616c69676e3a2063656e7465723b2220646174612d726561637469643d22343431223e224c6f62626f77616e69652070727a656b617ac3b377206f20276b7277617779636820506f6c616b61636827223c2f68323e0d0a3c2f6469763e0d0a3c64697620636c6173733d2261727469636c652d2d74657874206946514e384f55322069597761557233582220646174612d726561637469643d22343432223e0d0a3c703e4472204d69636861c582204d6172656b2c206175746f72206d6f6e6f67726166696920224f70657261636a6120556b7261696e61222069c2a0656b73706572742077c2a0647a6965647a696e69652064657a696e666f726d61636a692c2077c2a0726f7a6d6f776965207ac2a05769727475616c6ec48520506f6c736bc48520706f646b7265c59b6c612c20c5bc652022726f73796a736b696520647a6961c582616e69652064657a696e666f726d6163796a6e652c20646f7479637ac4856365206f6265636e6fc59b6369206f6279776174656c69205250206e6120746572656e6965206f62776f647520626965c582676f726f647a6b6965676f2c207370726f7761647a69c58279207369c49920646f20777a6d61636e69616e6961206e6567617479776e796368206f64637a75c48720526f736a616e20777a676cc49964656d20506f6c736b692069c2a0506f6c616bc3b377222e3c2f703e0d0a3c703e2d204d6f736b77612077796b6f727a79737461c582612064616ec485206b7765737469c49920646f206c6f62626f77616e69612070727a656b617ac3b377206fc2a0226b7277617779636820506f6c616b616368222c20226d6f726465726361636820637977696c69222c206b74c3b3727a793c7374726f6e673ec2a0727a656b6f6d6f206f64706f77696164616ac485207a6120c59b6d696572c48720726f73796a736b69656a206c75646e6fc59b6369c2a03c2f7374726f6e673e2d206dc3b377692e2049c2a0646f64616a652c20c5bc6520646f70726f7761647a69c582612074616bc5bc652073776f696368206f6279776174656c692022646f207374616e752c2077c2a06b74c3b372796d2073c485206f6e6920736bc5826f6e6e692075776965727a79c4872c2069c5bc20506f6c616379207a616a6d756ac485207369c499206e612066726f6e636965206d2e696e2e206f6263696e616e69656d2067c582c3b37720726f73796a736b696d206a65c584636f6d222e3c2f703e0d0a3c64697620646174612d726561637469643d22343630223e0d0a3c64697620636c6173733d2261727469636c652d2d74657874206946514e384f55322069597761557233582220646174612d726561637469643d22343631223e0d0a3c6832207374796c653d22746578742d616c69676e3a2063656e7465723b2220646174612d726561637469643d22343632223e526f736a616e69652062c49964c48520746f2077796b6f727a797374797761c4873c2f68323e0d0a3c2f6469763e0d0a3c64697620636c6173733d2261727469636c652d2d74657874206946514e384f55322069597761557233582220646174612d726561637469643d22343633223e0d0a3c703e4472204d69636861c582204d6172656b20706f646b7265c59b6c612c20c5bc65202270726f726f73796a7363792070726f706167616e6479c59b636920647a6961c582616ac48563792077c2a0706f6c736b69656a20696e666f736665727a652072657a6f6e6f77616c69206d2e696e2e20726f73796a736b6965206b6f6d656e7461727a6520646f7479637ac4856365206d6fc5bc6c69776fc59b63692070727a656b726f637a656e6961206772616e696379207ac2a0506f6c736bc4852070727a657a2067727570c49920637a65637a65c584736b69636820c5bc6fc5826e6965727a792028706f646c6567c582796368205369c5826f6d205a62726f6a6e796d20466564657261636a6920526f73796a736b69656a29222e3c2f703e0d0a3c2f6469763e0d0a3c2f6469763e0d0a3c64697620646174612d726561637469643d22343634223e0d0a3c64697620636c6173733d2261727469636c652d2d74657874206946514e384f55322069597761557233582220646174612d726561637469643d22343635223e0d0a3c703e2d2057c2a064616e796d206b6f6e74656bc59b63696520776172746f20706f646b7265c59b6c69c4872c2069c5bc20526f736a616e69652062c49964c4852077796b6f727a797374797761c4872070727a79737ac5826520706f646f626e652077796461727a656e69612cc2a03c7374726f6e673e6162792070727a656b6f6e797761c48720506f6c616bc3b3772c2069c5bc2077737061726369652075647a69656c616e652070727a657a20576172737a6177c499204b696a6f776f7769207370726f7761647a61206e6120506f6c616bc3b377207769646d6f20776f6a6e79c2a03c2f7374726f6e673e2d206f7374727a65676120656b73706572742e3c2f703e0d0a3c2f6469763e0d0a3c2f6469763e0d0a3c2f6469763e0d0a3c2f6469763e0d0a3c2f6469763e0d0a3c2f6469763e0d0a3c2f6469763e0d0a3c2f6469763e223b733a363a22696d61676573223b733a3333343a227b22696d6167655f696e74726f223a22696d616765735c2f313233342e77656270236a6f6f6d6c61496d6167653a5c2f5c2f6c6f63616c2d696d616765735c2f313233342e776562703f77696474683d31323030266865696768743d383030222c22696d6167655f696e74726f5f616c74223a22222c22666c6f61745f696e74726f223a22222c22696d6167655f696e74726f5f63617074696f6e223a22222c22696d6167655f66756c6c74657874223a22696d616765735c2f3534363435362e6a7067236a6f6f6d6c61496d6167653a5c2f5c2f6c6f63616c2d696d616765735c2f3534363435362e6a70673f77696474683d34333030266865696768743d32383637222c22696d6167655f66756c6c746578745f616c74223a22222c22666c6f61745f66756c6c74657874223a22222c22696d6167655f66756c6c746578745f63617074696f6e223a22227d223b733a353a226361746964223b693a383b733a31303a22637265617465645f6279223b693a3538383b733a31363a22637265617465645f62795f616c696173223b733a303a22223b733a383a226d6f646966696564223b733a31393a22323032332d30362d30362030383a33303a3539223b733a31313a226d6f6469666965645f6279223b693a3538383b733a363a22706172616d73223b4f3a32343a224a6f6f6d6c615c52656769737472795c5265676973747279223a333a7b733a373a22002a0064617461223b4f3a383a22737464436c617373223a38363a7b733a31343a2261727469636c655f6c61796f7574223b733a393a225f3a64656661756c74223b733a31303a2273686f775f7469746c65223b733a313a2231223b733a31313a226c696e6b5f7469746c6573223b733a313a2231223b733a31303a2273686f775f696e74726f223b733a313a2231223b733a31393a22696e666f5f626c6f636b5f706f736974696f6e223b733a313a2230223b733a32313a22696e666f5f626c6f636b5f73686f775f7469746c65223b733a313a2231223b733a31333a2273686f775f63617465676f7279223b733a313a2231223b733a31333a226c696e6b5f63617465676f7279223b733a313a2231223b733a32303a2273686f775f706172656e745f63617465676f7279223b733a313a2230223b733a32303a226c696e6b5f706172656e745f63617465676f7279223b733a313a2230223b733a31373a2273686f775f6173736f63696174696f6e73223b733a313a2230223b733a353a22666c616773223b733a313a2231223b733a31313a2273686f775f617574686f72223b733a313a2231223b733a31313a226c696e6b5f617574686f72223b733a313a2230223b733a31363a2273686f775f6372656174655f64617465223b733a313a2230223b733a31363a2273686f775f6d6f646966795f64617465223b733a313a2230223b733a31373a2273686f775f7075626c6973685f64617465223b733a313a2231223b733a32303a2273686f775f6974656d5f6e617669676174696f6e223b733a313a2231223b733a31333a2273686f775f726561646d6f7265223b733a313a2231223b733a31393a2273686f775f726561646d6f72655f7469746c65223b733a313a2231223b733a31343a22726561646d6f72655f6c696d6974223b693a3130303b733a393a2273686f775f74616773223b733a313a2231223b733a31313a227265636f72645f68697473223b733a313a2231223b733a393a2273686f775f68697473223b733a313a2231223b733a31313a2273686f775f6e6f61757468223b733a313a2230223b733a31333a2275726c735f706f736974696f6e223b693a303b733a373a2263617074636861223b733a303a22223b733a32333a2273686f775f7075626c697368696e675f6f7074696f6e73223b733a313a2231223b733a32303a2273686f775f61727469636c655f6f7074696f6e73223b733a313a2231223b733a32373a2273686f775f636f6e6669677572655f656469745f6f7074696f6e73223b733a313a2231223b733a31363a2273686f775f7065726d697373696f6e73223b733a313a2231223b733a32323a2273686f775f6173736f63696174696f6e735f65646974223b733a313a2231223b733a31323a22736176655f686973746f7279223b733a313a2231223b733a31333a22686973746f72795f6c696d6974223b693a31303b733a32353a2273686f775f75726c735f696d616765735f66726f6e74656e64223b733a313a2230223b733a32343a2273686f775f75726c735f696d616765735f6261636b656e64223b733a313a2231223b733a373a2274617267657461223b693a303b733a373a2274617267657462223b693a303b733a373a2274617267657463223b693a303b733a31313a22666c6f61745f696e74726f223b733a343a226c656674223b733a31343a22666c6f61745f66756c6c74657874223b733a343a226c656674223b733a31353a2263617465676f72795f6c61796f7574223b733a363a225f3a626c6f67223b733a31393a2273686f775f63617465676f72795f7469746c65223b733a313a2230223b733a31363a2273686f775f6465736372697074696f6e223b733a313a2230223b733a32323a2273686f775f6465736372697074696f6e5f696d616765223b733a313a2230223b733a383a226d61784c6576656c223b733a313a2231223b733a32313a2273686f775f656d7074795f63617465676f72696573223b733a313a2230223b733a31363a2273686f775f6e6f5f61727469636c6573223b733a313a2231223b733a33323a2273686f775f63617465676f72795f68656164696e675f7469746c655f74657874223b733a313a2231223b733a31363a2273686f775f7375626361745f64657363223b733a313a2231223b733a32313a2273686f775f6361745f6e756d5f61727469636c6573223b733a313a2230223b733a31333a2273686f775f6361745f74616773223b733a313a2231223b733a32313a2273686f775f626173655f6465736372697074696f6e223b733a313a2231223b733a31313a226d61784c6576656c636174223b733a323a222d31223b733a32353a2273686f775f656d7074795f63617465676f726965735f636174223b733a313a2230223b733a32303a2273686f775f7375626361745f646573635f636174223b733a313a2231223b733a32353a2273686f775f6361745f6e756d5f61727469636c65735f636174223b733a313a2231223b733a32303a226e756d5f6c656164696e675f61727469636c6573223b693a313b733a31383a22626c6f675f636c6173735f6c656164696e67223b733a303a22223b733a31383a226e756d5f696e74726f5f61727469636c6573223b693a343b733a31303a22626c6f675f636c617373223b733a303a22223b733a31313a226e756d5f636f6c756d6e73223b693a313b733a31383a226d756c74695f636f6c756d6e5f6f72646572223b733a313a2230223b733a393a226e756d5f6c696e6b73223b693a343b733a32343a2273686f775f73756263617465676f72795f636f6e74656e74223b733a313a2230223b733a31363a226c696e6b5f696e74726f5f696d616765223b733a313a2230223b733a32313a2273686f775f706167696e6174696f6e5f6c696d6974223b733a313a2231223b733a31323a2266696c7465725f6669656c64223b733a343a2268696465223b733a31333a2273686f775f68656164696e6773223b733a313a2231223b733a31343a226c6973745f73686f775f64617465223b733a313a2230223b733a31313a22646174655f666f726d6174223b733a303a22223b733a31343a226c6973745f73686f775f68697473223b733a313a2231223b733a31363a226c6973745f73686f775f617574686f72223b733a313a2231223b733a31313a22646973706c61795f6e756d223b733a323a223130223b733a31313a226f7264657262795f707269223b733a353a226f72646572223b733a31313a226f7264657262795f736563223b733a353a227264617465223b733a31303a226f726465725f64617465223b733a393a227075626c6973686564223b733a31353a2273686f775f706167696e6174696f6e223b733a313a2232223b733a32333a2273686f775f706167696e6174696f6e5f726573756c7473223b733a313a2231223b733a31333a2273686f775f6665617475726564223b733a343a2273686f77223b733a31343a2273686f775f666565645f6c696e6b223b733a313a2231223b733a31323a22666565645f73756d6d617279223b733a313a2230223b733a31383a22666565645f73686f775f726561646d6f7265223b733a313a2230223b733a373a227365665f696473223b693a313b733a32303a22637573746f6d5f6669656c64735f656e61626c65223b733a313a2231223b733a31363a22776f726b666c6f775f656e61626c6564223b733a313a2230223b7d733a31343a22002a00696e697469616c697a6564223b623a313b733a31323a22002a00736570617261746f72223b733a313a222e223b7d733a373a226d6574616b6579223b733a303a22223b733a383a226d65746164657363223b733a303a22223b733a383a226d65746164617461223b4f3a32343a224a6f6f6d6c615c52656769737472795c5265676973747279223a333a7b733a373a22002a0064617461223b4f3a383a22737464436c617373223a333a7b733a363a22726f626f7473223b733a303a22223b733a363a22617574686f72223b733a303a22223b733a363a22726967687473223b733a303a22223b7d733a31343a22002a00696e697469616c697a6564223b623a313b733a31323a22002a00736570617261746f72223b733a313a222e223b7d733a373a2276657273696f6e223b693a313b733a383a226f72646572696e67223b693a303b733a383a2263617465676f7279223b733a353a22576f6a6e61223b733a393a226361745f7374617465223b693a313b733a31303a226361745f616363657373223b693a313b733a343a22736c7567223b733a34353a22323a7370727a65637a6e652d646f6e69657369656e69612d6f2d706f6c616b6163682d6e612d66726f6e636965223b733a373a22636174736c7567223b733a373a22383a776f6a6e61223b733a363a22617574686f72223b733a363a224b6163706572223b733a363a226c61796f7574223b733a373a2261727469636c65223b733a373a22636f6e74657874223b733a31393a22636f6d5f636f6e74656e742e61727469636c65223b733a383a22696d61676555726c223b733a37353a22696d616765732f313233342e77656270236a6f6f6d6c61496d6167653a2f2f6c6f63616c2d696d616765732f313233342e776562703f77696474683d31323030266865696768743d383030223b733a383a22696d616765416c74223b733a303a22223b733a31303a226d657461617574686f72223b4e3b7d693a343b4e3b693a353b613a353a7b693a313b613a333a7b693a303b733a353a227469746c65223b693a313b733a383a227375627469746c65223b693a323b733a323a226964223b7d693a323b613a323a7b693a303b733a373a2273756d6d617279223b693a313b733a343a22626f6479223b7d693a333b613a383a7b693a303b733a343a226d657461223b693a313b733a31303a226c6973745f7072696365223b693a323b733a31303a2273616c655f7072696365223b693a333b733a373a226d6574616b6579223b693a343b733a383a226d65746164657363223b693a353b733a31303a226d657461617574686f72223b693a363b733a363a22617574686f72223b693a373b733a31363a22637265617465645f62795f616c696173223b7d693a343b613a323a7b693a303b733a343a2270617468223b693a313b733a353a22616c696173223b7d693a353b613a313a7b693a303b733a383a22636f6d6d656e7473223b7d7d693a363b733a313a222a223b693a373b4e3b693a383b4e3b693a393b733a31393a22323032332d30362d30362030383a33303a3539223b693a31303b4e3b693a31313b733a39383a22696e6465782e7068703f6f7074696f6e3d636f6d5f636f6e74656e7426766965773d61727469636c652669643d323a7370727a65637a6e652d646f6e69657369656e69612d6f2d706f6c616b6163682d6e612d66726f6e6369652663617469643d38223b693a31323b4e3b693a31333b733a31393a22323032332d30362d30362030383a33303a3539223b693a31343b693a313b693a31353b613a343a7b733a343a2254797065223b613a313a7b693a303b4f3a383a22737464436c617373223a363a7b733a353a227469746c65223b733a373a2241727469636c65223b733a353a227374617465223b693a313b733a363a22616363657373223b693a313b733a383a226c616e6775616765223b733a303a22223b733a363a226e6573746564223b623a303b733a323a226964223b693a333b7d7d733a363a22417574686f72223b613a313a7b693a303b4f3a383a22737464436c617373223a363a7b733a353a227469746c65223b733a363a224b6163706572223b733a353a227374617465223b693a313b733a363a22616363657373223b693a313b733a383a226c616e6775616765223b733a303a22223b733a363a226e6573746564223b623a303b733a323a226964223b693a353b7d7d733a383a2243617465676f7279223b613a313a7b693a303b4f3a383a22737464436c617373223a363a7b733a353a227469746c65223b733a353a22576f6a6e61223b733a353a227374617465223b693a313b733a363a22616363657373223b693a313b733a383a226c616e6775616765223b733a313a222a223b733a363a226e6573746564223b623a313b733a323a226964223b693a31313b7d7d733a383a224c616e6775616765223b613a313a7b693a303b4f3a383a22737464436c617373223a363a7b733a353a227469746c65223b733a313a222a223b733a353a227374617465223b693a313b733a363a22616363657373223b693a313b733a383a226c616e6775616765223b733a303a22223b733a363a226e6573746564223b623a303b733a323a226964223b693a393b7d7d7d693a31363b733a34333a225370727a65637a6e6520646f6e69657369656e6961206f20506f6c616b616368206e612066726f6e636965223b693a31373b693a333b693a31383b733a34363a22696e6465782e7068703f6f7074696f6e3d636f6d5f636f6e74656e7426766965773d61727469636c652669643d32223b7d);
INSERT INTO `buf3w_finder_links` (`link_id`, `url`, `route`, `title`, `description`, `indexdate`, `md5sum`, `published`, `state`, `access`, `language`, `publish_start_date`, `publish_end_date`, `start_date`, `end_date`, `list_price`, `sale_price`, `type_id`, `object`) VALUES
(4, 'index.php?option=com_content&view=article&id=3', 'index.php?option=com_content&view=article&id=3:ostrze-ukrainskiej-wloczni&catid=8', 'Ostrze ukraińskiej włóczni', ' \"Ostrze ukraińskiej włóczni\". Oni mają przełamać Rosjan Wyszkolone przez NATO jednostki armii Ukrainy dysponują nie tylko wiedzą i praktycznymi umiejętnościami, ale również zachodnią technologią. To te elitarne szeregi będą stanowiły największy potencjał w kontrofensywie Ukrainy. Żołnierze i żołnierki 47 Oddzielnej Brygady Zmechanizowanej są gotowi na sygnał do działania. ', '2023-06-06 09:19:59', 'b249d314aa3de385cf1a4526f20356d3', 1, 1, 1, '*', '2023-06-06 09:19:59', NULL, '2023-06-06 09:19:59', NULL, 0, 0, 3, 0x4f3a35323a224a6f6f6d6c615c436f6d706f6e656e745c46696e6465725c41646d696e6973747261746f725c496e64657865725c526573756c74223a31393a7b693a303b693a313b693a313b733a353a22656e2d4742223b693a323b733a3430323a2220224f7374727a6520756b726169c584736b69656a2077c582c3b3637a6e69222e204f6e69206d616ac4852070727a65c582616d61c48720526f736a616e205779737a6b6f6c6f6e652070727a657a204e41544f206a65646e6f73746b692061726d696920556b7261696e7920647973706f6e756ac485206e69652074796c6b6f20776965647ac4852069207072616b7479637a6e796d6920756d69656ac499746e6fc59b6369616d692c20616c652072c3b3776e6965c5bc207a6163686f646e69c48520746563686e6f6c6f6769c4852e20546f20746520656c697461726e6520737a65726567692062c49964c485207374616e6f7769c58279206e616a7769c4996b737a7920706f74656e636a61c5822077206b6f6e74726f66656e737977696520556b7261696e792e20c5bb6fc5826e6965727a65206920c5bc6fc5826e6965726b69203437204f64647a69656c6e656a2042727967616479205a6d656368616e697a6f77616e656a2073c48520676f746f7769206e61207379676e61c58220646f20647a6961c582616e69612e20223b693a333b613a32373a7b733a323a226964223b693a333b733a353a22616c696173223b733a32363a226f7374727a6520756b7261696e736b69656a20776c6f637a6e69223b733a373a2273756d6d617279223b733a3437393a223c683120636c6173733d2261727469636c652d2d7469746c6520693178416d52765222207374796c653d22746578742d616c69676e3a2063656e7465723b223e224f7374727a6520756b726169c584736b69656a2077c582c3b3637a6e69222e204f6e69206d616ac4852070727a65c582616d61c48720526f736a616e3c2f68313e0d0a3c703e5779737a6b6f6c6f6e652070727a657a204e41544f206a65646e6f73746b692061726d696920556b7261696e7920647973706f6e756ac485206e69652074796c6b6f20776965647ac4852069207072616b7479637a6e796d6920756d69656ac499746e6fc59b6369616d692c20616c652072c3b3776e6965c5bc207a6163686f646e69c48520746563686e6f6c6f6769c4852e20546f20746520656c697461726e6520737a65726567692062c49964c485207374616e6f7769c58279206e616a7769c4996b737a7920706f74656e636a61c5822077206b6f6e74726f66656e737977696520556b7261696e792e20c5bb6fc5826e6965727a65206920c5bc6fc5826e6965726b69203437204f64647a69656c6e656a2042727967616479205a6d656368616e697a6f77616e656a2073c48520676f746f7769206e61207379676e61c58220646f20647a6961c582616e69612e3c2f703e0d0a223b733a343a22626f6479223b733a323838303a220d0a3c703e3c696d67207372633d22696d616765732f3534363435362e6a7067236a6f6f6d6c61496d6167653a2f2f6c6f63616c2d696d616765732f3534363435362e6a70673f77696474683d3433303026616d703b6865696768743d32383637222077696474683d2237383822206865696768743d2235323522202f3e3c6272202f3e3c6272202f3e3c7370616e207374796c653d22666f6e742d73697a653a203172656d3b223e57616c6bc49920706f70726f7761647ac485206272796761647920757a62726f6a6f6e65206e69652074796c6b6f2077207a6163686f646e69c4852062726fc5842c20616c652074616bc5bc652077207a6163686f646e6965206b6e6f772d686f772c207a656272616e6520706f64637a6173206d69657369c499637920737a6b6f6c65c584206d616ac48563796368206e612063656c752070727a656b737a7461c58263656e696520756b726169c584736b69656a2061726d69692077206e6f776f637a65736ec485207369c582c4992c207779737a6b6f6c6f6ec4852077206e616a626172647a69656a207a616177616e736f77616e7963682074616b74796b61636820776f6a656e6e796368204e41544f202e3c2f7370616e3e3c2f703e0d0a3c703e3c7370616e207374796c653d22666f6e742d73697a653a203172656d3b223e4a616b206f706973756a6520225468652057617368696e67746f6e20506f7374222c20706f64637a61732067647920726567756c61726e612061726d696120556b7261696e792077616c637a79c58261207a206f6b7570616e74656d206e61207769656c752066726f6e746163682c2034372e204f64647a69656c6e612042727967616461205a6d656368616e697a6f77616e612070727a79676f746f77797761c58261207369c49920646f206e617374c499706e656a2066617a7920776f6a6e7920772062617a6965204e41544f2077204e69656d637a6563682e3c6272202f3e3c2f7370616e3e3c2f703e0d0a3c6469763e0d0a3c64697620636c6173733d2261727469636c652d2d74657874206946514e384f5532206959776155723358223e0d0a3c703e446f77c3b3647a74776f206272796761647920737a6b6f6c69c5826f207369c4992077c2a0707261636f776e69616368206b6f6d70757465726f777963682c2067647a6965206e6120656b72616e616368206d6fc5bc6e61206279c5826f20616e616c697a6f7761c487207374726174656769637a6e6520706f73756e69c4996369612069c2a0726f7a7761c5bc61c48720646563797a6a652c206b74c3b372652070727a7963686f647a6920696d2074616bc5bc6520706f64656a6d6f7761c4872077c2a07265616c6e796d20c5bc79636975206e6120776f6a6e69652e205a617374c49970636120646f77c3b3646379206d616a6f72204977616e20537a616c616d6168612069c2a0696e6e6920776f6a736b6f7769206b6f727a797374616c69207ac2a070726f6772616dc3b3772c206b74c3b372652070727a79706f6d696e61c582792067727920776f6a656e6e652e3c2f703e0d0a3c6469763e0d0a3c64697620636c6173733d2261727469636c652d2d74657874206946514e384f5532206959776155723358223e0d0a3c703e54616b69652073796d756c61636a6520706f6d6167616ac485207a6f6261637a79c487206e61206368c5826f646e6f206f67c3b36c6e79206f6272617a20776f6a736b6f77796368206f70657261636a692e202dc2a0526f7a756d6965737a2c2067647a69652069c2a06a616b6965206279c582792074776f6a65206e6965646f6369c485676e69c4996369612e205a7772616361737a2075776167c499206e6120727a65637a792c206b74c3b37265206d6f67c485206279c4872070727a656f637a6f6e652069c2a070727a79637a796e69c487207369c49920646f206e6965706f776f647a656e6961202dc2a06dc3b3776920537a616c616d6168612e3c2f703e0d0a3c2f6469763e0d0a3c2f6469763e0d0a3c6469763e0d0a3c64697620636c6173733d2261727469636c652d2d74657874206946514e384f5532206959776155723358223e0d0a3c703e546572617a2067727920776f6a656e6e65207369c49920736b6fc584637a79c582792e204a65646e6f73746b61207472616669c58261206a75c5bc20646f20556b7261696e792067647a6965206f637a656b756a65206e6120726f7a6b617a792e3c2f703e0d0a3c2f6469763e0d0a3c2f6469763e0d0a3c6469763e0d0a3c64697620636c6173733d2261727469636c652d2d74657874206946514e384f5532206959776155723358223e0d0a3c703e506f646f626e6520737a6b6f6c656e6961206f64207a65737ac58265676f206c617461207a617065776e6961c58261206f62726fc584636f6d20556b7261696e79205769656c6b612042727974616e69612e20446f204e69656d696563206e61746f6d6961737420777973c582616e6f206e696520706f737a637a6567c3b36c6e7963682072656b727574c3b3772c20616c65206a75c5bc2073666f726d6f77616e65206a65646e6f73746b6920756b726169c584736b69652c20616279206e6175637a79c58279207369c499207370c3b36a6e65676f20647a6961c582616e6965207765776ec48574727a2067727570792c20616c652074616bc5bc6520696e7465726f7065726163796a6e6fc59b6369206d69c499647a792072c3b3c5bc6e796d69206f64647a6961c582616d692e3c2f703e0d0a3c703e2d20506f74727a6562756a656d79206b757273c3b37720737a6b6f6c656e696f77796368206e6120706f7a696f6d6965206b6f6d70616e69692c20706c75746f6e752c20626174616c696f6e75207ac2a0746563686e696b616d692c207ac2a069636820626f6a6f77796d6920776f7a616d692070696563686f74792c207ac2a0646f77c3b36463c4852c206b74c3b37279207a726f7a756d69652c206a616b206b6965726f7761c4872073776f696d69207369c582616d692c2077737069657261c48720617274796c657269c4992c2077737069657261c487206f70657261636a6520726f7a706f7a6e6177637a6520e28093c2a06dc3b37769206d696e6973746572206f62726f6e7920556b7261696e79204fc582656b73696a2052657a6e696b6f772e3c2f703e0d0a3c703ec5bb6fc5826e6965727a652034372e20627279676164792070727a65737a6c69207465c5bc20737a6b6f6c656e696120746563686e69637a6e652077206f6273c58275647a652062726f6e69206c756220706f6a617a64c3b3772e3c2f703e0d0a3c703e33322d6c65746e6920737a657265676f7769656320706f776965647a6961c58220225468652057617368696e67746f6e20506f7374222c20c5bc6520706f7a6f7374616a652077206b6f6e74616b636965207a206e69656b74c3b372796d6920616d6572796b61c584736b696d6920696e737472756b746f72616d692c206b74c3b3727963682073706f746b61c58220706f64637a6173206b757273752e202d2057204e69656d637a656368206e617072617764c4992064616c69206e616d20737a616e73c49920706f637a75c4872c206a616b20746f2062c499647a69652e204a616b6f206c69646572207a6573706fc58275206d6f67c49920646f776f647a69c48720352d37206f736f62616d692e204b696479206d61737a20646f20637a796e69656e6961207a206c69637a6e69656a737a796d692067727570616d692c20706f74727a6562756a65737a207769c49963656a207072616b74796b692e204120646f776f647a656e696520626174616c696f6e656d206a657374206e617072617764c49920747275646e65202d20706f776965647a6961c58220c5bc6fc5826e6965727a2e3c2f703e0d0a3c2f6469763e0d0a3c2f6469763e0d0a3c2f6469763e0d0a3c2f6469763e223b733a363a22696d61676573223b733a3337313a227b22696d6167655f696e74726f223a22696d616765735c2f67617364676473677367732e6a7067236a6f6f6d6c61496d6167653a5c2f5c2f6c6f63616c2d696d616765735c2f67617364676473677367732e6a70673f77696474683d35333334266865696768743d33333634222c22696d6167655f696e74726f5f616c74223a22222c22666c6f61745f696e74726f223a22222c22696d6167655f696e74726f5f63617074696f6e223a22222c22696d6167655f66756c6c74657874223a22696d616765735c2f4c69746875616e69616e5f5374696e676572732e6a7067236a6f6f6d6c61496d6167653a5c2f5c2f6c6f63616c2d696d616765735c2f4c69746875616e69616e5f5374696e676572732e6a70673f77696474683d383430266865696768743d353934222c22696d6167655f66756c6c746578745f616c74223a22222c22666c6f61745f66756c6c74657874223a22222c22696d6167655f66756c6c746578745f63617074696f6e223a22227d223b733a353a226361746964223b693a383b733a31303a22637265617465645f6279223b693a3538383b733a31363a22637265617465645f62795f616c696173223b733a303a22223b733a383a226d6f646966696564223b733a31393a22323032332d30362d30362030393a31393a3539223b733a31313a226d6f6469666965645f6279223b693a3538383b733a363a22706172616d73223b4f3a32343a224a6f6f6d6c615c52656769737472795c5265676973747279223a333a7b733a373a22002a0064617461223b4f3a383a22737464436c617373223a38363a7b733a31343a2261727469636c655f6c61796f7574223b733a393a225f3a64656661756c74223b733a31303a2273686f775f7469746c65223b733a313a2231223b733a31313a226c696e6b5f7469746c6573223b733a313a2231223b733a31303a2273686f775f696e74726f223b733a313a2231223b733a31393a22696e666f5f626c6f636b5f706f736974696f6e223b733a313a2230223b733a32313a22696e666f5f626c6f636b5f73686f775f7469746c65223b733a313a2231223b733a31333a2273686f775f63617465676f7279223b733a313a2231223b733a31333a226c696e6b5f63617465676f7279223b733a313a2231223b733a32303a2273686f775f706172656e745f63617465676f7279223b733a313a2230223b733a32303a226c696e6b5f706172656e745f63617465676f7279223b733a313a2230223b733a31373a2273686f775f6173736f63696174696f6e73223b733a313a2230223b733a353a22666c616773223b733a313a2231223b733a31313a2273686f775f617574686f72223b733a313a2231223b733a31313a226c696e6b5f617574686f72223b733a313a2230223b733a31363a2273686f775f6372656174655f64617465223b733a313a2230223b733a31363a2273686f775f6d6f646966795f64617465223b733a313a2230223b733a31373a2273686f775f7075626c6973685f64617465223b733a313a2231223b733a32303a2273686f775f6974656d5f6e617669676174696f6e223b733a313a2231223b733a31333a2273686f775f726561646d6f7265223b733a313a2231223b733a31393a2273686f775f726561646d6f72655f7469746c65223b733a313a2231223b733a31343a22726561646d6f72655f6c696d6974223b693a3130303b733a393a2273686f775f74616773223b733a313a2231223b733a31313a227265636f72645f68697473223b733a313a2231223b733a393a2273686f775f68697473223b733a313a2231223b733a31313a2273686f775f6e6f61757468223b733a313a2230223b733a31333a2275726c735f706f736974696f6e223b693a303b733a373a2263617074636861223b733a303a22223b733a32333a2273686f775f7075626c697368696e675f6f7074696f6e73223b733a313a2231223b733a32303a2273686f775f61727469636c655f6f7074696f6e73223b733a313a2231223b733a32373a2273686f775f636f6e6669677572655f656469745f6f7074696f6e73223b733a313a2231223b733a31363a2273686f775f7065726d697373696f6e73223b733a313a2231223b733a32323a2273686f775f6173736f63696174696f6e735f65646974223b733a313a2231223b733a31323a22736176655f686973746f7279223b733a313a2231223b733a31333a22686973746f72795f6c696d6974223b693a31303b733a32353a2273686f775f75726c735f696d616765735f66726f6e74656e64223b733a313a2230223b733a32343a2273686f775f75726c735f696d616765735f6261636b656e64223b733a313a2231223b733a373a2274617267657461223b693a303b733a373a2274617267657462223b693a303b733a373a2274617267657463223b693a303b733a31313a22666c6f61745f696e74726f223b733a343a226c656674223b733a31343a22666c6f61745f66756c6c74657874223b733a343a226c656674223b733a31353a2263617465676f72795f6c61796f7574223b733a363a225f3a626c6f67223b733a31393a2273686f775f63617465676f72795f7469746c65223b733a313a2230223b733a31363a2273686f775f6465736372697074696f6e223b733a313a2230223b733a32323a2273686f775f6465736372697074696f6e5f696d616765223b733a313a2230223b733a383a226d61784c6576656c223b733a313a2231223b733a32313a2273686f775f656d7074795f63617465676f72696573223b733a313a2230223b733a31363a2273686f775f6e6f5f61727469636c6573223b733a313a2231223b733a33323a2273686f775f63617465676f72795f68656164696e675f7469746c655f74657874223b733a313a2231223b733a31363a2273686f775f7375626361745f64657363223b733a313a2231223b733a32313a2273686f775f6361745f6e756d5f61727469636c6573223b733a313a2230223b733a31333a2273686f775f6361745f74616773223b733a313a2231223b733a32313a2273686f775f626173655f6465736372697074696f6e223b733a313a2231223b733a31313a226d61784c6576656c636174223b733a323a222d31223b733a32353a2273686f775f656d7074795f63617465676f726965735f636174223b733a313a2230223b733a32303a2273686f775f7375626361745f646573635f636174223b733a313a2231223b733a32353a2273686f775f6361745f6e756d5f61727469636c65735f636174223b733a313a2231223b733a32303a226e756d5f6c656164696e675f61727469636c6573223b693a313b733a31383a22626c6f675f636c6173735f6c656164696e67223b733a303a22223b733a31383a226e756d5f696e74726f5f61727469636c6573223b693a343b733a31303a22626c6f675f636c617373223b733a303a22223b733a31313a226e756d5f636f6c756d6e73223b693a313b733a31383a226d756c74695f636f6c756d6e5f6f72646572223b733a313a2230223b733a393a226e756d5f6c696e6b73223b693a343b733a32343a2273686f775f73756263617465676f72795f636f6e74656e74223b733a313a2230223b733a31363a226c696e6b5f696e74726f5f696d616765223b733a313a2230223b733a32313a2273686f775f706167696e6174696f6e5f6c696d6974223b733a313a2231223b733a31323a2266696c7465725f6669656c64223b733a343a2268696465223b733a31333a2273686f775f68656164696e6773223b733a313a2231223b733a31343a226c6973745f73686f775f64617465223b733a313a2230223b733a31313a22646174655f666f726d6174223b733a303a22223b733a31343a226c6973745f73686f775f68697473223b733a313a2231223b733a31363a226c6973745f73686f775f617574686f72223b733a313a2231223b733a31313a22646973706c61795f6e756d223b733a323a223130223b733a31313a226f7264657262795f707269223b733a353a226f72646572223b733a31313a226f7264657262795f736563223b733a353a227264617465223b733a31303a226f726465725f64617465223b733a393a227075626c6973686564223b733a31353a2273686f775f706167696e6174696f6e223b733a313a2232223b733a32333a2273686f775f706167696e6174696f6e5f726573756c7473223b733a313a2231223b733a31333a2273686f775f6665617475726564223b733a343a2273686f77223b733a31343a2273686f775f666565645f6c696e6b223b733a313a2231223b733a31323a22666565645f73756d6d617279223b733a313a2230223b733a31383a22666565645f73686f775f726561646d6f7265223b733a313a2230223b733a373a227365665f696473223b693a313b733a32303a22637573746f6d5f6669656c64735f656e61626c65223b733a313a2231223b733a31363a22776f726b666c6f775f656e61626c6564223b733a313a2230223b7d733a31343a22002a00696e697469616c697a6564223b623a313b733a31323a22002a00736570617261746f72223b733a313a222e223b7d733a373a226d6574616b6579223b733a303a22223b733a383a226d65746164657363223b733a303a22223b733a383a226d65746164617461223b4f3a32343a224a6f6f6d6c615c52656769737472795c5265676973747279223a333a7b733a373a22002a0064617461223b4f3a383a22737464436c617373223a333a7b733a363a22726f626f7473223b733a303a22223b733a363a22617574686f72223b733a303a22223b733a363a22726967687473223b733a303a22223b7d733a31343a22002a00696e697469616c697a6564223b623a313b733a31323a22002a00736570617261746f72223b733a313a222e223b7d733a373a2276657273696f6e223b693a313b733a383a226f72646572696e67223b693a303b733a383a2263617465676f7279223b733a353a22576f6a6e61223b733a393a226361745f7374617465223b693a313b733a31303a226361745f616363657373223b693a313b733a343a22736c7567223b733a32383a22333a6f7374727a652d756b7261696e736b69656a2d776c6f637a6e69223b733a373a22636174736c7567223b733a373a22383a776f6a6e61223b733a363a22617574686f72223b733a363a224b6163706572223b733a363a226c61796f7574223b733a373a2261727469636c65223b733a373a22636f6e74657874223b733a31393a22636f6d5f636f6e74656e742e61727469636c65223b733a383a22696d61676555726c223b733a38383a22696d616765732f67617364676473677367732e6a7067236a6f6f6d6c61496d6167653a2f2f6c6f63616c2d696d616765732f67617364676473677367732e6a70673f77696474683d35333334266865696768743d33333634223b733a383a22696d616765416c74223b733a303a22223b733a31303a226d657461617574686f72223b4e3b7d693a343b4e3b693a353b613a353a7b693a313b613a333a7b693a303b733a353a227469746c65223b693a313b733a383a227375627469746c65223b693a323b733a323a226964223b7d693a323b613a323a7b693a303b733a373a2273756d6d617279223b693a313b733a343a22626f6479223b7d693a333b613a383a7b693a303b733a343a226d657461223b693a313b733a31303a226c6973745f7072696365223b693a323b733a31303a2273616c655f7072696365223b693a333b733a373a226d6574616b6579223b693a343b733a383a226d65746164657363223b693a353b733a31303a226d657461617574686f72223b693a363b733a363a22617574686f72223b693a373b733a31363a22637265617465645f62795f616c696173223b7d693a343b613a323a7b693a303b733a343a2270617468223b693a313b733a353a22616c696173223b7d693a353b613a313a7b693a303b733a383a22636f6d6d656e7473223b7d7d693a363b733a313a222a223b693a373b4e3b693a383b4e3b693a393b733a31393a22323032332d30362d30362030393a31393a3539223b693a31303b4e3b693a31313b733a38313a22696e6465782e7068703f6f7074696f6e3d636f6d5f636f6e74656e7426766965773d61727469636c652669643d333a6f7374727a652d756b7261696e736b69656a2d776c6f637a6e692663617469643d38223b693a31323b4e3b693a31333b733a31393a22323032332d30362d30362030393a31393a3539223b693a31343b693a313b693a31353b613a343a7b733a343a2254797065223b613a313a7b693a303b4f3a383a22737464436c617373223a363a7b733a353a227469746c65223b733a373a2241727469636c65223b733a353a227374617465223b693a313b733a363a22616363657373223b693a313b733a383a226c616e6775616765223b733a303a22223b733a363a226e6573746564223b623a303b733a323a226964223b693a333b7d7d733a363a22417574686f72223b613a313a7b693a303b4f3a383a22737464436c617373223a363a7b733a353a227469746c65223b733a363a224b6163706572223b733a353a227374617465223b693a313b733a363a22616363657373223b693a313b733a383a226c616e6775616765223b733a303a22223b733a363a226e6573746564223b623a303b733a323a226964223b693a353b7d7d733a383a2243617465676f7279223b613a313a7b693a303b4f3a383a22737464436c617373223a363a7b733a353a227469746c65223b733a353a22576f6a6e61223b733a353a227374617465223b693a313b733a363a22616363657373223b693a313b733a383a226c616e6775616765223b733a313a222a223b733a363a226e6573746564223b623a313b733a323a226964223b693a31313b7d7d733a383a224c616e6775616765223b613a313a7b693a303b4f3a383a22737464436c617373223a363a7b733a353a227469746c65223b733a313a222a223b733a353a227374617465223b693a313b733a363a22616363657373223b693a313b733a383a226c616e6775616765223b733a303a22223b733a363a226e6573746564223b623a303b733a323a226964223b693a393b7d7d7d693a31363b733a32393a224f7374727a6520756b726169c584736b69656a2077c582c3b3637a6e69223b693a31373b693a333b693a31383b733a34363a22696e6465782e7068703f6f7074696f6e3d636f6d5f636f6e74656e7426766965773d61727469636c652669643d33223b7d),
(5, 'index.php?option=com_content&view=article&id=4', 'index.php?option=com_content&view=article&id=4:siostry-wielkiej-wagi&catid=9', 'Siostry wielkiej wagi', ' \"Siostry wielkiej wagi\" przeszły spektakularną metamorfozę. Zrzuciły już ćwierć tony Amy i Tammy Slaton, siostry znane z programu \"Siostry wielkiej wagi\", zawalczyły o swoje zdrowie i sylwetki. Amerykanki, które zmagają się z otyłością, zrzuciły łącznie ponad 250 kilogramów. Siostry walczą z otyłością Amy Slaton-Halterman i jej siostra Tammy Slaton z Dixon w USA są zdeterminowane, by wygrać z otyłością i już mają pierwsze sukcesy.Amerykanki znane z programu \"Siostry wielkiej wagi\" przeszły spektakularną metomorfozę. Od czasu, kiedy wyemitowano pierwszy odcinek (w 2020 roku), łącznie zrzuciły 250 kilogramów. Przed tą niezwykłą przemianą Tammy ważyła 325 kilogramów, jej siostra Amy - 180 kilogramów. Ich walkę o zdrowie można śledzić w mediach społecznościowych, a program z udziałem sióstr stał się hitem. Nie obyło się jednak bez kryzysowych chwil. Pod koniec 2021 roku stan zdrowia Tammy był bardzo ciężki, a rodzina bała się, że kobieta nie zdoła z tego wyjść. Jak tłumaczyli lekarze, jej płuca zaczęły być niewydolne, co mogło skończyć się tragedią. Na szczęście kobietę udało się ją uratować. Wielka metamorfoza Otyłość jest uważana za pandemię XXI wieku, a chorych, którzy się z nią zmagają, gwałtownie przybywa. W Polsce nadwagę ma już 3 na 5 dorosłych, a co 4. jest otyły. Otyłość ma wpływ na funkcjonowanie całego organizmu i może przyczynić się do wielu chorób. Zwiększa ryzyko zapaleń stawów i kości, chorób sercowo-naczyniowych, nadciśnienia tętniczego, cukrzycy typu 2, bezdechu sennego. Poważnym problemem ludzi, którzy walczą z otyłością mogą być także żylaki kończyn dolnych oraz wzrost ryzyka udaru mózgu, nowotworów czy bezpłodności. Dlatego Amerykanki postanowiły walczyć o zdrowie. Do tej pory słynne siostry zrobiły ogromny postęp w swojej walce. Razem straciły ponad 250 kilogramów. Kobiety, które nie mogły się poruszać bezwózka i tlenu, mogą coraz łatwiej żyć. Amy spełnia się też w roli matki. Kobieta urodziła dwoje dzieci i chętnie dzieli się nowymi doświadczenami w mediach społecznościowych. ', '2023-06-07 07:32:58', 'f9a861e136e02ab3adce9ba9e5d5e096', 1, 1, 1, '*', '2023-06-07 07:32:36', NULL, '2023-06-07 07:32:36', NULL, 0, 0, 3, 0x4f3a35323a224a6f6f6d6c615c436f6d706f6e656e745c46696e6465725c41646d696e6973747261746f725c496e64657865725c526573756c74223a31393a7b693a303b693a313b693a313b733a353a22656e2d4742223b693a323b733a323138323a22202253696f73747279207769656c6b69656a2077616769222070727a65737ac58279207370656b74616b756c61726ec485206d6574616d6f72666f7ac4992e205a727a756369c58279206a75c5bc20c48777696572c48720746f6e7920416d7920692054616d6d7920536c61746f6e2c2073696f73747279207a6e616e65207a2070726f6772616d75202253696f73747279207769656c6b69656a2077616769222c207a6177616c637a79c58279206f2073776f6a65207a64726f77696520692073796c7765746b692e20416d6572796b616e6b692c206b74c3b37265207a6d6167616ac485207369c499207a206f7479c5826fc59b6369c4852c207a727a756369c5827920c582c485637a6e696520706f6e616420323530206b696c6f6772616dc3b3772e2053696f737472792077616c637ac485207a206f7479c5826fc59b6369c48520416d7920536c61746f6e2d48616c7465726d616e2069206a656a2073696f737472612054616d6d7920536c61746f6e207a204469786f6e2077205553412073c485207a64657465726d696e6f77616e652c206279207779677261c487207a206f7479c5826fc59b6369c4852069206a75c5bc206d616ac485207069657277737a652073756b636573792e416d6572796b616e6b69207a6e616e65207a2070726f6772616d75202253696f73747279207769656c6b69656a2077616769222070727a65737ac58279207370656b74616b756c61726ec485206d65746f6d6f72666f7ac4992e204f6420637a6173752c206b69656479207779656d69746f77616e6f207069657277737a79206f6463696e656b202877203230323020726f6b75292c20c582c485637a6e6965207a727a756369c5827920323530206b696c6f6772616dc3b3772e2050727a65642074c485206e69657a77796bc582c4852070727a656d69616ec4852054616d6d79207761c5bc79c5826120333235206b696c6f6772616dc3b3772c206a656a2073696f7374726120416d79202d20313830206b696c6f6772616dc3b3772e204963682077616c6bc499206f207a64726f776965206d6fc5bc6e6120c59b6c65647a69c4872077206d6564696163682073706fc58265637a6e6fc59b63696f777963682c20612070726f6772616d207a2075647a6961c582656d207369c3b373747220737461c582207369c49920686974656d2e204e6965206f6279c5826f207369c499206a65646e616b2062657a206b72797a79736f7779636820636877696c2e20506f64206b6f6e696563203230323120726f6b75207374616e207a64726f7769612054616d6d79206279c58220626172647a6f206369c499c5bc6b692c206120726f647a696e61206261c58261207369c4992c20c5bc65206b6f6269657461206e6965207a646fc58261207a207465676f2077796ac59bc4872e204a616b2074c582756d61637a796c69206c656b61727a652c206a656a2070c582756361207a61637ac499c58279206279c487206e69657779646f6c6e652c20636f206d6f67c5826f20736b6fc584637a79c487207369c4992074726167656469c4852e204e6120737a637ac499c59b636965206b6f62696574c49920756461c5826f207369c499206ac48520757261746f7761c4872e205769656c6b61206d6574616d6f72666f7a61204f7479c5826fc59bc487206a65737420757761c5bc616e61207a612070616e64656d69c49920585849207769656b752c20612063686f727963682c206b74c3b3727a79207369c499207a206e69c485207a6d6167616ac4852c20677761c582746f776e69652070727a79627977612e205720506f6c736365206e6164776167c499206d61206a75c5bc2033206e61203520646f726f73c5827963682c206120636f20342e206a657374206f7479c582792e204f7479c5826fc59bc487206d61207770c5827977206e612066756e6b636a6f6e6f77616e6965206361c58265676f206f7267616e697a6d752069206d6fc5bc652070727a79637a796e69c487207369c49920646f207769656c752063686f72c3b3622e205a7769c4996b737a612072797a796b6f207a6170616c65c5842073746177c3b3772069206b6fc59b63692c2063686f72c3b36220736572636f776f2d6e61637a796e696f777963682c206e61646369c59b6e69656e69612074c499746e69637a65676f2c2063756b727a796379207479707520322c2062657a64656368752073656e6e65676f2e20506f7761c5bc6e796d2070726f626c656d656d206c75647a692c206b74c3b3727a792077616c637ac485207a206f7479c5826fc59b6369c485206d6f67c485206279c4872074616bc5bc6520c5bc796c616b69206b6fc584637a796e20646f6c6e796368206f72617a20777a726f73742072797a796b61207564617275206dc3b37a67752c206e6f776f74776f72c3b37720637a792062657a70c5826f646e6fc59b63692e20446c617465676f20416d6572796b616e6b6920706f7374616e6f7769c582792077616c637a79c487206f207a64726f7769652e20446f2074656a20706f72792073c582796e6e652073696f73747279207a726f6269c58279206f67726f6d6e7920706f7374c4997020772073776f6a656a2077616c63652e2052617a656d20737472616369c5827920706f6e616420323530206b696c6f6772616dc3b3772e204b6f62696574792c206b74c3b37265206e6965206d6f67c58279207369c49920706f7275737a61c4872062657a77c3b37a6b61206920746c656e752c206d6f67c48520636f72617a20c58261747769656a20c5bc79c4872e20416d7920737065c5826e6961207369c499207465c5bc207720726f6c69206d61746b692e204b6f62696574612075726f647a69c582612064776f6a6520647a696563692069206368c499746e696520647a69656c69207369c499206e6f77796d6920646fc59b77696164637a656e616d692077206d6564696163682073706fc58265637a6e6fc59b63696f777963682e20223b693a333b613a32373a7b733a323a226964223b693a343b733a353a22616c696173223b733a32313a2273696f73747279207769656c6b69656a2077616769223b733a373a2273756d6d617279223b733a333339353a223c6831207374796c653d22746578742d616c69676e3a2063656e7465723b223e2253696f73747279207769656c6b69656a2077616769222070727a65737ac58279207370656b74616b756c61726ec485206d6574616d6f72666f7ac4992e205a727a756369c58279206a75c5bc20c48777696572c48720746f6e793c2f68313e0d0a3c703e416d7920692054616d6d7920536c61746f6e2c2073696f73747279207a6e616e65207a2070726f6772616d75202253696f73747279207769656c6b69656a2077616769222c207a6177616c637a79c58279206f2073776f6a65207a64726f77696520692073796c7765746b692e20416d6572796b616e6b692c206b74c3b37265207a6d6167616ac485207369c499207a206f7479c5826fc59b6369c4852c207a727a756369c5827920c582c485637a6e696520706f6e616420323530206b696c6f6772616dc3b3772e3c2f703e0d0a3c68322069643d2273696f737472792d77616c637a612d7a2d6f74796c6f73636961223e53696f737472792077616c637ac485207a206f7479c5826fc59b6369c4853c2f68323e0d0a3c703e416d7920536c61746f6e2d48616c7465726d616e2069206a656a2073696f737472612054616d6d7920536c61746f6e207a204469786f6e2077205553412073c485207a64657465726d696e6f77616e652c206279207779677261c487207ac2a03c6120687265663d2268747470733a2f2f706f7274616c2e6162637a64726f7769652e706c2f6f74796c6f7363223e6f7479c5826fc59b6369c4853c2f613e2069206a75c5bc206d616ac485207069657277737a652073756b636573792e416d6572796b616e6b69207a6e616e65207a2070726f6772616d75202253696f73747279207769656c6b69656a2077616769222070727a65737ac58279207370656b74616b756c61726ec485206d65746f6d6f72666f7ac4992e204f6420637a6173752c206b69656479207779656d69746f77616e6f207069657277737a79206f6463696e656b202877203230323020726f6b75292c20c582c485637a6e6965207a727a756369c5827920323530206b696c6f6772616dc3b3772e3c2f703e0d0a3c703e3c7374726f6e673e50727a65642074c485206e69657a77796bc582c4852070727a656d69616ec4852054616d6d79207761c5bc79c5826120333235206b696c6f6772616dc3b3772c206a656a2073696f7374726120416d79202d20313830206b696c6f6772616dc3b3773c2f7374726f6e673e2e3c2f703e0d0a3c703e4963682077616c6bc499206f207a64726f776965206d6fc5bc6e6120c59b6c65647a69c4872077206d6564696163682073706fc58265637a6e6fc59b63696f777963682c20612070726f6772616d207a2075647a6961c582656d207369c3b373747220737461c582207369c49920686974656d2e3c2f703e0d0a3c703e4e6965206f6279c5826f207369c499206a65646e616b2062657a206b72797a79736f7779636820636877696c2e20506f64206b6f6e696563203230323120726f6b75207374616e207a64726f7769612054616d6d79206279c58220626172647a6f206369c499c5bc6b692c206120726f647a696e61206261c58261207369c4992c20c5bc65206b6f6269657461206e6965207a646fc58261207a207465676f2077796ac59bc4872e3c2f703e0d0a3c703e4a616b2074c582756d61637a796c69206c656b61727a652cc2a03c7374726f6e673e6a656a2070c582756361207a61637ac499c58279206279c487206e69657779646f6c6e653c2f7374726f6e673e2c20636f206d6f67c5826f20736b6fc584637a79c487207369c4992074726167656469c4852e204e6120737a637ac499c59b636965206b6f62696574c49920756461c5826f207369c499206ac48520757261746f7761c4872e3c2f703e0d0a3c68322069643d227769656c6b612d6d6574616d6f72666f7a61223e5769656c6b61206d6574616d6f72666f7a613c2f68323e0d0a3c703e4f7479c5826fc59bc487206a65737420757761c5bc616e61207a612070616e64656d69c49920585849207769656b752c20612063686f727963682c206b74c3b3727a79207369c499207a206e69c485207a6d6167616ac4852c20677761c582746f776e69652070727a79627977612ec2a03c7374726f6e673e5720506f6c736365206e6164776167c499206d61206a75c5bc2033206e61203520646f726f73c5827963682c206120636f20342e206a657374206f7479c582793c2f7374726f6e673e2e3c2f703e0d0a3c703e4f7479c5826fc59bc487206d61207770c5827977206e612066756e6b636a6f6e6f77616e6965206361c58265676f206f7267616e697a6d752069206d6fc5bc652070727a79637a796e69c487207369c49920646f207769656c752063686f72c3b3622e205a7769c4996b737a612072797a796b6f207a6170616c65c5842073746177c3b3772069206b6fc59b63692cc2a03c6120687265663d2268747470733a2f2f706f7274616c2e6162637a64726f7769652e706c2f63686f726f62792d756b6c6164752d6b72617a656e6961223e63686f72c3b36220736572636f776f2d6e61637a796e696f777963683c2f613e2cc2a03c6120687265663d2268747470733a2f2f706f7274616c2e6162637a64726f7769652e706c2f6e61646369736e69656e69652d7465746e69637a65223e6e61646369c59b6e69656e69612074c499746e69637a65676f3c2f613e2cc2a03c6120687265663d2268747470733a2f2f706f7274616c2e6162637a64726f7769652e706c2f63756b727a7963612d747970752d32223e63756b727a796379207479707520323c2f613e2cc2a03c6120687265663d2268747470733a2f2f706f7274616c2e6162637a64726f7769652e706c2f62657a646563682d73656e6e79223e62657a64656368752073656e6e65676f3c2f613e2e3c2f703e0d0a3c703e506f7761c5bc6e796d2070726f626c656d656d206c75647a692c206b74c3b3727a792077616c637ac485207a206f7479c5826fc59b6369c485206d6f67c485206279c4872074616bc5bc65c2a03c6120687265663d2268747470733a2f2f706f7274616c2e6162637a64726f7769652e706c2f7a796c616b692d6b6f6e637a796e2d646f6c6e796368223ec5bc796c616b69206b6fc584637a796e20646f6c6e7963683c2f613ec2a06f72617a20777a726f73742072797a796b61c2a03c6120687265663d2268747470733a2f2f706f7274616c2e6162637a64726f7769652e706c2f756461722d6d6f7a6775223e7564617275206dc3b37a67753c2f613e2c206e6f776f74776f72c3b37720637a79c2a03c6120687265663d2268747470733a2f2f706f7274616c2e6162637a64726f7769652e706c2f62657a706c6f646e6f7363223e62657a70c5826f646e6fc59b63693c2f613e2e3c2f703e0d0a3c703e446c617465676f20416d6572796b616e6b6920706f7374616e6f7769c582792077616c637a79c487206f207a64726f7769652e20446f2074656a20706f72792073c582796e6e652073696f73747279207a726f6269c58279206f67726f6d6e7920706f7374c4997020772073776f6a656a2077616c63652ec2a03c7374726f6e673e52617a656d20737472616369c5827920706f6e616420323530206b696c6f6772616dc3b3773c2f7374726f6e673e2e204b6f62696574792c206b74c3b37265206e6965206d6f67c58279207369c49920706f7275737a61c4872062657a2077c3b37a6b61206920746c656e752c206d6f67c48520636f72617a20c58261747769656a20c5bc79c4872e3c2f703e0d0a3c703e416d7920737065c5826e6961207369c499207465c5bc207720726f6c69206d61746b692e204b6f62696574612075726f647a69c582612064776f6a6520647a696563692069206368c499746e696520647a69656c69207369c499206e6f77796d6920646fc59b77696164637a656e616d692077206d6564696163682073706fc58265637a6e6fc59b63696f777963682e3c2f703e0d0a3c703e3c696d67207374796c653d22646973706c61793a20626c6f636b3b206d617267696e2d6c6566743a206175746f3b206d617267696e2d72696768743a206175746f3b22207372633d2268747470733a2f2f762e7770696d672e706c2f65586b774c6e4275536a6b4b46547064625135484c456c4e6267637256306c36486c563254473036536d3564546a52656251554b4b68385749454d6a467759694477556a4753735153793862464367416241554a647749614c516b6e4e67513741784a6a58484a48566e6462516d4e6463316f454e524a614e6b4d6d447777394342776c437938715844774b456d4a444f6b556361424d50664263375255736f4252427545772220616c743d22416d792075726f647a69c58261206e69656461776e6f2064727567696520647a6965636b6f22202f3e3c2f703e0d0a3c703ec2a03c2f703e0d0a3c703ec2a03c2f703e0d0a3c64697620636c6173733d2261727469636c655f5f74657874626f78207776647871636520743665747567392062717a736e6f33206a6d7a72303570223e0d0a3c6469762069643d226336343830326661373064353835352220636c6173733d2277777a356b3469223e3c2f6469763e0d0a3c2f6469763e223b733a343a22626f6479223b733a303a22223b733a363a22696d61676573223b733a3432353a227b22696d6167655f696e74726f223a22696d616765735c2f3235306c622e77656270236a6f6f6d6c61496d6167653a5c2f5c2f6c6f63616c2d696d616765735c2f3235306c622e776562703f77696474683d393136266865696768743d343731222c22696d6167655f696e74726f5f616c74223a22222c22666c6f61745f696e74726f223a22222c22696d6167655f696e74726f5f63617074696f6e223a22222c22696d6167655f66756c6c74657874223a22696d616765735c2f313030302d6c622d536973746572732d54616d6d792d536c61746f6e2d416d792d536c61746f6e2d353438392d383030783434352e6a7067236a6f6f6d6c61496d6167653a5c2f5c2f6c6f63616c2d696d616765735c2f313030302d6c622d536973746572732d54616d6d792d536c61746f6e2d416d792d536c61746f6e2d353438392d383030783434352e6a70673f77696474683d383030266865696768743d343435222c22696d6167655f66756c6c746578745f616c74223a22222c22666c6f61745f66756c6c74657874223a22222c22696d6167655f66756c6c746578745f63617074696f6e223a22227d223b733a353a226361746964223b693a393b733a31303a22637265617465645f6279223b693a3538383b733a31363a22637265617465645f62795f616c696173223b733a303a22223b733a383a226d6f646966696564223b733a31393a22323032332d30362d30372030373a33323a3538223b733a31313a226d6f6469666965645f6279223b693a3538383b733a363a22706172616d73223b4f3a32343a224a6f6f6d6c615c52656769737472795c5265676973747279223a333a7b733a373a22002a0064617461223b4f3a383a22737464436c617373223a38363a7b733a31343a2261727469636c655f6c61796f7574223b733a393a225f3a64656661756c74223b733a31303a2273686f775f7469746c65223b733a313a2231223b733a31313a226c696e6b5f7469746c6573223b733a313a2231223b733a31303a2273686f775f696e74726f223b733a313a2231223b733a31393a22696e666f5f626c6f636b5f706f736974696f6e223b733a313a2230223b733a32313a22696e666f5f626c6f636b5f73686f775f7469746c65223b733a313a2231223b733a31333a2273686f775f63617465676f7279223b733a313a2231223b733a31333a226c696e6b5f63617465676f7279223b733a313a2231223b733a32303a2273686f775f706172656e745f63617465676f7279223b733a313a2230223b733a32303a226c696e6b5f706172656e745f63617465676f7279223b733a313a2230223b733a31373a2273686f775f6173736f63696174696f6e73223b733a313a2230223b733a353a22666c616773223b733a313a2231223b733a31313a2273686f775f617574686f72223b733a313a2231223b733a31313a226c696e6b5f617574686f72223b733a313a2230223b733a31363a2273686f775f6372656174655f64617465223b733a313a2230223b733a31363a2273686f775f6d6f646966795f64617465223b733a313a2230223b733a31373a2273686f775f7075626c6973685f64617465223b733a313a2231223b733a32303a2273686f775f6974656d5f6e617669676174696f6e223b733a313a2231223b733a31333a2273686f775f726561646d6f7265223b733a313a2231223b733a31393a2273686f775f726561646d6f72655f7469746c65223b733a313a2231223b733a31343a22726561646d6f72655f6c696d6974223b693a3130303b733a393a2273686f775f74616773223b733a313a2231223b733a31313a227265636f72645f68697473223b733a313a2231223b733a393a2273686f775f68697473223b733a313a2231223b733a31313a2273686f775f6e6f61757468223b733a313a2230223b733a31333a2275726c735f706f736974696f6e223b693a303b733a373a2263617074636861223b733a303a22223b733a32333a2273686f775f7075626c697368696e675f6f7074696f6e73223b733a313a2231223b733a32303a2273686f775f61727469636c655f6f7074696f6e73223b733a313a2231223b733a32373a2273686f775f636f6e6669677572655f656469745f6f7074696f6e73223b733a313a2231223b733a31363a2273686f775f7065726d697373696f6e73223b733a313a2231223b733a32323a2273686f775f6173736f63696174696f6e735f65646974223b733a313a2231223b733a31323a22736176655f686973746f7279223b733a313a2231223b733a31333a22686973746f72795f6c696d6974223b693a31303b733a32353a2273686f775f75726c735f696d616765735f66726f6e74656e64223b733a313a2230223b733a32343a2273686f775f75726c735f696d616765735f6261636b656e64223b733a313a2231223b733a373a2274617267657461223b693a303b733a373a2274617267657462223b693a303b733a373a2274617267657463223b693a303b733a31313a22666c6f61745f696e74726f223b733a343a226c656674223b733a31343a22666c6f61745f66756c6c74657874223b733a343a226c656674223b733a31353a2263617465676f72795f6c61796f7574223b733a363a225f3a626c6f67223b733a31393a2273686f775f63617465676f72795f7469746c65223b733a313a2230223b733a31363a2273686f775f6465736372697074696f6e223b733a313a2230223b733a32323a2273686f775f6465736372697074696f6e5f696d616765223b733a313a2230223b733a383a226d61784c6576656c223b733a313a2231223b733a32313a2273686f775f656d7074795f63617465676f72696573223b733a313a2230223b733a31363a2273686f775f6e6f5f61727469636c6573223b733a313a2231223b733a33323a2273686f775f63617465676f72795f68656164696e675f7469746c655f74657874223b733a313a2231223b733a31363a2273686f775f7375626361745f64657363223b733a313a2231223b733a32313a2273686f775f6361745f6e756d5f61727469636c6573223b733a313a2230223b733a31333a2273686f775f6361745f74616773223b733a313a2231223b733a32313a2273686f775f626173655f6465736372697074696f6e223b733a313a2231223b733a31313a226d61784c6576656c636174223b733a323a222d31223b733a32353a2273686f775f656d7074795f63617465676f726965735f636174223b733a313a2230223b733a32303a2273686f775f7375626361745f646573635f636174223b733a313a2231223b733a32353a2273686f775f6361745f6e756d5f61727469636c65735f636174223b733a313a2231223b733a32303a226e756d5f6c656164696e675f61727469636c6573223b693a313b733a31383a22626c6f675f636c6173735f6c656164696e67223b733a303a22223b733a31383a226e756d5f696e74726f5f61727469636c6573223b693a343b733a31303a22626c6f675f636c617373223b733a303a22223b733a31313a226e756d5f636f6c756d6e73223b693a313b733a31383a226d756c74695f636f6c756d6e5f6f72646572223b733a313a2230223b733a393a226e756d5f6c696e6b73223b693a343b733a32343a2273686f775f73756263617465676f72795f636f6e74656e74223b733a313a2230223b733a31363a226c696e6b5f696e74726f5f696d616765223b733a313a2230223b733a32313a2273686f775f706167696e6174696f6e5f6c696d6974223b733a313a2231223b733a31323a2266696c7465725f6669656c64223b733a343a2268696465223b733a31333a2273686f775f68656164696e6773223b733a313a2231223b733a31343a226c6973745f73686f775f64617465223b733a313a2230223b733a31313a22646174655f666f726d6174223b733a303a22223b733a31343a226c6973745f73686f775f68697473223b733a313a2231223b733a31363a226c6973745f73686f775f617574686f72223b733a313a2231223b733a31313a22646973706c61795f6e756d223b733a323a223130223b733a31313a226f7264657262795f707269223b733a353a226f72646572223b733a31313a226f7264657262795f736563223b733a353a227264617465223b733a31303a226f726465725f64617465223b733a393a227075626c6973686564223b733a31353a2273686f775f706167696e6174696f6e223b733a313a2232223b733a32333a2273686f775f706167696e6174696f6e5f726573756c7473223b733a313a2231223b733a31333a2273686f775f6665617475726564223b733a343a2273686f77223b733a31343a2273686f775f666565645f6c696e6b223b733a313a2231223b733a31323a22666565645f73756d6d617279223b733a313a2230223b733a31383a22666565645f73686f775f726561646d6f7265223b733a313a2230223b733a373a227365665f696473223b693a313b733a32303a22637573746f6d5f6669656c64735f656e61626c65223b733a313a2231223b733a31363a22776f726b666c6f775f656e61626c6564223b733a313a2230223b7d733a31343a22002a00696e697469616c697a6564223b623a313b733a31323a22002a00736570617261746f72223b733a313a222e223b7d733a373a226d6574616b6579223b733a303a22223b733a383a226d65746164657363223b733a303a22223b733a383a226d65746164617461223b4f3a32343a224a6f6f6d6c615c52656769737472795c5265676973747279223a333a7b733a373a22002a0064617461223b4f3a383a22737464436c617373223a333a7b733a363a22726f626f7473223b733a303a22223b733a363a22617574686f72223b733a303a22223b733a363a22726967687473223b733a303a22223b7d733a31343a22002a00696e697469616c697a6564223b623a313b733a31323a22002a00736570617261746f72223b733a313a222e223b7d733a373a2276657273696f6e223b693a323b733a383a226f72646572696e67223b693a303b733a383a2263617465676f7279223b733a31323a22536f6369616c204d65646961223b733a393a226361745f7374617465223b693a313b733a31303a226361745f616363657373223b693a313b733a343a22736c7567223b733a32333a22343a73696f737472792d7769656c6b69656a2d77616769223b733a373a22636174736c7567223b733a31343a22393a736f6369616c2d6d65646961223b733a363a22617574686f72223b733a363a224b6163706572223b733a363a226c61796f7574223b733a373a2261727469636c65223b733a373a22636f6e74657874223b733a31393a22636f6d5f636f6e74656e742e61727469636c65223b733a383a22696d61676555726c223b733a37363a22696d616765732f3235306c622e77656270236a6f6f6d6c61496d6167653a2f2f6c6f63616c2d696d616765732f3235306c622e776562703f77696474683d393136266865696768743d343731223b733a383a22696d616765416c74223b733a303a22223b733a31303a226d657461617574686f72223b4e3b7d693a343b4e3b693a353b613a353a7b693a313b613a333a7b693a303b733a353a227469746c65223b693a313b733a383a227375627469746c65223b693a323b733a323a226964223b7d693a323b613a323a7b693a303b733a373a2273756d6d617279223b693a313b733a343a22626f6479223b7d693a333b613a383a7b693a303b733a343a226d657461223b693a313b733a31303a226c6973745f7072696365223b693a323b733a31303a2273616c655f7072696365223b693a333b733a373a226d6574616b6579223b693a343b733a383a226d65746164657363223b693a353b733a31303a226d657461617574686f72223b693a363b733a363a22617574686f72223b693a373b733a31363a22637265617465645f62795f616c696173223b7d693a343b613a323a7b693a303b733a343a2270617468223b693a313b733a353a22616c696173223b7d693a353b613a313a7b693a303b733a383a22636f6d6d656e7473223b7d7d693a363b733a313a222a223b693a373b4e3b693a383b4e3b693a393b733a31393a22323032332d30362d30372030373a33323a3336223b693a31303b4e3b693a31313b733a37363a22696e6465782e7068703f6f7074696f6e3d636f6d5f636f6e74656e7426766965773d61727469636c652669643d343a73696f737472792d7769656c6b69656a2d776167692663617469643d39223b693a31323b4e3b693a31333b733a31393a22323032332d30362d30372030373a33323a3336223b693a31343b693a313b693a31353b613a343a7b733a343a2254797065223b613a313a7b693a303b4f3a383a22737464436c617373223a363a7b733a353a227469746c65223b733a373a2241727469636c65223b733a353a227374617465223b693a313b733a363a22616363657373223b693a313b733a383a226c616e6775616765223b733a303a22223b733a363a226e6573746564223b623a303b733a323a226964223b693a333b7d7d733a363a22417574686f72223b613a313a7b693a303b4f3a383a22737464436c617373223a363a7b733a353a227469746c65223b733a363a224b6163706572223b733a353a227374617465223b693a313b733a363a22616363657373223b693a313b733a383a226c616e6775616765223b733a303a22223b733a363a226e6573746564223b623a303b733a323a226964223b693a353b7d7d733a383a2243617465676f7279223b613a313a7b693a303b4f3a383a22737464436c617373223a363a7b733a353a227469746c65223b733a31323a22536f6369616c204d65646961223b733a353a227374617465223b693a313b733a363a22616363657373223b693a313b733a383a226c616e6775616765223b733a313a222a223b733a363a226e6573746564223b623a313b733a323a226964223b693a31333b7d7d733a383a224c616e6775616765223b613a313a7b693a303b4f3a383a22737464436c617373223a363a7b733a353a227469746c65223b733a313a222a223b733a353a227374617465223b693a313b733a363a22616363657373223b693a313b733a383a226c616e6775616765223b733a303a22223b733a363a226e6573746564223b623a303b733a323a226964223b693a393b7d7d7d693a31363b733a32313a2253696f73747279207769656c6b69656a2077616769223b693a31373b693a333b693a31383b733a34363a22696e6465782e7068703f6f7074696f6e3d636f6d5f636f6e74656e7426766965773d61727469636c652669643d34223b7d),
(6, 'index.php?option=com_content&view=category&id=9', 'index.php?option=com_content&view=category&id=9', 'Social Media', '', '2023-06-07 07:32:58', 'd1731d369c5fa55063582774c09b409d', 1, 1, 1, '*', NULL, NULL, '2023-06-07 07:32:58', NULL, 0, 0, 1, 0x4f3a35323a224a6f6f6d6c615c436f6d706f6e656e745c46696e6465725c41646d696e6973747261746f725c496e64657865725c526573756c74223a31393a7b693a303b693a313b693a313b733a353a22656e2d4742223b693a323b733a303a22223b693a333b613a31373a7b733a323a226964223b693a393b733a353a22616c696173223b733a31323a22736f6369616c206d65646961223b733a393a22657874656e73696f6e223b733a31313a22636f6d5f636f6e74656e74223b733a373a226d6574616b6579223b733a303a22223b733a383a226d65746164657363223b733a303a22223b733a383a226d65746164617461223b4f3a32343a224a6f6f6d6c615c52656769737472795c5265676973747279223a333a7b733a373a22002a0064617461223b4f3a383a22737464436c617373223a303a7b7d733a31343a22002a00696e697469616c697a6564223b623a303b733a31323a22002a00736570617261746f72223b733a313a222e223b7d733a333a226c6674223b693a31333b733a393a22706172656e745f6964223b693a313b733a353a226c6576656c223b693a313b733a363a22706172616d73223b4f3a32343a224a6f6f6d6c615c52656769737472795c5265676973747279223a333a7b733a373a22002a0064617461223b4f3a383a22737464436c617373223a303a7b7d733a31343a22002a00696e697469616c697a6564223b623a303b733a31323a22002a00736570617261746f72223b733a313a222e223b7d733a373a2273756d6d617279223b4e3b733a31303a22637265617465645f6279223b693a3538383b733a383a226d6f646966696564223b733a31393a22323032332d30362d30372030373a33323a3538223b733a31313a226d6f6469666965645f6279223b693a3538383b733a343a22736c7567223b733a31343a22393a736f6369616c2d6d65646961223b733a363a226c61796f7574223b733a383a2263617465676f7279223b733a31303a226d657461617574686f72223b4e3b7d693a343b4e3b693a353b613a353a7b693a313b613a333a7b693a303b733a353a227469746c65223b693a313b733a383a227375627469746c65223b693a323b733a323a226964223b7d693a323b613a323a7b693a303b733a373a2273756d6d617279223b693a313b733a343a22626f6479223b7d693a333b613a383a7b693a303b733a343a226d657461223b693a313b733a31303a226c6973745f7072696365223b693a323b733a31303a2273616c655f7072696365223b693a333b733a343a226c696e6b223b693a343b733a373a226d6574616b6579223b693a353b733a383a226d65746164657363223b693a363b733a31303a226d657461617574686f72223b693a373b733a363a22617574686f72223b7d693a343b613a323a7b693a303b733a343a2270617468223b693a313b733a353a22616c696173223b7d693a353b613a313a7b693a303b733a383a22636f6d6d656e7473223b7d7d693a363b733a313a222a223b693a373b4e3b693a383b4e3b693a393b4e3b693a31303b4e3b693a31313b733a34373a22696e6465782e7068703f6f7074696f6e3d636f6d5f636f6e74656e7426766965773d63617465676f72792669643d39223b693a31323b4e3b693a31333b733a31393a22323032332d30362d30372030373a33323a3538223b693a31343b693a313b693a31353b613a323a7b733a343a2254797065223b613a313a7b693a303b4f3a383a22737464436c617373223a363a7b733a353a227469746c65223b733a383a2243617465676f7279223b733a353a227374617465223b693a313b733a363a22616363657373223b693a313b733a383a226c616e6775616765223b733a303a22223b733a363a226e6573746564223b623a303b733a323a226964223b693a31303b7d7d733a383a224c616e6775616765223b613a313a7b693a303b4f3a383a22737464436c617373223a363a7b733a353a227469746c65223b733a313a222a223b733a353a227374617465223b693a313b733a363a22616363657373223b693a313b733a383a226c616e6775616765223b733a303a22223b733a363a226e6573746564223b623a303b733a323a226964223b693a393b7d7d7d693a31363b733a31323a22536f6369616c204d65646961223b693a31373b693a313b693a31383b733a34373a22696e6465782e7068703f6f7074696f6e3d636f6d5f636f6e74656e7426766965773d63617465676f72792669643d39223b7d);
INSERT INTO `buf3w_finder_links` (`link_id`, `url`, `route`, `title`, `description`, `indexdate`, `md5sum`, `published`, `state`, `access`, `language`, `publish_start_date`, `publish_end_date`, `start_date`, `end_date`, `list_price`, `sale_price`, `type_id`, `object`) VALUES
(7, 'index.php?option=com_content&view=article&id=5', 'index.php?option=com_content&view=article&id=5:tiktok-szykuje-zmiany&catid=9', 'TikTok szykuje zmiany', ' TikTok szykuje zmiany. Obejmą najmłodszych użytkowników TikTok od dawna jest krytykowany za niedostateczną ochronę swoich najmłodszych użytkowników, dlatego teraz serwis wprowadzi nowe mechanizmy chroniące dzieci przed pedofilią w sieci. Firma ogłosiła w środę, że konta użytkowników poniżej 16 roku domyślnie będą miały najsilniejsze ustawienia prywatności. ', '2023-06-07 07:40:46', 'bea5181ad3cce5aec4e284249e94f8be', 1, 1, 1, '*', '2023-06-07 07:40:46', NULL, '2023-06-07 07:40:46', NULL, 0, 0, 3, 0x4f3a35323a224a6f6f6d6c615c436f6d706f6e656e745c46696e6465725c41646d696e6973747261746f725c496e64657865725c526573756c74223a31393a7b693a303b693a313b693a313b733a353a22656e2d4742223b693a323b733a3338343a222054696b546f6b20737a796b756a65207a6d69616e792e204f62656a6dc485206e616a6dc5826f64737a7963682075c5bc79746b6f776e696bc3b3772054696b546f6b206f64206461776e61206a657374206b727974796b6f77616e79207a61206e6965646f7374617465637a6ec485206f6368726f6ec4992073776f696368206e616a6dc5826f64737a7963682075c5bc79746b6f776e696bc3b3772c20646c617465676f20746572617a20736572776973207770726f7761647a69206e6f7765206d656368616e697a6d79206368726f6e69c485636520647a696563692070727a6564207065646f66696c69c48520772073696563692e204669726d61206f67c5826f7369c58261207720c59b726f64c4992c20c5bc65206b6f6e74612075c5bc79746b6f776e696bc3b37720706f6e69c5bc656a20313620726f6b7520646f6d79c59b6c6e69652062c49964c485206d6961c58279206e616a73696c6e69656a737a6520757374617769656e6961207072797761746e6fc59b63692e20223b693a333b613a32373a7b733a323a226964223b693a353b733a353a22616c696173223b733a32313a2274696b746f6b20737a796b756a65207a6d69616e79223b733a373a2273756d6d617279223b733a3434353a223c683120636c6173733d224333637422207374796c653d22746578742d616c69676e3a2063656e7465723b223e54696b546f6bc2a0737a796b756a65207a6d69616e792e204f62656a6dc485206e616a6dc5826f64737a796368c2a075c5bc79746b6f776e696bc3b3773c2f68313e0d0a3c703e54696b546f6bc2a06f64206461776e61206a657374206b727974796b6f77616e79207a61206e6965646f7374617465637a6ec485206f6368726f6ec4992073776f696368206e616a6dc5826f64737a7963682075c5bc79746b6f776e696bc3b3772c20646c617465676f20746572617a20736572776973207770726f7761647a69206e6f7765206d656368616e697a6d79206368726f6e69c485636520647a696563692070727a6564207065646f66696c69c48520772073696563692e204669726d61206f67c5826f7369c58261207720c59b726f64c4992c20c5bc65206b6f6e74612075c5bc79746b6f776e696bc3b37720706f6e69c5bc656a20313620726f6b7520646f6d79c59b6c6e69652062c49964c485206d6961c58279206e616a73696c6e69656a737a6520757374617769656e6961207072797761746e6fc59b63692e3c2f703e0d0a223b733a343a22626f6479223b733a323237383a220d0a3c703e3c696d67207374796c653d22646973706c61793a20626c6f636b3b206d617267696e2d6c6566743a206175746f3b206d617267696e2d72696768743a206175746f3b22207372633d2268747470733a2f2f762e7770696d672e706c2f596d4d794f47597564677773477a6c30646735374757394462533477563356504f4674315a585a4561315639415741754e424a334353496250534970427a594b50786769506e63464e5549454643346750415a324979674f5047686f52576c6164454667637a3144616c347653796c7162554e70576d424e4c584537574474594c3074694a6d6c4e614638725443306b6130305f5179634a4b47556b2220616c743d22666f742e20556e73706c617368222077696474683d2237383322206865696768743d2235323222202f3e3c2f703e0d0a3c64697620636c6173733d2252446533223e0d0a3c703e5a6d69616e79207a6f7374616ec485207a6173746f736f77616e65206175746f6d617479637a6e696520777a676cc49964656d2077737a7973746b696368206b6f6e74207574776f727a6f6e7963682070727a657a206f736f627920706f6e69c5bc656a20313620726f6b7520c5bc796369612069206f7a6e61637a616ac4852c20c5bc65206b6f6e7461207374616ec485207369c499207072797761746e652e20436f207a612074796d2069647a69652c2077737a7973746b69652070726fc59b6279206f206d6fc5bc6c69776fc59bc48720696368206f62736572776f77616e69612062c499647a69652074727a656261207a617477696572647a61c4872073616d6f647a69656c6e69652e3c2f703e0d0a3c2f6469763e0d0a3c64697620636c6173733d2252446533223e0d0a3c703e50726f66696c65206f7a6e61637a6f6e65206a616b6f207072797761746e65206e6965206d6f67c4852072c3b3776e6965c5bc206279c487206f7a6e61637a616e652077206d617465726961c58261636820776964656f206e6167727977616e79636820772072616d6163682066756e6b636a69202244756574222c206b74c3b3726120637ac49973746f206279c582612077796b6f727a7973747977616e612070727a657a207065646f66696cc3b37720646f20c582c485637a656e69612073776f696368206f66696172207a206d617465726961c582616d6920706f726e6f6772616669637a6e796d692e3c2f703e0d0a3c64697620636c6173733d2252446533223e0d0a3c756c3e0d0a3c6c693e507261776f20646f207072797761746e6fc59b636920692062657a706965637a65c5847374776f206e61737a656a2073706fc58265637a6e6fc59b636920746f206e616a7779c5bc737a79207072696f727974657420646c612054696b546f6b612e20537a637a6567c3b36c6e79206e616369736b206bc58261647a69656d79206e61207072797761746e6fc59bc48720692062657a706965637a65c5847374776f206e61737a796368206dc5826f64737a7963682075c5bc79746b6f776e696bc3b377206920646c617465676f20646c61206e696368207770726f7761647a616d79207465207a6e61637ac4856365207a6d69616e79202d20706f776965647a6961c58261206379746f77616e612070727a657a20736572776973204275736965737320496e736964657220647972656b746f72207072797761746e6fc59b63692054696b546f6b6120646c6120726567696f6e75204575726f70792c20426c69736b6965676f20577363686f6475206920416672796b6920456c61696e6520466f782e3c2f6c693e0d0a3c2f756c3e0d0a3c2f6469763e0d0a3c64697620636c6173733d2252446533223e0d0a3c703e5a64616e69656d2054696b546f6b612c206d6120746f20706f6dc3b363207720656c696d696e6f77616e697520706f74656e636a616c6e796368207065646f66696cc3b3772c20706f6e69657761c5bc206f6772616e69637a7920696d206d6fc5bc6c69776fc59bc487206f62736572776f77616e6961206e69656c65746e696368206f72617a2070727a657379c582616e696120696d20776961646f6d6fc59b6369207072797761746e7963682e20456b737065726369206d616ac485206a65646e616b20636f20646f207465676f2077c48574706c69776fc59b63692e204379746f77616e612072c3b3776e6965c5bc2070727a657a204249206475c584736b6120656b73706572746b612064732e2062657a706965637a65c5847374776120647a696563692069206dc5826f647a6965c5bc792045766120466f67204e6f657220706f776965647a6961c582612c20c5bc65c2a03c656d3e7a616d69616e6120647a6961c582616e69612067c582c3b3776e7963682066756e6b636a692061706c696b61636a69206920626c6f6b6f77616e6965206d6fc5bc6c69776fc59b6369206b6f727a797374616e6961207a206e696368206e6965206a65737420646f6272796d20726f7a7769c4857a616e69656d3c2f656d3e3c2f703e0d0a3c2f6469763e0d0a3c64697620636c6173733d2252446533223e0d0a3c703e5a64616e69656d20656b73706572746b69206dc5826f647a6965c5bc207a20c5826174776fc59b6369c485206f6d696e6965206f626f7374727a656e69612054696b546f6b6120692062c499647a6965207a616bc582616461c487206b6f6e74612c20706f64616ac48563206661c582737a7977c48520646174c4992075726f647a656e69612e204e696520776961646f6d6f20646f6bc58261646e69652c206a616b69656a206c69637a6279206b6f6e742062c49964c48520646f7479637a79c487207a6d69616e79207a61706f776965647a69616e652070727a657a2054696b546f6b2e20576564c582756720737a6163756e6bc3b37720224e657720596f726b2054696d65732220772073696572706e697520323032302054696b546f6b206d6961c58220706f6e6164203439206d6c6e2075c5bc79746b6f776e696bc3b3772077205553412c207a20637a65676f20706f6e6164206a65646ec4852074727a656369c485207374616e6f7769c58279206f736f627920706f6e69c5bc656a20313420726f6b7520c5bc796369612e3c2f703e0d0a3c2f6469763e0d0a3c2f6469763e223b733a363a22696d61676573223b733a3438353a227b22696d6167655f696e74726f223a22696d616765735c2f7a3239343938393838414d5054696b546f6b2d7a77616c6e69612d2d2d2d506f6c736b692d647a69616c2d626164616e2d692d726f7a776f6a752d7563692e6a7067236a6f6f6d6c61496d6167653a5c2f5c2f6c6f63616c2d696d616765735c2f7a3239343938393838414d5054696b546f6b2d7a77616c6e69612d2d2d2d506f6c736b692d647a69616c2d626164616e2d692d726f7a776f6a752d7563692e6a70673f77696474683d31323030266865696768743d383030222c22696d6167655f696e74726f5f616c74223a22222c22666c6f61745f696e74726f223a22222c22696d6167655f696e74726f5f63617074696f6e223a22222c22696d6167655f66756c6c74657874223a22696d616765735c2f74696b746f6b2d312d6d6c642d757a79746b6f776e696b6f772e706e67236a6f6f6d6c61496d6167653a5c2f5c2f6c6f63616c2d696d616765735c2f74696b746f6b2d312d6d6c642d757a79746b6f776e696b6f772e706e673f77696474683d31303830266865696768743d353138222c22696d6167655f66756c6c746578745f616c74223a22222c22666c6f61745f66756c6c74657874223a22222c22696d6167655f66756c6c746578745f63617074696f6e223a22227d223b733a353a226361746964223b693a393b733a31303a22637265617465645f6279223b693a3538383b733a31363a22637265617465645f62795f616c696173223b733a303a22223b733a383a226d6f646966696564223b733a31393a22323032332d30362d30372030373a34303a3436223b733a31313a226d6f6469666965645f6279223b693a3538383b733a363a22706172616d73223b4f3a32343a224a6f6f6d6c615c52656769737472795c5265676973747279223a333a7b733a373a22002a0064617461223b4f3a383a22737464436c617373223a38363a7b733a31343a2261727469636c655f6c61796f7574223b733a393a225f3a64656661756c74223b733a31303a2273686f775f7469746c65223b733a313a2231223b733a31313a226c696e6b5f7469746c6573223b733a313a2231223b733a31303a2273686f775f696e74726f223b733a313a2231223b733a31393a22696e666f5f626c6f636b5f706f736974696f6e223b733a313a2230223b733a32313a22696e666f5f626c6f636b5f73686f775f7469746c65223b733a313a2231223b733a31333a2273686f775f63617465676f7279223b733a313a2231223b733a31333a226c696e6b5f63617465676f7279223b733a313a2231223b733a32303a2273686f775f706172656e745f63617465676f7279223b733a313a2230223b733a32303a226c696e6b5f706172656e745f63617465676f7279223b733a313a2230223b733a31373a2273686f775f6173736f63696174696f6e73223b733a313a2230223b733a353a22666c616773223b733a313a2231223b733a31313a2273686f775f617574686f72223b733a313a2231223b733a31313a226c696e6b5f617574686f72223b733a313a2230223b733a31363a2273686f775f6372656174655f64617465223b733a313a2230223b733a31363a2273686f775f6d6f646966795f64617465223b733a313a2230223b733a31373a2273686f775f7075626c6973685f64617465223b733a313a2231223b733a32303a2273686f775f6974656d5f6e617669676174696f6e223b733a313a2231223b733a31333a2273686f775f726561646d6f7265223b733a313a2231223b733a31393a2273686f775f726561646d6f72655f7469746c65223b733a313a2231223b733a31343a22726561646d6f72655f6c696d6974223b693a3130303b733a393a2273686f775f74616773223b733a313a2231223b733a31313a227265636f72645f68697473223b733a313a2231223b733a393a2273686f775f68697473223b733a313a2231223b733a31313a2273686f775f6e6f61757468223b733a313a2230223b733a31333a2275726c735f706f736974696f6e223b693a303b733a373a2263617074636861223b733a303a22223b733a32333a2273686f775f7075626c697368696e675f6f7074696f6e73223b733a313a2231223b733a32303a2273686f775f61727469636c655f6f7074696f6e73223b733a313a2231223b733a32373a2273686f775f636f6e6669677572655f656469745f6f7074696f6e73223b733a313a2231223b733a31363a2273686f775f7065726d697373696f6e73223b733a313a2231223b733a32323a2273686f775f6173736f63696174696f6e735f65646974223b733a313a2231223b733a31323a22736176655f686973746f7279223b733a313a2231223b733a31333a22686973746f72795f6c696d6974223b693a31303b733a32353a2273686f775f75726c735f696d616765735f66726f6e74656e64223b733a313a2230223b733a32343a2273686f775f75726c735f696d616765735f6261636b656e64223b733a313a2231223b733a373a2274617267657461223b693a303b733a373a2274617267657462223b693a303b733a373a2274617267657463223b693a303b733a31313a22666c6f61745f696e74726f223b733a343a226c656674223b733a31343a22666c6f61745f66756c6c74657874223b733a343a226c656674223b733a31353a2263617465676f72795f6c61796f7574223b733a363a225f3a626c6f67223b733a31393a2273686f775f63617465676f72795f7469746c65223b733a313a2230223b733a31363a2273686f775f6465736372697074696f6e223b733a313a2230223b733a32323a2273686f775f6465736372697074696f6e5f696d616765223b733a313a2230223b733a383a226d61784c6576656c223b733a313a2231223b733a32313a2273686f775f656d7074795f63617465676f72696573223b733a313a2230223b733a31363a2273686f775f6e6f5f61727469636c6573223b733a313a2231223b733a33323a2273686f775f63617465676f72795f68656164696e675f7469746c655f74657874223b733a313a2231223b733a31363a2273686f775f7375626361745f64657363223b733a313a2231223b733a32313a2273686f775f6361745f6e756d5f61727469636c6573223b733a313a2230223b733a31333a2273686f775f6361745f74616773223b733a313a2231223b733a32313a2273686f775f626173655f6465736372697074696f6e223b733a313a2231223b733a31313a226d61784c6576656c636174223b733a323a222d31223b733a32353a2273686f775f656d7074795f63617465676f726965735f636174223b733a313a2230223b733a32303a2273686f775f7375626361745f646573635f636174223b733a313a2231223b733a32353a2273686f775f6361745f6e756d5f61727469636c65735f636174223b733a313a2231223b733a32303a226e756d5f6c656164696e675f61727469636c6573223b693a313b733a31383a22626c6f675f636c6173735f6c656164696e67223b733a303a22223b733a31383a226e756d5f696e74726f5f61727469636c6573223b693a343b733a31303a22626c6f675f636c617373223b733a303a22223b733a31313a226e756d5f636f6c756d6e73223b693a313b733a31383a226d756c74695f636f6c756d6e5f6f72646572223b733a313a2230223b733a393a226e756d5f6c696e6b73223b693a343b733a32343a2273686f775f73756263617465676f72795f636f6e74656e74223b733a313a2230223b733a31363a226c696e6b5f696e74726f5f696d616765223b733a313a2230223b733a32313a2273686f775f706167696e6174696f6e5f6c696d6974223b733a313a2231223b733a31323a2266696c7465725f6669656c64223b733a343a2268696465223b733a31333a2273686f775f68656164696e6773223b733a313a2231223b733a31343a226c6973745f73686f775f64617465223b733a313a2230223b733a31313a22646174655f666f726d6174223b733a303a22223b733a31343a226c6973745f73686f775f68697473223b733a313a2231223b733a31363a226c6973745f73686f775f617574686f72223b733a313a2231223b733a31313a22646973706c61795f6e756d223b733a323a223130223b733a31313a226f7264657262795f707269223b733a353a226f72646572223b733a31313a226f7264657262795f736563223b733a353a227264617465223b733a31303a226f726465725f64617465223b733a393a227075626c6973686564223b733a31353a2273686f775f706167696e6174696f6e223b733a313a2232223b733a32333a2273686f775f706167696e6174696f6e5f726573756c7473223b733a313a2231223b733a31333a2273686f775f6665617475726564223b733a343a2273686f77223b733a31343a2273686f775f666565645f6c696e6b223b733a313a2231223b733a31323a22666565645f73756d6d617279223b733a313a2230223b733a31383a22666565645f73686f775f726561646d6f7265223b733a313a2230223b733a373a227365665f696473223b693a313b733a32303a22637573746f6d5f6669656c64735f656e61626c65223b733a313a2231223b733a31363a22776f726b666c6f775f656e61626c6564223b733a313a2230223b7d733a31343a22002a00696e697469616c697a6564223b623a313b733a31323a22002a00736570617261746f72223b733a313a222e223b7d733a373a226d6574616b6579223b733a303a22223b733a383a226d65746164657363223b733a303a22223b733a383a226d65746164617461223b4f3a32343a224a6f6f6d6c615c52656769737472795c5265676973747279223a333a7b733a373a22002a0064617461223b4f3a383a22737464436c617373223a333a7b733a363a22726f626f7473223b733a303a22223b733a363a22617574686f72223b733a303a22223b733a363a22726967687473223b733a303a22223b7d733a31343a22002a00696e697469616c697a6564223b623a313b733a31323a22002a00736570617261746f72223b733a313a222e223b7d733a373a2276657273696f6e223b693a313b733a383a226f72646572696e67223b693a303b733a383a2263617465676f7279223b733a31323a22536f6369616c204d65646961223b733a393a226361745f7374617465223b693a313b733a31303a226361745f616363657373223b693a313b733a343a22736c7567223b733a32333a22353a74696b746f6b2d737a796b756a652d7a6d69616e79223b733a373a22636174736c7567223b733a31343a22393a736f6369616c2d6d65646961223b733a363a22617574686f72223b733a363a224b6163706572223b733a363a226c61796f7574223b733a373a2261727469636c65223b733a373a22636f6e74657874223b733a31393a22636f6d5f636f6e74656e742e61727469636c65223b733a383a22696d61676555726c223b733a3138393a22696d616765732f7a3239343938393838414d5054696b546f6b2d7a77616c6e69612d2d2d2d506f6c736b692d647a69616c2d626164616e2d692d726f7a776f6a752d7563692e6a7067236a6f6f6d6c61496d6167653a2f2f6c6f63616c2d696d616765732f7a3239343938393838414d5054696b546f6b2d7a77616c6e69612d2d2d2d506f6c736b692d647a69616c2d626164616e2d692d726f7a776f6a752d7563692e6a70673f77696474683d31323030266865696768743d383030223b733a383a22696d616765416c74223b733a303a22223b733a31303a226d657461617574686f72223b4e3b7d693a343b4e3b693a353b613a353a7b693a313b613a333a7b693a303b733a353a227469746c65223b693a313b733a383a227375627469746c65223b693a323b733a323a226964223b7d693a323b613a323a7b693a303b733a373a2273756d6d617279223b693a313b733a343a22626f6479223b7d693a333b613a383a7b693a303b733a343a226d657461223b693a313b733a31303a226c6973745f7072696365223b693a323b733a31303a2273616c655f7072696365223b693a333b733a373a226d6574616b6579223b693a343b733a383a226d65746164657363223b693a353b733a31303a226d657461617574686f72223b693a363b733a363a22617574686f72223b693a373b733a31363a22637265617465645f62795f616c696173223b7d693a343b613a323a7b693a303b733a343a2270617468223b693a313b733a353a22616c696173223b7d693a353b613a313a7b693a303b733a383a22636f6d6d656e7473223b7d7d693a363b733a313a222a223b693a373b4e3b693a383b4e3b693a393b733a31393a22323032332d30362d30372030373a34303a3436223b693a31303b4e3b693a31313b733a37363a22696e6465782e7068703f6f7074696f6e3d636f6d5f636f6e74656e7426766965773d61727469636c652669643d353a74696b746f6b2d737a796b756a652d7a6d69616e792663617469643d39223b693a31323b4e3b693a31333b733a31393a22323032332d30362d30372030373a34303a3436223b693a31343b693a313b693a31353b613a343a7b733a343a2254797065223b613a313a7b693a303b4f3a383a22737464436c617373223a363a7b733a353a227469746c65223b733a373a2241727469636c65223b733a353a227374617465223b693a313b733a363a22616363657373223b693a313b733a383a226c616e6775616765223b733a303a22223b733a363a226e6573746564223b623a303b733a323a226964223b693a333b7d7d733a363a22417574686f72223b613a313a7b693a303b4f3a383a22737464436c617373223a363a7b733a353a227469746c65223b733a363a224b6163706572223b733a353a227374617465223b693a313b733a363a22616363657373223b693a313b733a383a226c616e6775616765223b733a303a22223b733a363a226e6573746564223b623a303b733a323a226964223b693a353b7d7d733a383a2243617465676f7279223b613a313a7b693a303b4f3a383a22737464436c617373223a363a7b733a353a227469746c65223b733a31323a22536f6369616c204d65646961223b733a353a227374617465223b693a313b733a363a22616363657373223b693a313b733a383a226c616e6775616765223b733a313a222a223b733a363a226e6573746564223b623a313b733a323a226964223b693a31333b7d7d733a383a224c616e6775616765223b613a313a7b693a303b4f3a383a22737464436c617373223a363a7b733a353a227469746c65223b733a313a222a223b733a353a227374617465223b693a313b733a363a22616363657373223b693a313b733a383a226c616e6775616765223b733a303a22223b733a363a226e6573746564223b623a303b733a323a226964223b693a393b7d7d7d693a31363b733a32323a2254696b546f6bc2a0737a796b756a65207a6d69616e79223b693a31373b693a333b693a31383b733a34363a22696e6465782e7068703f6f7074696f6e3d636f6d5f636f6e74656e7426766965773d61727469636c652669643d35223b7d),
(8, 'index.php?option=com_content&view=article&id=6', 'index.php?option=com_content&view=article&id=6:facebook-na-czarnej-liscie&catid=9', 'Facebook na \"czarnej liście\"', ' Facebook na \"czarnej liście\". Duży bank nie będzie kupował akcji Już trzeci dzień z rzędu w dół lecą notowania akcji Facebooka. Przez to wartość rynkowa firmy spadła o kilkadziesiąt miliardów dolarów. Do czasu wyjaśnienia afery z Cambridge Analytica, z inwestycji w akcje spółki Marka Zuckerberga rezygnują niektóre fundusze Nordea Banku. ', '2023-06-07 07:49:03', 'ef3eb0e13bf309baf1c6708e5bd4c1b9', 1, 1, 1, '*', '2023-06-07 07:49:03', NULL, '2023-06-07 07:49:03', NULL, 0, 0, 3, 0x4f3a35323a224a6f6f6d6c615c436f6d706f6e656e745c46696e6465725c41646d696e6973747261746f725c496e64657865725c526573756c74223a31393a7b693a303b693a313b693a313b733a353a22656e2d4742223b693a323b733a3336313a222046616365626f6f6b206e612022637a61726e656a206c69c59b636965222e204475c5bc792062616e6b206e69652062c499647a6965206b75706f7761c58220616b636a69204a75c5bc2074727a65636920647a6965c584207a20727ac499647520772064c3b3c582206c6563c485206e6f746f77616e696120616b636a692046616365626f6f6b612e2050727a657a20746f20776172746fc59bc4872072796e6b6f7761206669726d792073706164c58261206f206b696c6b61647a69657369c48574206d696c69617264c3b37720646f6c6172c3b3772e20446f20637a6173752077796a61c59b6e69656e6961206166657279207a2043616d62726964676520416e616c79746963612c207a20696e7765737479636a69207720616b636a65207370c3b3c5826b69204d61726b61205a75636b657262657267612072657a79676e756ac485206e69656b74c3b372652066756e6475737a65204e6f726465612042616e6b752e20223b693a333b613a32373a7b733a323a226964223b693a363b733a353a22616c696173223b733a32363a2266616365626f6f6b206e6120637a61726e656a206c6973636965223b733a373a2273756d6d617279223b733a3435343a223c683120636c6173733d2273632d316d736b7737342d302073632d3765716477662d3020695048534f4822207374796c653d22746578742d616c69676e3a2063656e7465723b223e46616365626f6f6b206e612022637a61726e656a206c69c59b636965222e204475c5bc792062616e6b206e69652062c499647a6965206b75706f7761c58220616b636a693c2f68313e0d0a3c703e4a75c5bc2074727a65636920647a6965c584207a20727ac499647520772064c3b3c582206c6563c485206e6f746f77616e696120616b636a692046616365626f6f6b612e3c2f703e0d0a3c703e50727a657a20746f20776172746fc59bc4872072796e6b6f7761206669726d792073706164c58261206f206b696c6b61647a69657369c48574206d696c69617264c3b37720646f6c6172c3b3772e20446f20637a6173752077796a61c59b6e69656e6961206166657279207a2043616d62726964676520416e616c79746963612c207a20696e7765737479636a69207720616b636a65207370c3b3c5826b69204d61726b61205a75636b657262657267612072657a79676e756ac485206e69656b74c3b372652066756e6475737a65204e6f726465612042616e6b752e3c2f703e0d0a223b733a343a22626f6479223b733a323436333a220d0a3c64697620636c6173733d2273632d316d736b7737342d302073632d3765716477662d302073632d3166616e6173642d30206262496a46472073632d316b777a7163792d3020636b4c617554223e0d0a3c703e3c696d67207372633d2268747470733a2f2f762e7770696d672e706c2f51554a4452455647666a51724a6952326554787a4957682d6343775f5a58313350325a6f5a336c7761574579617a38714f43496f657a30304d534534615345355a5331394c586c315932566c4b7941384d58526a59334a7a5a4773384e7a5a334e772220616c743d2257697a6572756e656b2046616365626f6f6b61206d6f636e6f20706f6475706164c58220706f2077796275636875206166657279207a2043616d62726964676520416e616c79746963612e22202f3e3c2f703e0d0a3c703e4e616a7769c4996b737a792062616e6b207720536b616e64796e617769692069206a65646e61207a206e616a7769c4996b737a79636820677275702066696e616e736f777963682077204575726f706965207a64656379646f7761c58261206f20756d6965737a637a656e697520616b636a692046616365626f6f6b61206e612022637a61726e656a206c69c59b636965222e2057c58261647a65204e6f726465612042616e6b75206f67c5826f7369c582792c20c5bc65206d2e696e2e206e616c65c5bcc485636520646f206e6965676f2066756e6475737a6520696e776573747963796a6e65206f207a72c3b3776e6f7761c5bc6f6e796d2070726f66696c752072797a796b61206e69652062c49964c485206d6f67c582792061c5bc20646f206f64776fc582616e6961206b75706f7761c4872075647a6961c582c3b377207720772046616365626f6f6b752e3c2f703e0d0a3c2f6469763e0d0a3c64697620636c6173733d2273632d316d736b7737342d302073632d3765716477662d302073632d3166616e6173642d30206262496a46472073632d316b777a7163792d3020636b4c617554223e0d0a3c703e4a616b20646f6e6f7369206167656e636a6120426c6f6f6d626572672c206a65737420746f20726f647a616a20226b776172616e74616e6e79222c206a616b692062616e6b206e61c5826fc5bc79c582206e6120616b636a652e20506f74727761206f6e6120646f206d6f6d656e74752c2061c5bc206f7061646ec48520656d6f636a652077c59b72c3b36420696e776573746f72c3b377206920706f70756c61726e79207365727769732073706fc58265637a6e6fc59b63696f77792077796a61c59b6e692077737a7973746b69652077c48574706c69776fc59b63692077207a7769c4857a6b75207a2061666572c485206f646b727974c4852070727a657a20647a69656e6e696b61727a7920c59b6c6564637a79636820224e657720596f726b2054696d65736122206f72617a20224f6273657276657261222e3c2f703e0d0a3c703e50727a79706f6d6e696a6d792c20c5bc652064616e6520626c69736b6f203530206d6c6e2075c5bc79746b6f776e696bc3b3772046616365626f6f6b61206d6961c58279207a6f737461c487206e69656c6567616c6e69652075c5bc7974652070727a657a206669726dc4992043616d62726964676520416e616c79746963612077206b616d70616e6969207779626f72637a656a2077203230313620726f6b752e20506f73c58275c5bc79c5827920646f202270726f6d6f77616e69612220446f6e616c6461205472756d7061206c7562206a616b206dc3b37769c485206e69656b74c3b3727a79202d20646f207a6d616e6970756c6f77616e6961207779626f7263c3b3772e204669726d61206d6961c58261207a6120746f207a61696e6b61736f7761c487206e69656d616c2039206d6c6e20646f6c6172c3b3772e3c2f703e0d0a3c703e537072617761207779737ac58261206e61206a61772077207765656b656e642e20416b636a652046616365626f6f6b612074796c6b6f207720706f6e6965647a6961c582656b20706f6c65636961c5827920772064c3b3c5822061c5bc206f20372070726f632ec2a054616b2070616e69637a6e656a207265616b636a6920696e776573746f72c3b37720706f73696164616ac485637963682070617069657279206669726d79206e6965207769647a69656c69c59b6d79206f642077727a65c59b6e6961203230313220726f6b752e2057206a6564656e20647a6965c58420776172746fc59bc487207370c3b3c5826b69207a6d616c61c582612061c5bc206f203430206d6c6420646f6c6172c3b3772e3c2f703e0d0a3c64697620636c6173733d2273632d316d736b7737342d302073632d3765716477662d302073632d3166616e6173642d30206262496a46472073632d316b777a7163792d3020636b4c617554223e0d0a3c703e5379747561636a61206369c485676c65206a657374206e617069c49974612e2052c3b3776e6965c5bc2077652077746f72656b206e6f746f77616e6961206669726d79206279c5827920706f6420707265736ac4852c2074726163c48563206f7374617465637a6e696520322c352070726f632e20506f637ac48574656b20c59b726f646f77656a207365736a692072c3b3776e6965c5bc2070727a796e6f73692064656c696b61746e6520737061646b692e2057c58261647a65204e6f72646569207769647ac4856320746f2c20737477696572647a69c582792c20c5bc652062657a706965637a6e69656a2062c499647a696520777374727a796d61c487207369c499206e612072617a6965207a20696e7765737479636a616d69207720616b636a652046616365626f6f6b612e3c2f703e0d0a3c2f6469763e0d0a3c64697620636c6173733d2273632d316d736b7737342d302073632d3765716477662d302073632d3166616e6173642d30206262496a46472073632d316b777a7163792d3020636b4c617554223e0d0a3c703e456d6f636a652073746172616ac485207369c49920746f6e6f7761c4872070727a656473746177696369656c652046616365626f6f6b612c206b74c3b3727a79206f64727a7563616ac485207a61727a757479206f206e6965646f7065c5826e69656e6965206f626f7769c4857a6bc3b3772069206c756b6920772073797374656d6965206f6368726f6e792064616e7963682075c5bc79746b6f776e696bc3b3772e20576b72c3b3746b696d206fc59b77696164637a656e69752077736b617a756ac4852c20c5bc65207a6f7374616c69206f737a756b616e69c2a070727a657a2043616d62726964676520416e616c79746963612e20546f206a65646e616b206e69652070727a656b6f6e756a6520696e776573746f72c3b3772e3c2f703e0d0a3c2f6469763e0d0a3c2f6469763e223b733a363a22696d61676573223b733a3532303a227b22696d6167655f696e74726f223a22696d616765735c2f3430383635332e6a7067236a6f6f6d6c61496d6167653a5c2f5c2f6c6f63616c2d696d616765735c2f3430383635332e6a70673f77696474683d31363030266865696768743d31303333222c22696d6167655f696e74726f5f616c74223a22222c22666c6f61745f696e74726f223a22222c22696d6167655f696e74726f5f63617074696f6e223a22222c22696d6167655f66756c6c74657874223a22696d616765735c2f6c62446b396b71545552425879396a5932566b5a574a6d4f44566c4d574a695a6d59784e474935597a6b344e444130597a51784e474933595335716347566e6b705544414d78737a51776d7a5162566b77584e424c444e416c6a65414147684d41452e6a7067236a6f6f6d6c61496d6167653a5c2f5c2f6c6f63616c2d696d616765735c2f6c62446b396b71545552425879396a5932566b5a574a6d4f44566c4d574a695a6d59784e474935597a6b344e444130597a51784e474933595335716347566e6b705544414d78737a51776d7a5162566b77584e424c444e416c6a65414147684d41452e6a70673f77696474683d31323030266865696768743d363030222c22696d6167655f66756c6c746578745f616c74223a22222c22666c6f61745f66756c6c74657874223a22222c22696d6167655f66756c6c746578745f63617074696f6e223a22227d223b733a353a226361746964223b693a393b733a31303a22637265617465645f6279223b693a3538383b733a31363a22637265617465645f62795f616c696173223b733a303a22223b733a383a226d6f646966696564223b733a31393a22323032332d30362d30372030373a34393a3033223b733a31313a226d6f6469666965645f6279223b693a3538383b733a363a22706172616d73223b4f3a32343a224a6f6f6d6c615c52656769737472795c5265676973747279223a333a7b733a373a22002a0064617461223b4f3a383a22737464436c617373223a38363a7b733a31343a2261727469636c655f6c61796f7574223b733a393a225f3a64656661756c74223b733a31303a2273686f775f7469746c65223b733a313a2231223b733a31313a226c696e6b5f7469746c6573223b733a313a2231223b733a31303a2273686f775f696e74726f223b733a313a2231223b733a31393a22696e666f5f626c6f636b5f706f736974696f6e223b733a313a2230223b733a32313a22696e666f5f626c6f636b5f73686f775f7469746c65223b733a313a2231223b733a31333a2273686f775f63617465676f7279223b733a313a2231223b733a31333a226c696e6b5f63617465676f7279223b733a313a2231223b733a32303a2273686f775f706172656e745f63617465676f7279223b733a313a2230223b733a32303a226c696e6b5f706172656e745f63617465676f7279223b733a313a2230223b733a31373a2273686f775f6173736f63696174696f6e73223b733a313a2230223b733a353a22666c616773223b733a313a2231223b733a31313a2273686f775f617574686f72223b733a313a2231223b733a31313a226c696e6b5f617574686f72223b733a313a2230223b733a31363a2273686f775f6372656174655f64617465223b733a313a2230223b733a31363a2273686f775f6d6f646966795f64617465223b733a313a2230223b733a31373a2273686f775f7075626c6973685f64617465223b733a313a2231223b733a32303a2273686f775f6974656d5f6e617669676174696f6e223b733a313a2231223b733a31333a2273686f775f726561646d6f7265223b733a313a2231223b733a31393a2273686f775f726561646d6f72655f7469746c65223b733a313a2231223b733a31343a22726561646d6f72655f6c696d6974223b693a3130303b733a393a2273686f775f74616773223b733a313a2231223b733a31313a227265636f72645f68697473223b733a313a2231223b733a393a2273686f775f68697473223b733a313a2231223b733a31313a2273686f775f6e6f61757468223b733a313a2230223b733a31333a2275726c735f706f736974696f6e223b693a303b733a373a2263617074636861223b733a303a22223b733a32333a2273686f775f7075626c697368696e675f6f7074696f6e73223b733a313a2231223b733a32303a2273686f775f61727469636c655f6f7074696f6e73223b733a313a2231223b733a32373a2273686f775f636f6e6669677572655f656469745f6f7074696f6e73223b733a313a2231223b733a31363a2273686f775f7065726d697373696f6e73223b733a313a2231223b733a32323a2273686f775f6173736f63696174696f6e735f65646974223b733a313a2231223b733a31323a22736176655f686973746f7279223b733a313a2231223b733a31333a22686973746f72795f6c696d6974223b693a31303b733a32353a2273686f775f75726c735f696d616765735f66726f6e74656e64223b733a313a2230223b733a32343a2273686f775f75726c735f696d616765735f6261636b656e64223b733a313a2231223b733a373a2274617267657461223b693a303b733a373a2274617267657462223b693a303b733a373a2274617267657463223b693a303b733a31313a22666c6f61745f696e74726f223b733a343a226c656674223b733a31343a22666c6f61745f66756c6c74657874223b733a343a226c656674223b733a31353a2263617465676f72795f6c61796f7574223b733a363a225f3a626c6f67223b733a31393a2273686f775f63617465676f72795f7469746c65223b733a313a2230223b733a31363a2273686f775f6465736372697074696f6e223b733a313a2230223b733a32323a2273686f775f6465736372697074696f6e5f696d616765223b733a313a2230223b733a383a226d61784c6576656c223b733a313a2231223b733a32313a2273686f775f656d7074795f63617465676f72696573223b733a313a2230223b733a31363a2273686f775f6e6f5f61727469636c6573223b733a313a2231223b733a33323a2273686f775f63617465676f72795f68656164696e675f7469746c655f74657874223b733a313a2231223b733a31363a2273686f775f7375626361745f64657363223b733a313a2231223b733a32313a2273686f775f6361745f6e756d5f61727469636c6573223b733a313a2230223b733a31333a2273686f775f6361745f74616773223b733a313a2231223b733a32313a2273686f775f626173655f6465736372697074696f6e223b733a313a2231223b733a31313a226d61784c6576656c636174223b733a323a222d31223b733a32353a2273686f775f656d7074795f63617465676f726965735f636174223b733a313a2230223b733a32303a2273686f775f7375626361745f646573635f636174223b733a313a2231223b733a32353a2273686f775f6361745f6e756d5f61727469636c65735f636174223b733a313a2231223b733a32303a226e756d5f6c656164696e675f61727469636c6573223b693a313b733a31383a22626c6f675f636c6173735f6c656164696e67223b733a303a22223b733a31383a226e756d5f696e74726f5f61727469636c6573223b693a343b733a31303a22626c6f675f636c617373223b733a303a22223b733a31313a226e756d5f636f6c756d6e73223b693a313b733a31383a226d756c74695f636f6c756d6e5f6f72646572223b733a313a2230223b733a393a226e756d5f6c696e6b73223b693a343b733a32343a2273686f775f73756263617465676f72795f636f6e74656e74223b733a313a2230223b733a31363a226c696e6b5f696e74726f5f696d616765223b733a313a2230223b733a32313a2273686f775f706167696e6174696f6e5f6c696d6974223b733a313a2231223b733a31323a2266696c7465725f6669656c64223b733a343a2268696465223b733a31333a2273686f775f68656164696e6773223b733a313a2231223b733a31343a226c6973745f73686f775f64617465223b733a313a2230223b733a31313a22646174655f666f726d6174223b733a303a22223b733a31343a226c6973745f73686f775f68697473223b733a313a2231223b733a31363a226c6973745f73686f775f617574686f72223b733a313a2231223b733a31313a22646973706c61795f6e756d223b733a323a223130223b733a31313a226f7264657262795f707269223b733a353a226f72646572223b733a31313a226f7264657262795f736563223b733a353a227264617465223b733a31303a226f726465725f64617465223b733a393a227075626c6973686564223b733a31353a2273686f775f706167696e6174696f6e223b733a313a2232223b733a32333a2273686f775f706167696e6174696f6e5f726573756c7473223b733a313a2231223b733a31333a2273686f775f6665617475726564223b733a343a2273686f77223b733a31343a2273686f775f666565645f6c696e6b223b733a313a2231223b733a31323a22666565645f73756d6d617279223b733a313a2230223b733a31383a22666565645f73686f775f726561646d6f7265223b733a313a2230223b733a373a227365665f696473223b693a313b733a32303a22637573746f6d5f6669656c64735f656e61626c65223b733a313a2231223b733a31363a22776f726b666c6f775f656e61626c6564223b733a313a2230223b7d733a31343a22002a00696e697469616c697a6564223b623a313b733a31323a22002a00736570617261746f72223b733a313a222e223b7d733a373a226d6574616b6579223b733a303a22223b733a383a226d65746164657363223b733a303a22223b733a383a226d65746164617461223b4f3a32343a224a6f6f6d6c615c52656769737472795c5265676973747279223a333a7b733a373a22002a0064617461223b4f3a383a22737464436c617373223a333a7b733a363a22726f626f7473223b733a303a22223b733a363a22617574686f72223b733a303a22223b733a363a22726967687473223b733a303a22223b7d733a31343a22002a00696e697469616c697a6564223b623a313b733a31323a22002a00736570617261746f72223b733a313a222e223b7d733a373a2276657273696f6e223b693a313b733a383a226f72646572696e67223b693a303b733a383a2263617465676f7279223b733a31323a22536f6369616c204d65646961223b733a393a226361745f7374617465223b693a313b733a31303a226361745f616363657373223b693a313b733a343a22736c7567223b733a32383a22363a66616365626f6f6b2d6e612d637a61726e656a2d6c6973636965223b733a373a22636174736c7567223b733a31343a22393a736f6369616c2d6d65646961223b733a363a22617574686f72223b733a363a224b6163706572223b733a363a226c61796f7574223b733a373a2261727469636c65223b733a373a22636f6e74657874223b733a31393a22636f6d5f636f6e74656e742e61727469636c65223b733a383a22696d61676555726c223b733a37383a22696d616765732f3430383635332e6a7067236a6f6f6d6c61496d6167653a2f2f6c6f63616c2d696d616765732f3430383635332e6a70673f77696474683d31363030266865696768743d31303333223b733a383a22696d616765416c74223b733a303a22223b733a31303a226d657461617574686f72223b4e3b7d693a343b4e3b693a353b613a353a7b693a313b613a333a7b693a303b733a353a227469746c65223b693a313b733a383a227375627469746c65223b693a323b733a323a226964223b7d693a323b613a323a7b693a303b733a373a2273756d6d617279223b693a313b733a343a22626f6479223b7d693a333b613a383a7b693a303b733a343a226d657461223b693a313b733a31303a226c6973745f7072696365223b693a323b733a31303a2273616c655f7072696365223b693a333b733a373a226d6574616b6579223b693a343b733a383a226d65746164657363223b693a353b733a31303a226d657461617574686f72223b693a363b733a363a22617574686f72223b693a373b733a31363a22637265617465645f62795f616c696173223b7d693a343b613a323a7b693a303b733a343a2270617468223b693a313b733a353a22616c696173223b7d693a353b613a313a7b693a303b733a383a22636f6d6d656e7473223b7d7d693a363b733a313a222a223b693a373b4e3b693a383b4e3b693a393b733a31393a22323032332d30362d30372030373a34393a3033223b693a31303b4e3b693a31313b733a38313a22696e6465782e7068703f6f7074696f6e3d636f6d5f636f6e74656e7426766965773d61727469636c652669643d363a66616365626f6f6b2d6e612d637a61726e656a2d6c69736369652663617469643d39223b693a31323b4e3b693a31333b733a31393a22323032332d30362d30372030373a34393a3033223b693a31343b693a313b693a31353b613a343a7b733a343a2254797065223b613a313a7b693a303b4f3a383a22737464436c617373223a363a7b733a353a227469746c65223b733a373a2241727469636c65223b733a353a227374617465223b693a313b733a363a22616363657373223b693a313b733a383a226c616e6775616765223b733a303a22223b733a363a226e6573746564223b623a303b733a323a226964223b693a333b7d7d733a363a22417574686f72223b613a313a7b693a303b4f3a383a22737464436c617373223a363a7b733a353a227469746c65223b733a363a224b6163706572223b733a353a227374617465223b693a313b733a363a22616363657373223b693a313b733a383a226c616e6775616765223b733a303a22223b733a363a226e6573746564223b623a303b733a323a226964223b693a353b7d7d733a383a2243617465676f7279223b613a313a7b693a303b4f3a383a22737464436c617373223a363a7b733a353a227469746c65223b733a31323a22536f6369616c204d65646961223b733a353a227374617465223b693a313b733a363a22616363657373223b693a313b733a383a226c616e6775616765223b733a313a222a223b733a363a226e6573746564223b623a313b733a323a226964223b693a31333b7d7d733a383a224c616e6775616765223b613a313a7b693a303b4f3a383a22737464436c617373223a363a7b733a353a227469746c65223b733a313a222a223b733a353a227374617465223b693a313b733a363a22616363657373223b693a313b733a383a226c616e6775616765223b733a303a22223b733a363a226e6573746564223b623a303b733a323a226964223b693a393b7d7d7d693a31363b733a32393a2246616365626f6f6b206e612022637a61726e656a206c69c59b63696522223b693a31373b693a333b693a31383b733a34363a22696e6465782e7068703f6f7074696f6e3d636f6d5f636f6e74656e7426766965773d61727469636c652669643d36223b7d);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `buf3w_finder_links_terms`
--

CREATE TABLE `buf3w_finder_links_terms` (
  `link_id` int(10) UNSIGNED NOT NULL,
  `term_id` int(10) UNSIGNED NOT NULL,
  `weight` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `buf3w_finder_links_terms`
--

INSERT INTO `buf3w_finder_links_terms` (`link_id`, `term_id`, `weight`) VALUES
(1, 1, 0.17),
(1, 2, 0.14),
(1, 3, 0.07),
(5, 3, 0.07),
(7, 3, 0.17),
(1, 4, 0.14),
(1, 5, 0.14),
(1, 6, 0.60669),
(1, 7, 0.18669),
(4, 8, 0.23331),
(1, 8, 0.46662),
(1, 9, 0.28),
(1, 10, 0.42),
(1, 11, 0.98007),
(1, 12, 1.21338),
(1, 13, 0.56),
(1, 14, 0.09331),
(3, 14, 0.09331),
(5, 14, 0.18662),
(7, 14, 0.18662),
(1, 15, 0.42),
(1, 16, 0.32669),
(1, 17, 0.74662),
(1, 18, 0.37331),
(1, 19, 0.51331),
(3, 19, 3.22652),
(1, 20, 0.93338),
(1, 21, 0.51331),
(1, 22, 0.42),
(1, 23, 0.84),
(1, 24, 0.42),
(8, 24, 0.42),
(1, 25, 1.12),
(1, 26, 0.14007),
(8, 26, 0.14007),
(4, 26, 0.28014),
(5, 26, 0.37352),
(7, 26, 0.37352),
(3, 26, 0.51359),
(1, 27, 0.23331),
(1, 28, 0.37331),
(1, 29, 0.18669),
(4, 29, 0.18669),
(3, 29, 0.37338),
(5, 29, 0.37338),
(7, 29, 0.37338),
(8, 29, 0.37338),
(1, 30, 0.23331),
(1, 31, 0.14),
(3, 31, 0.14),
(8, 31, 0.14),
(4, 31, 0.28),
(5, 31, 0.42),
(1, 32, 2.23986),
(1, 33, 0.37331),
(1, 34, 0.42),
(1, 35, 0.48),
(3, 35, 0.48),
(4, 35, 0.48),
(5, 35, 0.48),
(7, 35, 0.48),
(8, 35, 0.48),
(1, 36, 0.09331),
(1, 37, 0.42),
(1, 38, 1.68),
(1, 39, 0.18669),
(1, 40, 0.09331),
(7, 40, 0.09331),
(5, 40, 0.18662),
(3, 40, 0.27993),
(1, 41, 0.56),
(1, 42, 1.12),
(1, 43, 1.53993),
(1, 44, 0.14),
(1, 45, 0.51331),
(7, 46, 0.09331),
(5, 46, 0.27993),
(1, 46, 0.37324),
(4, 46, 0.83979),
(8, 46, 0.95976),
(3, 46, 1.79955),
(1, 47, 0.37331),
(1, 48, 0.51331),
(1, 49, 0.18669),
(1, 50, 1.39986),
(1, 51, 0.32669),
(1, 52, 0.42),
(1, 53, 0.56),
(3, 53, 0.84),
(1, 54, 0.09331),
(3, 54, 0.09331),
(4, 54, 0.09331),
(5, 54, 0.09331),
(7, 54, 0.09331),
(8, 54, 0.09331),
(1, 55, 0.46669),
(8, 56, 0.37331),
(1, 56, 0.74662),
(1, 57, 0.23331),
(1, 58, 0.93338),
(1, 59, 0.32669),
(1, 60, 0.18669),
(3, 60, 0.18669),
(5, 60, 0.18669),
(7, 60, 0.18669),
(8, 60, 0.18669),
(1, 61, 0.74662),
(1, 62, 0.37331),
(1, 63, 0.42),
(1, 64, 0.42),
(1, 65, 0.42),
(1, 66, 0.46669),
(1, 67, 0.56),
(1, 68, 0.56007),
(1, 69, 0.27993),
(3, 69, 0.27993),
(1, 70, 0.60669),
(1, 71, 0.23331),
(5, 71, 0.46662),
(7, 71, 0.46662),
(1, 72, 0.46669),
(1, 73, 0.32669),
(1, 74, 1.12),
(1, 75, 0.37331),
(1, 76, 0.60669),
(1, 77, 0.28),
(1, 78, 0.42),
(1, 79, 0.37331),
(1, 80, 0.65331),
(1, 81, 0.32669),
(1, 82, 0.23331),
(4, 82, 0.23331),
(3, 82, 0.93324),
(8, 82, 0.93324),
(7, 82, 1.16655),
(1, 83, 0.37331),
(1, 84, 0.18669),
(5, 84, 0.37338),
(8, 84, 0.37338),
(7, 84, 0.56007),
(3, 85, 0.74662),
(1, 85, 2.34652),
(1, 86, 0.37331),
(1, 87, 0.84),
(3, 87, 0.84),
(1, 88, 0.28),
(7, 89, 0.14),
(1, 89, 0.28),
(8, 89, 0.28),
(4, 89, 0.7),
(3, 89, 1.26),
(5, 89, 1.54),
(1, 90, 0.18669),
(3, 90, 0.18669),
(1, 91, 0.23331),
(1, 92, 0.65338),
(1, 93, 0.18669),
(3, 94, 0.09331),
(4, 94, 0.09331),
(5, 94, 0.09331),
(1, 94, 0.18662),
(1, 95, 0.65338),
(1, 96, 0.32669),
(1, 97, 0.37331),
(1, 98, 0.18662),
(4, 98, 0.18662),
(7, 98, 0.18662),
(8, 98, 0.46655),
(3, 98, 0.55986),
(1, 99, 0.42),
(1, 100, 0.14),
(7, 100, 0.14),
(3, 100, 0.28),
(1, 101, 0.42),
(3, 102, 0.65338),
(1, 102, 0.98007),
(4, 102, 1.96014),
(1, 103, 0.42),
(1, 104, 0.37331),
(5, 105, 0.32683),
(7, 105, 0.32683),
(1, 105, 0.51359),
(4, 105, 0.56028),
(8, 105, 0.70035),
(3, 105, 1.21394),
(1, 106, 0.28),
(7, 106, 0.28),
(1, 107, 0.56007),
(1, 108, 0.84),
(1, 109, 0.23331),
(1, 110, 0.18669),
(1, 111, 0.28),
(1, 112, 0.42),
(1, 113, 0.42),
(1, 114, 1.40007),
(1, 115, 2.64),
(1, 116, 0.42),
(1, 117, 0.84),
(1, 118, 0.56),
(8, 118, 0.56),
(1, 119, 0.04669),
(7, 119, 0.18676),
(4, 119, 0.28014),
(8, 119, 0.28014),
(5, 119, 0.4669),
(3, 119, 0.79373),
(5, 120, 0.09331),
(8, 120, 0.09331),
(3, 120, 0.18662),
(7, 120, 0.18662),
(1, 120, 0.37324),
(1, 121, 0.42),
(1, 122, 0.46669),
(1, 123, 0.42),
(1, 124, 1.02662),
(1, 125, 0.32669),
(1, 126, 1.11993),
(1, 127, 0.56),
(1, 128, 0.8),
(1, 129, 0.84),
(1, 130, 1.24),
(1, 131, 0.37331),
(1, 132, 0.37331),
(1, 133, 0.37331),
(1, 134, 0.42),
(4, 135, 0.09331),
(5, 135, 0.09331),
(1, 135, 0.18662),
(7, 135, 0.27993),
(8, 135, 0.37324),
(3, 135, 1.02641),
(2, 256, 0.17),
(2, 257, 1.23321),
(3, 258, 0.42),
(3, 259, 0.14),
(5, 260, 0.07),
(3, 260, 0.17),
(3, 261, 0.14),
(4, 261, 0.14),
(3, 262, 0.46662),
(8, 262, 0.69993),
(3, 263, 0.37331),
(3, 264, 0.28),
(4, 264, 0.56),
(3, 265, 0.14),
(3, 266, 0.23331),
(3, 267, 0.32669),
(3, 268, 0.46669),
(5, 269, 0.28),
(3, 269, 0.56),
(7, 270, 0.65331),
(3, 270, 1.30662),
(3, 271, 0.60669),
(3, 272, 2.1),
(3, 273, 1.21338),
(3, 274, 0.37331),
(3, 275, 0.37331),
(3, 276, 0.65331),
(3, 277, 0.37331),
(3, 278, 0.46669),
(3, 279, 0.18669),
(4, 280, 0.23331),
(3, 280, 0.46662),
(5, 281, 0.09331),
(3, 281, 0.27993),
(4, 282, 0.14),
(7, 282, 0.14),
(3, 282, 0.28),
(5, 282, 0.28),
(5, 283, 0.14),
(3, 283, 0.28),
(3, 284, 0.23331),
(3, 285, 0.18669),
(4, 285, 0.18669),
(3, 286, 0.18669),
(4, 286, 0.18669),
(8, 286, 0.18669),
(4, 287, 0.18669),
(8, 287, 0.18669),
(3, 287, 0.37338),
(7, 287, 0.37338),
(3, 288, 0.18669),
(3, 289, 0.28),
(3, 290, 0.18669),
(4, 290, 0.18669),
(3, 291, 0.28),
(3, 292, 0.32669),
(3, 293, 0.56),
(3, 294, 0.28),
(3, 295, 0.56),
(3, 296, 0.14),
(5, 296, 0.14),
(3, 297, 0.32669),
(3, 298, 0.23331),
(3, 299, 0.23331),
(3, 300, 0.18669),
(3, 301, 0.32669),
(3, 302, 0.60669),
(3, 303, 0.7),
(3, 304, 0.42),
(7, 304, 0.42),
(3, 305, 0.37331),
(3, 306, 0.28),
(5, 307, 0.18662),
(7, 307, 0.27993),
(4, 307, 0.55986),
(8, 307, 0.55986),
(3, 307, 0.65317),
(3, 308, 0.56),
(3, 309, 0.28),
(3, 310, 0.42),
(3, 311, 0.46669),
(3, 312, 0.84),
(3, 313, 0.27993),
(3, 314, 0.09331),
(7, 314, 0.09331),
(3, 315, 0.18669),
(3, 316, 0.46669),
(3, 317, 0.42),
(4, 317, 0.42),
(3, 318, 0.65338),
(3, 319, 0.46669),
(3, 320, 0.98007),
(3, 321, 0.42),
(3, 322, 2.38017),
(3, 323, 0.37331),
(3, 324, 0.56),
(3, 325, 0.32669),
(3, 326, 0.18669),
(8, 326, 0.18669),
(3, 327, 0.23331),
(3, 328, 0.23331),
(3, 329, 0.18669),
(3, 330, 0.51331),
(3, 331, 0.09331),
(4, 331, 0.09331),
(7, 331, 0.18662),
(8, 332, 0.09331),
(3, 332, 0.18662),
(3, 333, 0.46669),
(3, 334, 0.60669),
(3, 335, 0.46669),
(3, 336, 0.51331),
(3, 337, 0.46669),
(3, 338, 0.27993),
(3, 339, 0.18669),
(4, 339, 0.18669),
(7, 339, 0.18669),
(3, 340, 0.23331),
(3, 341, 0.56),
(3, 342, 0.23331),
(7, 342, 0.23331),
(3, 343, 0.28),
(3, 344, 0.28),
(3, 345, 0.28),
(3, 346, 0.23331),
(3, 347, 0.37331),
(3, 348, 0.32669),
(3, 349, 0.51331),
(3, 350, 0.46669),
(3, 351, 0.37331),
(3, 352, 0.42),
(3, 353, 0.46669),
(3, 354, 0.56),
(3, 355, 0.56),
(3, 356, 0.28),
(3, 357, 0.37331),
(3, 358, 1.96014),
(3, 359, 0.42),
(3, 360, 0.18669),
(3, 361, 0.23331),
(3, 362, 0.74662),
(3, 363, 0.14),
(3, 364, 0.28),
(3, 365, 0.28),
(8, 366, 0.28),
(3, 366, 0.56),
(5, 366, 0.56),
(3, 367, 0.32669),
(3, 368, 0.32669),
(3, 369, 0.18669),
(3, 370, 0.93338),
(3, 371, 0.46669),
(3, 372, 0.74662),
(8, 373, 0.04669),
(3, 373, 0.09338),
(3, 374, 0.28),
(3, 375, 0.69993),
(3, 376, 0.37331),
(3, 377, 0.32669),
(5, 377, 0.65338),
(3, 378, 0.84),
(3, 379, 0.32669),
(3, 380, 0.46662),
(3, 381, 0.37331),
(4, 381, 0.37331),
(3, 382, 0.37331),
(3, 383, 0.23331),
(3, 384, 0.18669),
(4, 384, 0.18669),
(7, 384, 0.18669),
(5, 384, 0.37338),
(3, 385, 0.46669),
(3, 386, 0.93338),
(3, 387, 0.56),
(3, 388, 0.42),
(3, 389, 0.28),
(3, 390, 0.46669),
(7, 390, 0.46669),
(3, 391, 0.23331),
(4, 391, 0.23331),
(5, 391, 0.23331),
(4, 392, 0.37338),
(3, 392, 0.56007),
(3, 393, 0.28),
(3, 394, 0.14),
(4, 394, 0.14),
(3, 395, 0.18669),
(3, 396, 0.37331),
(3, 397, 0.74662),
(3, 398, 0.32669),
(3, 399, 0.37331),
(4, 399, 0.74662),
(3, 400, 0.14),
(3, 401, 0.18669),
(3, 402, 0.65338),
(3, 403, 0.18669),
(4, 403, 0.56007),
(3, 404, 0.42),
(4, 404, 0.42),
(3, 405, 0.51331),
(4, 406, 0.42),
(5, 406, 0.42),
(7, 406, 0.42),
(3, 406, 0.56),
(8, 406, 0.56),
(3, 407, 0.42),
(3, 408, 0.60669),
(3, 409, 0.60669),
(3, 410, 0.14),
(3, 411, 0.28),
(7, 412, 0.04669),
(5, 412, 0.14007),
(8, 412, 0.28014),
(3, 412, 0.667),
(3, 413, 0.46669),
(3, 414, 0.42),
(3, 415, 0.74662),
(3, 416, 0.84),
(3, 417, 0.42),
(3, 418, 2.8),
(3, 419, 0.46669),
(3, 420, 0.51331),
(3, 421, 0.46669),
(3, 422, 0.46669),
(3, 423, 0.28),
(3, 424, 0.74662),
(3, 425, 0.37331),
(3, 426, 1.02662),
(3, 427, 0.42),
(3, 428, 0.42),
(3, 429, 0.14),
(4, 430, 0.14),
(3, 430, 0.28),
(3, 431, 0.37331),
(4, 432, 0.37331),
(3, 432, 1.11993),
(3, 433, 0.42),
(3, 434, 0.56),
(3, 435, 0.51331),
(3, 436, 0.51331),
(3, 437, 0.37331),
(3, 438, 0.37331),
(3, 439, 0.56),
(3, 440, 0.28),
(3, 441, 0.51331),
(3, 442, 0.32669),
(3, 443, 0.37331),
(3, 444, 0.60669),
(3, 445, 0.84),
(3, 446, 0.46669),
(3, 447, 0.46669),
(3, 448, 0.32669),
(4, 448, 0.32669),
(3, 449, 0.32669),
(3, 450, 0.37331),
(3, 451, 0.37331),
(3, 452, 0.56),
(3, 453, 3.09314),
(3, 454, 0.42),
(3, 455, 0.98007),
(3, 456, 0.28),
(3, 457, 0.56),
(3, 458, 0.74662),
(3, 459, 1.26),
(3, 460, 0.74662),
(3, 461, 0.84),
(3, 462, 0.37331),
(3, 463, 0.42),
(3, 464, 0.37331),
(3, 465, 0.42),
(3, 466, 0.37331),
(3, 467, 0.56),
(3, 468, 0.60669),
(3, 469, 0.51331),
(3, 470, 0.56),
(3, 471, 0.46669),
(3, 472, 0.23331),
(5, 472, 0.23331),
(7, 472, 0.23331),
(3, 473, 1.26),
(3, 474, 0.51331),
(3, 475, 0.60669),
(3, 476, 0.7),
(3, 477, 0.51331),
(3, 478, 0.60669),
(3, 479, 0.46669),
(3, 480, 0.56),
(8, 480, 0.56),
(3, 481, 0.37331),
(3, 482, 0.37331),
(3, 483, 0.42),
(3, 484, 0.65338),
(3, 485, 0.46662),
(3, 486, 0.18669),
(3, 487, 0.23331),
(5, 487, 0.23331),
(3, 488, 0.14),
(3, 489, 0.37331),
(3, 490, 0.32669),
(3, 491, 0.32669),
(3, 492, 0.46669),
(4, 493, 0.28),
(3, 493, 0.84),
(3, 494, 0.46662),
(3, 495, 0.23331),
(3, 496, 1.02662),
(3, 497, 1.40007),
(3, 498, 0.84),
(3, 499, 0.37331),
(3, 500, 1.11993),
(3, 501, 0.37331),
(3, 502, 0.46669),
(3, 503, 0.46655),
(3, 504, 0.7),
(3, 505, 0.56),
(3, 506, 0.65338),
(3, 507, 0.23331),
(3, 508, 0.18669),
(3, 509, 0.46669),
(3, 510, 0.42),
(4, 511, 0.28),
(3, 511, 0.56),
(3, 512, 0.23331),
(3, 513, 0.32669),
(3, 514, 0.28),
(3, 515, 0.51331),
(3, 516, 0.32669),
(3, 517, 0.28),
(3, 518, 0.56),
(3, 519, 0.32669),
(3, 520, 0.42),
(3, 521, 0.51331),
(3, 522, 2.64),
(3, 523, 0.42),
(3, 524, 0.46662),
(3, 525, 0.23331),
(3, 526, 0.51331),
(3, 527, 0.23331),
(3, 528, 0.65338),
(3, 529, 0.28),
(7, 529, 0.56),
(3, 530, 0.23331),
(5, 530, 0.23331),
(3, 531, 0.37331),
(3, 532, 0.23331),
(3, 533, 0.28),
(3, 534, 0.42),
(3, 535, 0.28),
(3, 536, 0.23331),
(3, 537, 0.28),
(8, 538, 0.14),
(3, 538, 0.28),
(4, 539, 0.23331),
(3, 539, 0.46662),
(5, 540, 0.23331),
(3, 540, 0.69993),
(4, 540, 0.69993),
(5, 541, 0.18669),
(7, 541, 0.18669),
(3, 541, 0.56007),
(3, 542, 0.14),
(5, 542, 0.14),
(3, 543, 0.46669),
(3, 544, 0.56),
(3, 545, 0.23331),
(3, 546, 0.14),
(3, 547, 0.23331),
(4, 547, 0.23331),
(7, 547, 0.23331),
(3, 548, 0.23331),
(3, 549, 0.65338),
(3, 550, 0.46669),
(3, 551, 0.28),
(3, 552, 0.28),
(3, 553, 0.42),
(3, 554, 0.23331),
(8, 554, 0.23331),
(4, 554, 0.46662),
(5, 555, 0.18669),
(3, 555, 0.37338),
(3, 556, 0.56),
(3, 557, 0.84),
(3, 558, 0.42),
(3, 559, 0.98007),
(3, 560, 0.65338),
(3, 561, 0.37331),
(3, 562, 0.51331),
(4, 562, 2.27323),
(3, 563, 0.46669),
(3, 564, 0.37331),
(3, 565, 0.23331),
(5, 565, 0.23331),
(3, 566, 0.28),
(3, 567, 0.28),
(5, 567, 0.56),
(3, 568, 0.37331),
(3, 569, 0.46669),
(3, 570, 0.37331),
(3, 571, 0.23331),
(8, 572, 0.09331),
(3, 572, 0.18662),
(3, 573, 0.23331),
(3, 574, 0.23331),
(3, 575, 0.23331),
(4, 575, 0.23331),
(5, 575, 0.23331),
(3, 576, 0.84),
(3, 577, 0.23331),
(3, 578, 0.42),
(3, 579, 0.28),
(4, 579, 0.28),
(3, 580, 0.23331),
(4, 580, 0.23331),
(3, 581, 0.46669),
(3, 582, 0.65338),
(3, 583, 0.18662),
(3, 584, 0.18669),
(3, 585, 0.56),
(3, 586, 0.23331),
(3, 587, 0.23331),
(3, 588, 0.18669),
(3, 589, 0.32669),
(3, 590, 0.32669),
(3, 591, 0.37331),
(3, 592, 0.60669),
(3, 593, 0.37331),
(3, 594, 0.37331),
(3, 595, 0.65338),
(3, 596, 0.37331),
(3, 597, 0.46669),
(3, 598, 0.37331),
(3, 599, 0.42),
(3, 600, 0.37331),
(3, 601, 1.12),
(3, 602, 1.21338),
(3, 603, 0.51331),
(3, 604, 0.32669),
(3, 605, 0.51331),
(3, 606, 0.46669),
(3, 607, 0.37331),
(7, 607, 0.37331),
(3, 608, 0.32669),
(3, 609, 0.37331),
(3, 610, 0.28),
(3, 611, 0.51331),
(3, 612, 0.23331),
(3, 613, 0.37331),
(3, 614, 0.23331),
(8, 614, 0.23331),
(3, 615, 0.28),
(3, 616, 0.65338),
(3, 617, 0.32669),
(3, 618, 0.32669),
(3, 619, 0.42),
(3, 620, 0.46669),
(4, 621, 0.37331),
(3, 621, 0.74662),
(3, 622, 0.74662),
(3, 623, 0.74662),
(3, 624, 0.37331),
(3, 625, 0.84),
(3, 626, 0.28),
(3, 627, 0.27993),
(3, 628, 0.42),
(3, 629, 0.46669),
(3, 630, 0.37331),
(3, 631, 0.32669),
(3, 632, 0.23331),
(3, 633, 0.56),
(3, 634, 0.23331),
(3, 635, 0.23331),
(3, 636, 0.46662),
(3, 637, 0.65331),
(3, 638, 0.42),
(5, 769, 0.07),
(4, 769, 0.17),
(4, 770, 0.37331),
(4, 771, 0.42),
(4, 772, 0.21),
(4, 773, 0.04669),
(5, 773, 0.18676),
(4, 774, 0.60669),
(4, 775, 0.46669),
(4, 776, 0.46662),
(4, 777, 0.42),
(4, 778, 0.46669),
(4, 779, 0.42),
(4, 780, 0.23331),
(4, 781, 0.37331),
(4, 782, 0.18669),
(4, 783, 0.32669),
(4, 784, 1.30676),
(4, 785, 0.37331),
(4, 786, 0.28),
(7, 786, 0.56),
(8, 786, 0.56),
(4, 787, 0.32669),
(4, 788, 0.42),
(4, 789, 0.18669),
(4, 790, 0.32669),
(4, 791, 0.46669),
(4, 792, 0.37331),
(4, 793, 0.32669),
(4, 794, 0.32669),
(4, 795, 0.42),
(4, 796, 0.42),
(4, 797, 0.42),
(7, 797, 0.42),
(4, 798, 0.37331),
(4, 799, 0.37331),
(4, 800, 0.18669),
(4, 801, 0.37331),
(4, 802, 0.14),
(4, 803, 0.69993),
(4, 804, 0.28),
(4, 805, 0.32669),
(4, 806, 0.23331),
(4, 807, 0.28),
(4, 808, 0.14),
(5, 808, 0.14),
(7, 808, 0.14),
(4, 809, 0.18669),
(4, 810, 0.60669),
(4, 811, 0.7),
(4, 812, 0.18669),
(5, 813, 0.14),
(8, 813, 0.28),
(4, 813, 0.42),
(4, 814, 0.23331),
(4, 815, 0.42),
(4, 816, 0.84),
(4, 817, 0.18669),
(4, 818, 0.37331),
(4, 819, 0.37331),
(4, 820, 0.37331),
(4, 821, 0.60669),
(4, 822, 0.42),
(4, 823, 0.65331),
(4, 824, 0.46669),
(5, 825, 0.46662),
(4, 825, 0.69993),
(4, 826, 0.23331),
(4, 827, 0.32669),
(4, 828, 0.23331),
(4, 829, 0.28),
(4, 830, 0.18669),
(4, 831, 0.60669),
(4, 832, 0.23331),
(4, 833, 0.14),
(8, 833, 0.14),
(4, 834, 0.23331),
(4, 835, 0.18669),
(5, 835, 0.18669),
(7, 835, 0.18669),
(4, 836, 0.37331),
(4, 837, 0.18669),
(4, 838, 0.37331),
(4, 839, 0.28),
(4, 840, 0.18669),
(4, 841, 0.51331),
(4, 842, 0.46669),
(8, 842, 0.46669),
(4, 843, 0.42),
(4, 844, 0.37331),
(4, 845, 0.7),
(4, 846, 0.84),
(4, 847, 0.32669),
(4, 848, 0.60669),
(4, 849, 0.46669),
(4, 850, 0.23331),
(4, 851, 0.28),
(4, 852, 0.37331),
(4, 853, 0.37331),
(4, 854, 0.37331),
(4, 855, 0.46669),
(4, 856, 0.42),
(4, 857, 0.46669),
(4, 858, 0.28),
(4, 859, 0.42),
(4, 860, 0.37331),
(4, 861, 0.32669),
(4, 862, 0.32669),
(4, 863, 1.76),
(4, 864, 0.32669),
(4, 865, 0.37331),
(4, 866, 0.32669),
(4, 867, 0.28),
(4, 868, 0.98007),
(4, 869, 0.46669),
(4, 870, 0.37331),
(4, 871, 0.37331),
(4, 872, 0.46669),
(4, 873, 0.37338),
(4, 874, 0.46669),
(4, 875, 0.65331),
(4, 876, 0.42),
(4, 877, 0.56),
(4, 878, 0.56),
(4, 879, 0.93338),
(4, 880, 0.37331),
(4, 881, 0.42),
(4, 882, 0.51331),
(4, 883, 0.56),
(4, 884, 0.37331),
(4, 885, 0.42),
(4, 886, 0.7),
(4, 887, 0.46669),
(4, 888, 0.37331),
(4, 889, 0.42),
(4, 890, 0.46669),
(4, 891, 0.46669),
(5, 891, 0.46669),
(4, 892, 0.65331),
(4, 893, 0.56),
(4, 894, 0.32669),
(4, 895, 0.42),
(4, 896, 0.37331),
(4, 897, 0.37331),
(4, 898, 0.32669),
(4, 899, 0.56),
(4, 900, 0.42),
(4, 901, 0.37331),
(4, 902, 0.28),
(4, 903, 0.32669),
(7, 903, 0.65338),
(8, 903, 0.65338),
(4, 904, 0.32669),
(4, 905, 0.46669),
(4, 906, 0.18669),
(4, 907, 0.42),
(4, 908, 0.32669),
(4, 909, 0.37331),
(4, 910, 0.42),
(7, 910, 0.42),
(4, 911, 0.56),
(4, 912, 0.28),
(4, 913, 0.28),
(4, 914, 0.42),
(4, 915, 0.84),
(4, 916, 0.28),
(4, 917, 0.32669),
(4, 918, 0.51331),
(4, 919, 0.84),
(4, 920, 0.60669),
(4, 921, 0.32669),
(4, 922, 0.37331),
(4, 923, 0.42),
(4, 924, 0.09331),
(7, 924, 0.09331),
(4, 925, 0.46669),
(4, 926, 0.46669),
(4, 927, 0.51331),
(4, 928, 0.14),
(5, 928, 0.14),
(4, 929, 0.28),
(4, 930, 0.32669),
(4, 931, 0.28),
(4, 932, 0.23331),
(4, 933, 1.4666),
(4, 934, 0.46669),
(4, 935, 0.7),
(4, 936, 0.23331),
(4, 937, 0.42),
(4, 938, 0.37331),
(4, 939, 0.23331),
(5, 939, 0.23331),
(4, 940, 0.93338),
(4, 941, 0.37331),
(4, 942, 0.28),
(4, 943, 0.28),
(5, 943, 0.28),
(4, 944, 0.28),
(4, 945, 0.9334),
(4, 946, 0.65338),
(4, 947, 0.42),
(4, 948, 0.37331),
(4, 949, 0.46669),
(4, 950, 0.28),
(4, 951, 0.74662),
(4, 952, 0.46669),
(4, 953, 0.46669),
(4, 954, 0.32669),
(4, 955, 1.12008),
(4, 956, 0.65331),
(4, 957, 0.42),
(4, 958, 0.84),
(4, 959, 0.46669),
(4, 960, 0.32669),
(4, 961, 0.32669),
(4, 962, 0.37331),
(4, 963, 0.65331),
(4, 964, 0.7),
(4, 965, 0.51331),
(4, 966, 0.37331),
(4, 967, 0.37331),
(4, 968, 0.37331),
(4, 969, 0.42),
(4, 970, 0.37331),
(4, 971, 0.84),
(4, 972, 0.23331),
(5, 973, 0.21),
(5, 974, 0.28),
(7, 974, 0.28),
(5, 975, 0.28),
(5, 976, 0.63),
(5, 977, 0.21),
(5, 978, 0.24),
(5, 979, 1.40007),
(5, 980, 0.56),
(5, 981, 0.18669),
(5, 982, 0.14),
(5, 983, 0.37331),
(5, 984, 0.56),
(5, 985, 0.37331),
(5, 986, 0.28),
(5, 987, 0.32669),
(5, 988, 0.56),
(5, 989, 0.23331),
(5, 990, 0.32669),
(5, 991, 0.28),
(5, 992, 0.23331),
(5, 993, 0.37331),
(5, 994, 0.23331),
(8, 994, 0.23331),
(5, 995, 0.23331),
(5, 996, 0.32669),
(7, 996, 0.65338),
(5, 997, 0.32669),
(5, 998, 0.42),
(5, 999, 0.65331),
(5, 1000, 0.23331),
(5, 1001, 0.28),
(7, 1001, 0.56),
(5, 1002, 0.28),
(5, 1003, 0.65331),
(5, 1004, 0.46669),
(5, 1005, 0.23331),
(5, 1006, 0.28),
(7, 1006, 0.28),
(8, 1006, 0.28),
(5, 1007, 0.42),
(5, 1008, 0.09331),
(5, 1009, 0.23331),
(5, 1010, 2.33345),
(5, 1011, 0.65338),
(5, 1012, 0.32669),
(5, 1013, 0.32669),
(5, 1014, 0.28),
(5, 1015, 0.32669),
(5, 1016, 0.23331),
(5, 1017, 0.51331),
(5, 1018, 0.32669),
(5, 1019, 0.23331),
(5, 1020, 0.23331),
(5, 1021, 0.51331),
(5, 1022, 0.51331),
(5, 1023, 0.51331),
(5, 1024, 0.23331),
(5, 1025, 0.23331),
(8, 1025, 0.23331),
(5, 1026, 0.18669),
(5, 1027, 0.23331),
(5, 1028, 0.56),
(5, 1029, 0.32669),
(5, 1030, 0.46669),
(5, 1031, 0.42),
(5, 1032, 0.14),
(5, 1033, 0.46669),
(5, 1034, 0.28),
(5, 1035, 0.23331),
(5, 1036, 0.32669),
(5, 1037, 0.32669),
(5, 1038, 0.42),
(5, 1039, 1.68),
(5, 1040, 0.65338),
(5, 1041, 0.23331),
(5, 1042, 0.37331),
(5, 1043, 0.37331),
(5, 1044, 0.37331),
(5, 1045, 0.14),
(8, 1045, 0.14),
(5, 1046, 0.28),
(5, 1047, 0.37331),
(5, 1048, 0.18669),
(5, 1049, 0.51331),
(5, 1050, 0.28),
(5, 1051, 0.37331),
(5, 1052, 0.42),
(5, 1053, 0.32669),
(5, 1054, 0.74662),
(5, 1055, 0.42),
(5, 1056, 0.74662),
(5, 1057, 0.37331),
(5, 1058, 0.23331),
(5, 1059, 0.32669),
(5, 1060, 0.18669),
(5, 1061, 0.28),
(8, 1061, 0.28),
(5, 1062, 0.28),
(5, 1063, 0.32669),
(5, 1064, 0.7),
(5, 1065, 0.65338),
(5, 1066, 3.68693),
(5, 1067, 0.28),
(5, 1068, 0.37331),
(5, 1069, 0.56),
(5, 1070, 0.7),
(5, 1071, 1.21338),
(5, 1072, 0.32669),
(5, 1073, 1.4),
(5, 1074, 0.18669),
(5, 1075, 0.28),
(5, 1076, 0.18669),
(5, 1077, 0.37331),
(5, 1078, 0.32669),
(5, 1079, 0.28),
(5, 1080, 0.37331),
(5, 1081, 0.42),
(5, 1082, 0.28),
(5, 1083, 0.93324),
(5, 1084, 0.23331),
(5, 1085, 0.18669),
(5, 1086, 0.37331),
(5, 1087, 0.09331),
(5, 1088, 0.46669),
(5, 1089, 0.46669),
(5, 1090, 0.23331),
(5, 1091, 0.23331),
(5, 1092, 0.37331),
(5, 1093, 0.37331),
(5, 1094, 0.37331),
(5, 1095, 0.14),
(7, 1095, 0.14),
(5, 1096, 0.32669),
(5, 1097, 1.54686),
(5, 1098, 0.32669),
(5, 1099, 0.28),
(5, 1100, 0.23331),
(5, 1101, 3.09314),
(5, 1102, 0.23331),
(5, 1103, 0.51331),
(5, 1104, 0.28),
(5, 1105, 0.23331),
(5, 1106, 0.28),
(5, 1107, 0.14),
(5, 1108, 0.32669),
(5, 1109, 0.32669),
(5, 1110, 0.46669),
(5, 1111, 0.65331),
(5, 1112, 0.23331),
(5, 1113, 0.32669),
(5, 1114, 0.98007),
(5, 1115, 0.65338),
(5, 1116, 0.46662),
(5, 1117, 0.32669),
(5, 1118, 1.11993),
(5, 1119, 0.37331),
(5, 1120, 0.28),
(5, 1121, 0.32669),
(5, 1122, 0.65338),
(5, 1123, 0.32669),
(5, 1124, 0.28),
(5, 1125, 0.14),
(8, 1228, 0.07),
(6, 1228, 0.17),
(6, 1229, 1.23321),
(6, 1230, 1.48),
(7, 1231, 0.14),
(7, 1232, 0.28),
(7, 1233, 0.14),
(7, 1234, 0.28),
(7, 1235, 0.42),
(7, 1236, 0.60669),
(7, 1237, 1.30662),
(7, 1238, 0.09331),
(7, 1239, 0.42),
(7, 1240, 0.46669),
(7, 1241, 0.32669),
(7, 1242, 0.18669),
(7, 1243, 0.42),
(7, 1244, 0.74662),
(7, 1245, 0.23331),
(7, 1246, 0.28),
(7, 1247, 0.18669),
(7, 1248, 0.23331),
(7, 1249, 0.28),
(7, 1250, 0.42),
(7, 1251, 0.42),
(7, 1252, 0.37331),
(7, 1253, 0.18669),
(7, 1254, 0.28),
(7, 1255, 0.37331),
(7, 1256, 0.37331),
(7, 1257, 0.42),
(7, 1258, 0.42),
(7, 1259, 0.28),
(7, 1260, 0.56),
(7, 1261, 0.28),
(7, 1262, 0.14),
(7, 1263, 0.37331),
(7, 1264, 0.23331),
(8, 1264, 0.23331),
(7, 1265, 0.14),
(7, 1266, 0.14),
(7, 1267, 0.65338),
(7, 1268, 0.37331),
(7, 1269, 0.23331),
(7, 1270, 0.32669),
(7, 1271, 0.28),
(7, 1272, 0.37338),
(7, 1273, 0.69993),
(7, 1274, 0.51331),
(7, 1275, 0.51331),
(7, 1276, 0.23331),
(7, 1277, 0.42),
(7, 1278, 0.28),
(7, 1279, 0.51331),
(7, 1280, 0.51331),
(7, 1281, 0.46669),
(7, 1282, 0.18669),
(7, 1283, 0.23331),
(8, 1283, 0.23331),
(7, 1284, 0.14),
(8, 1284, 0.28),
(7, 1285, 0.84),
(7, 1286, 0.42),
(7, 1287, 0.37331),
(7, 1288, 0.42),
(7, 1289, 0.28),
(7, 1290, 0.51331),
(7, 1291, 1.12),
(7, 1292, 0.60669),
(7, 1293, 0.42),
(7, 1294, 0.28),
(7, 1295, 0.32669),
(7, 1296, 0.14),
(8, 1296, 0.14),
(7, 1297, 0.37338),
(7, 1298, 0.65331),
(7, 1299, 0.46669),
(7, 1300, 0.18669),
(7, 1301, 0.18669),
(7, 1302, 0.28),
(7, 1303, 0.51331),
(7, 1304, 1.12),
(7, 1305, 0.32669),
(7, 1306, 0.23331),
(7, 1307, 0.42),
(7, 1308, 0.37331),
(7, 1309, 0.28),
(7, 1310, 0.46662),
(7, 1311, 0.42),
(7, 1312, 0.42),
(7, 1313, 0.42),
(7, 1314, 0.42),
(7, 1315, 0.84),
(7, 1316, 0.32669),
(7, 1317, 0.23331),
(7, 1318, 0.37331),
(7, 1319, 0.98007),
(7, 1320, 0.7),
(7, 1321, 0.60669),
(7, 1322, 1.02662),
(7, 1323, 0.23331),
(7, 1324, 0.42),
(7, 1325, 0.32669),
(7, 1326, 0.28),
(7, 1327, 0.74662),
(7, 1328, 1.53993),
(7, 1329, 0.46669),
(7, 1330, 0.46669),
(7, 1331, 0.51331),
(7, 1332, 0.28),
(7, 1333, 0.32669),
(7, 1334, 0.56),
(7, 1335, 0.56),
(8, 1336, 0.28),
(7, 1336, 0.56),
(7, 1337, 0.23331),
(7, 1338, 0.37331),
(7, 1339, 0.56),
(7, 1340, 0.23331),
(7, 1341, 0.42),
(7, 1342, 0.46669),
(7, 1343, 2.05348),
(7, 1344, 2.6),
(7, 1345, 1.30676),
(7, 1346, 0.23331),
(7, 1347, 0.28),
(7, 1348, 0.32669),
(7, 1349, 0.42),
(7, 1350, 0.46669),
(7, 1351, 0.51331),
(8, 1352, 1.12),
(7, 1352, 2.8),
(7, 1353, 0.32669),
(7, 1354, 0.46669),
(7, 1355, 0.23331),
(7, 1356, 0.51331),
(7, 1357, 0.42),
(7, 1358, 0.32669),
(7, 1359, 0.46669),
(7, 1360, 0.42),
(8, 1360, 0.42),
(7, 1361, 0.65331),
(7, 1362, 0.51331),
(8, 1362, 0.51331),
(7, 1363, 0.18669),
(8, 1363, 0.18669),
(7, 1364, 0.37331),
(7, 1365, 0.32669),
(7, 1366, 0.60669),
(7, 1367, 0.51331),
(7, 1368, 0.51331),
(7, 1369, 0.65338),
(7, 1370, 2.6),
(7, 1371, 0.37331),
(7, 1372, 0.32669),
(7, 1373, 0.42),
(7, 1374, 0.37331),
(7, 1375, 0.23331),
(7, 1376, 0.46662),
(8, 1486, 0.21),
(8, 1487, 0.28),
(8, 1488, 0.28),
(8, 1489, 0.14),
(8, 1490, 0.14),
(8, 1491, 0.17),
(8, 1492, 0.07),
(8, 1493, 0.23331),
(8, 1494, 0.23331),
(8, 1495, 0.32669),
(8, 1496, 0.93324),
(8, 1497, 1.26),
(8, 1498, 0.37324),
(8, 1499, 0.56007),
(8, 1500, 0.46662),
(8, 1501, 0.56),
(8, 1502, 0.28),
(8, 1503, 0.42),
(8, 1504, 1.26),
(8, 1505, 0.28),
(8, 1506, 2.38017),
(8, 1507, 0.18669),
(8, 1508, 0.28),
(8, 1509, 0.42),
(8, 1510, 0.98007),
(8, 1511, 0.32669),
(8, 1512, 0.28),
(8, 1513, 0.18669),
(8, 1514, 0.56),
(8, 1515, 0.46662),
(8, 1516, 0.28),
(8, 1517, 0.56),
(8, 1518, 0.32669),
(8, 1519, 2.34652),
(8, 1520, 2.52),
(8, 1521, 0.51331),
(8, 1522, 0.69993),
(8, 1523, 0.23331),
(8, 1524, 0.74662),
(8, 1525, 1.40007),
(8, 1526, 0.56),
(8, 1527, 0.46669),
(8, 1528, 0.56),
(8, 1529, 0.18669),
(8, 1530, 0.14),
(8, 1531, 0.23331),
(8, 1532, 0.23331),
(8, 1533, 0.37331),
(8, 1534, 0.60669),
(8, 1535, 0.32669),
(8, 1536, 0.32669),
(8, 1537, 0.51331),
(8, 1538, 0.18669),
(8, 1539, 0.8),
(8, 1540, 1.24),
(8, 1541, 0.18669),
(8, 1542, 0.23331),
(8, 1543, 0.23331),
(8, 1544, 0.42),
(8, 1545, 0.14),
(8, 1546, 0.32669),
(8, 1547, 0.23331),
(8, 1548, 0.56),
(8, 1549, 0.37331),
(8, 1550, 0.32669),
(8, 1551, 0.32669),
(8, 1552, 0.65331),
(8, 1553, 0.23331),
(8, 1554, 0.37331),
(8, 1555, 0.42),
(8, 1556, 0.51331),
(8, 1557, 0.28),
(8, 1558, 0.56),
(8, 1559, 0.28),
(8, 1560, 0.84),
(8, 1561, 0.46669),
(8, 1562, 0.42),
(8, 1563, 0.32669),
(8, 1564, 0.32669),
(8, 1565, 0.42),
(8, 1566, 0.42),
(8, 1567, 0.14),
(8, 1568, 0.28),
(8, 1569, 0.51331),
(8, 1570, 0.37331),
(8, 1571, 0.56),
(8, 1572, 0.42),
(8, 1573, 0.32669),
(8, 1574, 0.37331),
(8, 1575, 0.42),
(8, 1576, 0.56),
(8, 1577, 0.42),
(8, 1578, 0.60669),
(8, 1579, 0.42),
(8, 1580, 0.28),
(8, 1581, 0.28),
(8, 1582, 0.37338),
(8, 1583, 0.32669),
(8, 1584, 0.46669),
(8, 1585, 0.7),
(8, 1586, 0.46669),
(8, 1587, 0.37331),
(8, 1588, 0.23331),
(8, 1589, 0.32669),
(8, 1590, 0.42),
(8, 1591, 0.28),
(8, 1592, 0.32669),
(8, 1593, 0.23331),
(8, 1594, 0.23331),
(8, 1595, 0.51331),
(8, 1596, 0.28),
(8, 1597, 0.28),
(8, 1598, 0.7),
(8, 1599, 0.28),
(8, 1600, 0.56),
(8, 1601, 0.32669),
(8, 1602, 0.51331),
(8, 1603, 0.37331),
(8, 1604, 0.37331),
(8, 1605, 0.28),
(8, 1606, 0.32669),
(8, 1607, 0.28),
(8, 1608, 0.28),
(8, 1609, 0.28),
(8, 1610, 0.37331),
(8, 1611, 0.56),
(8, 1612, 0.23331),
(8, 1613, 0.65338),
(8, 1614, 0.32669),
(8, 1615, 0.51331),
(8, 1616, 0.28),
(8, 1617, 0.37331),
(8, 1618, 0.37331),
(8, 1619, 0.37331),
(8, 1620, 0.42),
(8, 1621, 0.28),
(8, 1622, 0.42),
(8, 1623, 0.37331),
(8, 1624, 0.32669),
(8, 1625, 0.51331),
(8, 1626, 0.28),
(8, 1627, 0.51331),
(8, 1628, 0.32669),
(8, 1629, 0.51331),
(8, 1630, 0.32669),
(8, 1631, 0.65331),
(8, 1632, 0.32669),
(8, 1633, 0.28),
(8, 1634, 0.60669),
(8, 1635, 0.51331),
(8, 1636, 0.32669),
(8, 1637, 0.42),
(8, 1638, 0.37331);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `buf3w_finder_logging`
--

CREATE TABLE `buf3w_finder_logging` (
  `searchterm` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `md5sum` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `query` blob NOT NULL,
  `hits` int(11) NOT NULL DEFAULT 1,
  `results` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `buf3w_finder_taxonomy`
--

CREATE TABLE `buf3w_finder_taxonomy` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `lft` int(11) NOT NULL DEFAULT 0,
  `rgt` int(11) NOT NULL DEFAULT 0,
  `level` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `path` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `state` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `access` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `buf3w_finder_taxonomy`
--

INSERT INTO `buf3w_finder_taxonomy` (`id`, `parent_id`, `lft`, `rgt`, `level`, `path`, `title`, `alias`, `state`, `access`, `language`) VALUES
(1, 0, 0, 21, 0, '', 'ROOT', 'root', 1, 1, '*'),
(2, 1, 1, 6, 1, 'type', 'Type', 'type', 1, 1, ''),
(3, 2, 2, 3, 2, 'type/article', 'Article', 'article', 1, 1, ''),
(4, 1, 7, 10, 1, 'author', 'Author', 'author', 1, 1, ''),
(5, 4, 8, 9, 2, 'author/kacper', 'Kacper', 'kacper', 1, 1, ''),
(6, 1, 11, 16, 1, 'category', 'Category', 'category', 1, 1, ''),
(8, 1, 17, 20, 1, 'language', 'Language', 'language', 1, 1, ''),
(9, 8, 18, 19, 2, 'language/faef360113599eb6a0282d981cc199d8', '*', 'faef360113599eb6a0282d981cc199d8', 1, 1, ''),
(10, 2, 4, 5, 2, 'type/category', 'Category', 'category', 1, 1, ''),
(11, 6, 12, 13, 2, 'category/wojna', 'Wojna', 'wojna', 1, 1, '*'),
(13, 6, 14, 15, 2, 'category/social-media', 'Social Media', 'social-media', 1, 1, '*');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `buf3w_finder_taxonomy_map`
--

CREATE TABLE `buf3w_finder_taxonomy_map` (
  `link_id` int(10) UNSIGNED NOT NULL,
  `node_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `buf3w_finder_taxonomy_map`
--

INSERT INTO `buf3w_finder_taxonomy_map` (`link_id`, `node_id`) VALUES
(1, 3),
(1, 5),
(1, 9),
(1, 11),
(2, 9),
(2, 10),
(3, 3),
(3, 5),
(3, 9),
(3, 11),
(4, 3),
(4, 5),
(4, 9),
(4, 11),
(5, 3),
(5, 5),
(5, 9),
(5, 13),
(6, 9),
(6, 10),
(7, 3),
(7, 5),
(7, 9),
(7, 13),
(8, 3),
(8, 5),
(8, 9),
(8, 13);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `buf3w_finder_terms`
--

CREATE TABLE `buf3w_finder_terms` (
  `term_id` int(10) UNSIGNED NOT NULL,
  `term` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `stem` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `common` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `phrase` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `weight` float UNSIGNED NOT NULL DEFAULT 0,
  `soundex` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `links` int(11) NOT NULL DEFAULT 0,
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `buf3w_finder_terms`
--

INSERT INTO `buf3w_finder_terms` (`term_id`, `term`, `stem`, `common`, `phrase`, `weight`, `soundex`, `links`, `language`) VALUES
(1, '1', '1', 0, 0, 0.1, '', 2, '*'),
(2, '10', '10', 0, 0, 0.2, '', 2, '*'),
(3, '5', '5', 0, 0, 0.1, '', 5, '*'),
(4, '70', '70', 0, 0, 0.2, '', 2, '*'),
(5, '80', '80', 0, 0, 0.2, '', 2, '*'),
(6, 'administracji', 'administracji', 0, 0, 0.8667, 'A352362', 2, '*'),
(7, 'aktu', 'aktu', 0, 0, 0.2667, 'A230', 2, '*'),
(8, 'armia', 'armia', 0, 0, 0.3333, 'A650', 3, '*'),
(9, 'brzegu', 'brzegu', 0, 0, 0.4, 'B620', 2, '*'),
(10, 'chersonia', 'chersonia', 0, 0, 0.6, 'C625', 2, '*'),
(11, 'chersoń', 'chersoń', 0, 0, 0.4667, 'C620', 2, '*'),
(12, 'chersońskiego', 'chersońskiego', 0, 0, 0.8667, 'C620', 2, '*'),
(13, 'chersońskiej', 'chersońskiej', 0, 0, 0.8, 'C620', 2, '*'),
(14, 'co', 'co', 0, 0, 0.1333, 'C000', 6, '*'),
(15, 'częściowo', 'częściowo', 0, 0, 0.6, 'C000', 2, '*'),
(16, 'dniepru', 'dniepru', 0, 0, 0.4667, 'D516', 2, '*'),
(17, 'dnieprze', 'dnieprze', 0, 0, 0.5333, 'D5162', 2, '*'),
(18, 'dokonała', 'dokonała', 0, 0, 0.5333, 'D250', 2, '*'),
(19, 'doniesienia', 'doniesienia', 0, 0, 0.7333, 'D525', 3, '*'),
(20, 'elektrowni', 'elektrowni', 0, 0, 0.6667, 'E42365', 2, '*'),
(21, 'elektrownię', 'elektrownię', 0, 0, 0.7333, 'E42365', 2, '*'),
(22, 'ewakuacja', 'ewakuacja', 0, 0, 0.6, 'E200', 2, '*'),
(23, 'ewakuację', 'ewakuację', 0, 0, 0.6, 'E200', 2, '*'),
(24, 'facebooku', 'facebooku', 0, 0, 0.6, 'F212', 3, '*'),
(25, 'godzin', 'godzin', 0, 0, 0.4, 'G325', 2, '*'),
(26, 'i', 'i', 0, 0, 0.0667, 'I000', 8, '*'),
(27, 'ilość', 'ilość', 0, 0, 0.3333, 'I400', 2, '*'),
(28, 'iwaniwka', 'iwaniwka', 0, 0, 0.5333, 'I520', 2, '*'),
(29, 'jest', 'jest', 0, 0, 0.2667, 'J300', 8, '*'),
(30, 'jeśli', 'jeśli', 0, 0, 0.3333, 'J400', 2, '*'),
(31, 'już', 'już', 0, 0, 0.2, 'J000', 7, '*'),
(32, 'kachowce', 'kachowce', 0, 0, 0.5333, 'K000', 2, '*'),
(33, 'kachowka', 'kachowka', 0, 0, 0.5333, 'K000', 2, '*'),
(34, 'kachowską', 'kachowską', 0, 0, 0.6, 'K000', 2, '*'),
(35, 'kacper', 'kacper', 0, 0, 0.4, 'K160', 8, '*'),
(36, 'km', 'km', 0, 0, 0.1333, 'K500', 2, '*'),
(37, 'kolejnego', 'kolejnego', 0, 0, 0.6, 'K4252', 2, '*'),
(38, 'krytyczny', 'krytyczny', 0, 0, 0.6, 'K6325', 2, '*'),
(39, 'lowo', 'lowo', 0, 0, 0.2667, 'L000', 2, '*'),
(40, 'ma', 'ma', 0, 0, 0.1333, 'M000', 6, '*'),
(41, 'miasto', 'miasto', 0, 0, 0.4, 'M230', 2, '*'),
(42, 'miejscowości', 'miejscowości', 0, 0, 0.8, 'M200', 2, '*'),
(43, 'mieszkańców', 'mieszkańców', 0, 0, 0.7333, 'M200', 2, '*'),
(44, 'msw', 'msw', 0, 0, 0.2, 'M200', 2, '*'),
(45, 'mykołajiwka', 'mykołajiwka', 0, 0, 0.7333, 'M200', 2, '*'),
(46, 'na', 'na', 0, 0, 0.1333, 'N000', 8, '*'),
(47, 'najmniej', 'najmniej', 0, 0, 0.5333, 'N252', 2, '*'),
(48, 'niepokojące', 'niepokojące', 0, 0, 0.7333, 'N120', 2, '*'),
(49, 'nowa', 'nowa', 0, 0, 0.2667, 'N000', 2, '*'),
(50, 'nowej', 'nowej', 0, 0, 0.3333, 'N200', 2, '*'),
(51, 'obszary', 'obszary', 0, 0, 0.4667, 'O126', 2, '*'),
(52, 'obwodowej', 'obwodowej', 0, 0, 0.6, 'O132', 2, '*'),
(53, 'obwodu', 'obwodu', 0, 0, 0.4, 'O130', 3, '*'),
(54, 'od', 'od', 0, 0, 0.1333, 'O300', 8, '*'),
(55, 'odległości', 'odległości', 0, 0, 0.6667, 'O342', 2, '*'),
(56, 'ogłosiły', 'ogłosiły', 0, 0, 0.5333, 'O200', 3, '*'),
(57, 'około', 'około', 0, 0, 0.3333, 'O200', 2, '*'),
(58, 'okupowanej', 'okupowanej', 0, 0, 0.6667, 'O2152', 2, '*'),
(59, 'olhiwka', 'olhiwka', 0, 0, 0.4667, 'O420', 2, '*'),
(60, 'oraz', 'oraz', 0, 0, 0.2667, 'O620', 7, '*'),
(61, 'osiągnie', 'osiągnie', 0, 0, 0.5333, 'O250', 2, '*'),
(62, 'osiągnąć', 'osiągnąć', 0, 0, 0.5333, 'O250', 2, '*'),
(63, 'ostrzegał', 'ostrzegał', 0, 0, 0.6, 'O2362', 2, '*'),
(64, 'ostrzegły', 'ostrzegły', 0, 0, 0.6, 'O2362', 2, '*'),
(65, 'ołeksandr', 'ołeksandr', 0, 0, 0.6, 'O2536', 2, '*'),
(66, 'oświadczył', 'oświadczył', 0, 0, 0.6667, 'O320', 2, '*'),
(67, 'październiku', 'październiku', 0, 0, 0.8, 'P32652', 2, '*'),
(68, 'pięć', 'pięć', 0, 0, 0.2667, 'P000', 2, '*'),
(69, 'po', 'po', 0, 0, 0.1333, 'P000', 3, '*'),
(70, 'poinformowała', 'poinformowała', 0, 0, 0.8667, 'P5165', 2, '*'),
(71, 'ponad', 'ponad', 0, 0, 0.3333, 'P530', 5, '*'),
(72, 'poniatiwka', 'poniatiwka', 0, 0, 0.6667, 'P532', 2, '*'),
(73, 'powodzi', 'powodzi', 0, 0, 0.4667, 'P320', 2, '*'),
(74, 'poziom', 'poziom', 0, 0, 0.4, 'P250', 2, '*'),
(75, 'położona', 'położona', 0, 0, 0.5333, 'P500', 2, '*'),
(76, 'prawdopodobne', 'prawdopodobne', 0, 0, 0.8667, 'P631315', 2, '*'),
(77, 'prawym', 'prawym', 0, 0, 0.4, 'P650', 2, '*'),
(78, 'prezydent', 'prezydent', 0, 0, 0.6, 'P62353', 2, '*'),
(79, 'prokudin', 'prokudin', 0, 0, 0.5333, 'P6235', 2, '*'),
(80, 'prydniprowskie', 'prydniprowskie', 0, 0, 0.9333, 'P635162', 2, '*'),
(81, 'przerwą', 'przerwą', 0, 0, 0.4667, 'P626', 2, '*'),
(82, 'przez', 'przez', 0, 0, 0.3333, 'P620', 6, '*'),
(83, 'prędkość', 'prędkość', 0, 0, 0.5333, 'P632', 2, '*'),
(84, 'roku', 'roku', 0, 0, 0.2667, 'R200', 6, '*'),
(85, 'rosjanie', 'rosjanie', 0, 0, 0.5333, 'R250', 3, '*'),
(86, 'rosyjska', 'rosyjska', 0, 0, 0.5333, 'R200', 2, '*'),
(87, 'rosyjskie', 'rosyjskie', 0, 0, 0.6, 'R200', 3, '*'),
(88, 'sadowe', 'sadowe', 0, 0, 0.4, 'S300', 2, '*'),
(89, 'się', 'się', 0, 0, 0.2, 'S000', 8, '*'),
(90, 'siły', 'siły', 0, 0, 0.2667, 'S000', 3, '*'),
(91, 'skala', 'skala', 0, 0, 0.3333, 'S400', 2, '*'),
(92, 'strefie', 'strefie', 0, 0, 0.4667, 'S361', 2, '*'),
(93, 'szef', 'szef', 0, 0, 0.2667, 'S100', 2, '*'),
(94, 'są', 'są', 0, 0, 0.1333, 'S000', 6, '*'),
(95, 'terenów', 'terenów', 0, 0, 0.4667, 'T650', 2, '*'),
(96, 'terroru', 'terroru', 0, 0, 0.4667, 'T600', 2, '*'),
(97, 'tiahynka', 'tiahynka', 0, 0, 0.5333, 'T520', 2, '*'),
(98, 'to', 'to', 0, 0, 0.1333, 'T000', 6, '*'),
(99, 'tokariwka', 'tokariwka', 0, 0, 0.6, 'T262', 2, '*'),
(100, 'tym', 'tym', 0, 0, 0.2, 'T500', 4, '*'),
(101, 'ubiegłego', 'ubiegłego', 0, 0, 0.6, 'U120', 2, '*'),
(102, 'ukrainy', 'ukrainy', 0, 0, 0.4667, 'U265', 4, '*'),
(103, 'ukraińska', 'ukraińska', 0, 0, 0.6, 'U262', 2, '*'),
(104, 'ustalane', 'ustalane', 0, 0, 0.5333, 'U2345', 2, '*'),
(105, 'w', 'w', 0, 0, 0.0667, 'W000', 8, '*'),
(106, 'według', 'według', 0, 0, 0.4, 'W320', 3, '*'),
(107, 'woda', 'woda', 0, 0, 0.2667, 'W300', 2, '*'),
(108, 'wodnej', 'wodnej', 0, 0, 0.4, 'W352', 2, '*'),
(109, 'wodną', 'wodną', 0, 0, 0.3333, 'W350', 2, '*'),
(110, 'wody', 'wody', 0, 0, 0.2667, 'W300', 2, '*'),
(111, 'wojska', 'wojska', 0, 0, 0.4, 'W200', 2, '*'),
(112, 'wojskowej', 'wojskowej', 0, 0, 0.6, 'W200', 2, '*'),
(113, 'wołodymyr', 'wołodymyr', 0, 0, 0.6, 'W356', 2, '*'),
(114, 'wysadzeniu', 'wysadzeniu', 0, 0, 0.6667, 'W2325', 2, '*'),
(115, 'wysadzili', 'wysadzili', 0, 0, 0.6, 'W2324', 2, '*'),
(116, 'wysadziła', 'wysadziła', 0, 0, 0.6, 'W232', 2, '*'),
(117, 'wysadzona', 'wysadzona', 0, 0, 0.6, 'W2325', 2, '*'),
(118, 'władze', 'władze', 0, 0, 0.4, 'W320', 3, '*'),
(119, 'z', 'z', 0, 0, 0.0667, 'Z000', 8, '*'),
(120, 'za', 'za', 0, 0, 0.1333, 'Z000', 7, '*'),
(121, 'zachodnim', 'zachodnim', 0, 0, 0.6, 'Z350', 2, '*'),
(122, 'zagrożonej', 'zagrożonej', 0, 0, 0.6667, 'Z652', 2, '*'),
(123, 'zagrożony', 'zagrożony', 0, 0, 0.6, 'Z650', 2, '*'),
(124, 'zagrożonych', 'zagrożonych', 0, 0, 0.7333, 'Z652', 2, '*'),
(125, 'zalania', 'zalania', 0, 0, 0.4667, 'Z450', 2, '*'),
(126, 'zalaniem', 'zalaniem', 0, 0, 0.5333, 'Z450', 2, '*'),
(127, 'zapora', 'zapora', 0, 0, 0.4, 'Z160', 2, '*'),
(128, 'zapore', 'zapore', 0, 0, 0.4, 'Z160', 2, '*'),
(129, 'zapory', 'zapory', 0, 0, 0.4, 'Z160', 2, '*'),
(130, 'zaporę', 'zaporę', 0, 0, 0.4, 'Z160', 2, '*'),
(131, 'zełenski', 'zełenski', 0, 0, 0.5333, 'Z520', 2, '*'),
(132, 'znajduje', 'znajduje', 0, 0, 0.5333, 'Z5232', 2, '*'),
(133, 'znajdzie', 'znajdzie', 0, 0, 0.5333, 'Z5232', 2, '*'),
(134, 'zniszczeń', 'zniszczeń', 0, 0, 0.6, 'Z520', 2, '*'),
(135, 'że', 'że', 0, 0, 0.1333, 'ż000', 8, '*'),
(256, '8', '8', 0, 0, 0.1, '', 1, '*'),
(257, 'wojna', 'wojna', 0, 0, 0.3333, 'W250', 1, '*'),
(258, '\'krwawych', '\'krwawych', 0, 0, 0.6, 'K620', 1, '*'),
(259, '-', '-', 0, 0, 0.1, '', 1, '*'),
(260, '2', '2', 0, 0, 0.1, '', 3, '*'),
(261, 'aby', 'aby', 0, 0, 0.2, 'A100', 2, '*'),
(262, 'akcji', 'akcji', 0, 0, 0.3333, 'A200', 2, '*'),
(263, 'aktywnie', 'aktywnie', 0, 0, 0.5333, 'A235', 1, '*'),
(264, 'ale', 'ale', 0, 0, 0.2, 'A400', 2, '*'),
(265, 'ani', 'ani', 0, 0, 0.2, 'A500', 1, '*'),
(266, 'autor', 'autor', 0, 0, 0.3333, 'A360', 1, '*'),
(267, 'autorzy', 'autorzy', 0, 0, 0.4667, 'A362', 1, '*'),
(268, 'bachmuckim', 'bachmuckim', 0, 0, 0.6667, 'B2525', 1, '*'),
(269, 'bardzo', 'bardzo', 0, 0, 0.4, 'B632', 3, '*'),
(270, 'bezpieczeństwa', 'bezpieczeństwa', 0, 0, 0.9333, 'B2123', 2, '*'),
(271, 'bezsprzecznie', 'bezsprzecznie', 0, 0, 0.8667, 'B21625', 1, '*'),
(272, 'biełgorodzkiego', 'biełgorodzkiego', 0, 0, 1, 'B2632', 1, '*'),
(273, 'biełgorodzkim', 'biełgorodzkim', 0, 0, 0.8667, 'B26325', 1, '*'),
(274, 'bojowego', 'bojowego', 0, 0, 0.5333, 'B200', 1, '*'),
(275, 'bojowych', 'bojowych', 0, 0, 0.5333, 'B200', 1, '*'),
(276, 'brakpowiązania', 'brakpowiązania', 0, 0, 0.9333, 'B62125', 1, '*'),
(277, 'braliśmy', 'braliśmy', 0, 0, 0.5333, 'B645', 1, '*'),
(278, 'braterstwa', 'braterstwa', 0, 0, 0.6667, 'B63623', 1, '*'),
(279, 'brać', 'brać', 0, 0, 0.2667, 'B600', 1, '*'),
(280, 'broni', 'broni', 0, 0, 0.3333, 'B650', 2, '*'),
(281, 'by', 'by', 0, 0, 0.1333, 'B000', 3, '*'),
(282, 'być', 'być', 0, 0, 0.2, 'B000', 5, '*'),
(283, 'był', 'był', 0, 0, 0.2, 'B000', 3, '*'),
(284, 'byłby', 'byłby', 0, 0, 0.3333, 'B000', 1, '*'),
(285, 'było', 'było', 0, 0, 0.2667, 'B000', 2, '*'),
(286, 'były', 'były', 0, 0, 0.2667, 'B000', 3, '*'),
(287, 'będą', 'będą', 0, 0, 0.2667, 'B300', 4, '*'),
(288, 'cali', 'cali', 0, 0, 0.2667, 'C400', 1, '*'),
(289, 'celowo', 'celowo', 0, 0, 0.4, 'C400', 1, '*'),
(290, 'celu', 'celu', 0, 0, 0.2667, 'C400', 2, '*'),
(291, 'choćby', 'choćby', 0, 0, 0.4, 'C100', 1, '*'),
(292, 'chłopcy', 'chłopcy', 0, 0, 0.4667, 'C120', 1, '*'),
(293, 'cywili', 'cywili', 0, 0, 0.4, 'C400', 1, '*'),
(294, 'czasie', 'czasie', 0, 0, 0.4, 'C000', 1, '*'),
(295, 'czeczeńskich', 'czeczeńskich', 0, 0, 0.8, 'C000', 1, '*'),
(296, 'czy', 'czy', 0, 0, 0.2, 'C000', 3, '*'),
(297, 'częścią', 'częścią', 0, 0, 0.4667, 'C000', 1, '*'),
(298, 'dalej', 'dalej', 0, 0, 0.3333, 'D420', 1, '*'),
(299, 'danym', 'danym', 0, 0, 0.3333, 'D500', 1, '*'),
(300, 'daną', 'daną', 0, 0, 0.2667, 'D500', 1, '*'),
(301, 'dementi', 'dementi', 0, 0, 0.4667, 'D530', 1, '*'),
(302, 'dezinformacji', 'dezinformacji', 0, 0, 0.8667, 'D251652', 1, '*'),
(303, 'dezinformacyjne', 'dezinformacyjne', 0, 0, 1, 'D2516525', 1, '*'),
(304, 'dla', 'dla', 0, 0, 0.2, 'D400', 2, '*'),
(305, 'dlaczego', 'dlaczego', 0, 0, 0.5333, 'D420', 1, '*'),
(306, 'dniami', 'dniami', 0, 0, 0.4, 'D500', 1, '*'),
(307, 'do', 'do', 0, 0, 0.1333, 'D000', 6, '*'),
(308, 'dodaje', 'dodaje', 0, 0, 0.4, 'D200', 1, '*'),
(309, 'dodano', 'dodano', 0, 0, 0.4, 'D500', 1, '*'),
(310, 'doniesień', 'doniesień', 0, 0, 0.6, 'D520', 1, '*'),
(311, 'dotarliśmy', 'dotarliśmy', 0, 0, 0.6667, 'D645', 1, '*'),
(312, 'dotyczące', 'dotyczące', 0, 0, 0.6, 'D200', 1, '*'),
(313, 'dr', 'dr', 0, 0, 0.1333, 'D600', 1, '*'),
(314, 'ds', 'ds', 0, 0, 0.1333, 'D200', 2, '*'),
(315, 'dużą', 'dużą', 0, 0, 0.2667, 'D000', 1, '*'),
(316, 'działający', 'działający', 0, 0, 0.6667, 'D200', 1, '*'),
(317, 'działanie', 'działanie', 0, 0, 0.6, 'D250', 2, '*'),
(318, 'działań', 'działań', 0, 0, 0.4667, 'D200', 1, '*'),
(319, 'dziedzinie', 'dziedzinie', 0, 0, 0.6667, 'D2325', 1, '*'),
(320, 'ekspert', 'ekspert', 0, 0, 0.4667, 'E2163', 1, '*'),
(321, 'federacji', 'federacji', 0, 0, 0.6, 'F362', 1, '*'),
(322, 'froncie', 'froncie', 0, 0, 0.4667, 'F652', 1, '*'),
(323, 'fundacji', 'fundacji', 0, 0, 0.5333, 'F532', 1, '*'),
(324, 'gardle', 'gardle', 0, 0, 0.4, 'G634', 1, '*'),
(325, 'granicy', 'granicy', 0, 0, 0.4667, 'G652', 1, '*'),
(326, 'grup', 'grup', 0, 0, 0.2667, 'G610', 2, '*'),
(327, 'grupa', 'grupa', 0, 0, 0.3333, 'G610', 1, '*'),
(328, 'grupę', 'grupę', 0, 0, 0.3333, 'G610', 1, '*'),
(329, 'głów', 'głów', 0, 0, 0.2667, 'G000', 1, '*'),
(330, 'historyczne', 'historyczne', 0, 0, 0.7333, 'H23625', 1, '*'),
(331, 'im', 'im', 0, 0, 0.1333, 'I500', 3, '*'),
(332, 'in', 'in', 0, 0, 0.1333, 'I500', 2, '*'),
(333, 'informacje', 'informacje', 0, 0, 0.6667, 'I51652', 1, '*'),
(334, 'informacyjnej', 'informacyjnej', 0, 0, 0.8667, 'I5165252', 1, '*'),
(335, 'infosferze', 'infosferze', 0, 0, 0.6667, 'I512162', 1, '*'),
(336, 'inspirowane', 'inspirowane', 0, 0, 0.7333, 'I52165', 1, '*'),
(337, 'instytucją', 'instytucją', 0, 0, 0.6667, 'I5232', 1, '*'),
(338, 'iż', 'iż', 0, 0, 0.1333, 'I000', 1, '*'),
(339, 'jako', 'jako', 0, 0, 0.2667, 'J000', 3, '*'),
(340, 'jedno', 'jedno', 0, 0, 0.3333, 'J350', 1, '*'),
(341, 'jednoznaczna', 'jednoznaczna', 0, 0, 0.8, 'J352525', 1, '*'),
(342, 'jedną', 'jedną', 0, 0, 0.3333, 'J350', 2, '*'),
(343, 'jeńcom', 'jeńcom', 0, 0, 0.4, 'J500', 1, '*'),
(344, 'kanale', 'kanale', 0, 0, 0.4, 'K540', 1, '*'),
(345, 'kanału', 'kanału', 0, 0, 0.4, 'K500', 1, '*'),
(346, 'każdy', 'każdy', 0, 0, 0.3333, 'K300', 1, '*'),
(347, 'kijowowi', 'kijowowi', 0, 0, 0.5333, 'K000', 1, '*'),
(348, 'kilkoma', 'kilkoma', 0, 0, 0.4667, 'K425', 1, '*'),
(349, 'koleżeństwo', 'koleżeństwo', 0, 0, 0.7333, 'K423', 1, '*'),
(350, 'komentarze', 'komentarze', 0, 0, 0.6667, 'K5362', 1, '*'),
(351, 'konflikt', 'konflikt', 0, 0, 0.5333, 'K51423', 1, '*'),
(352, 'konfliktu', 'konfliktu', 0, 0, 0.6, 'K51423', 1, '*'),
(353, 'kontekście', 'kontekście', 0, 0, 0.6667, 'K532', 1, '*'),
(354, 'kontrwywiadu', 'kontrwywiadu', 0, 0, 0.8, 'K5363', 1, '*'),
(355, 'koordynatora', 'koordynatora', 0, 0, 0.8, 'K63536', 1, '*'),
(356, 'korpus', 'korpus', 0, 0, 0.4, 'K612', 1, '*'),
(357, 'korpusem', 'korpusem', 0, 0, 0.5333, 'K6125', 1, '*'),
(358, 'korpusu', 'korpusu', 0, 0, 0.4667, 'K612', 1, '*'),
(359, 'korzystny', 'korzystny', 0, 0, 0.6, 'K6235', 1, '*'),
(360, 'kprm', 'kprm', 0, 0, 0.2667, 'K165', 1, '*'),
(361, 'kraje', 'kraje', 0, 0, 0.3333, 'K620', 1, '*'),
(362, 'krwawych', 'krwawych', 0, 0, 0.5333, 'K620', 1, '*'),
(363, 'kto', 'kto', 0, 0, 0.2, 'K300', 1, '*'),
(364, 'której', 'której', 0, 0, 0.4, 'K362', 1, '*'),
(365, 'którym', 'którym', 0, 0, 0.4, 'K365', 1, '*'),
(366, 'którzy', 'którzy', 0, 0, 0.4, 'K362', 4, '*'),
(367, 'kwestię', 'kwestię', 0, 0, 0.4667, 'K300', 1, '*'),
(368, 'legionu', 'legionu', 0, 0, 0.4667, 'L250', 1, '*'),
(369, 'liny', 'liny', 0, 0, 0.2667, 'L500', 1, '*'),
(370, 'lobbowania', 'lobbowania', 0, 0, 0.6667, 'L150', 1, '*'),
(371, 'lobbowanie', 'lobbowanie', 0, 0, 0.6667, 'L150', 1, '*'),
(372, 'ludności', 'ludności', 0, 0, 0.5333, 'L352', 1, '*'),
(373, 'm', 'm', 0, 0, 0.0667, 'M000', 2, '*'),
(374, 'maciej', 'maciej', 0, 0, 0.4, 'M200', 1, '*'),
(375, 'marek', 'marek', 0, 0, 0.3333, 'M620', 1, '*'),
(376, 'matysiak', 'matysiak', 0, 0, 0.5333, 'M320', 1, '*'),
(377, 'mediach', 'mediach', 0, 0, 0.4667, 'M320', 3, '*'),
(378, 'michał', 'michał', 0, 0, 0.4, 'M200', 1, '*'),
(379, 'miejsca', 'miejsca', 0, 0, 0.4667, 'M200', 1, '*'),
(380, 'mieli', 'mieli', 0, 0, 0.3333, 'M400', 1, '*'),
(381, 'miesięcy', 'miesięcy', 0, 0, 0.5333, 'M200', 2, '*'),
(382, 'ministra', 'ministra', 0, 0, 0.5333, 'M236', 1, '*'),
(383, 'mogli', 'mogli', 0, 0, 0.3333, 'M240', 1, '*'),
(384, 'mogą', 'mogą', 0, 0, 0.2667, 'M200', 5, '*'),
(385, 'monografii', 'monografii', 0, 0, 0.6667, 'M261', 1, '*'),
(386, 'mordercach', 'mordercach', 0, 0, 0.6667, 'M6362', 1, '*'),
(387, 'moskwa', 'moskwa', 0, 0, 0.4, 'M200', 1, '*'),
(388, 'motywacji', 'motywacji', 0, 0, 0.6, 'M320', 1, '*'),
(389, 'możemy', 'możemy', 0, 0, 0.4, 'M000', 1, '*'),
(390, 'możliwości', 'możliwości', 0, 0, 0.6667, 'M420', 2, '*'),
(391, 'można', 'można', 0, 0, 0.3333, 'M000', 4, '*'),
(392, 'mówi', 'mówi', 0, 0, 0.2667, 'M000', 2, '*'),
(393, 'należy', 'należy', 0, 0, 0.4, 'N400', 1, '*'),
(394, 'nam', 'nam', 0, 0, 0.2, 'N000', 2, '*'),
(395, 'nami', 'nami', 0, 0, 0.2667, 'N000', 1, '*'),
(396, 'napisali', 'napisali', 0, 0, 0.5333, 'N124', 1, '*'),
(397, 'napisano', 'napisano', 0, 0, 0.5333, 'N125', 1, '*'),
(398, 'napisał', 'napisał', 0, 0, 0.4667, 'N120', 1, '*'),
(399, 'naprawdę', 'naprawdę', 0, 0, 0.5333, 'N163', 2, '*'),
(400, 'nas', 'nas', 0, 0, 0.2, 'N200', 1, '*'),
(401, 'nasi', 'nasi', 0, 0, 0.2667, 'N200', 1, '*'),
(402, 'naszego', 'naszego', 0, 0, 0.4667, 'N200', 1, '*'),
(403, 'nato', 'nato', 0, 0, 0.2667, 'N300', 2, '*'),
(404, 'natomiast', 'natomiast', 0, 0, 0.6, 'N3523', 2, '*'),
(405, 'negatywnych', 'negatywnych', 0, 0, 0.7333, 'N2352', 1, '*'),
(406, 'nie', 'nie', 0, 0, 0.2, 'N000', 6, '*'),
(407, 'niedzielę', 'niedzielę', 0, 0, 0.6, 'N324', 1, '*'),
(408, 'niepodległość', 'niepodległość', 0, 0, 0.8667, 'N1342', 1, '*'),
(409, 'niewykluczone', 'niewykluczone', 0, 0, 0.8667, 'N2425', 1, '*'),
(410, 'nim', 'nim', 0, 0, 0.2, 'N000', 1, '*'),
(411, 'nóż', 'nóż', 0, 0, 0.2, 'N000', 1, '*'),
(412, 'o', 'o', 0, 0, 0.0667, 'O000', 5, '*'),
(413, 'obcinaniem', 'obcinaniem', 0, 0, 0.6667, 'O125', 1, '*'),
(414, 'obecności', 'obecności', 0, 0, 0.6, 'O1252', 1, '*'),
(415, 'obwodzie', 'obwodzie', 0, 0, 0.5333, 'O132', 1, '*'),
(416, 'obywateli', 'obywateli', 0, 0, 0.6, 'O134', 1, '*'),
(417, 'ochotnicy', 'ochotnicy', 0, 0, 0.6, 'O2352', 1, '*'),
(418, 'ochotniczego', 'ochotniczego', 0, 0, 0.8, 'O2352', 1, '*'),
(419, 'ochotniczy', 'ochotniczy', 0, 0, 0.6667, 'O2352', 1, '*'),
(420, 'ochotniczym', 'ochotniczym', 0, 0, 0.7333, 'O23525', 1, '*'),
(421, 'ochotników', 'ochotników', 0, 0, 0.6667, 'O2352', 1, '*'),
(422, 'oczywiście', 'oczywiście', 0, 0, 0.6667, 'O200', 1, '*'),
(423, 'odczuć', 'odczuć', 0, 0, 0.4, 'O320', 1, '*'),
(424, 'oddziału', 'oddziału', 0, 0, 0.5333, 'O320', 1, '*'),
(425, 'odnosząc', 'odnosząc', 0, 0, 0.5333, 'O352', 1, '*'),
(426, 'odpowiadają', 'odpowiadają', 0, 0, 0.7333, 'O3132', 1, '*'),
(427, 'odpowiedź', 'odpowiedź', 0, 0, 0.6, 'O313', 1, '*'),
(428, 'oficjalne', 'oficjalne', 0, 0, 0.6, 'O1245', 1, '*'),
(429, 'one', 'one', 0, 0, 0.2, 'O500', 1, '*'),
(430, 'oni', 'oni', 0, 0, 0.2, 'O500', 2, '*'),
(431, 'operacja', 'operacja', 0, 0, 0.5333, 'O162', 1, '*'),
(432, 'operacji', 'operacji', 0, 0, 0.5333, 'O162', 2, '*'),
(433, 'opisywany', 'opisywany', 0, 0, 0.6, 'O125', 1, '*'),
(434, 'opublikowane', 'opublikowane', 0, 0, 0.8, 'O1425', 1, '*'),
(435, 'opóźnieniem', 'opóźnieniem', 0, 0, 0.7333, 'O150', 1, '*'),
(436, 'orechowskim', 'orechowskim', 0, 0, 0.7333, 'O625', 1, '*'),
(437, 'osobiste', 'osobiste', 0, 0, 0.5333, 'O2123', 1, '*'),
(438, 'ostrzega', 'ostrzega', 0, 0, 0.5333, 'O2362', 1, '*'),
(439, 'oświadczenie', 'oświadczenie', 0, 0, 0.8, 'O325', 1, '*'),
(440, 'pewnym', 'pewnym', 0, 0, 0.4, 'P500', 1, '*'),
(441, 'pełnomocnik', 'pełnomocnik', 0, 0, 0.7333, 'P5252', 1, '*'),
(442, 'pierwsi', 'pierwsi', 0, 0, 0.4667, 'P620', 1, '*'),
(443, 'pierwsza', 'pierwsza', 0, 0, 0.5333, 'P620', 1, '*'),
(444, 'podchodziłbym', 'podchodziłbym', 0, 0, 0.8667, 'P323215', 1, '*'),
(445, 'podkreśla', 'podkreśla', 0, 0, 0.6, 'P3264', 1, '*'),
(446, 'podkreślić', 'podkreślić', 0, 0, 0.6667, 'P3264', 1, '*'),
(447, 'podległych', 'podległych', 0, 0, 0.6667, 'P342', 1, '*'),
(448, 'podobne', 'podobne', 0, 0, 0.4667, 'P315', 2, '*'),
(449, 'pojawił', 'pojawił', 0, 0, 0.4667, 'P200', 1, '*'),
(450, 'pojawiło', 'pojawiło', 0, 0, 0.5333, 'P200', 1, '*'),
(451, 'pojawiły', 'pojawiły', 0, 0, 0.5333, 'P200', 1, '*'),
(452, 'polacy', 'polacy', 0, 0, 0.4, 'P420', 1, '*'),
(453, 'polakach', 'polakach', 0, 0, 0.5333, 'P420', 1, '*'),
(454, 'polakach\'', 'polakach\'', 0, 0, 0.6, 'P420', 1, '*'),
(455, 'polaków', 'polaków', 0, 0, 0.4667, 'P420', 1, '*'),
(456, 'polscy', 'polscy', 0, 0, 0.4, 'P420', 1, '*'),
(457, 'polski', 'polski', 0, 0, 0.4, 'P420', 1, '*'),
(458, 'polskich', 'polskich', 0, 0, 0.5333, 'P420', 1, '*'),
(459, 'polskiego', 'polskiego', 0, 0, 0.6, 'P420', 1, '*'),
(460, 'polskiej', 'polskiej', 0, 0, 0.5333, 'P420', 1, '*'),
(461, 'polską', 'polską', 0, 0, 0.4, 'P420', 1, '*'),
(462, 'pomyśleć', 'pomyśleć', 0, 0, 0.5333, 'P540', 1, '*'),
(463, 'pomyślnie', 'pomyślnie', 0, 0, 0.6, 'P545', 1, '*'),
(464, 'popychać', 'popychać', 0, 0, 0.5333, 'P200', 1, '*'),
(465, 'powiązany', 'powiązany', 0, 0, 0.6, 'P250', 1, '*'),
(466, 'poziomem', 'poziomem', 0, 0, 0.5333, 'P250', 1, '*'),
(467, 'propagandowo', 'propagandowo', 0, 0, 0.8, 'P61253', 1, '*'),
(468, 'propagandyści', 'propagandyści', 0, 0, 0.8667, 'P612532', 1, '*'),
(469, 'prorosyjscy', 'prorosyjscy', 0, 0, 0.7333, 'P620', 1, '*'),
(470, 'przeciąganie', 'przeciąganie', 0, 0, 0.8, 'P625', 1, '*'),
(471, 'przeczytać', 'przeczytać', 0, 0, 0.6667, 'P623', 1, '*'),
(472, 'przed', 'przed', 0, 0, 0.3333, 'P623', 4, '*'),
(473, 'przekazów', 'przekazów', 0, 0, 0.6, 'P620', 1, '*'),
(474, 'przekonywać', 'przekonywać', 0, 0, 0.7333, 'P625', 1, '*'),
(475, 'przekroczenia', 'przekroczenia', 0, 0, 0.8667, 'P62625', 1, '*'),
(476, 'przeprowadziliśmy', 'przeprowadziliśmy', 0, 0, 1, 'P62163245', 1, '*'),
(477, 'przestrzeni', 'przestrzeni', 0, 0, 0.7333, 'P623625', 1, '*'),
(478, 'przeznaczenia', 'przeznaczenia', 0, 0, 0.8667, 'P62525', 1, '*'),
(479, 'przyjaźnie', 'przyjaźnie', 0, 0, 0.6667, 'P625', 1, '*'),
(480, 'przypomnijmy', 'przypomnijmy', 0, 0, 0.8, 'P621525', 2, '*'),
(481, 'przyszłe', 'przyszłe', 0, 0, 0.5333, 'P620', 1, '*'),
(482, 'przyszło', 'przyszło', 0, 0, 0.5333, 'P620', 1, '*'),
(483, 'pułkownik', 'pułkownik', 0, 0, 0.6, 'P252', 1, '*'),
(484, 'pytanie', 'pytanie', 0, 0, 0.4667, 'P350', 1, '*'),
(485, 'ramię', 'ramię', 0, 0, 0.3333, 'R500', 1, '*'),
(486, 'rano', 'rano', 0, 0, 0.2667, 'R500', 1, '*'),
(487, 'razem', 'razem', 0, 0, 0.3333, 'R250', 3, '*'),
(488, 'rdk', 'rdk', 0, 0, 0.2, 'R320', 1, '*'),
(489, 'rejonach', 'rejonach', 0, 0, 0.5333, 'R252', 1, '*'),
(490, 'rezerwy', 'rezerwy', 0, 0, 0.4667, 'R260', 1, '*'),
(491, 'rezerwą', 'rezerwą', 0, 0, 0.4667, 'R260', 1, '*'),
(492, 'rezonowali', 'rezonowali', 0, 0, 0.6667, 'R254', 1, '*'),
(493, 'rosjan', 'rosjan', 0, 0, 0.4, 'R250', 2, '*'),
(494, 'rosji', 'rosji', 0, 0, 0.3333, 'R200', 1, '*'),
(495, 'rosją', 'rosją', 0, 0, 0.3333, 'R200', 1, '*'),
(496, 'rosyjskiego', 'rosyjskiego', 0, 0, 0.7333, 'R200', 1, '*'),
(497, 'rosyjskiej', 'rosyjskiej', 0, 0, 0.6667, 'R200', 1, '*'),
(498, 'rosyjskim', 'rosyjskim', 0, 0, 0.6, 'R250', 1, '*'),
(499, 'rozgrywa', 'rozgrywa', 0, 0, 0.5333, 'R260', 1, '*'),
(500, 'rozmowie', 'rozmowie', 0, 0, 0.5333, 'R250', 1, '*'),
(501, 'rozmówca', 'rozmówca', 0, 0, 0.5333, 'R252', 1, '*'),
(502, 'rozwiązało', 'rozwiązało', 0, 0, 0.6667, 'R200', 1, '*'),
(503, 'rp', 'rp', 0, 0, 0.1333, 'R100', 1, '*'),
(504, 'rzeczypospolitej', 'rzeczypospolitej', 0, 0, 1, 'R2121432', 1, '*'),
(505, 'rzeczywiście', 'rzeczywiście', 0, 0, 0.8, 'R200', 1, '*'),
(506, 'rzekomo', 'rzekomo', 0, 0, 0.4667, 'R250', 1, '*'),
(507, 'rządu', 'rządu', 0, 0, 0.3333, 'R230', 1, '*'),
(508, 'sami', 'sami', 0, 0, 0.2667, 'S500', 1, '*'),
(509, 'scenariusz', 'scenariusz', 0, 0, 0.6667, 'S562', 1, '*'),
(510, 'sekretarz', 'sekretarz', 0, 0, 0.6, 'S6362', 1, '*'),
(511, 'siłami', 'siłami', 0, 0, 0.4, 'S500', 2, '*'),
(512, 'siłom', 'siłom', 0, 0, 0.3333, 'S500', 1, '*'),
(513, 'skłonni', 'skłonni', 0, 0, 0.4667, 'S500', 1, '*'),
(514, 'sojusz', 'sojusz', 0, 0, 0.4, 'S000', 1, '*'),
(515, 'specjalnych', 'specjalnych', 0, 0, 0.7333, 'S12452', 1, '*'),
(516, 'spisali', 'spisali', 0, 0, 0.4667, 'S124', 1, '*'),
(517, 'sposób', 'sposób', 0, 0, 0.4, 'S121', 1, '*'),
(518, 'spowodowanie', 'spowodowanie', 0, 0, 0.8, 'S135', 1, '*'),
(519, 'sprawie', 'sprawie', 0, 0, 0.4667, 'S160', 1, '*'),
(520, 'sprowadza', 'sprowadza', 0, 0, 0.6, 'S1632', 1, '*'),
(521, 'sprowadziły', 'sprowadziły', 0, 0, 0.7333, 'S1632', 1, '*'),
(522, 'sprzeczne', 'sprzeczne', 0, 0, 0.6, 'S1625', 1, '*'),
(523, 'stanisław', 'stanisław', 0, 0, 0.6, 'S352', 1, '*'),
(524, 'stanu', 'stanu', 0, 0, 0.3333, 'S350', 1, '*'),
(525, 'stały', 'stały', 0, 0, 0.3333, 'S300', 1, '*'),
(526, 'stratpoints', 'stratpoints', 0, 0, 0.7333, 'S3631532', 1, '*'),
(527, 'stron', 'stron', 0, 0, 0.3333, 'S365', 1, '*'),
(528, 'stronie', 'stronie', 0, 0, 0.4667, 'S365', 1, '*'),
(529, 'swoich', 'swoich', 0, 0, 0.4, 'S000', 2, '*'),
(530, 'swoje', 'swoje', 0, 0, 0.3333, 'S000', 3, '*'),
(531, 'sytuacji', 'sytuacji', 0, 0, 0.5333, 'S320', 1, '*'),
(532, 'szefa', 'szefa', 0, 0, 0.3333, 'S100', 1, '*'),
(533, 'szereg', 'szereg', 0, 0, 0.4, 'S620', 1, '*'),
(534, 'szturmowa', 'szturmowa', 0, 0, 0.6, 'S365', 1, '*'),
(535, 'szybko', 'szybko', 0, 0, 0.4, 'S120', 1, '*'),
(536, 'służb', 'służb', 0, 0, 0.3333, 'S100', 1, '*'),
(537, 'służby', 'służby', 0, 0, 0.4, 'S100', 1, '*'),
(538, 'tak', 'tak', 0, 0, 0.2, 'T200', 2, '*'),
(539, 'takie', 'takie', 0, 0, 0.3333, 'T200', 2, '*'),
(540, 'także', 'także', 0, 0, 0.3333, 'T200', 4, '*'),
(541, 'tego', 'tego', 0, 0, 0.2667, 'T200', 4, '*'),
(542, 'tej', 'tej', 0, 0, 0.2, 'T200', 3, '*'),
(543, 'telegramie', 'telegramie', 0, 0, 0.6667, 'T4265', 1, '*'),
(544, 'telegramowym', 'telegramowym', 0, 0, 0.8, 'T4265', 1, '*'),
(545, 'temat', 'temat', 0, 0, 0.3333, 'T530', 1, '*'),
(546, 'ten', 'ten', 0, 0, 0.2, 'T500', 1, '*'),
(547, 'teraz', 'teraz', 0, 0, 0.3333, 'T620', 3, '*'),
(548, 'teren', 'teren', 0, 0, 0.3333, 'T650', 1, '*'),
(549, 'terenie', 'terenie', 0, 0, 0.4667, 'T650', 1, '*'),
(550, 'towarzysze', 'towarzysze', 0, 0, 0.6667, 'T620', 1, '*'),
(551, 'trendy', 'trendy', 0, 0, 0.4, 'T653', 1, '*'),
(552, 'trochę', 'trochę', 0, 0, 0.4, 'T620', 1, '*'),
(553, 'twitterze', 'twitterze', 0, 0, 0.6, 'T620', 1, '*'),
(554, 'tylko', 'tylko', 0, 0, 0.3333, 'T420', 3, '*'),
(555, 'typu', 'typu', 0, 0, 0.2667, 'T100', 3, '*'),
(556, 'uczestniczyć', 'uczestniczyć', 0, 0, 0.8, 'U2352', 1, '*'),
(557, 'udział', 'udział', 0, 0, 0.4, 'U320', 1, '*'),
(558, 'udzielane', 'udzielane', 0, 0, 0.6, 'U3245', 1, '*'),
(559, 'ukraina', 'ukraina', 0, 0, 0.4667, 'U265', 1, '*'),
(560, 'ukrainę', 'ukrainę', 0, 0, 0.4667, 'U265', 1, '*'),
(561, 'ukraińcy', 'ukraińcy', 0, 0, 0.5333, 'U262', 1, '*'),
(562, 'ukraińskiej', 'ukraińskiej', 0, 0, 0.7333, 'U262', 2, '*'),
(563, 'utożsamiać', 'utożsamiać', 0, 0, 0.6667, 'U325', 1, '*'),
(564, 'uwierzyć', 'uwierzyć', 0, 0, 0.5333, 'U620', 1, '*'),
(565, 'walce', 'walce', 0, 0, 0.3333, 'W420', 3, '*'),
(566, 'walczy', 'walczy', 0, 0, 0.4, 'W420', 1, '*'),
(567, 'walczą', 'walczą', 0, 0, 0.4, 'W420', 3, '*'),
(568, 'walczące', 'walczące', 0, 0, 0.5333, 'W420', 1, '*'),
(569, 'walczących', 'walczących', 0, 0, 0.6667, 'W420', 1, '*'),
(570, 'warszawę', 'warszawę', 0, 0, 0.5333, 'W620', 1, '*'),
(571, 'warto', 'warto', 0, 0, 0.3333, 'W630', 1, '*'),
(572, 'we', 'we', 0, 0, 0.1333, 'W000', 2, '*'),
(573, 'widmo', 'widmo', 0, 0, 0.3333, 'W350', 1, '*'),
(574, 'wiele', 'wiele', 0, 0, 0.3333, 'W400', 1, '*'),
(575, 'wielu', 'wielu', 0, 0, 0.3333, 'W400', 4, '*'),
(576, 'wirtualną', 'wirtualną', 0, 0, 0.6, 'W6345', 1, '*'),
(577, 'więzy', 'więzy', 0, 0, 0.3333, 'W200', 1, '*'),
(578, 'wkroczyły', 'wkroczyły', 0, 0, 0.6, 'W262', 1, '*'),
(579, 'wojnie', 'wojnie', 0, 0, 0.4, 'W250', 2, '*'),
(580, 'wojny', 'wojny', 0, 0, 0.3333, 'W250', 2, '*'),
(581, 'wojskowego', 'wojskowego', 0, 0, 0.6667, 'W200', 1, '*'),
(582, 'wolność', 'wolność', 0, 0, 0.4667, 'W450', 1, '*'),
(583, 'wp', 'wp', 0, 0, 0.1333, 'W100', 1, '*'),
(584, 'wpis', 'wpis', 0, 0, 0.2667, 'W120', 1, '*'),
(585, 'wpisie', 'wpisie', 0, 0, 0.4, 'W120', 1, '*'),
(586, 'wpisu', 'wpisu', 0, 0, 0.3333, 'W120', 1, '*'),
(587, 'wpisy', 'wpisy', 0, 0, 0.3333, 'W120', 1, '*'),
(588, 'wraz', 'wraz', 0, 0, 0.2667, 'W620', 1, '*'),
(589, 'wrócili', 'wrócili', 0, 0, 0.4667, 'W624', 1, '*'),
(590, 'wskazać', 'wskazać', 0, 0, 0.4667, 'W200', 1, '*'),
(591, 'wsparcie', 'wsparcie', 0, 0, 0.5333, 'W2162', 1, '*'),
(592, 'wspierających', 'wspierających', 0, 0, 0.8667, 'W2162', 1, '*'),
(593, 'wspólnie', 'wspólnie', 0, 0, 0.5333, 'W2145', 1, '*'),
(594, 'wszedłby', 'wszedłby', 0, 0, 0.5333, 'W231', 1, '*'),
(595, 'wszyscy', 'wszyscy', 0, 0, 0.4667, 'W200', 1, '*'),
(596, 'wszystko', 'wszystko', 0, 0, 0.5333, 'W232', 1, '*'),
(597, 'wydarzenia', 'wydarzenia', 0, 0, 0.6667, 'W3625', 1, '*'),
(598, 'wykazali', 'wykazali', 0, 0, 0.5333, 'W240', 1, '*'),
(599, 'wykluczam', 'wykluczam', 0, 0, 0.6, 'W2425', 1, '*'),
(600, 'wykonano', 'wykonano', 0, 0, 0.5333, 'W250', 1, '*'),
(601, 'wykorzystała', 'wykorzystała', 0, 0, 0.8, 'W2623', 1, '*'),
(602, 'wykorzystywać', 'wykorzystywać', 0, 0, 0.8667, 'W2623', 1, '*'),
(603, 'wypełnieniu', 'wypełnieniu', 0, 0, 0.7333, 'W150', 1, '*'),
(604, 'wysokim', 'wysokim', 0, 0, 0.4667, 'W250', 1, '*'),
(605, 'wyszkolenia', 'wyszkolenia', 0, 0, 0.7333, 'W245', 1, '*'),
(606, 'wyznaczone', 'wyznaczone', 0, 0, 0.6667, 'W2525', 1, '*'),
(607, 'względem', 'względem', 0, 0, 0.5333, 'W2435', 2, '*'),
(608, 'względu', 'względu', 0, 0, 0.4667, 'W243', 1, '*'),
(609, 'względów', 'względów', 0, 0, 0.5333, 'W243', 1, '*'),
(610, 'wzięła', 'wzięła', 0, 0, 0.4, 'W200', 1, '*'),
(611, 'wzmacniania', 'wzmacniania', 0, 0, 0.7333, 'W2525', 1, '*'),
(612, 'władz', 'władz', 0, 0, 0.3333, 'W320', 1, '*'),
(613, 'władzami', 'władzami', 0, 0, 0.5333, 'W325', 1, '*'),
(614, 'wśród', 'wśród', 0, 0, 0.3333, 'W630', 2, '*'),
(615, 'zadają', 'zadają', 0, 0, 0.4, 'Z320', 1, '*'),
(616, 'zadania', 'zadania', 0, 0, 0.4667, 'Z350', 1, '*'),
(617, 'zadanie', 'zadanie', 0, 0, 0.4667, 'Z350', 1, '*'),
(618, 'zajmują', 'zajmują', 0, 0, 0.4667, 'Z520', 1, '*'),
(619, 'zapewnili', 'zapewnili', 0, 0, 0.6, 'Z154', 1, '*'),
(620, 'zaporoskim', 'zaporoskim', 0, 0, 0.6667, 'Z1625', 1, '*'),
(621, 'zastępca', 'zastępca', 0, 0, 0.5333, 'Z312', 2, '*'),
(622, 'zaszczyt', 'zaszczyt', 0, 0, 0.5333, 'Z300', 1, '*'),
(623, 'zaznacza', 'zaznacza', 0, 0, 0.5333, 'Z520', 1, '*'),
(624, 'zbrojnym', 'zbrojnym', 0, 0, 0.5333, 'Z1625', 1, '*'),
(625, 'zbrojnymi', 'zbrojnymi', 0, 0, 0.6, 'Z1625', 1, '*'),
(626, 'zdrowi', 'zdrowi', 0, 0, 0.4, 'Z360', 1, '*'),
(627, 'ze', 'ze', 0, 0, 0.1333, 'Z000', 1, '*'),
(628, 'znaczenie', 'znaczenie', 0, 0, 0.6, 'Z525', 1, '*'),
(629, 'znakomicie', 'znakomicie', 0, 0, 0.6667, 'Z5252', 1, '*'),
(630, 'zniknęły', 'zniknęły', 0, 0, 0.5333, 'Z525', 1, '*'),
(631, 'zostały', 'zostały', 0, 0, 0.4667, 'Z300', 1, '*'),
(632, 'łączą', 'łączą', 0, 0, 0.3333, 'ł200', 1, '*'),
(633, 'śmierć', 'śmierć', 0, 0, 0.4, 'ś560', 1, '*'),
(634, 'żaden', 'żaden', 0, 0, 0.3333, 'ż350', 1, '*'),
(635, 'żadną', 'żadną', 0, 0, 0.3333, 'ż350', 1, '*'),
(636, 'żaryn', 'żaryn', 0, 0, 0.3333, 'ż650', 1, '*'),
(637, 'żedoprowadziła', 'żedoprowadziła', 0, 0, 0.9333, 'ż31632', 1, '*'),
(638, 'żołnierzy', 'żołnierzy', 0, 0, 0.6, 'ż562', 1, '*'),
(769, '3', '3', 0, 0, 0.1, '', 3, '*'),
(770, '32-letni', '32-letni', 0, 0, 0.5333, 'L350', 1, '*'),
(771, '47', '47', 0, 0, 0.2, '', 1, '*'),
(772, '5-7', '5-7', 0, 0, 0.3, '', 1, '*'),
(773, 'a', 'a', 0, 0, 0.0667, 'A000', 3, '*'),
(774, 'amerykańskimi', 'amerykańskimi', 0, 0, 0.8667, 'A5625', 1, '*'),
(775, 'analizować', 'analizować', 0, 0, 0.6667, 'A542', 1, '*'),
(776, 'armii', 'armii', 0, 0, 0.3333, 'A650', 1, '*'),
(777, 'artylerię', 'artylerię', 0, 0, 0.6, 'A6346', 1, '*'),
(778, 'batalionem', 'batalionem', 0, 0, 0.6667, 'B345', 1, '*'),
(779, 'batalionu', 'batalionu', 0, 0, 0.6, 'B345', 1, '*'),
(780, 'bazie', 'bazie', 0, 0, 0.3333, 'B200', 1, '*'),
(781, 'bojowymi', 'bojowymi', 0, 0, 0.5333, 'B250', 1, '*'),
(782, 'broń', 'broń', 0, 0, 0.2667, 'B600', 1, '*'),
(783, 'brygada', 'brygada', 0, 0, 0.4667, 'B623', 1, '*'),
(784, 'brygady', 'brygady', 0, 0, 0.4667, 'B623', 1, '*'),
(785, 'brytania', 'brytania', 0, 0, 0.5333, 'B635', 1, '*'),
(786, 'będzie', 'będzie', 0, 0, 0.4, 'B320', 3, '*'),
(787, 'chłodno', 'chłodno', 0, 0, 0.4667, 'C350', 1, '*'),
(788, 'czynienia', 'czynienia', 0, 0, 0.6, 'C500', 1, '*'),
(789, 'dali', 'dali', 0, 0, 0.2667, 'D400', 1, '*'),
(790, 'decyzje', 'decyzje', 0, 0, 0.4667, 'D200', 1, '*'),
(791, 'dowodzenie', 'dowodzenie', 0, 0, 0.6667, 'D250', 1, '*'),
(792, 'dowodzić', 'dowodzić', 0, 0, 0.5333, 'D200', 1, '*'),
(793, 'dowódcy', 'dowódcy', 0, 0, 0.4667, 'D200', 1, '*'),
(794, 'dowódcą', 'dowódcą', 0, 0, 0.4667, 'D200', 1, '*'),
(795, 'dowództwo', 'dowództwo', 0, 0, 0.6, 'D230', 1, '*'),
(796, 'dysponują', 'dysponują', 0, 0, 0.6, 'D2152', 1, '*'),
(797, 'działania', 'działania', 0, 0, 0.6, 'D250', 2, '*'),
(798, 'ekranach', 'ekranach', 0, 0, 0.5333, 'E2652', 1, '*'),
(799, 'elitarne', 'elitarne', 0, 0, 0.5333, 'E4365', 1, '*'),
(800, 'fazy', 'fazy', 0, 0, 0.2667, 'F200', 1, '*'),
(801, 'frontach', 'frontach', 0, 0, 0.5333, 'F6532', 1, '*'),
(802, 'gdy', 'gdy', 0, 0, 0.2, 'G300', 1, '*'),
(803, 'gdzie', 'gdzie', 0, 0, 0.3333, 'G320', 1, '*'),
(804, 'gotowi', 'gotowi', 0, 0, 0.4, 'G300', 1, '*'),
(805, 'grupami', 'grupami', 0, 0, 0.4667, 'G615', 1, '*'),
(806, 'grupy', 'grupy', 0, 0, 0.3333, 'G610', 1, '*'),
(807, 'gry', 'gry', 0, 0, 0.2, 'G600', 1, '*'),
(808, 'ich', 'ich', 0, 0, 0.2, 'I200', 4, '*'),
(809, 'inni', 'inni', 0, 0, 0.2667, 'I500', 1, '*'),
(810, 'instruktorami', 'instruktorami', 0, 0, 0.8667, 'I52362365', 1, '*'),
(811, 'interoperacyjności', 'interoperacyjności', 0, 0, 1, 'I53616252', 1, '*'),
(812, 'iwan', 'iwan', 0, 0, 0.2667, 'I500', 1, '*'),
(813, 'jak', 'jak', 0, 0, 0.2, 'J000', 4, '*'),
(814, 'jakie', 'jakie', 0, 0, 0.3333, 'J000', 1, '*'),
(815, 'jednostka', 'jednostka', 0, 0, 0.6, 'J35232', 1, '*'),
(816, 'jednostki', 'jednostki', 0, 0, 0.6, 'J35232', 1, '*'),
(817, 'kidy', 'kidy', 0, 0, 0.2667, 'K300', 1, '*'),
(818, 'kierować', 'kierować', 0, 0, 0.5333, 'K600', 1, '*'),
(819, 'know-how', 'know-how', 0, 0, 0.5333, 'K500', 1, '*'),
(820, 'kompanii', 'kompanii', 0, 0, 0.5333, 'K515', 1, '*'),
(821, 'komputerowych', 'komputerowych', 0, 0, 0.8667, 'K51362', 1, '*'),
(822, 'kontakcie', 'kontakcie', 0, 0, 0.6, 'K532', 1, '*'),
(823, 'kontrofensywie', 'kontrofensywie', 0, 0, 0.9333, 'K536152', 1, '*'),
(824, 'korzystali', 'korzystali', 0, 0, 0.6667, 'K6234', 1, '*'),
(825, 'które', 'które', 0, 0, 0.3333, 'K360', 3, '*'),
(826, 'który', 'który', 0, 0, 0.3333, 'K360', 1, '*'),
(827, 'których', 'których', 0, 0, 0.4667, 'K362', 1, '*'),
(828, 'kursu', 'kursu', 0, 0, 0.3333, 'K620', 1, '*'),
(829, 'kursów', 'kursów', 0, 0, 0.4, 'K620', 1, '*'),
(830, 'lata', 'lata', 0, 0, 0.2667, 'L300', 1, '*'),
(831, 'liczniejszymi', 'liczniejszymi', 0, 0, 0.8667, 'L2525', 1, '*'),
(832, 'lider', 'lider', 0, 0, 0.3333, 'L360', 1, '*'),
(833, 'lub', 'lub', 0, 0, 0.2, 'L100', 2, '*'),
(834, 'major', 'major', 0, 0, 0.3333, 'M260', 1, '*'),
(835, 'mają', 'mają', 0, 0, 0.2667, 'M200', 4, '*'),
(836, 'mających', 'mających', 0, 0, 0.5333, 'M200', 1, '*'),
(837, 'masz', 'masz', 0, 0, 0.2667, 'M200', 1, '*'),
(838, 'minister', 'minister', 0, 0, 0.5333, 'M236', 1, '*'),
(839, 'między', 'między', 0, 0, 0.4, 'M320', 1, '*'),
(840, 'mogę', 'mogę', 0, 0, 0.2667, 'M200', 1, '*'),
(841, 'najbardziej', 'najbardziej', 0, 0, 0.7333, 'N21632', 1, '*'),
(842, 'największy', 'największy', 0, 0, 0.6667, 'N200', 2, '*'),
(843, 'następnej', 'następnej', 0, 0, 0.6, 'N23152', 1, '*'),
(844, 'nauczyły', 'nauczyły', 0, 0, 0.5333, 'N200', 1, '*'),
(845, 'niedociągnięcia', 'niedociągnięcia', 0, 0, 1, 'N3252', 1, '*'),
(846, 'niemczech', 'niemczech', 0, 0, 0.6, 'N200', 1, '*'),
(847, 'niemiec', 'niemiec', 0, 0, 0.4667, 'N200', 1, '*'),
(848, 'niepowodzenia', 'niepowodzenia', 0, 0, 0.8667, 'N1325', 1, '*'),
(849, 'nowoczesną', 'nowoczesną', 0, 0, 0.6667, 'N250', 1, '*'),
(850, 'obraz', 'obraz', 0, 0, 0.3333, 'O162', 1, '*'),
(851, 'obrony', 'obrony', 0, 0, 0.4, 'O165', 1, '*'),
(852, 'obrońcom', 'obrońcom', 0, 0, 0.5333, 'O1625', 1, '*'),
(853, 'obsłudze', 'obsłudze', 0, 0, 0.5333, 'O1232', 1, '*'),
(854, 'oczekuje', 'oczekuje', 0, 0, 0.5333, 'O200', 1, '*'),
(855, 'oddziałami', 'oddziałami', 0, 0, 0.6667, 'O325', 1, '*'),
(856, 'oddzielna', 'oddzielna', 0, 0, 0.6, 'O3245', 1, '*'),
(857, 'oddzielnej', 'oddzielnej', 0, 0, 0.6667, 'O32452', 1, '*'),
(858, 'ogólny', 'ogólny', 0, 0, 0.4, 'O245', 1, '*'),
(859, 'okupantem', 'okupantem', 0, 0, 0.6, 'O21535', 1, '*'),
(860, 'operacje', 'operacje', 0, 0, 0.5333, 'O162', 1, '*'),
(861, 'opisuje', 'opisuje', 0, 0, 0.4667, 'O120', 1, '*'),
(862, 'osobami', 'osobami', 0, 0, 0.4667, 'O215', 1, '*'),
(863, 'ostrze', 'ostrze', 0, 0, 0.4, 'O2362', 1, '*'),
(864, 'ołeksij', 'ołeksij', 0, 0, 0.4667, 'O200', 1, '*'),
(865, 'piechoty', 'piechoty', 0, 0, 0.5333, 'P230', 1, '*'),
(866, 'plutonu', 'plutonu', 0, 0, 0.4667, 'P435', 1, '*'),
(867, 'poczuć', 'poczuć', 0, 0, 0.4, 'P200', 1, '*'),
(868, 'podczas', 'podczas', 0, 0, 0.4667, 'P320', 1, '*'),
(869, 'podejmować', 'podejmować', 0, 0, 0.6667, 'P325', 1, '*'),
(870, 'pojazdów', 'pojazdów', 0, 0, 0.5333, 'P230', 1, '*'),
(871, 'pomagają', 'pomagają', 0, 0, 0.5333, 'P520', 1, '*'),
(872, 'poprowadzą', 'poprowadzą', 0, 0, 0.6667, 'P632', 1, '*'),
(873, 'post', 'post', 0, 0, 0.2667, 'P230', 1, '*'),
(874, 'posunięcia', 'posunięcia', 0, 0, 0.6667, 'P252', 1, '*'),
(875, 'poszczególnych', 'poszczególnych', 0, 0, 0.9333, 'P2452', 1, '*'),
(876, 'potencjał', 'potencjał', 0, 0, 0.6, 'P352', 1, '*'),
(877, 'potrzebujemy', 'potrzebujemy', 0, 0, 0.8, 'P362125', 1, '*'),
(878, 'potrzebujesz', 'potrzebujesz', 0, 0, 0.8, 'P36212', 1, '*'),
(879, 'powiedział', 'powiedział', 0, 0, 0.6667, 'P320', 1, '*'),
(880, 'poziomie', 'poziomie', 0, 0, 0.5333, 'P250', 1, '*'),
(881, 'pozostaje', 'pozostaje', 0, 0, 0.6, 'P232', 1, '*'),
(882, 'pracowniach', 'pracowniach', 0, 0, 0.7333, 'P6252', 1, '*'),
(883, 'praktycznymi', 'praktycznymi', 0, 0, 0.8, 'P62325', 1, '*'),
(884, 'praktyki', 'praktyki', 0, 0, 0.5333, 'P6232', 1, '*'),
(885, 'programów', 'programów', 0, 0, 0.6, 'P6265', 1, '*'),
(886, 'przekształcenie', 'przekształcenie', 0, 0, 1, 'P62325', 1, '*'),
(887, 'przeoczone', 'przeoczone', 0, 0, 0.6667, 'P625', 1, '*'),
(888, 'przeszli', 'przeszli', 0, 0, 0.5333, 'P624', 1, '*'),
(889, 'przełamać', 'przełamać', 0, 0, 0.6, 'P625', 1, '*'),
(890, 'przychodzi', 'przychodzi', 0, 0, 0.6667, 'P6232', 1, '*'),
(891, 'przyczynić', 'przyczynić', 0, 0, 0.6667, 'P625', 3, '*'),
(892, 'przygotowywała', 'przygotowywała', 0, 0, 0.9333, 'P623', 1, '*'),
(893, 'przypominały', 'przypominały', 0, 0, 0.8, 'P6215', 1, '*'),
(894, 'realnym', 'realnym', 0, 0, 0.4667, 'R450', 1, '*'),
(895, 'regularna', 'regularna', 0, 0, 0.6, 'R2465', 1, '*'),
(896, 'rekrutów', 'rekrutów', 0, 0, 0.5333, 'R263', 1, '*'),
(897, 'reznikow', 'reznikow', 0, 0, 0.5333, 'R252', 1, '*'),
(898, 'rozkazy', 'rozkazy', 0, 0, 0.4667, 'R200', 1, '*'),
(899, 'rozpoznawcze', 'rozpoznawcze', 0, 0, 0.8, 'R21252', 1, '*'),
(900, 'rozumiesz', 'rozumiesz', 0, 0, 0.6, 'R252', 1, '*'),
(901, 'rozważać', 'rozważać', 0, 0, 0.5333, 'R200', 1, '*'),
(902, 'rzeczy', 'rzeczy', 0, 0, 0.4, 'R200', 1, '*'),
(903, 'również', 'również', 0, 0, 0.4667, 'R500', 3, '*'),
(904, 'różnymi', 'różnymi', 0, 0, 0.4667, 'R500', 1, '*'),
(905, 'sformowane', 'sformowane', 0, 0, 0.6667, 'S165', 1, '*'),
(906, 'siłę', 'siłę', 0, 0, 0.2667, 'S000', 1, '*'),
(907, 'skończyły', 'skończyły', 0, 0, 0.6, 'S000', 1, '*'),
(908, 'spotkał', 'spotkał', 0, 0, 0.4667, 'S132', 1, '*'),
(909, 'spójnego', 'spójnego', 0, 0, 0.5333, 'S1252', 1, '*'),
(910, 'stanowiły', 'stanowiły', 0, 0, 0.6, 'S350', 2, '*'),
(911, 'strategiczne', 'strategiczne', 0, 0, 0.8, 'S36325', 1, '*'),
(912, 'swoimi', 'swoimi', 0, 0, 0.4, 'S500', 1, '*'),
(913, 'sygnał', 'sygnał', 0, 0, 0.4, 'S500', 1, '*'),
(914, 'symulacje', 'symulacje', 0, 0, 0.6, 'S542', 1, '*'),
(915, 'szalamaha', 'szalamaha', 0, 0, 0.6, 'S450', 1, '*'),
(916, 'szansę', 'szansę', 0, 0, 0.4, 'S520', 1, '*'),
(917, 'szeregi', 'szeregi', 0, 0, 0.4667, 'S620', 1, '*'),
(918, 'szeregowiec', 'szeregowiec', 0, 0, 0.7333, 'S620', 1, '*'),
(919, 'szkolenia', 'szkolenia', 0, 0, 0.6, 'S450', 1, '*'),
(920, 'szkoleniowych', 'szkoleniowych', 0, 0, 0.8667, 'S452', 1, '*'),
(921, 'szkoleń', 'szkoleń', 0, 0, 0.4667, 'S400', 1, '*'),
(922, 'szkoliło', 'szkoliło', 0, 0, 0.5333, 'S400', 1, '*'),
(923, 'taktykach', 'taktykach', 0, 0, 0.6, 'T232', 1, '*'),
(924, 'te', 'te', 0, 0, 0.1333, 'T000', 2, '*'),
(925, 'techniczne', 'techniczne', 0, 0, 0.6667, 'T2525', 1, '*'),
(926, 'technikami', 'technikami', 0, 0, 0.6667, 'T2525', 1, '*'),
(927, 'technologią', 'technologią', 0, 0, 0.7333, 'T2542', 1, '*'),
(928, 'też', 'też', 0, 0, 0.2, 'T000', 3, '*'),
(929, 'the', 'the', 0, 0, 0.2, 'T000', 1, '*'),
(930, 'trafiła', 'trafiła', 0, 0, 0.4667, 'T610', 1, '*'),
(931, 'trudne', 'trudne', 0, 0, 0.4, 'T635', 1, '*'),
(932, 'twoje', 'twoje', 0, 0, 0.3333, 'T200', 1, '*'),
(933, 'ukrainskiej', 'ukrainskiej', 0, 0, 0.7333, 'U2652', 1, '*'),
(934, 'ukraińskie', 'ukraińskie', 0, 0, 0.6667, 'U262', 1, '*'),
(935, 'umiejętnościami', 'umiejętnościami', 0, 0, 1, 'U523525', 1, '*'),
(936, 'uwagę', 'uwagę', 0, 0, 0.3333, 'U200', 1, '*'),
(937, 'uzbrojone', 'uzbrojone', 0, 0, 0.6, 'U21625', 1, '*'),
(938, 'walczyła', 'walczyła', 0, 0, 0.5333, 'W420', 1, '*'),
(939, 'walkę', 'walkę', 0, 0, 0.3333, 'W420', 3, '*'),
(940, 'washington', 'washington', 0, 0, 0.6667, 'W25235', 1, '*'),
(941, 'wewnątrz', 'wewnątrz', 0, 0, 0.5333, 'W5362', 1, '*'),
(942, 'wiedzą', 'wiedzą', 0, 0, 0.4, 'W320', 1, '*'),
(943, 'wielka', 'wielka', 0, 0, 0.4, 'W420', 3, '*'),
(944, 'więcej', 'więcej', 0, 0, 0.4, 'W200', 1, '*'),
(945, 'wloczni', 'wloczni', 0, 0, 0.4667, 'W425', 1, '*'),
(946, 'wojenne', 'wojenne', 0, 0, 0.4667, 'W250', 1, '*'),
(947, 'wojennych', 'wojennych', 0, 0, 0.6, 'W252', 1, '*'),
(948, 'wojskowi', 'wojskowi', 0, 0, 0.5333, 'W200', 1, '*'),
(949, 'wojskowych', 'wojskowych', 0, 0, 0.6667, 'W200', 1, '*'),
(950, 'wozami', 'wozami', 0, 0, 0.4, 'W250', 1, '*'),
(951, 'wspierać', 'wspierać', 0, 0, 0.5333, 'W216', 1, '*'),
(952, 'wyszkolone', 'wyszkolone', 0, 0, 0.6667, 'W245', 1, '*'),
(953, 'wyszkoloną', 'wyszkoloną', 0, 0, 0.6667, 'W245', 1, '*'),
(954, 'wysłano', 'wysłano', 0, 0, 0.4667, 'W250', 1, '*'),
(955, 'włóczni', 'włóczni', 0, 0, 0.4667, 'W250', 1, '*'),
(956, 'zaawansowanych', 'zaawansowanych', 0, 0, 0.9333, 'Z5252', 1, '*'),
(957, 'zachodnie', 'zachodnie', 0, 0, 0.6, 'Z350', 1, '*'),
(958, 'zachodnią', 'zachodnią', 0, 0, 0.6, 'Z350', 1, '*'),
(959, 'zapewniała', 'zapewniała', 0, 0, 0.6667, 'Z150', 1, '*'),
(960, 'zebrane', 'zebrane', 0, 0, 0.4667, 'Z165', 1, '*'),
(961, 'zespołu', 'zespołu', 0, 0, 0.4667, 'Z100', 1, '*'),
(962, 'zeszłego', 'zeszłego', 0, 0, 0.5333, 'Z000', 1, '*'),
(963, 'zmechanizowana', 'zmechanizowana', 0, 0, 0.9333, 'Z52525', 1, '*'),
(964, 'zmechanizowanej', 'zmechanizowanej', 0, 0, 1, 'Z525252', 1, '*'),
(965, 'zniektórymi', 'zniektórymi', 0, 0, 0.7333, 'Z52365', 1, '*'),
(966, 'zobaczyć', 'zobaczyć', 0, 0, 0.5333, 'Z120', 1, '*'),
(967, 'zrozumie', 'zrozumie', 0, 0, 0.5333, 'Z625', 1, '*'),
(968, 'zwracasz', 'zwracasz', 0, 0, 0.5333, 'Z620', 1, '*'),
(969, 'żołnierki', 'żołnierki', 0, 0, 0.6, 'ż562', 1, '*'),
(970, 'żołnierz', 'żołnierz', 0, 0, 0.5333, 'ż562', 1, '*'),
(971, 'żołnierze', 'żołnierze', 0, 0, 0.6, 'ż562', 1, '*'),
(972, 'życiu', 'życiu', 0, 0, 0.3333, 'ż200', 1, '*'),
(973, '180', '180', 0, 0, 0.3, '', 2, '*'),
(974, '2020', '2020', 0, 0, 0.4, '', 3, '*'),
(975, '2021', '2021', 0, 0, 0.4, '', 2, '*'),
(976, '250', '250', 0, 0, 0.3, '', 2, '*'),
(977, '325', '325', 0, 0, 0.3, '', 2, '*'),
(978, '4', '4', 0, 0, 0.1, '', 2, '*'),
(979, 'amerykanki', 'amerykanki', 0, 0, 0.6667, 'A56252', 2, '*'),
(980, 'amy', 'amy', 0, 0, 0.2, 'A500', 2, '*'),
(981, 'bała', 'bała', 0, 0, 0.2667, 'B000', 2, '*'),
(982, 'bez', 'bez', 0, 0, 0.2, 'B200', 2, '*'),
(983, 'bezdechu', 'bezdechu', 0, 0, 0.5333, 'B232', 2, '*'),
(984, 'bezpłodności', 'bezpłodności', 0, 0, 0.8, 'B21352', 2, '*'),
(985, 'bezwózka', 'bezwózka', 0, 0, 0.5333, 'B200', 2, '*'),
(986, 'całego', 'całego', 0, 0, 0.4, 'C000', 2, '*'),
(987, 'chorych', 'chorych', 0, 0, 0.4667, 'C620', 2, '*'),
(988, 'chorób', 'chorób', 0, 0, 0.4, 'C610', 2, '*'),
(989, 'chwil', 'chwil', 0, 0, 0.3333, 'C400', 2, '*'),
(990, 'chętnie', 'chętnie', 0, 0, 0.4667, 'C350', 2, '*'),
(991, 'ciężki', 'ciężki', 0, 0, 0.4, 'C000', 2, '*'),
(992, 'coraz', 'coraz', 0, 0, 0.3333, 'C620', 2, '*'),
(993, 'cukrzycy', 'cukrzycy', 0, 0, 0.5333, 'C620', 2, '*'),
(994, 'czasu', 'czasu', 0, 0, 0.3333, 'C000', 3, '*'),
(995, 'dixon', 'dixon', 0, 0, 0.3333, 'D250', 2, '*'),
(996, 'dlatego', 'dlatego', 0, 0, 0.4667, 'D432', 3, '*'),
(997, 'dolnych', 'dolnych', 0, 0, 0.4667, 'D452', 2, '*'),
(998, 'dorosłych', 'dorosłych', 0, 0, 0.6, 'D620', 2, '*'),
(999, 'doświadczenami', 'doświadczenami', 0, 0, 0.9333, 'D250', 2, '*'),
(1000, 'dwoje', 'dwoje', 0, 0, 0.3333, 'D200', 2, '*'),
(1001, 'dzieci', 'dzieci', 0, 0, 0.4, 'D200', 3, '*'),
(1002, 'dzieli', 'dzieli', 0, 0, 0.4, 'D240', 2, '*'),
(1003, 'funkcjonowanie', 'funkcjonowanie', 0, 0, 0.9333, 'F525', 2, '*'),
(1004, 'gwałtownie', 'gwałtownie', 0, 0, 0.6667, 'G350', 2, '*'),
(1005, 'hitem', 'hitem', 0, 0, 0.3333, 'H350', 2, '*'),
(1006, 'jednak', 'jednak', 0, 0, 0.4, 'J352', 4, '*'),
(1007, 'jej', 'jej', 0, 0, 0.2, 'J000', 2, '*'),
(1008, 'ją', 'ją', 0, 0, 0.1333, 'J000', 2, '*'),
(1009, 'kiedy', 'kiedy', 0, 0, 0.3333, 'K300', 2, '*'),
(1010, 'kilogramów', 'kilogramów', 0, 0, 0.6667, 'K4265', 2, '*'),
(1011, 'kobieta', 'kobieta', 0, 0, 0.4667, 'K130', 2, '*'),
(1012, 'kobiety', 'kobiety', 0, 0, 0.4667, 'K130', 2, '*'),
(1013, 'kobietę', 'kobietę', 0, 0, 0.4667, 'K130', 2, '*'),
(1014, 'koniec', 'koniec', 0, 0, 0.4, 'K520', 2, '*'),
(1015, 'kończyn', 'kończyn', 0, 0, 0.4667, 'K500', 2, '*'),
(1016, 'kości', 'kości', 0, 0, 0.3333, 'K000', 2, '*'),
(1017, 'kryzysowych', 'kryzysowych', 0, 0, 0.7333, 'K620', 2, '*'),
(1018, 'lekarze', 'lekarze', 0, 0, 0.4667, 'L262', 2, '*'),
(1019, 'ludzi', 'ludzi', 0, 0, 0.3333, 'L320', 2, '*'),
(1020, 'matki', 'matki', 0, 0, 0.3333, 'M320', 2, '*'),
(1021, 'metamorfoza', 'metamorfoza', 0, 0, 0.7333, 'M35612', 2, '*'),
(1022, 'metamorfozę', 'metamorfozę', 0, 0, 0.7333, 'M35612', 2, '*'),
(1023, 'metomorfozę', 'metomorfozę', 0, 0, 0.7333, 'M35612', 2, '*'),
(1024, 'mogło', 'mogło', 0, 0, 0.3333, 'M200', 2, '*'),
(1025, 'mogły', 'mogły', 0, 0, 0.3333, 'M200', 3, '*'),
(1026, 'może', 'może', 0, 0, 0.2667, 'M000', 2, '*'),
(1027, 'mózgu', 'mózgu', 0, 0, 0.3333, 'M200', 2, '*'),
(1028, 'nadciśnienia', 'nadciśnienia', 0, 0, 0.8, 'N325', 2, '*'),
(1029, 'nadwagę', 'nadwagę', 0, 0, 0.4667, 'N320', 2, '*'),
(1030, 'niewydolne', 'niewydolne', 0, 0, 0.6667, 'N345', 2, '*'),
(1031, 'niezwykłą', 'niezwykłą', 0, 0, 0.6, 'N200', 2, '*'),
(1032, 'nią', 'nią', 0, 0, 0.2, 'N000', 2, '*'),
(1033, 'nowotworów', 'nowotworów', 0, 0, 0.6667, 'N360', 2, '*'),
(1034, 'nowymi', 'nowymi', 0, 0, 0.4, 'N000', 2, '*'),
(1035, 'obyło', 'obyło', 0, 0, 0.3333, 'O100', 2, '*'),
(1036, 'odcinek', 'odcinek', 0, 0, 0.4667, 'O3252', 2, '*'),
(1037, 'ogromny', 'ogromny', 0, 0, 0.4667, 'O265', 2, '*'),
(1038, 'organizmu', 'organizmu', 0, 0, 0.6, 'O62525', 2, '*'),
(1039, 'otyłością', 'otyłością', 0, 0, 0.6, 'O320', 2, '*'),
(1040, 'otyłość', 'otyłość', 0, 0, 0.4667, 'O300', 2, '*'),
(1041, 'otyły', 'otyły', 0, 0, 0.3333, 'O300', 2, '*'),
(1042, 'pandemię', 'pandemię', 0, 0, 0.5333, 'P535', 2, '*'),
(1043, 'pierwsze', 'pierwsze', 0, 0, 0.5333, 'P620', 2, '*'),
(1044, 'pierwszy', 'pierwszy', 0, 0, 0.5333, 'P620', 2, '*'),
(1045, 'pod', 'pod', 0, 0, 0.2, 'P300', 3, '*'),
(1046, 'polsce', 'polsce', 0, 0, 0.4, 'P420', 2, '*'),
(1047, 'poruszać', 'poruszać', 0, 0, 0.5333, 'P620', 2, '*'),
(1048, 'pory', 'pory', 0, 0, 0.2667, 'P600', 2, '*'),
(1049, 'postanowiły', 'postanowiły', 0, 0, 0.7333, 'P235', 2, '*'),
(1050, 'postęp', 'postęp', 0, 0, 0.4, 'P231', 2, '*'),
(1051, 'poważnym', 'poważnym', 0, 0, 0.5333, 'P500', 2, '*'),
(1052, 'problemem', 'problemem', 0, 0, 0.6, 'P6145', 2, '*'),
(1053, 'program', 'program', 0, 0, 0.4667, 'P6265', 2, '*'),
(1054, 'programu', 'programu', 0, 0, 0.5333, 'P6265', 2, '*'),
(1055, 'przemianą', 'przemianą', 0, 0, 0.6, 'P625', 2, '*'),
(1056, 'przeszły', 'przeszły', 0, 0, 0.5333, 'P620', 2, '*'),
(1057, 'przybywa', 'przybywa', 0, 0, 0.5333, 'P621', 2, '*'),
(1058, 'płuca', 'płuca', 0, 0, 0.3333, 'P200', 2, '*'),
(1059, 'rodzina', 'rodzina', 0, 0, 0.4667, 'R325', 2, '*'),
(1060, 'roli', 'roli', 0, 0, 0.2667, 'R400', 2, '*'),
(1061, 'ryzyka', 'ryzyka', 0, 0, 0.4, 'R200', 3, '*'),
(1062, 'ryzyko', 'ryzyko', 0, 0, 0.4, 'R200', 2, '*'),
(1063, 'sennego', 'sennego', 0, 0, 0.4667, 'S520', 2, '*'),
(1064, 'sercowo-naczyniowych', 'sercowo-naczyniowych', 0, 0, 1, 'S625252', 2, '*'),
(1065, 'siostra', 'siostra', 0, 0, 0.4667, 'S360', 2, '*'),
(1066, 'siostry', 'siostry', 0, 0, 0.4667, 'S360', 2, '*'),
(1067, 'sióstr', 'sióstr', 0, 0, 0.4, 'S360', 2, '*'),
(1068, 'skończyć', 'skończyć', 0, 0, 0.5333, 'S000', 2, '*'),
(1069, 'slaton', 'slaton', 0, 0, 0.4, 'S435', 2, '*'),
(1070, 'slaton-halterman', 'slaton-halterman', 0, 0, 1, 'S4354365', 2, '*'),
(1071, 'spektakularną', 'spektakularną', 0, 0, 0.8667, 'S1232465', 2, '*'),
(1072, 'spełnia', 'spełnia', 0, 0, 0.4667, 'S150', 2, '*'),
(1073, 'społecznościowych', 'społecznościowych', 0, 0, 1, 'S1252', 2, '*'),
(1074, 'stan', 'stan', 0, 0, 0.2667, 'S350', 2, '*'),
(1075, 'stawów', 'stawów', 0, 0, 0.4, 'S300', 2, '*'),
(1076, 'stał', 'stał', 0, 0, 0.2667, 'S300', 2, '*'),
(1077, 'straciły', 'straciły', 0, 0, 0.5333, 'S362', 2, '*'),
(1078, 'sukcesy', 'sukcesy', 0, 0, 0.4667, 'S000', 2, '*'),
(1079, 'swojej', 'swojej', 0, 0, 0.4, 'S000', 2, '*'),
(1080, 'sylwetki', 'sylwetki', 0, 0, 0.5333, 'S432', 2, '*'),
(1081, 'szczęście', 'szczęście', 0, 0, 0.6, 'S000', 2, '*'),
(1082, 'słynne', 'słynne', 0, 0, 0.4, 'S500', 2, '*'),
(1083, 'tammy', 'tammy', 0, 0, 0.3333, 'T500', 2, '*'),
(1084, 'tlenu', 'tlenu', 0, 0, 0.3333, 'T450', 2, '*'),
(1085, 'tony', 'tony', 0, 0, 0.2667, 'T500', 2, '*'),
(1086, 'tragedią', 'tragedią', 0, 0, 0.5333, 'T623', 2, '*'),
(1087, 'tą', 'tą', 0, 0, 0.1333, 'T000', 2, '*'),
(1088, 'tętniczego', 'tętniczego', 0, 0, 0.6667, 'T520', 2, '*'),
(1089, 'tłumaczyli', 'tłumaczyli', 0, 0, 0.6667, 'T524', 2, '*'),
(1090, 'udaru', 'udaru', 0, 0, 0.3333, 'U360', 2, '*'),
(1091, 'udało', 'udało', 0, 0, 0.3333, 'U300', 2, '*'),
(1092, 'udziałem', 'udziałem', 0, 0, 0.5333, 'U325', 2, '*'),
(1093, 'uratować', 'uratować', 0, 0, 0.5333, 'U630', 2, '*'),
(1094, 'urodziła', 'urodziła', 0, 0, 0.5333, 'U632', 2, '*'),
(1095, 'usa', 'usa', 0, 0, 0.2, 'U200', 3, '*'),
(1096, 'uważana', 'uważana', 0, 0, 0.4667, 'U500', 2, '*'),
(1097, 'wagi', 'wagi', 0, 0, 0.2667, 'W200', 2, '*'),
(1098, 'walczyć', 'walczyć', 0, 0, 0.4667, 'W420', 2, '*'),
(1099, 'ważyła', 'ważyła', 0, 0, 0.4, 'W000', 2, '*'),
(1100, 'wieku', 'wieku', 0, 0, 0.3333, 'W200', 2, '*'),
(1101, 'wielkiej', 'wielkiej', 0, 0, 0.5333, 'W420', 2, '*'),
(1102, 'wpływ', 'wpływ', 0, 0, 0.3333, 'W100', 2, '*'),
(1103, 'wyemitowano', 'wyemitowano', 0, 0, 0.7333, 'W535', 2, '*'),
(1104, 'wygrać', 'wygrać', 0, 0, 0.4, 'W260', 2, '*'),
(1105, 'wyjść', 'wyjść', 0, 0, 0.3333, 'W200', 2, '*'),
(1106, 'wzrost', 'wzrost', 0, 0, 0.4, 'W2623', 2, '*'),
(1107, 'xxi', 'xxi', 0, 0, 0.2, 'X000', 2, '*'),
(1108, 'zaczęły', 'zaczęły', 0, 0, 0.4667, 'Z000', 2, '*'),
(1109, 'zapaleń', 'zapaleń', 0, 0, 0.4667, 'Z140', 2, '*'),
(1110, 'zawalczyły', 'zawalczyły', 0, 0, 0.6667, 'Z420', 2, '*'),
(1111, 'zdeterminowane', 'zdeterminowane', 0, 0, 0.9333, 'Z365', 2, '*'),
(1112, 'zdoła', 'zdoła', 0, 0, 0.3333, 'Z300', 2, '*'),
(1113, 'zdrowia', 'zdrowia', 0, 0, 0.4667, 'Z360', 2, '*'),
(1114, 'zdrowie', 'zdrowie', 0, 0, 0.4667, 'Z360', 2, '*'),
(1115, 'zmagają', 'zmagają', 0, 0, 0.4667, 'Z520', 2, '*'),
(1116, 'znane', 'znane', 0, 0, 0.3333, 'Z500', 2, '*'),
(1117, 'zrobiły', 'zrobiły', 0, 0, 0.4667, 'Z610', 2, '*'),
(1118, 'zrzuciły', 'zrzuciły', 0, 0, 0.5333, 'Z620', 2, '*'),
(1119, 'zwiększa', 'zwiększa', 0, 0, 0.5333, 'Z000', 2, '*'),
(1120, 'ćwierć', 'ćwierć', 0, 0, 0.4, 'ć600', 2, '*'),
(1121, 'łatwiej', 'łatwiej', 0, 0, 0.4667, 'ł320', 2, '*'),
(1122, 'łącznie', 'łącznie', 0, 0, 0.4667, 'ł250', 2, '*'),
(1123, 'śledzić', 'śledzić', 0, 0, 0.4667, 'ś432', 2, '*'),
(1124, 'żylaki', 'żylaki', 0, 0, 0.4, 'ż420', 2, '*'),
(1125, 'żyć', 'żyć', 0, 0, 0.2, 'ż000', 2, '*'),
(1228, '9', '9', 0, 0, 0.1, '', 2, '*');
INSERT INTO `buf3w_finder_terms` (`term_id`, `term`, `stem`, `common`, `phrase`, `weight`, `soundex`, `links`, `language`) VALUES
(1229, 'media', 'media', 0, 0, 0.3333, 'M300', 1, '*'),
(1230, 'social', 'social', 0, 0, 0.4, 'S400', 1, '*'),
(1231, '14', '14', 0, 0, 0.2, '', 1, '*'),
(1232, '16', '16', 0, 0, 0.2, '', 1, '*'),
(1233, '49', '49', 0, 0, 0.2, '', 1, '*'),
(1234, 'afryki', 'afryki', 0, 0, 0.4, 'A162', 1, '*'),
(1235, 'aplikacji', 'aplikacji', 0, 0, 0.6, 'A142', 1, '*'),
(1236, 'automatycznie', 'automatycznie', 0, 0, 0.8667, 'A35325', 1, '*'),
(1237, 'bezpieczeństwo', 'bezpieczeństwo', 0, 0, 0.9333, 'B2123', 1, '*'),
(1238, 'bi', 'bi', 0, 0, 0.1333, 'B000', 1, '*'),
(1239, 'bliskiego', 'bliskiego', 0, 0, 0.6, 'B420', 1, '*'),
(1240, 'blokowanie', 'blokowanie', 0, 0, 0.6667, 'B425', 1, '*'),
(1241, 'busiess', 'busiess', 0, 0, 0.4667, 'B200', 1, '*'),
(1242, 'była', 'była', 0, 0, 0.2667, 'B000', 1, '*'),
(1243, 'chroniące', 'chroniące', 0, 0, 0.6, 'C652', 1, '*'),
(1244, 'cytowana', 'cytowana', 0, 0, 0.5333, 'C350', 1, '*'),
(1245, 'czego', 'czego', 0, 0, 0.3333, 'C000', 1, '*'),
(1246, 'często', 'często', 0, 0, 0.4, 'C300', 1, '*'),
(1247, 'datę', 'datę', 0, 0, 0.2667, 'D000', 1, '*'),
(1248, 'dawna', 'dawna', 0, 0, 0.3333, 'D500', 1, '*'),
(1249, 'dobrym', 'dobrym', 0, 0, 0.4, 'D165', 1, '*'),
(1250, 'dokładnie', 'dokładnie', 0, 0, 0.6, 'D235', 1, '*'),
(1251, 'domyślnie', 'domyślnie', 0, 0, 0.6, 'D545', 1, '*'),
(1252, 'dotyczyć', 'dotyczyć', 0, 0, 0.5333, 'D200', 1, '*'),
(1253, 'duet', 'duet', 0, 0, 0.2667, 'D000', 1, '*'),
(1254, 'duńska', 'duńska', 0, 0, 0.4, 'D200', 1, '*'),
(1255, 'dyrektor', 'dyrektor', 0, 0, 0.5333, 'D6236', 1, '*'),
(1256, 'eksperci', 'eksperci', 0, 0, 0.5333, 'E2162', 1, '*'),
(1257, 'ekspertka', 'ekspertka', 0, 0, 0.6, 'E21632', 1, '*'),
(1258, 'ekspertki', 'ekspertki', 0, 0, 0.6, 'E21632', 1, '*'),
(1259, 'elaine', 'elaine', 0, 0, 0.4, 'E450', 1, '*'),
(1260, 'eliminowaniu', 'eliminowaniu', 0, 0, 0.8, 'E450', 1, '*'),
(1261, 'europy', 'europy', 0, 0, 0.4, 'E610', 1, '*'),
(1262, 'eva', 'eva', 0, 0, 0.2, 'E100', 1, '*'),
(1263, 'fałszywą', 'fałszywą', 0, 0, 0.5333, 'F200', 1, '*'),
(1264, 'firma', 'firma', 0, 0, 0.3333, 'F650', 2, '*'),
(1265, 'fog', 'fog', 0, 0, 0.2, 'F200', 1, '*'),
(1266, 'fox', 'fox', 0, 0, 0.2, 'F200', 1, '*'),
(1267, 'funkcji', 'funkcji', 0, 0, 0.4667, 'F520', 1, '*'),
(1268, 'głównych', 'głównych', 0, 0, 0.5333, 'G520', 1, '*'),
(1269, 'idzie', 'idzie', 0, 0, 0.3333, 'I320', 1, '*'),
(1270, 'insider', 'insider', 0, 0, 0.4667, 'I5236', 1, '*'),
(1271, 'jakiej', 'jakiej', 0, 0, 0.4, 'J000', 1, '*'),
(1272, 'kont', 'kont', 0, 0, 0.2667, 'K530', 1, '*'),
(1273, 'konta', 'konta', 0, 0, 0.3333, 'K530', 1, '*'),
(1274, 'korzystania', 'korzystania', 0, 0, 0.7333, 'K6235', 1, '*'),
(1275, 'krytykowany', 'krytykowany', 0, 0, 0.7333, 'K6325', 1, '*'),
(1276, 'która', 'która', 0, 0, 0.3333, 'K360', 1, '*'),
(1277, 'kładziemy', 'kładziemy', 0, 0, 0.6, 'K325', 1, '*'),
(1278, 'liczby', 'liczby', 0, 0, 0.4, 'L210', 1, '*'),
(1279, 'materiałach', 'materiałach', 0, 0, 0.7333, 'M362', 1, '*'),
(1280, 'materiałami', 'materiałami', 0, 0, 0.7333, 'M365', 1, '*'),
(1281, 'mechanizmy', 'mechanizmy', 0, 0, 0.6667, 'M2525', 1, '*'),
(1282, 'miał', 'miał', 0, 0, 0.2667, 'M000', 1, '*'),
(1283, 'miały', 'miały', 0, 0, 0.3333, 'M000', 2, '*'),
(1284, 'mln', 'mln', 0, 0, 0.2, 'M450', 2, '*'),
(1285, 'możliwość', 'możliwość', 0, 0, 0.6, 'M400', 1, '*'),
(1286, 'młodszych', 'młodszych', 0, 0, 0.6, 'M320', 1, '*'),
(1287, 'młodzież', 'młodzież', 0, 0, 0.5333, 'M320', 1, '*'),
(1288, 'młodzieży', 'młodzieży', 0, 0, 0.6, 'M320', 1, '*'),
(1289, 'nacisk', 'nacisk', 0, 0, 0.4, 'N200', 1, '*'),
(1290, 'nagrywanych', 'nagrywanych', 0, 0, 0.7333, 'N2652', 1, '*'),
(1291, 'najmłodszych', 'najmłodszych', 0, 0, 0.8, 'N2532', 1, '*'),
(1292, 'najsilniejsze', 'najsilniejsze', 0, 0, 0.8667, 'N2452', 1, '*'),
(1293, 'najwyższy', 'najwyższy', 0, 0, 0.6, 'N200', 1, '*'),
(1294, 'naszej', 'naszej', 0, 0, 0.4, 'N200', 1, '*'),
(1295, 'naszych', 'naszych', 0, 0, 0.4667, 'N200', 1, '*'),
(1296, 'new', 'new', 0, 0, 0.2, 'N000', 2, '*'),
(1297, 'nich', 'nich', 0, 0, 0.2667, 'N200', 1, '*'),
(1298, 'niedostateczną', 'niedostateczną', 0, 0, 0.9333, 'N32325', 1, '*'),
(1299, 'nieletnich', 'nieletnich', 0, 0, 0.6667, 'N4352', 1, '*'),
(1300, 'noer', 'noer', 0, 0, 0.2667, 'N600', 1, '*'),
(1301, 'nowe', 'nowe', 0, 0, 0.2667, 'N000', 1, '*'),
(1302, 'obejmą', 'obejmą', 0, 0, 0.4, 'O125', 1, '*'),
(1303, 'obostrzenia', 'obostrzenia', 0, 0, 0.7333, 'O123625', 1, '*'),
(1304, 'obserwowania', 'obserwowania', 0, 0, 0.8, 'O1265', 1, '*'),
(1305, 'ochronę', 'ochronę', 0, 0, 0.4667, 'O265', 1, '*'),
(1306, 'ofiar', 'ofiar', 0, 0, 0.3333, 'O160', 1, '*'),
(1307, 'ograniczy', 'ograniczy', 0, 0, 0.6, 'O2652', 1, '*'),
(1308, 'ogłosiła', 'ogłosiła', 0, 0, 0.5333, 'O200', 1, '*'),
(1309, 'ominie', 'ominie', 0, 0, 0.4, 'O500', 1, '*'),
(1310, 'osoby', 'osoby', 0, 0, 0.3333, 'O210', 1, '*'),
(1311, 'oznaczają', 'oznaczają', 0, 0, 0.6, 'O252', 1, '*'),
(1312, 'oznaczane', 'oznaczane', 0, 0, 0.6, 'O2525', 1, '*'),
(1313, 'oznaczone', 'oznaczone', 0, 0, 0.6, 'O2525', 1, '*'),
(1314, 'pedofilią', 'pedofilią', 0, 0, 0.6, 'P314', 1, '*'),
(1315, 'pedofilów', 'pedofilów', 0, 0, 0.6, 'P314', 1, '*'),
(1316, 'podając', 'podając', 0, 0, 0.4667, 'P320', 1, '*'),
(1317, 'pomóc', 'pomóc', 0, 0, 0.3333, 'P520', 1, '*'),
(1318, 'ponieważ', 'ponieważ', 0, 0, 0.5333, 'P500', 1, '*'),
(1319, 'poniżej', 'poniżej', 0, 0, 0.4667, 'P520', 1, '*'),
(1320, 'pornograficznymi', 'pornograficznymi', 0, 0, 1, 'P6526125', 1, '*'),
(1321, 'potencjalnych', 'potencjalnych', 0, 0, 0.8667, 'P352452', 1, '*'),
(1322, 'powiedziała', 'powiedziała', 0, 0, 0.7333, 'P320', 1, '*'),
(1323, 'prawo', 'prawo', 0, 0, 0.3333, 'P600', 1, '*'),
(1324, 'priorytet', 'priorytet', 0, 0, 0.6, 'P630', 1, '*'),
(1325, 'profile', 'profile', 0, 0, 0.4667, 'P614', 1, '*'),
(1326, 'prośby', 'prośby', 0, 0, 0.4, 'P610', 1, '*'),
(1327, 'prywatne', 'prywatne', 0, 0, 0.5333, 'P635', 1, '*'),
(1328, 'prywatności', 'prywatności', 0, 0, 0.7333, 'P6352', 1, '*'),
(1329, 'prywatność', 'prywatność', 0, 0, 0.6667, 'P635', 1, '*'),
(1330, 'prywatnych', 'prywatnych', 0, 0, 0.6667, 'P6352', 1, '*'),
(1331, 'przesyłania', 'przesyłania', 0, 0, 0.7333, 'P625', 1, '*'),
(1332, 'ramach', 'ramach', 0, 0, 0.4, 'R520', 1, '*'),
(1333, 'regionu', 'regionu', 0, 0, 0.4667, 'R250', 1, '*'),
(1334, 'rozwiązaniem', 'rozwiązaniem', 0, 0, 0.8, 'R250', 1, '*'),
(1335, 'samodzielnie', 'samodzielnie', 0, 0, 0.8, 'S53245', 1, '*'),
(1336, 'serwis', 'serwis', 0, 0, 0.4, 'S620', 2, '*'),
(1337, 'sieci', 'sieci', 0, 0, 0.3333, 'S000', 1, '*'),
(1338, 'sierpniu', 'sierpniu', 0, 0, 0.5333, 'S615', 1, '*'),
(1339, 'społeczności', 'społeczności', 0, 0, 0.8, 'S1252', 1, '*'),
(1340, 'staną', 'staną', 0, 0, 0.3333, 'S350', 1, '*'),
(1341, 'szacunków', 'szacunków', 0, 0, 0.6, 'S520', 1, '*'),
(1342, 'szczególny', 'szczególny', 0, 0, 0.6667, 'S450', 1, '*'),
(1343, 'szykuje', 'szykuje', 0, 0, 0.4667, 'S000', 1, '*'),
(1344, 'tiktok', 'tiktok', 0, 0, 0.4, 'T232', 1, '*'),
(1345, 'tiktoka', 'tiktoka', 0, 0, 0.4667, 'T232', 1, '*'),
(1346, 'times', 'times', 0, 0, 0.3333, 'T520', 1, '*'),
(1347, 'trzeba', 'trzeba', 0, 0, 0.4, 'T621', 1, '*'),
(1348, 'trzecią', 'trzecią', 0, 0, 0.4667, 'T620', 1, '*'),
(1349, 'urodzenia', 'urodzenia', 0, 0, 0.6, 'U6325', 1, '*'),
(1350, 'ustawienia', 'ustawienia', 0, 0, 0.6667, 'U235', 1, '*'),
(1351, 'utworzonych', 'utworzonych', 0, 0, 0.7333, 'U36252', 1, '*'),
(1352, 'użytkowników', 'użytkowników', 0, 0, 0.8, 'U3252', 2, '*'),
(1353, 'wiadomo', 'wiadomo', 0, 0, 0.4667, 'W350', 1, '*'),
(1354, 'wiadomości', 'wiadomości', 0, 0, 0.6667, 'W352', 1, '*'),
(1355, 'wideo', 'wideo', 0, 0, 0.3333, 'W300', 1, '*'),
(1356, 'wprowadzamy', 'wprowadzamy', 0, 0, 0.7333, 'W16325', 1, '*'),
(1357, 'wprowadzi', 'wprowadzi', 0, 0, 0.6, 'W1632', 1, '*'),
(1358, 'wschodu', 'wschodu', 0, 0, 0.4667, 'W230', 1, '*'),
(1359, 'wszystkich', 'wszystkich', 0, 0, 0.6667, 'W232', 1, '*'),
(1360, 'wszystkie', 'wszystkie', 0, 0, 0.6, 'W232', 2, '*'),
(1361, 'wykorzystywana', 'wykorzystywana', 0, 0, 0.9333, 'W26235', 1, '*'),
(1362, 'wątpliwości', 'wątpliwości', 0, 0, 0.7333, 'W3142', 2, '*'),
(1363, 'york', 'york', 0, 0, 0.2667, 'Y620', 2, '*'),
(1364, 'zakładać', 'zakładać', 0, 0, 0.5333, 'Z300', 1, '*'),
(1365, 'zamiana', 'zamiana', 0, 0, 0.4667, 'Z500', 1, '*'),
(1366, 'zapowiedziane', 'zapowiedziane', 0, 0, 0.8667, 'Z1325', 1, '*'),
(1367, 'zastosowane', 'zastosowane', 0, 0, 0.7333, 'Z325', 1, '*'),
(1368, 'zatwierdzać', 'zatwierdzać', 0, 0, 0.7333, 'Z3632', 1, '*'),
(1369, 'zdaniem', 'zdaniem', 0, 0, 0.4667, 'Z350', 1, '*'),
(1370, 'zmiany', 'zmiany', 0, 0, 0.4, 'Z500', 1, '*'),
(1371, 'znaczące', 'znaczące', 0, 0, 0.5333, 'Z520', 1, '*'),
(1372, 'zostaną', 'zostaną', 0, 0, 0.4667, 'Z350', 1, '*'),
(1373, 'łatwością', 'łatwością', 0, 0, 0.6, 'ł320', 1, '*'),
(1374, 'łączenia', 'łączenia', 0, 0, 0.5333, 'ł250', 1, '*'),
(1375, 'środę', 'środę', 0, 0, 0.3333, 'ś630', 1, '*'),
(1376, 'życia', 'życia', 0, 0, 0.3333, 'ż200', 1, '*'),
(1486, '2,5', '2,5', 0, 0, 0.3, '', 1, '*'),
(1487, '2012', '2012', 0, 0, 0.4, '', 1, '*'),
(1488, '2016', '2016', 0, 0, 0.4, '', 1, '*'),
(1489, '40', '40', 0, 0, 0.2, '', 1, '*'),
(1490, '50', '50', 0, 0, 0.2, '', 1, '*'),
(1491, '6', '6', 0, 0, 0.1, '', 1, '*'),
(1492, '7', '7', 0, 0, 0.1, '', 1, '*'),
(1493, 'afery', 'afery', 0, 0, 0.3333, 'A160', 1, '*'),
(1494, 'aferą', 'aferą', 0, 0, 0.3333, 'A160', 1, '*'),
(1495, 'agencja', 'agencja', 0, 0, 0.4667, 'A252', 1, '*'),
(1496, 'akcje', 'akcje', 0, 0, 0.3333, 'A200', 1, '*'),
(1497, 'analytica', 'analytica', 0, 0, 0.6, 'A5432', 1, '*'),
(1498, 'aż', 'aż', 0, 0, 0.1333, 'A000', 1, '*'),
(1499, 'bank', 'bank', 0, 0, 0.2667, 'B520', 1, '*'),
(1500, 'banku', 'banku', 0, 0, 0.3333, 'B520', 1, '*'),
(1501, 'bezpieczniej', 'bezpieczniej', 0, 0, 0.8, 'B21252', 1, '*'),
(1502, 'blisko', 'blisko', 0, 0, 0.4, 'B420', 1, '*'),
(1503, 'bloomberg', 'bloomberg', 0, 0, 0.6, 'B45162', 1, '*'),
(1504, 'cambridge', 'cambridge', 0, 0, 0.6, 'C51632', 1, '*'),
(1505, 'ciągle', 'ciągle', 0, 0, 0.4, 'C400', 1, '*'),
(1506, 'czarnej', 'czarnej', 0, 0, 0.4667, 'C652', 1, '*'),
(1507, 'dane', 'dane', 0, 0, 0.2667, 'D500', 1, '*'),
(1508, 'danych', 'danych', 0, 0, 0.4, 'D520', 1, '*'),
(1509, 'delikatne', 'delikatne', 0, 0, 0.6, 'D4235', 1, '*'),
(1510, 'dolarów', 'dolarów', 0, 0, 0.4667, 'D460', 1, '*'),
(1511, 'donalda', 'donalda', 0, 0, 0.4667, 'D543', 1, '*'),
(1512, 'donosi', 'donosi', 0, 0, 0.4, 'D520', 1, '*'),
(1513, 'duży', 'duży', 0, 0, 0.2667, 'D000', 1, '*'),
(1514, 'dziennikarzy', 'dziennikarzy', 0, 0, 0.8, 'D25262', 1, '*'),
(1515, 'dzień', 'dzień', 0, 0, 0.3333, 'D200', 1, '*'),
(1516, 'dół', 'dół', 0, 0, 0.2, 'D000', 1, '*'),
(1517, 'emocje', 'emocje', 0, 0, 0.4, 'E520', 1, '*'),
(1518, 'europie', 'europie', 0, 0, 0.4667, 'E610', 1, '*'),
(1519, 'facebook', 'facebook', 0, 0, 0.5333, 'F212', 1, '*'),
(1520, 'facebooka', 'facebooka', 0, 0, 0.6, 'F212', 1, '*'),
(1521, 'finansowych', 'finansowych', 0, 0, 0.7333, 'F520', 1, '*'),
(1522, 'firmy', 'firmy', 0, 0, 0.3333, 'F650', 1, '*'),
(1523, 'firmę', 'firmę', 0, 0, 0.3333, 'F650', 1, '*'),
(1524, 'fundusze', 'fundusze', 0, 0, 0.5333, 'F532', 1, '*'),
(1525, 'inwestorów', 'inwestorów', 0, 0, 0.6667, 'I5236', 1, '*'),
(1526, 'inwestycjami', 'inwestycjami', 0, 0, 0.8, 'I52325', 1, '*'),
(1527, 'inwestycji', 'inwestycji', 0, 0, 0.6667, 'I5232', 1, '*'),
(1528, 'inwestycyjne', 'inwestycyjne', 0, 0, 0.8, 'I52325', 1, '*'),
(1529, 'jaki', 'jaki', 0, 0, 0.2667, 'J000', 1, '*'),
(1530, 'jaw', 'jaw', 0, 0, 0.2, 'J000', 1, '*'),
(1531, 'jeden', 'jeden', 0, 0, 0.3333, 'J350', 1, '*'),
(1532, 'jedna', 'jedna', 0, 0, 0.3333, 'J350', 1, '*'),
(1533, 'kampanii', 'kampanii', 0, 0, 0.5333, 'K515', 1, '*'),
(1534, 'kilkadziesiąt', 'kilkadziesiąt', 0, 0, 0.8667, 'K42323', 1, '*'),
(1535, 'kupować', 'kupować', 0, 0, 0.4667, 'K100', 1, '*'),
(1536, 'kupował', 'kupował', 0, 0, 0.4667, 'K100', 1, '*'),
(1537, 'kwarantanny', 'kwarantanny', 0, 0, 0.7333, 'K6535', 1, '*'),
(1538, 'lecą', 'lecą', 0, 0, 0.2667, 'L200', 1, '*'),
(1539, 'liscie', 'liscie', 0, 0, 0.4, 'L200', 1, '*'),
(1540, 'liście', 'liście', 0, 0, 0.4, 'L200', 1, '*'),
(1541, 'luki', 'luki', 0, 0, 0.2667, 'L200', 1, '*'),
(1542, 'marka', 'marka', 0, 0, 0.3333, 'M620', 1, '*'),
(1543, 'miała', 'miała', 0, 0, 0.3333, 'M000', 1, '*'),
(1544, 'miliardów', 'miliardów', 0, 0, 0.6, 'M463', 1, '*'),
(1545, 'mld', 'mld', 0, 0, 0.2, 'M430', 1, '*'),
(1546, 'momentu', 'momentu', 0, 0, 0.4667, 'M300', 1, '*'),
(1547, 'mówią', 'mówią', 0, 0, 0.3333, 'M000', 1, '*'),
(1548, 'największych', 'największych', 0, 0, 0.8, 'N200', 1, '*'),
(1549, 'należące', 'należące', 0, 0, 0.5333, 'N420', 1, '*'),
(1550, 'napięta', 'napięta', 0, 0, 0.4667, 'N130', 1, '*'),
(1551, 'nałożył', 'nałożył', 0, 0, 0.4667, 'N000', 1, '*'),
(1552, 'niedopełnienie', 'niedopełnienie', 0, 0, 0.9333, 'N315', 1, '*'),
(1553, 'niego', 'niego', 0, 0, 0.3333, 'N200', 1, '*'),
(1554, 'niektóre', 'niektóre', 0, 0, 0.5333, 'N236', 1, '*'),
(1555, 'niektórzy', 'niektórzy', 0, 0, 0.6, 'N2362', 1, '*'),
(1556, 'nielegalnie', 'nielegalnie', 0, 0, 0.7333, 'N4245', 1, '*'),
(1557, 'niemal', 'niemal', 0, 0, 0.4, 'N400', 1, '*'),
(1558, 'nordea', 'nordea', 0, 0, 0.4, 'N630', 1, '*'),
(1559, 'nordei', 'nordei', 0, 0, 0.4, 'N630', 1, '*'),
(1560, 'notowania', 'notowania', 0, 0, 0.6, 'N350', 1, '*'),
(1561, 'obowiązków', 'obowiązków', 0, 0, 0.6667, 'O120', 1, '*'),
(1562, 'observera', 'observera', 0, 0, 0.6, 'O12616', 1, '*'),
(1563, 'ochrony', 'ochrony', 0, 0, 0.4667, 'O265', 1, '*'),
(1564, 'odkrytą', 'odkrytą', 0, 0, 0.4667, 'O3263', 1, '*'),
(1565, 'odrzucają', 'odrzucają', 0, 0, 0.6, 'O362', 1, '*'),
(1566, 'odwołania', 'odwołania', 0, 0, 0.6, 'O350', 1, '*'),
(1567, 'ona', 'ona', 0, 0, 0.2, 'O500', 1, '*'),
(1568, 'opadną', 'opadną', 0, 0, 0.4, 'O135', 1, '*'),
(1569, 'ostatecznie', 'ostatecznie', 0, 0, 0.7333, 'O2325', 1, '*'),
(1570, 'oszukani', 'oszukani', 0, 0, 0.5333, 'O250', 1, '*'),
(1571, 'oświadczeniu', 'oświadczeniu', 0, 0, 0.8, 'O325', 1, '*'),
(1572, 'panicznej', 'panicznej', 0, 0, 0.6, 'P5252', 1, '*'),
(1573, 'papiery', 'papiery', 0, 0, 0.4667, 'P600', 1, '*'),
(1574, 'początek', 'początek', 0, 0, 0.5333, 'P232', 1, '*'),
(1575, 'poleciały', 'poleciały', 0, 0, 0.6, 'P420', 1, '*'),
(1576, 'poniedziałek', 'poniedziałek', 0, 0, 0.8, 'P532', 1, '*'),
(1577, 'popularny', 'popularny', 0, 0, 0.6, 'P465', 1, '*'),
(1578, 'posiadających', 'posiadających', 0, 0, 0.8667, 'P232', 1, '*'),
(1579, 'posłużyły', 'posłużyły', 0, 0, 0.6, 'P200', 1, '*'),
(1580, 'potrwa', 'potrwa', 0, 0, 0.4, 'P360', 1, '*'),
(1581, 'presją', 'presją', 0, 0, 0.4, 'P620', 1, '*'),
(1582, 'proc', 'proc', 0, 0, 0.2667, 'P620', 1, '*'),
(1583, 'profilu', 'profilu', 0, 0, 0.4667, 'P614', 1, '*'),
(1584, 'promowania', 'promowania', 0, 0, 0.6667, 'P650', 1, '*'),
(1585, 'przedstawiciele', 'przedstawiciele', 0, 0, 1, 'P6232324', 1, '*'),
(1586, 'przekonuje', 'przekonuje', 0, 0, 0.6667, 'P6252', 1, '*'),
(1587, 'przynosi', 'przynosi', 0, 0, 0.5333, 'P6252', 1, '*'),
(1588, 'razie', 'razie', 0, 0, 0.3333, 'R200', 1, '*'),
(1589, 'reakcji', 'reakcji', 0, 0, 0.4667, 'R200', 1, '*'),
(1590, 'rezygnują', 'rezygnują', 0, 0, 0.6, 'R252', 1, '*'),
(1591, 'rodzaj', 'rodzaj', 0, 0, 0.4, 'R320', 1, '*'),
(1592, 'rynkowa', 'rynkowa', 0, 0, 0.4667, 'R520', 1, '*'),
(1593, 'rzędu', 'rzędu', 0, 0, 0.3333, 'R230', 1, '*'),
(1594, 'sesji', 'sesji', 0, 0, 0.3333, 'S000', 1, '*'),
(1595, 'skandynawii', 'skandynawii', 0, 0, 0.7333, 'S535', 1, '*'),
(1596, 'spadki', 'spadki', 0, 0, 0.4, 'S132', 1, '*'),
(1597, 'spadła', 'spadła', 0, 0, 0.4, 'S130', 1, '*'),
(1598, 'społecznościowy', 'społecznościowy', 0, 0, 1, 'S1252', 1, '*'),
(1599, 'sprawa', 'sprawa', 0, 0, 0.4, 'S160', 1, '*'),
(1600, 'spółki', 'spółki', 0, 0, 0.4, 'S120', 1, '*'),
(1601, 'starają', 'starają', 0, 0, 0.4667, 'S362', 1, '*'),
(1602, 'stwierdziły', 'stwierdziły', 0, 0, 0.7333, 'S3632', 1, '*'),
(1603, 'systemie', 'systemie', 0, 0, 0.5333, 'S350', 1, '*'),
(1604, 'sytuacja', 'sytuacja', 0, 0, 0.5333, 'S320', 1, '*'),
(1605, 'timesa', 'timesa', 0, 0, 0.4, 'T520', 1, '*'),
(1606, 'tonować', 'tonować', 0, 0, 0.4667, 'T500', 1, '*'),
(1607, 'tracąc', 'tracąc', 0, 0, 0.4, 'T620', 1, '*'),
(1608, 'trumpa', 'trumpa', 0, 0, 0.4, 'T651', 1, '*'),
(1609, 'trzeci', 'trzeci', 0, 0, 0.4, 'T620', 1, '*'),
(1610, 'udziałów', 'udziałów', 0, 0, 0.5333, 'U320', 1, '*'),
(1611, 'umieszczeniu', 'umieszczeniu', 0, 0, 0.8, 'U525', 1, '*'),
(1612, 'użyte', 'użyte', 0, 0, 0.3333, 'U300', 1, '*'),
(1613, 'wartość', 'wartość', 0, 0, 0.4667, 'W630', 1, '*'),
(1614, 'weekend', 'weekend', 0, 0, 0.4667, 'W253', 1, '*'),
(1615, 'widzieliśmy', 'widzieliśmy', 0, 0, 0.7333, 'W3245', 1, '*'),
(1616, 'widząc', 'widząc', 0, 0, 0.4, 'W320', 1, '*'),
(1617, 'wkrótkim', 'wkrótkim', 0, 0, 0.5333, 'W26325', 1, '*'),
(1618, 'września', 'września', 0, 0, 0.5333, 'W625', 1, '*'),
(1619, 'wskazują', 'wskazują', 0, 0, 0.5333, 'W200', 1, '*'),
(1620, 'wstrzymać', 'wstrzymać', 0, 0, 0.6, 'W23625', 1, '*'),
(1621, 'wtorek', 'wtorek', 0, 0, 0.4, 'W362', 1, '*'),
(1622, 'wyborczej', 'wyborczej', 0, 0, 0.6, 'W162', 1, '*'),
(1623, 'wyborców', 'wyborców', 0, 0, 0.5333, 'W162', 1, '*'),
(1624, 'wyjaśni', 'wyjaśni', 0, 0, 0.4667, 'W250', 1, '*'),
(1625, 'wyjaśnienia', 'wyjaśnienia', 0, 0, 0.7333, 'W250', 1, '*'),
(1626, 'wyszła', 'wyszła', 0, 0, 0.4, 'W200', 1, '*'),
(1627, 'zainkasować', 'zainkasować', 0, 0, 0.7333, 'Z520', 1, '*'),
(1628, 'zarzuty', 'zarzuty', 0, 0, 0.4667, 'Z623', 1, '*'),
(1629, 'zdecydowała', 'zdecydowała', 0, 0, 0.7333, 'Z323', 1, '*'),
(1630, 'zmalała', 'zmalała', 0, 0, 0.4667, 'Z540', 1, '*'),
(1631, 'zmanipulowania', 'zmanipulowania', 0, 0, 0.9333, 'Z5145', 1, '*'),
(1632, 'zostali', 'zostali', 0, 0, 0.4667, 'Z340', 1, '*'),
(1633, 'zostać', 'zostać', 0, 0, 0.4, 'Z300', 1, '*'),
(1634, 'zrównoważonym', 'zrównoważonym', 0, 0, 0.8667, 'Z650', 1, '*'),
(1635, 'zuckerberga', 'zuckerberga', 0, 0, 0.7333, 'Z6162', 1, '*'),
(1636, 'związku', 'związku', 0, 0, 0.4667, 'Z000', 1, '*'),
(1637, 'śledczych', 'śledczych', 0, 0, 0.6, 'ś432', 1, '*'),
(1638, 'środowej', 'środowej', 0, 0, 0.5333, 'ś632', 1, '*');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `buf3w_finder_terms_common`
--

CREATE TABLE `buf3w_finder_terms_common` (
  `term` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `custom` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `buf3w_finder_terms_common`
--

INSERT INTO `buf3w_finder_terms_common` (`term`, `language`, `custom`) VALUES
('a', 'en', 0),
('about', 'en', 0),
('above', 'en', 0),
('after', 'en', 0),
('again', 'en', 0),
('against', 'en', 0),
('all', 'en', 0),
('am', 'en', 0),
('an', 'en', 0),
('and', 'en', 0),
('any', 'en', 0),
('are', 'en', 0),
('aren\'t', 'en', 0),
('as', 'en', 0),
('at', 'en', 0),
('be', 'en', 0),
('because', 'en', 0),
('been', 'en', 0),
('before', 'en', 0),
('being', 'en', 0),
('below', 'en', 0),
('between', 'en', 0),
('both', 'en', 0),
('but', 'en', 0),
('by', 'en', 0),
('can\'t', 'en', 0),
('cannot', 'en', 0),
('could', 'en', 0),
('couldn\'t', 'en', 0),
('did', 'en', 0),
('didn\'t', 'en', 0),
('do', 'en', 0),
('does', 'en', 0),
('doesn\'t', 'en', 0),
('doing', 'en', 0),
('don\'t', 'en', 0),
('down', 'en', 0),
('during', 'en', 0),
('each', 'en', 0),
('few', 'en', 0),
('for', 'en', 0),
('from', 'en', 0),
('further', 'en', 0),
('had', 'en', 0),
('hadn\'t', 'en', 0),
('has', 'en', 0),
('hasn\'t', 'en', 0),
('have', 'en', 0),
('haven\'t', 'en', 0),
('having', 'en', 0),
('he', 'en', 0),
('he\'d', 'en', 0),
('he\'ll', 'en', 0),
('he\'s', 'en', 0),
('her', 'en', 0),
('here', 'en', 0),
('here\'s', 'en', 0),
('hers', 'en', 0),
('herself', 'en', 0),
('him', 'en', 0),
('himself', 'en', 0),
('his', 'en', 0),
('how', 'en', 0),
('how\'s', 'en', 0),
('i', 'en', 0),
('i\'d', 'en', 0),
('i\'ll', 'en', 0),
('i\'m', 'en', 0),
('i\'ve', 'en', 0),
('if', 'en', 0),
('in', 'en', 0),
('into', 'en', 0),
('is', 'en', 0),
('isn\'t', 'en', 0),
('it', 'en', 0),
('it\'s', 'en', 0),
('its', 'en', 0),
('itself', 'en', 0),
('let\'s', 'en', 0),
('me', 'en', 0),
('more', 'en', 0),
('most', 'en', 0),
('mustn\'t', 'en', 0),
('my', 'en', 0),
('myself', 'en', 0),
('no', 'en', 0),
('nor', 'en', 0),
('not', 'en', 0),
('of', 'en', 0),
('off', 'en', 0),
('on', 'en', 0),
('once', 'en', 0),
('only', 'en', 0),
('or', 'en', 0),
('other', 'en', 0),
('ought', 'en', 0),
('our', 'en', 0),
('ours', 'en', 0),
('ourselves', 'en', 0),
('out', 'en', 0),
('over', 'en', 0),
('own', 'en', 0),
('same', 'en', 0),
('shan\'t', 'en', 0),
('she', 'en', 0),
('she\'d', 'en', 0),
('she\'ll', 'en', 0),
('she\'s', 'en', 0),
('should', 'en', 0),
('shouldn\'t', 'en', 0),
('so', 'en', 0),
('some', 'en', 0),
('such', 'en', 0),
('than', 'en', 0),
('that', 'en', 0),
('that\'s', 'en', 0),
('the', 'en', 0),
('their', 'en', 0),
('theirs', 'en', 0),
('them', 'en', 0),
('themselves', 'en', 0),
('then', 'en', 0),
('there', 'en', 0),
('there\'s', 'en', 0),
('these', 'en', 0),
('they', 'en', 0),
('they\'d', 'en', 0),
('they\'ll', 'en', 0),
('they\'re', 'en', 0),
('they\'ve', 'en', 0),
('this', 'en', 0),
('those', 'en', 0),
('through', 'en', 0),
('to', 'en', 0),
('too', 'en', 0),
('under', 'en', 0),
('until', 'en', 0),
('up', 'en', 0),
('very', 'en', 0),
('was', 'en', 0),
('wasn\'t', 'en', 0),
('we', 'en', 0),
('we\'d', 'en', 0),
('we\'ll', 'en', 0),
('we\'re', 'en', 0),
('we\'ve', 'en', 0),
('were', 'en', 0),
('weren\'t', 'en', 0),
('what', 'en', 0),
('what\'s', 'en', 0),
('when', 'en', 0),
('when\'s', 'en', 0),
('where', 'en', 0),
('where\'s', 'en', 0),
('which', 'en', 0),
('while', 'en', 0),
('who', 'en', 0),
('who\'s', 'en', 0),
('whom', 'en', 0),
('why', 'en', 0),
('why\'s', 'en', 0),
('with', 'en', 0),
('won\'t', 'en', 0),
('would', 'en', 0),
('wouldn\'t', 'en', 0),
('you', 'en', 0),
('you\'d', 'en', 0),
('you\'ll', 'en', 0),
('you\'re', 'en', 0),
('you\'ve', 'en', 0),
('your', 'en', 0),
('yours', 'en', 0),
('yourself', 'en', 0),
('yourselves', 'en', 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `buf3w_finder_tokens`
--

CREATE TABLE `buf3w_finder_tokens` (
  `term` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `stem` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `common` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `phrase` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `weight` float UNSIGNED NOT NULL DEFAULT 1,
  `context` tinyint(3) UNSIGNED NOT NULL DEFAULT 2,
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=MEMORY DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `buf3w_finder_tokens_aggregate`
--

CREATE TABLE `buf3w_finder_tokens_aggregate` (
  `term_id` int(10) UNSIGNED NOT NULL,
  `term` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `stem` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `common` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `phrase` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `term_weight` float UNSIGNED NOT NULL DEFAULT 0,
  `context` tinyint(3) UNSIGNED NOT NULL DEFAULT 2,
  `context_weight` float UNSIGNED NOT NULL DEFAULT 0,
  `total_weight` float UNSIGNED NOT NULL DEFAULT 0,
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=MEMORY DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `buf3w_finder_types`
--

CREATE TABLE `buf3w_finder_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `buf3w_finder_types`
--

INSERT INTO `buf3w_finder_types` (`id`, `title`, `mime`) VALUES
(1, 'Category', ''),
(2, 'Contact', ''),
(3, 'Article', ''),
(4, 'News Feed', ''),
(5, 'Tag', '');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `buf3w_guidedtours`
--

CREATE TABLE `buf3w_guidedtours` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT 0,
  `extensions` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `created_by` int(11) NOT NULL DEFAULT 0,
  `modified` datetime NOT NULL,
  `modified_by` int(11) NOT NULL DEFAULT 0,
  `checked_out_time` datetime DEFAULT NULL,
  `checked_out` int(10) UNSIGNED DEFAULT NULL,
  `published` tinyint(4) NOT NULL DEFAULT 0,
  `language` varchar(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `access` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `buf3w_guidedtours`
--

INSERT INTO `buf3w_guidedtours` (`id`, `title`, `description`, `ordering`, `extensions`, `url`, `created`, `created_by`, `modified`, `modified_by`, `checked_out_time`, `checked_out`, `published`, `language`, `note`, `access`) VALUES
(1, 'COM_GUIDEDTOURS_TOUR_GUIDEDTOURS_TITLE', 'COM_GUIDEDTOURS_TOUR_GUIDEDTOURS_DESCRIPTION', 1, '[\"com_guidedtours\"]', 'administrator/index.php?option=com_guidedtours&view=tours', '2023-06-06 05:52:05', 0, '2023-06-06 05:52:05', 0, NULL, NULL, 1, '*', '', 1),
(2, 'COM_GUIDEDTOURS_TOUR_GUIDEDTOURSTEPS_TITLE', 'COM_GUIDEDTOURS_TOUR_GUIDEDTOURSTEPS_DESCRIPTION', 2, '[\"com_guidedtours\"]', 'administrator/index.php?option=com_guidedtours&view=tours', '2023-06-06 05:52:05', 0, '2023-06-06 05:52:05', 0, NULL, NULL, 1, '*', '', 1),
(3, 'COM_GUIDEDTOURS_TOUR_ARTICLES_TITLE', 'COM_GUIDEDTOURS_TOUR_ARTICLES_DESCRIPTION', 3, '[\"*\"]', 'administrator/index.php?option=com_content&view=articles', '2023-06-06 05:52:05', 0, '2023-06-06 05:52:05', 0, NULL, NULL, 1, '*', '', 1),
(4, 'COM_GUIDEDTOURS_TOUR_CATEGORIES_TITLE', 'COM_GUIDEDTOURS_TOUR_CATEGORIES_DESCRIPTION', 4, '[\"*\"]', 'administrator/index.php?option=com_categories&view=categories&extension=com_content', '2023-06-06 05:52:05', 0, '2023-06-06 05:52:05', 0, NULL, NULL, 1, '*', '', 1),
(5, 'COM_GUIDEDTOURS_TOUR_MENUS_TITLE', 'COM_GUIDEDTOURS_TOUR_MENUS_DESCRIPTION', 5, '[\"*\"]', 'administrator/index.php?option=com_menus&view=menus', '2023-06-06 05:52:05', 0, '2023-06-06 05:52:05', 0, NULL, NULL, 1, '*', '', 1),
(6, 'COM_GUIDEDTOURS_TOUR_TAGS_TITLE', 'COM_GUIDEDTOURS_TOUR_TAGS_DESCRIPTION', 6, '[\"*\"]', 'administrator/index.php?option=com_tags&view=tags', '2023-06-06 05:52:05', 0, '2023-06-06 05:52:05', 0, NULL, NULL, 1, '*', '', 1),
(7, 'COM_GUIDEDTOURS_TOUR_BANNERS_TITLE', 'COM_GUIDEDTOURS_TOUR_BANNERS_DESCRIPTION', 7, '[\"*\"]', 'administrator/index.php?option=com_banners&view=banners', '2023-06-06 05:52:05', 0, '2023-06-06 05:52:05', 0, NULL, NULL, 1, '*', '', 1),
(8, 'COM_GUIDEDTOURS_TOUR_CONTACTS_TITLE', 'COM_GUIDEDTOURS_TOUR_CONTACTS_DESCRIPTION', 8, '[\"*\"]', 'administrator/index.php?option=com_contact&view=contacts', '2023-06-06 05:52:05', 0, '2023-06-06 05:52:05', 0, NULL, NULL, 1, '*', '', 1),
(9, 'COM_GUIDEDTOURS_TOUR_NEWSFEEDS_TITLE', 'COM_GUIDEDTOURS_TOUR_NEWSFEEDS_DESCRIPTION', 9, '[\"*\"]', 'administrator/index.php?option=com_newsfeeds&view=newsfeeds', '2023-06-06 05:52:05', 0, '2023-06-06 05:52:05', 0, NULL, NULL, 1, '*', '', 1),
(10, 'COM_GUIDEDTOURS_TOUR_SMARTSEARCH_TITLE', 'COM_GUIDEDTOURS_TOUR_SMARTSEARCH_DESCRIPTION', 10, '[\"*\"]', 'administrator/index.php?option=com_finder&view=filters', '2023-06-06 05:52:05', 0, '2023-06-06 05:52:05', 0, NULL, NULL, 1, '*', '', 1),
(11, 'COM_GUIDEDTOURS_TOUR_USERS_TITLE', 'COM_GUIDEDTOURS_TOUR_USERS_DESCRIPTION', 11, '[\"*\"]', 'administrator/index.php?option=com_users&view=users', '2023-06-06 05:52:05', 0, '2023-06-06 05:52:05', 0, NULL, NULL, 1, '*', '', 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `buf3w_guidedtour_steps`
--

CREATE TABLE `buf3w_guidedtour_steps` (
  `id` int(11) NOT NULL,
  `tour_id` int(11) NOT NULL DEFAULT 0,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `published` tinyint(4) NOT NULL DEFAULT 0,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT 0,
  `position` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `interactive_type` int(11) NOT NULL DEFAULT 1,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `created_by` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `modified` datetime NOT NULL,
  `modified_by` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `checked_out_time` datetime DEFAULT NULL,
  `checked_out` int(10) UNSIGNED DEFAULT NULL,
  `language` varchar(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `buf3w_guidedtour_steps`
--

INSERT INTO `buf3w_guidedtour_steps` (`id`, `tour_id`, `title`, `published`, `description`, `ordering`, `position`, `target`, `type`, `interactive_type`, `url`, `created`, `created_by`, `modified`, `modified_by`, `checked_out_time`, `checked_out`, `language`, `note`) VALUES
(1, 1, 'COM_GUIDEDTOURS_TOUR_GUIDEDTOURS_STEP_NEW_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_GUIDEDTOURS_STEP_NEW_DESCRIPTION', 1, 'bottom', '.button-new', 2, 1, 'administrator/index.php?option=com_guidedtours&view=tours', '2023-06-06 05:52:05', 0, '2023-06-06 05:52:05', 0, NULL, NULL, '*', ''),
(2, 1, 'COM_GUIDEDTOURS_TOUR_GUIDEDTOURS_STEP_TITLE_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_GUIDEDTOURS_STEP_TITLE_DESCRIPTION', 2, 'bottom', '#jform_title', 2, 2, 'administrator/index.php?option=com_guidedtours&view=tour&layout=edit', '2023-06-06 05:52:05', 0, '2023-06-06 05:52:05', 0, NULL, NULL, '*', ''),
(3, 1, 'COM_GUIDEDTOURS_TOUR_GUIDEDTOURS_STEP_URL_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_GUIDEDTOURS_STEP_URL_DESCRIPTION', 3, 'top', '#jform_url', 2, 2, 'administrator/index.php?option=com_guidedtours&view=tour&layout=edit', '2023-06-06 05:52:05', 0, '2023-06-06 05:52:05', 0, NULL, NULL, '*', ''),
(4, 1, 'COM_GUIDEDTOURS_TOUR_GUIDEDTOURS_STEP_CONTENT_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_GUIDEDTOURS_STEP_CONTENT_DESCRIPTION', 4, 'bottom', '#jform_description,#jform_description_ifr', 2, 3, 'administrator/index.php?option=com_guidedtours&view=tour&layout=edit', '2023-06-06 05:52:05', 0, '2023-06-06 05:52:05', 0, NULL, NULL, '*', ''),
(5, 1, 'COM_GUIDEDTOURS_TOUR_GUIDEDTOURS_STEP_COMPONENT_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_GUIDEDTOURS_STEP_COMPONENT_DESCRIPTION', 5, 'top', 'joomla-field-fancy-select .choices', 2, 3, 'administrator/index.php?option=com_guidedtours&view=tour&layout=edit', '2023-06-06 05:52:05', 0, '2023-06-06 05:52:05', 0, NULL, NULL, '*', ''),
(6, 1, 'COM_GUIDEDTOURS_TOUR_GUIDEDTOURS_STEP_SAVECLOSE_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_GUIDEDTOURS_STEP_SAVECLOSE_DESCRIPTION', 6, 'top', '#save-group-children-save .button-save', 2, 1, 'administrator/index.php?option=com_guidedtours&view=tour&layout=edit', '2023-06-06 05:52:05', 0, '2023-06-06 05:52:05', 0, NULL, NULL, '*', ''),
(7, 1, 'COM_GUIDEDTOURS_TOUR_GUIDEDTOURS_STEP_CONGRATULATIONS_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_GUIDEDTOURS_STEP_CONGRATULATIONS_DESCRIPTION', 7, 'bottom', '', 0, 1, 'administrator/index.php?option=com_guidedtours&view=tour&layout=edit', '2023-06-06 05:52:05', 0, '2023-06-06 05:52:05', 0, NULL, NULL, '*', ''),
(8, 2, 'COM_GUIDEDTOURS_TOUR_GUIDEDTOURSTEPS_STEP_COUNTER_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_GUIDEDTOURSTEPS_STEP_COUNTER_DESCRIPTION', 8, 'top', '#toursList tbody tr:nth-last-of-type(1) td:nth-of-type(5) .btn', 2, 1, '', '2023-06-06 05:52:05', 0, '2023-06-06 05:52:05', 0, NULL, NULL, '*', ''),
(9, 2, 'COM_GUIDEDTOURS_TOUR_GUIDEDTOURSTEPS_STEP_NEW_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_GUIDEDTOURSTEPS_STEP_NEW_DESCRIPTION', 9, 'bottom', '.button-new', 2, 1, '', '2023-06-06 05:52:05', 0, '2023-06-06 05:52:05', 0, NULL, NULL, '*', ''),
(10, 2, 'COM_GUIDEDTOURS_TOUR_GUIDEDTOURSTEPS_STEP_TITLE_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_GUIDEDTOURSTEPS_STEP_TITLE_DESCRIPTION', 10, 'bottom', '#jform_title', 2, 2, '', '2023-06-06 05:52:05', 0, '2023-06-06 05:52:05', 0, NULL, NULL, '*', ''),
(11, 2, 'COM_GUIDEDTOURS_TOUR_GUIDEDTOURSTEPS_STEP_DESCRIPTION_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_GUIDEDTOURSTEPS_STEP_DESCRIPTION_DESCRIPTION', 11, 'bottom', '#jform_description,#jform_description_ifr', 2, 3, '', '2023-06-06 05:52:05', 0, '2023-06-06 05:52:05', 0, NULL, NULL, '*', ''),
(12, 2, 'COM_GUIDEDTOURS_TOUR_GUIDEDTOURSTEPS_STEP_STATUS_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_GUIDEDTOURSTEPS_STEP_STATUS_DESCRIPTION', 12, 'bottom', '#jform_published', 2, 3, '', '2023-06-06 05:52:05', 0, '2023-06-06 05:52:05', 0, NULL, NULL, '*', ''),
(13, 2, 'COM_GUIDEDTOURS_TOUR_GUIDEDTOURSTEPS_STEP_POSITION_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_GUIDEDTOURSTEPS_STEP_POSITION_DESCRIPTION', 13, 'top', '#jform_position', 2, 3, '', '2023-06-06 05:52:05', 0, '2023-06-06 05:52:05', 0, NULL, NULL, '*', ''),
(14, 2, 'COM_GUIDEDTOURS_TOUR_GUIDEDTOURSTEPS_STEP_TARGET_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_GUIDEDTOURSTEPS_STEP_TARGET_DESCRIPTION', 14, 'top', '#jform_target', 2, 3, '', '2023-06-06 05:52:05', 0, '2023-06-06 05:52:05', 0, NULL, NULL, '*', ''),
(15, 2, 'COM_GUIDEDTOURS_TOUR_GUIDEDTOURSTEPS_STEP_TYPE_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_GUIDEDTOURSTEPS_STEP_TYPE_DESCRIPTION', 15, 'top', '#jform_type', 2, 3, '', '2023-06-06 05:52:05', 0, '2023-06-06 05:52:05', 0, NULL, NULL, '*', ''),
(16, 2, 'COM_GUIDEDTOURS_TOUR_GUIDEDTOURSTEPS_STEP_SAVECLOSE_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_GUIDEDTOURSTEPS_STEP_SAVECLOSE_DESCRIPTION', 16, 'bottom', '#save-group-children-save .button-save', 2, 1, '', '2023-06-06 05:52:05', 0, '2023-06-06 05:52:05', 0, NULL, NULL, '*', ''),
(17, 2, 'COM_GUIDEDTOURS_TOUR_GUIDEDTOURSTEPS_STEP_CONGRATULATIONS_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_GUIDEDTOURSTEPS_STEP_CONGRATULATIONS_DESCRIPTION', 17, 'bottom', '', 0, 1, '', '2023-06-06 05:52:05', 0, '2023-06-06 05:52:05', 0, NULL, NULL, '*', ''),
(18, 3, 'COM_GUIDEDTOURS_TOUR_ARTICLES_STEP_NEW_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_ARTICLES_STEP_NEW_DESCRIPTION', 18, 'bottom', '.button-new', 2, 1, 'administrator/index.php?option=com_content&view=articles', '2023-06-06 05:52:05', 0, '2023-06-06 05:52:05', 0, NULL, NULL, '*', ''),
(19, 3, 'COM_GUIDEDTOURS_TOUR_ARTICLES_STEP_TITLE_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_ARTICLES_STEP_TITLE_DESCRIPTION', 19, 'bottom', '#jform_title', 2, 2, 'administrator/index.php?option=com_content&view=article&layout=edit', '2023-06-06 05:52:05', 0, '2023-06-06 05:52:05', 0, NULL, NULL, '*', ''),
(20, 3, 'COM_GUIDEDTOURS_TOUR_ARTICLES_STEP_ALIAS_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_ARTICLES_STEP_ALIAS_DESCRIPTION', 20, 'bottom', '#jform_alias', 2, 2, 'administrator/index.php?option=com_content&view=article&layout=edit', '2023-06-06 05:52:05', 0, '2023-06-06 05:52:05', 0, NULL, NULL, '*', ''),
(21, 3, 'COM_GUIDEDTOURS_TOUR_ARTICLES_STEP_CONTENT_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_ARTICLES_STEP_CONTENT_DESCRIPTION', 21, 'bottom', '#jform_articletext,#jform_articletext_ifr', 2, 3, 'administrator/index.php?option=com_content&view=article&layout=edit', '2023-06-06 05:52:05', 0, '2023-06-06 05:52:05', 0, NULL, NULL, '*', ''),
(22, 3, 'COM_GUIDEDTOURS_TOUR_ARTICLES_STEP_STATUS_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_ARTICLES_STEP_STATUS_DESCRIPTION', 22, 'bottom', '#jform_state', 2, 3, 'administrator/index.php?option=com_content&view=article&layout=edit', '2023-06-06 05:52:05', 0, '2023-06-06 05:52:05', 0, NULL, NULL, '*', ''),
(23, 3, 'COM_GUIDEDTOURS_TOUR_ARTICLES_STEP_CATEGORY_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_ARTICLES_STEP_CATEGORY_DESCRIPTION', 23, 'top', 'joomla-field-fancy-select .choices[data-type=select-one]', 2, 3, 'administrator/index.php?option=com_content&view=article&layout=edit', '2023-06-06 05:52:05', 0, '2023-06-06 05:52:05', 0, NULL, NULL, '*', ''),
(24, 3, 'COM_GUIDEDTOURS_TOUR_ARTICLES_STEP_FEATURED_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_ARTICLES_STEP_FEATURED_DESCRIPTION', 24, 'bottom', '#jform_featured0', 2, 3, 'administrator/index.php?option=com_content&view=article&layout=edit', '2023-06-06 05:52:05', 0, '2023-06-06 05:52:05', 0, NULL, NULL, '*', ''),
(25, 3, 'COM_GUIDEDTOURS_TOUR_ARTICLES_STEP_ACCESS_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_ARTICLES_STEP_ACCESS_DESCRIPTION', 25, 'bottom', '#jform_access', 2, 3, 'administrator/index.php?option=com_content&view=article&layout=edit', '2023-06-06 05:52:05', 0, '2023-06-06 05:52:05', 0, NULL, NULL, '*', ''),
(26, 3, 'COM_GUIDEDTOURS_TOUR_ARTICLES_STEP_TAGS_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_ARTICLES_STEP_TAGS_DESCRIPTION', 26, 'top', 'joomla-field-fancy-select .choices[data-type=select-multiple]', 2, 3, 'administrator/index.php?option=com_content&view=article&layout=edit', '2023-06-06 05:52:05', 0, '2023-06-06 05:52:05', 0, NULL, NULL, '*', ''),
(27, 3, 'COM_GUIDEDTOURS_TOUR_ARTICLES_STEP_NOTE_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_ARTICLES_STEP_NOTE_DESCRIPTION', 27, 'top', '#jform_note', 2, 2, 'administrator/index.php?option=com_content&view=article&layout=edit', '2023-06-06 05:52:05', 0, '2023-06-06 05:52:05', 0, NULL, NULL, '*', ''),
(28, 3, 'COM_GUIDEDTOURS_TOUR_ARTICLES_STEP_VERSIONNOTE_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_ARTICLES_STEP_VERSIONNOTE_DESCRIPTION', 28, 'top', '#jform_version_note', 2, 2, 'administrator/index.php?option=com_content&view=article&layout=edit', '2023-06-06 05:52:05', 0, '2023-06-06 05:52:05', 0, NULL, NULL, '*', ''),
(29, 3, 'COM_GUIDEDTOURS_TOUR_ARTICLES_STEP_SAVECLOSE_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_ARTICLES_STEP_SAVECLOSE_DESCRIPTION', 29, 'bottom', '#save-group-children-save .button-save', 2, 1, 'administrator/index.php?option=com_content&view=article&layout=edit', '2023-06-06 05:52:05', 0, '2023-06-06 05:52:05', 0, NULL, NULL, '*', ''),
(30, 3, 'COM_GUIDEDTOURS_TOUR_ARTICLES_STEP_CONGRATULATIONS_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_ARTICLES_STEP_CONGRATULATIONS_DESCRIPTION', 30, 'bottom', '', 0, 1, 'administrator/index.php?option=com_content&view=article&layout=edit', '2023-06-06 05:52:05', 0, '2023-06-06 05:52:05', 0, NULL, NULL, '*', ''),
(31, 4, 'COM_GUIDEDTOURS_TOUR_CATEGORIES_STEP_NEW_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_CATEGORIES_STEP_NEW_DESCRIPTION', 31, 'bottom', '.button-new', 2, 1, 'administrator/index.php?option=com_categories&view=categories&extension=com_content', '2023-06-06 05:52:05', 0, '2023-06-06 05:52:05', 0, NULL, NULL, '*', ''),
(32, 4, 'COM_GUIDEDTOURS_TOUR_CATEGORIES_STEP_TITLE_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_CATEGORIES_STEP_TITLE_DESCRIPTION', 32, 'bottom', '#jform_title', 2, 2, 'administrator/index.php?option=com_categories&view=category&layout=edit&extension=com_content', '2023-06-06 05:52:05', 0, '2023-06-06 05:52:05', 0, NULL, NULL, '*', ''),
(33, 4, 'COM_GUIDEDTOURS_TOUR_CATEGORIES_STEP_ALIAS_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_CATEGORIES_STEP_ALIAS_DESCRIPTION', 33, 'bottom', '#jform_alias', 2, 2, 'administrator/index.php?option=com_categories&view=category&layout=edit&extension=com_content', '2023-06-06 05:52:05', 0, '2023-06-06 05:52:05', 0, NULL, NULL, '*', ''),
(34, 4, 'COM_GUIDEDTOURS_TOUR_CATEGORIES_STEP_CONTENT_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_CATEGORIES_STEP_CONTENT_DESCRIPTION', 34, 'bottom', '#jform_description,#jform_description_ifr', 2, 3, 'administrator/index.php?option=com_categories&view=category&layout=edit&extension=com_content', '2023-06-06 05:52:05', 0, '2023-06-06 05:52:05', 0, NULL, NULL, '*', ''),
(35, 4, 'COM_GUIDEDTOURS_TOUR_CATEGORIES_STEP_PARENT_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_CATEGORIES_STEP_PARENT_DESCRIPTION', 35, 'top', 'joomla-field-fancy-select .choices[data-type=select-one]', 2, 3, 'administrator/index.php?option=com_categories&view=category&layout=edit&extension=com_content', '2023-06-06 05:52:05', 0, '2023-06-06 05:52:05', 0, NULL, NULL, '*', ''),
(36, 4, 'COM_GUIDEDTOURS_TOUR_CATEGORIES_STEP_STATUS_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_CATEGORIES_STEP_STATUS_DESCRIPTION', 36, 'bottom', '#jform_published', 2, 3, 'administrator/index.php?option=com_categories&view=category&layout=edit&extension=com_content', '2023-06-06 05:52:05', 0, '2023-06-06 05:52:05', 0, NULL, NULL, '*', ''),
(37, 4, 'COM_GUIDEDTOURS_TOUR_CATEGORIES_STEP_ACCESS_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_CATEGORIES_STEP_ACCESS_DESCRIPTION', 37, 'bottom', '#jform_access', 2, 3, 'administrator/index.php?option=com_categories&view=category&layout=edit&extension=com_content', '2023-06-06 05:52:05', 0, '2023-06-06 05:52:05', 0, NULL, NULL, '*', ''),
(38, 4, 'COM_GUIDEDTOURS_TOUR_CATEGORIES_STEP_TAGS_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_CATEGORIES_STEP_TAGS_DESCRIPTION', 38, 'top', 'joomla-field-fancy-select .choices[data-type=select-multiple]', 2, 3, 'administrator/index.php?option=com_categories&view=category&layout=edit&extension=com_content', '2023-06-06 05:52:05', 0, '2023-06-06 05:52:05', 0, NULL, NULL, '*', ''),
(39, 4, 'COM_GUIDEDTOURS_TOUR_CATEGORIES_STEP_NOTE_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_CATEGORIES_STEP_NOTE_DESCRIPTION', 39, 'top', '#jform_note', 2, 2, 'administrator/index.php?option=com_categories&view=category&layout=edit&extension=com_content', '2023-06-06 05:52:05', 0, '2023-06-06 05:52:05', 0, NULL, NULL, '*', ''),
(40, 4, 'COM_GUIDEDTOURS_TOUR_CATEGORIES_STEP_VERSIONNOTE_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_CATEGORIES_STEP_VERSIONNOTE_DESCRIPTION', 40, 'top', '#jform_version_note', 2, 2, 'administrator/index.php?option=com_categories&view=category&layout=edit&extension=com_content', '2023-06-06 05:52:05', 0, '2023-06-06 05:52:05', 0, NULL, NULL, '*', ''),
(41, 4, 'COM_GUIDEDTOURS_TOUR_CATEGORIES_STEP_SAVECLOSE_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_CATEGORIES_STEP_SAVECLOSE_DESCRIPTION', 41, 'bottom', '#save-group-children-save .button-save', 2, 1, 'administrator/index.php?option=com_categories&view=category&layout=edit&extension=com_content', '2023-06-06 05:52:05', 0, '2023-06-06 05:52:05', 0, NULL, NULL, '*', ''),
(42, 4, 'COM_GUIDEDTOURS_TOUR_CATEGORIES_STEP_CONGRATULATIONS_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_CATEGORIES_STEP_CONGRATULATIONS_DESCRIPTION', 42, 'bottom', '', 0, 1, 'administrator/index.php?option=com_categories&view=category&layout=edit&extension=com_content', '2023-06-06 05:52:05', 0, '2023-06-06 05:52:05', 0, NULL, NULL, '*', ''),
(43, 5, 'COM_GUIDEDTOURS_TOUR_MENUS_STEP_NEW_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_MENUS_STEP_NEW_DESCRIPTION', 43, 'bottom', '.button-new', 2, 1, 'administrator/index.php?option=com_menus&view=menus', '2023-06-06 05:52:05', 0, '2023-06-06 05:52:05', 0, NULL, NULL, '*', ''),
(44, 5, 'COM_GUIDEDTOURS_TOUR_MENUS_STEP_TITLE_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_MENUS_STEP_TITLE_DESCRIPTION', 44, 'bottom', '#jform_title', 2, 2, 'administrator/index.php?option=com_menus&view=menu&layout=edit', '2023-06-06 05:52:05', 0, '2023-06-06 05:52:05', 0, NULL, NULL, '*', ''),
(45, 5, 'COM_GUIDEDTOURS_TOUR_MENUS_STEP_UNIQUENAME_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_MENUS_STEP_UNIQUENAME_DESCRIPTION', 45, 'top', '#jform_menutype', 2, 2, 'administrator/index.php?option=com_menus&view=menu&layout=edit', '2023-06-06 05:52:05', 0, '2023-06-06 05:52:05', 0, NULL, NULL, '*', ''),
(46, 5, 'COM_GUIDEDTOURS_TOUR_MENUS_STEP_DESCRIPTION_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_MENUS_STEP_DESCRIPTION_DESCRIPTION', 46, 'top', '#jform_menudescription', 2, 2, 'administrator/index.php?option=com_menus&view=menu&layout=edit', '2023-06-06 05:52:05', 0, '2023-06-06 05:52:05', 0, NULL, NULL, '*', ''),
(47, 5, 'COM_GUIDEDTOURS_TOUR_MENUS_STEP_SAVECLOSE_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_MENUS_STEP_SAVECLOSE_DESCRIPTION', 47, 'bottom', '#save-group-children-save .button-save', 2, 1, 'administrator/index.php?option=com_menus&view=menu&layout=edit', '2023-06-06 05:52:05', 0, '2023-06-06 05:52:05', 0, NULL, NULL, '*', ''),
(48, 5, 'COM_GUIDEDTOURS_TOUR_MENUS_STEP_CONGRATULATIONS_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_MENUS_STEP_CONGRATULATIONS_DESCRIPTION', 48, 'bottom', '', 0, 1, 'administrator/index.php?option=com_menus&view=menu&layout=edit', '2023-06-06 05:52:05', 0, '2023-06-06 05:52:05', 0, NULL, NULL, '*', ''),
(49, 6, 'COM_GUIDEDTOURS_TOUR_TAGS_STEP_NEW_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_TAGS_STEP_NEW_DESCRIPTION', 49, 'bottom', '.button-new', 2, 1, 'administrator/index.php?option=com_tags&view=tags', '2023-06-06 05:52:05', 0, '2023-06-06 05:52:05', 0, NULL, NULL, '*', ''),
(50, 6, 'COM_GUIDEDTOURS_TOUR_TAGS_STEP_TITLE_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_TAGS_STEP_TITLE_DESCRIPTION', 50, 'bottom', '#jform_title', 2, 2, 'administrator/index.php?option=com_tags&view=tag&layout=edit', '2023-06-06 05:52:05', 0, '2023-06-06 05:52:05', 0, NULL, NULL, '*', ''),
(51, 6, 'COM_GUIDEDTOURS_TOUR_TAGS_STEP_ALIAS_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_TAGS_STEP_ALIAS_DESCRIPTION', 51, 'bottom', '#jform_alias', 2, 2, 'administrator/index.php?option=com_tags&view=tag&layout=edit', '2023-06-06 05:52:05', 0, '2023-06-06 05:52:05', 0, NULL, NULL, '*', ''),
(52, 6, 'COM_GUIDEDTOURS_TOUR_TAGS_STEP_CONTENT_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_TAGS_STEP_CONTENT_DESCRIPTION', 52, 'bottom', '#jform_description,#jform_description_ifr', 2, 3, 'administrator/index.php?option=com_tags&view=tag&layout=edit', '2023-06-06 05:52:05', 0, '2023-06-06 05:52:05', 0, NULL, NULL, '*', ''),
(53, 6, 'COM_GUIDEDTOURS_TOUR_TAGS_STEP_PARENT_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_TAGS_STEP_PARENT_DESCRIPTION', 53, 'top', 'joomla-field-fancy-select .choices[data-type=select-one]', 2, 3, 'administrator/index.php?option=com_tags&view=tag&layout=edit', '2023-06-06 05:52:05', 0, '2023-06-06 05:52:05', 0, NULL, NULL, '*', ''),
(54, 6, 'COM_GUIDEDTOURS_TOUR_TAGS_STEP_STATUS_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_TAGS_STEP_STATUS_DESCRIPTION', 54, 'bottom', '#jform_published', 2, 3, 'administrator/index.php?option=com_tags&view=tag&layout=edit', '2023-06-06 05:52:05', 0, '2023-06-06 05:52:05', 0, NULL, NULL, '*', ''),
(55, 6, 'COM_GUIDEDTOURS_TOUR_TAGS_STEP_ACCESS_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_TAGS_STEP_ACCESS_DESCRIPTION', 55, 'bottom', '#jform_access', 2, 3, 'administrator/index.php?option=com_tags&view=tag&layout=edit', '2023-06-06 05:52:05', 0, '2023-06-06 05:52:05', 0, NULL, NULL, '*', ''),
(56, 6, 'COM_GUIDEDTOURS_TOUR_TAGS_STEP_NOTE_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_TAGS_STEP_NOTE_DESCRIPTION', 56, 'top', '#jform_note', 2, 2, 'administrator/index.php?option=com_tags&view=tag&layout=edit', '2023-06-06 05:52:05', 0, '2023-06-06 05:52:05', 0, NULL, NULL, '*', ''),
(57, 6, 'COM_GUIDEDTOURS_TOUR_TAGS_STEP_VERSIONNOTE_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_TAGS_STEP_VERSIONNOTE_DESCRIPTION', 57, 'top', '#jform_version_note', 2, 2, 'administrator/index.php?option=com_tags&view=tag&layout=edit', '2023-06-06 05:52:05', 0, '2023-06-06 05:52:05', 0, NULL, NULL, '*', ''),
(58, 6, 'COM_GUIDEDTOURS_TOUR_TAGS_STEP_SAVECLOSE_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_TAGS_STEP_SAVECLOSE_DESCRIPTION', 58, 'bottom', '#save-group-children-save .button-save', 2, 1, 'administrator/index.php?option=com_tags&view=tag&layout=edit', '2023-06-06 05:52:05', 0, '2023-06-06 05:52:05', 0, NULL, NULL, '*', ''),
(59, 6, 'COM_GUIDEDTOURS_TOUR_TAGS_STEP_CONGRATULATIONS_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_TAGS_STEP_CONGRATULATIONS_DESCRIPTION', 59, 'bottom', '', 0, 1, 'administrator/index.php?option=com_tags&view=tag&layout=edit', '2023-06-06 05:52:05', 0, '2023-06-06 05:52:05', 0, NULL, NULL, '*', ''),
(60, 7, 'COM_GUIDEDTOURS_TOUR_BANNERS_STEP_NEW_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_BANNERS_STEP_NEW_DESCRIPTION', 60, 'bottom', '.button-new', 2, 1, 'administrator/index.php?option=com_banners&view=banners', '2023-06-06 05:52:05', 0, '2023-06-06 05:52:05', 0, NULL, NULL, '*', ''),
(61, 7, 'COM_GUIDEDTOURS_TOUR_BANNERS_STEP_TITLE_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_BANNERS_STEP_TITLE_DESCRIPTION', 61, 'bottom', '#jform_name', 2, 2, 'administrator/index.php?option=com_banners&view=banner&layout=edit', '2023-06-06 05:52:05', 0, '2023-06-06 05:52:05', 0, NULL, NULL, '*', ''),
(62, 7, 'COM_GUIDEDTOURS_TOUR_BANNERS_STEP_ALIAS_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_BANNERS_STEP_ALIAS_DESCRIPTION', 62, 'bottom', '#jform_alias', 2, 2, 'administrator/index.php?option=com_banners&view=banner&layout=edit', '2023-06-06 05:52:05', 0, '2023-06-06 05:52:05', 0, NULL, NULL, '*', ''),
(63, 7, 'COM_GUIDEDTOURS_TOUR_BANNERS_STEP_DETAILS_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_BANNERS_STEP_DETAILS_DESCRIPTION', 63, 'bottom', '.col-lg-9', 2, 3, 'administrator/index.php?option=com_banners&view=banner&layout=edit', '2023-06-06 05:52:05', 0, '2023-06-06 05:52:05', 0, NULL, NULL, '*', ''),
(64, 7, 'COM_GUIDEDTOURS_TOUR_BANNERS_STEP_STATUS_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_BANNERS_STEP_STATUS_DESCRIPTION', 64, 'bottom', '#jform_state', 2, 3, 'administrator/index.php?option=com_banners&view=banner&layout=edit', '2023-06-06 05:52:05', 0, '2023-06-06 05:52:05', 0, NULL, NULL, '*', ''),
(65, 7, 'COM_GUIDEDTOURS_TOUR_BANNERS_STEP_CATEGORY_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_BANNERS_STEP_CATEGORY_DESCRIPTION', 65, 'top', 'joomla-field-fancy-select .choices[data-type=select-one]', 2, 3, 'administrator/index.php?option=com_banners&view=banner&layout=edit', '2023-06-06 05:52:05', 0, '2023-06-06 05:52:05', 0, NULL, NULL, '*', ''),
(66, 7, 'COM_GUIDEDTOURS_TOUR_BANNERS_STEP_PINNED_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_BANNERS_STEP_PINNED_DESCRIPTION', 66, 'bottom', '#jform_sticky1', 2, 3, 'administrator/index.php?option=com_banners&view=banner&layout=edit', '2023-06-06 05:52:05', 0, '2023-06-06 05:52:05', 0, NULL, NULL, '*', ''),
(67, 7, 'COM_GUIDEDTOURS_TOUR_BANNERS_STEP_VERSIONNOTE_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_BANNERS_STEP_VERSIONNOTE_DESCRIPTION', 67, 'top', '#jform_version_note', 2, 2, 'administrator/index.php?option=com_banners&view=banner&layout=edit', '2023-06-06 05:52:05', 0, '2023-06-06 05:52:05', 0, NULL, NULL, '*', ''),
(68, 7, 'COM_GUIDEDTOURS_TOUR_BANNERS_STEP_SAVECLOSE_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_BANNERS_STEP_SAVECLOSE_DESCRIPTION', 68, 'bottom', '#save-group-children-save .button-save', 2, 1, 'administrator/index.php?option=com_banners&view=banner&layout=edit', '2023-06-06 05:52:05', 0, '2023-06-06 05:52:05', 0, NULL, NULL, '*', ''),
(69, 7, 'COM_GUIDEDTOURS_TOUR_BANNERS_STEP_CONGRATULATIONS_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_BANNERS_STEP_CONGRATULATIONS_DESCRIPTION', 69, 'bottom', '', 0, 1, 'administrator/index.php?option=com_banners&view=banner&layout=edit', '2023-06-06 05:52:05', 0, '2023-06-06 05:52:05', 0, NULL, NULL, '*', ''),
(70, 8, 'COM_GUIDEDTOURS_TOUR_CONTACTS_STEP_NEW_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_CONTACTS_STEP_NEW_DESCRIPTION', 70, 'bottom', '.button-new', 2, 1, 'administrator/index.php?option=com_contact&view=contacts', '2023-06-06 05:52:05', 0, '2023-06-06 05:52:05', 0, NULL, NULL, '*', ''),
(71, 8, 'COM_GUIDEDTOURS_TOUR_CONTACTS_STEP_TITLE_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_CONTACTS_STEP_TITLE_DESCRIPTION', 71, 'bottom', '#jform_name', 2, 2, 'administrator/index.php?option=com_contact&view=contact&layout=edit', '2023-06-06 05:52:05', 0, '2023-06-06 05:52:05', 0, NULL, NULL, '*', ''),
(72, 8, 'COM_GUIDEDTOURS_TOUR_CONTACTS_STEP_ALIAS_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_CONTACTS_STEP_ALIAS_DESCRIPTION', 72, 'bottom', '#jform_alias', 2, 2, 'administrator/index.php?option=com_contact&view=contact&layout=edit', '2023-06-06 05:52:05', 0, '2023-06-06 05:52:05', 0, NULL, NULL, '*', ''),
(73, 8, 'COM_GUIDEDTOURS_TOUR_CONTACTS_STEP_DETAILS_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_CONTACTS_STEP_DETAILS_DESCRIPTION', 73, 'bottom', '.col-lg-9', 0, 1, 'administrator/index.php?option=com_contact&view=contact&layout=edit', '2023-06-06 05:52:05', 0, '2023-06-06 05:52:05', 0, NULL, NULL, '*', ''),
(74, 8, 'COM_GUIDEDTOURS_TOUR_CONTACTS_STEP_STATUS_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_CONTACTS_STEP_STATUS_DESCRIPTION', 74, 'bottom', '#jform_published', 2, 3, 'administrator/index.php?option=com_contact&view=contact&layout=edit', '2023-06-06 05:52:05', 0, '2023-06-06 05:52:05', 0, NULL, NULL, '*', ''),
(75, 8, 'COM_GUIDEDTOURS_TOUR_CONTACTS_STEP_CATEGORY_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_CONTACTS_STEP_CATEGORY_DESCRIPTION', 75, 'top', 'joomla-field-fancy-select .choices[data-type=select-one]', 2, 3, 'administrator/index.php?option=com_contact&view=contact&layout=edit', '2023-06-06 05:52:05', 0, '2023-06-06 05:52:05', 0, NULL, NULL, '*', ''),
(76, 8, 'COM_GUIDEDTOURS_TOUR_CONTACTS_STEP_FEATURED_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_CONTACTS_STEP_FEATURED_DESCRIPTION', 76, 'bottom', '#jform_featured0', 2, 3, 'administrator/index.php?option=com_contact&view=contact&layout=edit', '2023-06-06 05:52:05', 0, '2023-06-06 05:52:05', 0, NULL, NULL, '*', ''),
(77, 8, 'COM_GUIDEDTOURS_TOUR_CONTACTS_STEP_ACCESS_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_CONTACTS_STEP_ACCESS_DESCRIPTION', 77, 'bottom', '#jform_access', 2, 3, 'administrator/index.php?option=com_contact&view=contact&layout=edit', '2023-06-06 05:52:05', 0, '2023-06-06 05:52:05', 0, NULL, NULL, '*', ''),
(78, 8, 'COM_GUIDEDTOURS_TOUR_CONTACTS_STEP_TAGS_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_CONTACTS_STEP_TAGS_DESCRIPTION', 78, 'top', 'joomla-field-fancy-select .choices[data-type=select-multiple]', 2, 3, 'administrator/index.php?option=com_contact&view=contact&layout=edit', '2023-06-06 05:52:05', 0, '2023-06-06 05:52:05', 0, NULL, NULL, '*', ''),
(79, 8, 'COM_GUIDEDTOURS_TOUR_CONTACTS_STEP_VERSIONNOTE_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_CONTACTS_STEP_VERSIONNOTE_DESCRIPTION', 79, 'top', '#jform_version_note', 2, 2, 'administrator/index.php?option=com_contact&view=contact&layout=edit', '2023-06-06 05:52:05', 0, '2023-06-06 05:52:05', 0, NULL, NULL, '*', ''),
(80, 8, 'COM_GUIDEDTOURS_TOUR_CONTACTS_STEP_SAVECLOSE_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_CONTACTS_STEP_SAVECLOSE_DESCRIPTION', 80, 'bottom', '#save-group-children-save .button-save', 2, 1, 'administrator/index.php?option=com_contact&view=contact&layout=edit', '2023-06-06 05:52:05', 0, '2023-06-06 05:52:05', 0, NULL, NULL, '*', ''),
(81, 8, 'COM_GUIDEDTOURS_TOUR_CONTACTS_STEP_CONGRATULATIONS_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_CONTACTS_STEP_CONGRATULATIONS_DESCRIPTION', 81, 'bottom', '', 0, 1, 'administrator/index.php?option=com_contact&view=contact&layout=edit', '2023-06-06 05:52:05', 0, '2023-06-06 05:52:05', 0, NULL, NULL, '*', ''),
(82, 9, 'COM_GUIDEDTOURS_TOUR_NEWSFEEDS_STEP_NEW_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_NEWSFEEDS_STEP_NEW_DESCRIPTION', 82, 'bottom', '.button-new', 2, 1, 'administrator/index.php?option=com_newsfeeds&view=newsfeeds', '2023-06-06 05:52:05', 0, '2023-06-06 05:52:05', 0, NULL, NULL, '*', ''),
(83, 9, 'COM_GUIDEDTOURS_TOUR_NEWSFEEDS_STEP_TITLE_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_NEWSFEEDS_STEP_TITLE_DESCRIPTION', 83, 'bottom', '#jform_name', 2, 2, 'administrator/index.php?option=com_newsfeeds&view=newsfeed&layout=edit', '2023-06-06 05:52:05', 0, '2023-06-06 05:52:05', 0, NULL, NULL, '*', ''),
(84, 9, 'COM_GUIDEDTOURS_TOUR_NEWSFEEDS_STEP_ALIAS_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_NEWSFEEDS_STEP_ALIAS_DESCRIPTION', 84, 'bottom', '#jform_alias', 2, 2, 'administrator/index.php?option=com_newsfeeds&view=newsfeed&layout=edit', '2023-06-06 05:52:05', 0, '2023-06-06 05:52:05', 0, NULL, NULL, '*', ''),
(85, 9, 'COM_GUIDEDTOURS_TOUR_NEWSFEEDS_STEP_LINK_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_NEWSFEEDS_STEP_LINK_DESCRIPTION', 85, 'bottom', '#jform_link', 2, 2, 'administrator/index.php?option=com_newsfeeds&view=newsfeed&layout=edit', '2023-06-06 05:52:05', 0, '2023-06-06 05:52:05', 0, NULL, NULL, '*', ''),
(86, 9, 'COM_GUIDEDTOURS_TOUR_NEWSFEEDS_STEP_DESCRIPTION_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_NEWSFEEDS_STEP_DESCRIPTION_DESCRIPTION', 86, 'bottom', '#jform_description,#jform_description_ifr', 2, 3, 'administrator/index.php?option=com_newsfeeds&view=newsfeed&layout=edit', '2023-06-06 05:52:05', 0, '2023-06-06 05:52:05', 0, NULL, NULL, '*', ''),
(87, 9, 'COM_GUIDEDTOURS_TOUR_NEWSFEEDS_STEP_STATUS_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_NEWSFEEDS_STEP_STATUS_DESCRIPTION', 87, 'bottom', '#jform_published', 2, 3, 'administrator/index.php?option=com_newsfeeds&view=newsfeed&layout=edit', '2023-06-06 05:52:05', 0, '2023-06-06 05:52:05', 0, NULL, NULL, '*', ''),
(88, 9, 'COM_GUIDEDTOURS_TOUR_NEWSFEEDS_STEP_CATEGORY_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_NEWSFEEDS_STEP_CATEGORY_DESCRIPTION', 88, 'top', 'joomla-field-fancy-select .choices[data-type=select-one]', 2, 3, 'administrator/index.php?option=com_newsfeeds&view=newsfeed&layout=edit', '2023-06-06 05:52:05', 0, '2023-06-06 05:52:05', 0, NULL, NULL, '*', ''),
(89, 9, 'COM_GUIDEDTOURS_TOUR_NEWSFEEDS_STEP_ACCESS_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_NEWSFEEDS_STEP_ACCESS_DESCRIPTION', 89, 'bottom', '#jform_access', 2, 3, 'administrator/index.php?option=com_newsfeeds&view=newsfeed&layout=edit', '2023-06-06 05:52:05', 0, '2023-06-06 05:52:05', 0, NULL, NULL, '*', ''),
(90, 9, 'COM_GUIDEDTOURS_TOUR_NEWSFEEDS_STEP_TAGS_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_NEWSFEEDS_STEP_TAGS_DESCRIPTION', 90, 'top', 'joomla-field-fancy-select .choices[data-type=select-multiple]', 2, 3, 'administrator/index.php?option=com_newsfeeds&view=newsfeed&layout=edit', '2023-06-06 05:52:05', 0, '2023-06-06 05:52:05', 0, NULL, NULL, '*', ''),
(91, 9, 'COM_GUIDEDTOURS_TOUR_NEWSFEEDS_STEP_VERSIONNOTE_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_NEWSFEEDS_STEP_VERSIONNOTE_DESCRIPTION', 91, 'top', '#jform_version_note', 2, 2, 'administrator/index.php?option=com_newsfeeds&view=newsfeed&layout=edit', '2023-06-06 05:52:05', 0, '2023-06-06 05:52:05', 0, NULL, NULL, '*', ''),
(92, 9, 'COM_GUIDEDTOURS_TOUR_NEWSFEEDS_STEP_SAVECLOSE_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_NEWSFEEDS_STEP_SAVECLOSE_DESCRIPTION', 92, 'bottom', '#save-group-children-save .button-save', 2, 1, 'administrator/index.php?option=com_newsfeeds&view=newsfeed&layout=edit', '2023-06-06 05:52:05', 0, '2023-06-06 05:52:05', 0, NULL, NULL, '*', ''),
(93, 9, 'COM_GUIDEDTOURS_TOUR_NEWSFEEDS_STEP_CONGRATULATIONS_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_NEWSFEEDS_STEP_CONGRATULATIONS_DESCRIPTION', 93, 'bottom', '', 0, 1, 'administrator/index.php?option=com_newsfeeds&view=newsfeed&layout=edit', '2023-06-06 05:52:05', 0, '2023-06-06 05:52:05', 0, NULL, NULL, '*', ''),
(94, 10, 'COM_GUIDEDTOURS_TOUR_SMARTSEARCH_STEP_NEW_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_SMARTSEARCH_STEP_NEW_DESCRIPTION', 94, 'bottom', '.button-new', 2, 1, 'administrator/index.php?option=com_finder&view=filters', '2023-06-06 05:52:05', 0, '2023-06-06 05:52:05', 0, NULL, NULL, '*', ''),
(95, 10, 'COM_GUIDEDTOURS_TOUR_SMARTSEARCH_STEP_TITLE_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_SMARTSEARCH_STEP_TITLE_DESCRIPTION', 95, 'bottom', '#jform_title', 2, 2, 'administrator/index.php?option=com_finder&view=filter&layout=edit', '2023-06-06 05:52:05', 0, '2023-06-06 05:52:05', 0, NULL, NULL, '*', ''),
(96, 10, 'COM_GUIDEDTOURS_TOUR_SMARTSEARCH_STEP_ALIAS_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_SMARTSEARCH_STEP_ALIAS_DESCRIPTION', 96, 'bottom', '#jform_alias', 2, 2, 'administrator/index.php?option=com_finder&view=filter&layout=edit', '2023-06-06 05:52:05', 0, '2023-06-06 05:52:05', 0, NULL, NULL, '*', ''),
(97, 10, 'COM_GUIDEDTOURS_TOUR_SMARTSEARCH_STEP_CONTENT_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_SMARTSEARCH_STEP_CONTENT_DESCRIPTION', 97, 'bottom', '.col-lg-9', 0, 1, 'administrator/index.php?option=com_finder&view=filter&layout=edit', '2023-06-06 05:52:05', 0, '2023-06-06 05:52:05', 0, NULL, NULL, '*', ''),
(98, 10, 'COM_GUIDEDTOURS_TOUR_SMARTSEARCH_STEP_STATUS_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_SMARTSEARCH_STEP_STATUS_DESCRIPTION', 98, 'bottom', '#jform_state', 2, 3, 'administrator/index.php?option=com_finder&view=filter&layout=edit', '2023-06-06 05:52:05', 0, '2023-06-06 05:52:05', 0, NULL, NULL, '*', ''),
(99, 10, 'COM_GUIDEDTOURS_TOUR_SMARTSEARCH_STEP_SAVECLOSE_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_SMARTSEARCH_STEP_SAVECLOSE_DESCRIPTION', 99, 'bottom', '#save-group-children-save .button-save', 2, 1, 'administrator/index.php?option=com_finder&view=filter&layout=edit', '2023-06-06 05:52:05', 0, '2023-06-06 05:52:05', 0, NULL, NULL, '*', ''),
(100, 10, 'COM_GUIDEDTOURS_TOUR_SMARTSEARCH_STEP_CONGRATULATIONS_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_SMARTSEARCH_STEP_CONGRATULATIONS_DESCRIPTION', 100, 'bottom', '', 0, 1, 'administrator/index.php?option=com_finder&view=filter&layout=edit', '2023-06-06 05:52:05', 0, '2023-06-06 05:52:05', 0, NULL, NULL, '*', ''),
(101, 11, 'COM_GUIDEDTOURS_TOUR_USERS_STEP_NEW_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_USERS_STEP_NEW_DESCRIPTION', 101, 'bottom', '.button-new', 2, 1, 'administrator/index.php?option=com_users&view=user&layout=edit', '2023-06-06 05:52:05', 0, '2023-06-06 05:52:05', 0, NULL, NULL, '*', ''),
(102, 11, 'COM_GUIDEDTOURS_TOUR_USERS_STEP_NAME_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_USERS_STEP_NAME_DESCRIPTION', 102, 'bottom', '#jform_name', 2, 2, 'administrator/index.php?option=com_users&view=user&layout=edit', '2023-06-06 05:52:05', 0, '2023-06-06 05:52:05', 0, NULL, NULL, '*', ''),
(103, 11, 'COM_GUIDEDTOURS_TOUR_USERS_STEP_LOGINNAME_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_USERS_STEP_LOGINNAME_DESCRIPTION', 103, 'bottom', '#jform_username', 2, 2, 'administrator/index.php?option=com_users&view=user&layout=edit', '2023-06-06 05:52:05', 0, '2023-06-06 05:52:05', 0, NULL, NULL, '*', ''),
(104, 11, 'COM_GUIDEDTOURS_TOUR_USERS_STEP_PASSWORD_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_USERS_STEP_PASSWORD_DESCRIPTION', 104, 'bottom', '#jform_password', 2, 2, 'administrator/index.php?option=com_users&view=user&layout=edit', '2023-06-06 05:52:05', 0, '2023-06-06 05:52:05', 0, NULL, NULL, '*', ''),
(105, 11, 'COM_GUIDEDTOURS_TOUR_USERS_STEP_PASSWORD2_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_USERS_STEP_PASSWORD2_DESCRIPTION', 105, 'bottom', '#jform_password2', 2, 2, 'administrator/index.php?option=com_users&view=user&layout=edit', '2023-06-06 05:52:05', 0, '2023-06-06 05:52:05', 0, NULL, NULL, '*', ''),
(106, 11, 'COM_GUIDEDTOURS_TOUR_USERS_STEP_EMAIL_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_USERS_STEP_EMAIL_DESCRIPTION', 106, 'bottom', '#jform_email', 2, 2, 'administrator/index.php?option=com_users&view=user&layout=edit', '2023-06-06 05:52:05', 0, '2023-06-06 05:52:05', 0, NULL, NULL, '*', ''),
(107, 11, 'COM_GUIDEDTOURS_TOUR_USERS_STEP_SYSTEMEMAIL_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_USERS_STEP_SYSTEMEMAIL_DESCRIPTION', 107, 'top', '#jform_sendEmail0', 2, 3, 'administrator/index.php?option=com_users&view=user&layout=edit', '2023-06-06 05:52:05', 0, '2023-06-06 05:52:05', 0, NULL, NULL, '*', ''),
(108, 11, 'COM_GUIDEDTOURS_TOUR_USERS_STEP_STATUS_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_USERS_STEP_STATUS_DESCRIPTION', 108, 'top', '#jform_block0', 2, 3, 'administrator/index.php?option=com_users&view=user&layout=edit', '2023-06-06 05:52:05', 0, '2023-06-06 05:52:05', 0, NULL, NULL, '*', ''),
(109, 11, 'COM_GUIDEDTOURS_TOUR_USERS_STEP_PASSWORDRESET_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_USERS_STEP_PASSWORDRESET_DESCRIPTION', 109, 'top', '#jform_requireReset0', 2, 3, 'administrator/index.php?option=com_users&view=user&layout=edit', '2023-06-06 05:52:05', 0, '2023-06-06 05:52:05', 0, NULL, NULL, '*', ''),
(110, 11, 'COM_GUIDEDTOURS_TOUR_USERS_STEP_SAVECLOSE_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_USERS_STEP_SAVECLOSE_DESCRIPTION', 110, 'bottom', '#save-group-children-save .button-save', 2, 1, 'administrator/index.php?option=com_users&view=user&layout=edit', '2023-06-06 05:52:05', 0, '2023-06-06 05:52:05', 0, NULL, NULL, '*', ''),
(111, 11, 'COM_GUIDEDTOURS_TOUR_USERS_STEP_CONGRATULATIONS_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_USERS_STEP_CONGRATULATIONS_DESCRIPTION', 111, 'bottom', '', 0, 1, 'administrator/index.php?option=com_users&view=user&layout=edit', '2023-06-06 05:52:05', 0, '2023-06-06 05:52:05', 0, NULL, NULL, '*', '');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `buf3w_history`
--

CREATE TABLE `buf3w_history` (
  `version_id` int(10) UNSIGNED NOT NULL,
  `item_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version_note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Optional version name',
  `save_date` datetime NOT NULL,
  `editor_user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `character_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Number of characters in this version.',
  `sha1_hash` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'SHA1 hash of the version_data column.',
  `version_data` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'json-encoded string of version data',
  `keep_forever` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=auto delete; 1=keep'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `buf3w_history`
--

INSERT INTO `buf3w_history` (`version_id`, `item_id`, `version_note`, `save_date`, `editor_user_id`, `character_count`, `sha1_hash`, `version_data`, `keep_forever`) VALUES
(1, 'com_content.article.1', '', '2023-06-06 06:37:25', 588, 4823, '3fc5d178cf8936895fdd122107cb3a976020c2fe', '{\"id\":1,\"asset_id\":97,\"title\":\"Rosjanie wysadzili zapor\\u0119\",\"alias\":\"rosjanie-wysadzili-zapore\",\"introtext\":\"<h1 class=\\\"article--title i1xAmRvR\\\" style=\\\"text-align: center;\\\">Rosjanie wysadzili zapor\\u0119. \\\"Poziom krytyczny za 5 godzin\\\"<\\/h1>\\r\\n<p>Niepokoj\\u0105ce doniesienia z Ukrainy. Po wysadzeniu przez wojska rosyjskie zapory wodnej na Dnieprze w okupowanej Nowej Kachowce, w\\u0142adze obwodu cherso\\u0144skiego og\\u0142osi\\u0142y ewakuacj\\u0119 mieszka\\u0144c\\u00f3w zagro\\u017conych zalaniem teren\\u00f3w. Za pi\\u0119\\u0107 godzin woda ma osi\\u0105gn\\u0105\\u0107 poziom krytyczny.<\\/p>\\r\\n\",\"fulltext\":\"\\r\\n<p style=\\\"text-align: left;\\\"><img src=\\\"images\\/tama2.jpeg#joomlaImage:\\/\\/local-images\\/tama2.jpeg?width=3745&amp;height=2497\\\" width=\\\"1263\\\" height=\\\"842\\\" \\/><\\/p>\\r\\n<p style=\\\"text-align: left;\\\">\\\"Skala zniszcze\\u0144, pr\\u0119dko\\u015b\\u0107 i\\u00a0ilo\\u015b\\u0107 wody oraz prawdopodobne obszary powodzi s\\u0105 ustalane\\\" \\u2013\\u00a0poinformowa\\u0142a ukrai\\u0144ska armia na Facebooku.<\\/p>\\r\\n<div class=\\\"article--text iFQN8OU2 iYwaUr3X\\\">\\r\\n<h2 style=\\\"text-align: center;\\\">Wysadzona zapora w Nowej Kachowce. Ewakuacja mieszka\\u0144c\\u00f3w<\\/h2>\\r\\n<\\/div>\\r\\n<div class=\\\"article--text iFQN8OU2 iYwaUr3X\\\">\\r\\n<p>Po\\u00a0wysadzeniu<strong>\\u00a0zapory wodnej\\u00a0na Dnieprze<\\/strong> w\\u00a0okupowanej Nowej Kachowce, w\\u0142adze obwodu cherso\\u0144skiego og\\u0142osi\\u0142y ewakuacj\\u0119 mieszka\\u0144c\\u00f3w zagro\\u017conych zalaniem teren\\u00f3w i\\u00a0ostrzeg\\u0142y, \\u017ce za pi\\u0119\\u0107 godzin woda osi\\u0105gnie poziom krytyczny.<\\/p>\\r\\n<\\/div>\\r\\n<p>\\\"Rosyjska armia dokona\\u0142a kolejnego aktu terroru \\u2013\\u00a0wysadzi\\u0142a Kachowsk\\u0105 Elektrowni\\u0119 Wodn\\u0105. Za pi\\u0119\\u0107 godzin woda osi\\u0105gnie poziom krytyczny\\\" -\\u00a0o\\u015bwiadczy\\u0142 szef Cherso\\u0144skiej Wojskowej Administracji Obwodowej O\\u0142eksandr Prokudin.<\\/p>\\r\\n<div class=\\\"article--text iFQN8OU2 iYwaUr3X\\\">\\r\\n<h2 style=\\\"text-align: center;\\\">Zapora w Nowej Kachowce wysadzona. Cherso\\u0144 zagro\\u017cony<\\/h2>\\r\\n<\\/div>\\r\\n<div class=\\\"article--text iFQN8OU2 iYwaUr3X\\\">\\r\\n<p>Wed\\u0142ug MSW Ukrainy po wysadzeniu zapory elektrowni w\\u00a0Nowej Kachowce\\u00a0<strong>w strefie zagro\\u017conej zalaniem<\\/strong>\\u00a0znajduje si\\u0119 co najmniej 10 miejscowo\\u015bci na prawym, zachodnim brzegu Dniepru. S\\u0105 to: Myko\\u0142ajiwka, Olhiwka, Lowo, Tiahynka, Poniatiwka, Iwaniwka, Tokariwka, Prydniprowskie, Sadowe i\\u00a0cz\\u0119\\u015bciowo miasto Cherso\\u0144.<\\/p>\\r\\n<\\/div>\\r\\n<div>\\r\\n<div class=\\\"article--text iFQN8OU2 iYwaUr3X\\\">\\r\\n<p>Nowa Kachowka po\\u0142o\\u017cona jest w\\u00a0odleg\\u0142o\\u015bci oko\\u0142o 70 km. od\\u00a0Chersonia.<\\/p>\\r\\n<\\/div>\\r\\n<\\/div>\\r\\n<div>\\r\\n<div class=\\\"article--text iFQN8OU2 iYwaUr3X\\\">\\r\\n<p>Ju\\u017c w\\u00a0pa\\u017adzierniku ubieg\\u0142ego roku prezydent Ukrainy Wo\\u0142odymyr Ze\\u0142enski ostrzega\\u0142, \\u017ce je\\u015bli si\\u0142y rosyjskie przerw\\u0105 zapor\\u0119 w\\u00a0elektrowni wodnej w\\u00a0Nowej Kachowce, to w\\u00a0strefie zalania znajdzie si\\u0119 ponad 80 miejscowo\\u015bci, tym miasto Cherso\\u0144.<\\/p>\\r\\n<\\/div>\\r\\n<\\/div>\",\"state\":\"1\",\"catid\":2,\"created\":\"2023-06-06 06:37:25\",\"created_by\":588,\"created_by_alias\":\"\",\"modified\":\"2023-06-06 06:37:25\",\"modified_by\":588,\"checked_out\":null,\"checked_out_time\":null,\"publish_up\":\"2023-06-06 06:37:25\",\"publish_down\":null,\"images\":\"{\\\"image_intro\\\":\\\"images\\\\\\/Tama.webp#joomlaImage:\\\\\\/\\\\\\/local-images\\\\\\/Tama.webp?width=800&height=490\\\",\\\"image_intro_alt\\\":\\\"tama\\\",\\\"float_intro\\\":\\\"\\\",\\\"image_intro_caption\\\":\\\"\\\",\\\"image_fulltext\\\":\\\"images\\\\\\/tama1.jpg#joomlaImage:\\\\\\/\\\\\\/local-images\\\\\\/tama1.jpg?width=1200&height=630\\\",\\\"image_fulltext_alt\\\":\\\"\\\",\\\"float_fulltext\\\":\\\"\\\",\\\"image_fulltext_caption\\\":\\\"\\\"}\",\"urls\":\"{\\\"urla\\\":\\\"\\\",\\\"urlatext\\\":\\\"\\\",\\\"targeta\\\":\\\"\\\",\\\"urlb\\\":\\\"\\\",\\\"urlbtext\\\":\\\"\\\",\\\"targetb\\\":\\\"\\\",\\\"urlc\\\":\\\"\\\",\\\"urlctext\\\":\\\"\\\",\\\"targetc\\\":\\\"\\\"}\",\"attribs\":\"{\\\"article_layout\\\":\\\"\\\",\\\"show_title\\\":\\\"\\\",\\\"link_titles\\\":\\\"\\\",\\\"show_tags\\\":\\\"\\\",\\\"show_intro\\\":\\\"\\\",\\\"info_block_position\\\":\\\"\\\",\\\"info_block_show_title\\\":\\\"\\\",\\\"show_category\\\":\\\"\\\",\\\"link_category\\\":\\\"\\\",\\\"show_parent_category\\\":\\\"\\\",\\\"link_parent_category\\\":\\\"\\\",\\\"show_author\\\":\\\"\\\",\\\"link_author\\\":\\\"\\\",\\\"show_create_date\\\":\\\"\\\",\\\"show_modify_date\\\":\\\"\\\",\\\"show_publish_date\\\":\\\"\\\",\\\"show_item_navigation\\\":\\\"\\\",\\\"show_hits\\\":\\\"\\\",\\\"show_noauth\\\":\\\"\\\",\\\"urls_position\\\":\\\"\\\",\\\"alternative_readmore\\\":\\\"\\\",\\\"article_page_title\\\":\\\"\\\",\\\"show_publishing_options\\\":\\\"\\\",\\\"show_article_options\\\":\\\"\\\",\\\"show_urls_images_backend\\\":\\\"\\\",\\\"show_urls_images_frontend\\\":\\\"\\\"}\",\"version\":\"1\",\"ordering\":null,\"metakey\":\"\",\"metadesc\":\"\",\"access\":1,\"hits\":0,\"metadata\":\"{\\\"robots\\\":\\\"\\\",\\\"author\\\":\\\"\\\",\\\"rights\\\":\\\"\\\"}\",\"featured\":\"0\",\"language\":\"*\",\"note\":\"\"}', 0),
(2, 'com_content.category.8', '', '2023-06-06 06:54:12', 588, 456, '689d02ed8dab5909d00d3f1db1b5e9f27031e754', '{\"id\":8,\"asset_id\":98,\"parent_id\":1,\"lft\":11,\"rgt\":12,\"level\":1,\"path\":null,\"extension\":\"com_content\",\"title\":\"Wojna\",\"alias\":\"wojna\",\"note\":null,\"description\":null,\"published\":1,\"checked_out\":null,\"checked_out_time\":null,\"access\":1,\"params\":null,\"metadesc\":null,\"metakey\":null,\"metadata\":null,\"created_user_id\":588,\"created_time\":\"2023-06-06 06:54:12\",\"modified_user_id\":588,\"modified_time\":\"2023-06-06 06:54:12\",\"hits\":null,\"language\":\"*\",\"version\":null}', 0),
(3, 'com_content.article.1', '', '2023-06-06 06:54:12', 588, 4838, '1dfa6d73ef8a0eefc513c2b7a000b56cae4e1fe9', '{\"id\":\"1\",\"asset_id\":97,\"title\":\"Rosjanie wysadzili zapor\\u0119\",\"alias\":\"rosjanie-wysadzili-zapore\",\"introtext\":\"<h1 class=\\\"article--title i1xAmRvR\\\" style=\\\"text-align: center;\\\">Rosjanie wysadzili zapor\\u0119. \\\"Poziom krytyczny za 5 godzin\\\"<\\/h1>\\r\\n<p>Niepokoj\\u0105ce doniesienia z Ukrainy. Po wysadzeniu przez wojska rosyjskie zapory wodnej na Dnieprze w okupowanej Nowej Kachowce, w\\u0142adze obwodu cherso\\u0144skiego og\\u0142osi\\u0142y ewakuacj\\u0119 mieszka\\u0144c\\u00f3w zagro\\u017conych zalaniem teren\\u00f3w. Za pi\\u0119\\u0107 godzin woda ma osi\\u0105gn\\u0105\\u0107 poziom krytyczny.<\\/p>\\r\\n\",\"fulltext\":\"\\r\\n<p style=\\\"text-align: left;\\\"><img src=\\\"images\\/tama2.jpeg#joomlaImage:\\/\\/local-images\\/tama2.jpeg?width=3745&amp;height=2497\\\" width=\\\"1263\\\" height=\\\"842\\\" \\/><\\/p>\\r\\n<p style=\\\"text-align: left;\\\">\\\"Skala zniszcze\\u0144, pr\\u0119dko\\u015b\\u0107 i\\u00a0ilo\\u015b\\u0107 wody oraz prawdopodobne obszary powodzi s\\u0105 ustalane\\\" \\u2013\\u00a0poinformowa\\u0142a ukrai\\u0144ska armia na Facebooku.<\\/p>\\r\\n<div class=\\\"article--text iFQN8OU2 iYwaUr3X\\\">\\r\\n<h2 style=\\\"text-align: center;\\\">Wysadzona zapora w Nowej Kachowce. Ewakuacja mieszka\\u0144c\\u00f3w<\\/h2>\\r\\n<\\/div>\\r\\n<div class=\\\"article--text iFQN8OU2 iYwaUr3X\\\">\\r\\n<p>Po\\u00a0wysadzeniu<strong>\\u00a0zapory wodnej\\u00a0na Dnieprze<\\/strong> w\\u00a0okupowanej Nowej Kachowce, w\\u0142adze obwodu cherso\\u0144skiego og\\u0142osi\\u0142y ewakuacj\\u0119 mieszka\\u0144c\\u00f3w zagro\\u017conych zalaniem teren\\u00f3w i\\u00a0ostrzeg\\u0142y, \\u017ce za pi\\u0119\\u0107 godzin woda osi\\u0105gnie poziom krytyczny.<\\/p>\\r\\n<\\/div>\\r\\n<p>\\\"Rosyjska armia dokona\\u0142a kolejnego aktu terroru \\u2013\\u00a0wysadzi\\u0142a Kachowsk\\u0105 Elektrowni\\u0119 Wodn\\u0105. Za pi\\u0119\\u0107 godzin woda osi\\u0105gnie poziom krytyczny\\\" -\\u00a0o\\u015bwiadczy\\u0142 szef Cherso\\u0144skiej Wojskowej Administracji Obwodowej O\\u0142eksandr Prokudin.<\\/p>\\r\\n<div class=\\\"article--text iFQN8OU2 iYwaUr3X\\\">\\r\\n<h2 style=\\\"text-align: center;\\\">Zapora w Nowej Kachowce wysadzona. Cherso\\u0144 zagro\\u017cony<\\/h2>\\r\\n<\\/div>\\r\\n<div class=\\\"article--text iFQN8OU2 iYwaUr3X\\\">\\r\\n<p>Wed\\u0142ug MSW Ukrainy po wysadzeniu zapory elektrowni w\\u00a0Nowej Kachowce\\u00a0<strong>w strefie zagro\\u017conej zalaniem<\\/strong>\\u00a0znajduje si\\u0119 co najmniej 10 miejscowo\\u015bci na prawym, zachodnim brzegu Dniepru. S\\u0105 to: Myko\\u0142ajiwka, Olhiwka, Lowo, Tiahynka, Poniatiwka, Iwaniwka, Tokariwka, Prydniprowskie, Sadowe i\\u00a0cz\\u0119\\u015bciowo miasto Cherso\\u0144.<\\/p>\\r\\n<\\/div>\\r\\n<div>\\r\\n<div class=\\\"article--text iFQN8OU2 iYwaUr3X\\\">\\r\\n<p>Nowa Kachowka po\\u0142o\\u017cona jest w\\u00a0odleg\\u0142o\\u015bci oko\\u0142o 70 km. od\\u00a0Chersonia.<\\/p>\\r\\n<\\/div>\\r\\n<\\/div>\\r\\n<div>\\r\\n<div class=\\\"article--text iFQN8OU2 iYwaUr3X\\\">\\r\\n<p>Ju\\u017c w\\u00a0pa\\u017adzierniku ubieg\\u0142ego roku prezydent Ukrainy Wo\\u0142odymyr Ze\\u0142enski ostrzega\\u0142, \\u017ce je\\u015bli si\\u0142y rosyjskie przerw\\u0105 zapor\\u0119 w\\u00a0elektrowni wodnej w\\u00a0Nowej Kachowce, to w\\u00a0strefie zalania znajdzie si\\u0119 ponad 80 miejscowo\\u015bci, tym miasto Cherso\\u0144.<\\/p>\\r\\n<\\/div>\\r\\n<\\/div>\",\"state\":\"1\",\"catid\":8,\"created\":\"2023-06-06 06:37:25\",\"created_by\":\"588\",\"created_by_alias\":\"\",\"modified\":\"2023-06-06 06:54:12\",\"modified_by\":588,\"checked_out\":588,\"checked_out_time\":\"2023-06-06 06:53:55\",\"publish_up\":\"2023-06-06 06:37:25\",\"publish_down\":null,\"images\":\"{\\\"image_intro\\\":\\\"images\\\\\\/Tama.webp#joomlaImage:\\\\\\/\\\\\\/local-images\\\\\\/Tama.webp?width=800&height=490\\\",\\\"image_intro_alt\\\":\\\"tama\\\",\\\"float_intro\\\":\\\"\\\",\\\"image_intro_caption\\\":\\\"\\\",\\\"image_fulltext\\\":\\\"images\\\\\\/tama1.jpg#joomlaImage:\\\\\\/\\\\\\/local-images\\\\\\/tama1.jpg?width=1200&height=630\\\",\\\"image_fulltext_alt\\\":\\\"\\\",\\\"float_fulltext\\\":\\\"\\\",\\\"image_fulltext_caption\\\":\\\"\\\"}\",\"urls\":\"{\\\"urla\\\":\\\"\\\",\\\"urlatext\\\":\\\"\\\",\\\"targeta\\\":\\\"\\\",\\\"urlb\\\":\\\"\\\",\\\"urlbtext\\\":\\\"\\\",\\\"targetb\\\":\\\"\\\",\\\"urlc\\\":\\\"\\\",\\\"urlctext\\\":\\\"\\\",\\\"targetc\\\":\\\"\\\"}\",\"attribs\":\"{\\\"article_layout\\\":\\\"\\\",\\\"show_title\\\":\\\"\\\",\\\"link_titles\\\":\\\"\\\",\\\"show_tags\\\":\\\"\\\",\\\"show_intro\\\":\\\"\\\",\\\"info_block_position\\\":\\\"\\\",\\\"info_block_show_title\\\":\\\"\\\",\\\"show_category\\\":\\\"\\\",\\\"link_category\\\":\\\"\\\",\\\"show_parent_category\\\":\\\"\\\",\\\"link_parent_category\\\":\\\"\\\",\\\"show_author\\\":\\\"\\\",\\\"link_author\\\":\\\"\\\",\\\"show_create_date\\\":\\\"\\\",\\\"show_modify_date\\\":\\\"\\\",\\\"show_publish_date\\\":\\\"\\\",\\\"show_item_navigation\\\":\\\"\\\",\\\"show_hits\\\":\\\"\\\",\\\"show_noauth\\\":\\\"\\\",\\\"urls_position\\\":\\\"\\\",\\\"alternative_readmore\\\":\\\"\\\",\\\"article_page_title\\\":\\\"\\\",\\\"show_publishing_options\\\":\\\"\\\",\\\"show_article_options\\\":\\\"\\\",\\\"show_urls_images_backend\\\":\\\"\\\",\\\"show_urls_images_frontend\\\":\\\"\\\"}\",\"version\":2,\"ordering\":0,\"metakey\":\"\",\"metadesc\":\"\",\"access\":1,\"hits\":0,\"metadata\":\"{\\\"robots\\\":\\\"\\\",\\\"author\\\":\\\"\\\",\\\"rights\\\":\\\"\\\"}\",\"featured\":\"0\",\"language\":\"*\",\"note\":\"\"}', 0),
(4, 'com_content.article.2', '', '2023-06-06 08:30:59', 588, 10682, '7a7d56abf8cb845ffb62a9f31d36564639f274f9', '{\"id\":2,\"asset_id\":99,\"title\":\"Sprzeczne doniesienia o Polakach na froncie\",\"alias\":\"sprzeczne-doniesienia-o-polakach-na-froncie\",\"introtext\":\"<h1 class=\\\"article--title i1xAmRvR\\\" style=\\\"text-align: center;\\\" data-reactid=\\\"319\\\">Sprzeczne doniesienia o Polakach na froncie. \\\"Ukraina ma n\\u00f3\\u017c na gardle\\\"<\\/h1>\\r\\n<p>- Moskwa wykorzysta\\u0142a to do lobbowania przekaz\\u00f3w o \\\"krwawych Polakach\\\", \\\"mordercach cywili\\\", kt\\u00f3rzy rzekomo odpowiadaj\\u0105 za \\u015bmier\\u0107 rosyjskiej ludno\\u015bci - m\\u00f3wi dr Micha\\u0142 Marek w rozmowie z WP, odnosz\\u0105c si\\u0119 do doniesie\\u0144 o tym, \\u017ce Polacy mieli by\\u0107 w\\u015br\\u00f3d walcz\\u0105cych w obwodzie bie\\u0142gorodzkim.<\\/p>\\r\\n\",\"fulltext\":\"\\r\\n<p><img style=\\\"display: block; margin-left: auto; margin-right: auto;\\\" title=\\\"Przeciwnicy Putina z Legionu Wolno\\u015b\\u0107 Rosji\\\" src=\\\"images\\/123.webp#joomlaImage:\\/\\/local-images\\/123.webp?width=800&amp;height=533\\\" alt=\\\"wojsko\\\" width=\\\"800\\\" height=\\\"533\\\" \\/><\\/p>\\r\\n<p>W niedziel\\u0119 rano na telegramowym kanale Polskiego Korpusu Ochotniczego pojawi\\u0142 si\\u0119 wpis na temat akcji w\\u00a0obwodzie bie\\u0142gorodzkim. \\\"Wszyscy zadaj\\u0105 nam jedno pytanie, czy brali\\u015bmy udzia\\u0142 w\\u00a0operacji na terenie obwodu bie\\u0142gorodzkiego\\u2026\\u00a0<strong>Odpowied\\u017a jest jednoznaczna: oczywi\\u015bcie, \\u017ce tak!<\\/strong>\\\" -\\u00a0mo\\u017cna by\\u0142o przeczyta\\u0107 we wpisie.<\\/p>\\r\\n<p>Przypomnijmy, \\u017ce si\\u0142y Rosyjskiego Ochotniczego Korpusu oraz Legionu \\\"Wolno\\u015b\\u0107 Rosji\\\", walcz\\u0105ce w\\u00a0wojnie po stronie Ukrainy, przed kilkoma dniami\\u00a0wkroczy\\u0142y na teren obwodu bie\\u0142gorodzkiego w\\u00a0Rosji. We wpisie Polskiego Korpusu Ochotniczego dodano, \\u017ce mieli oni bra\\u0107 udzia\\u0142 w\\u00a0<strong>wype\\u0142nieniu \\\"zadania bojowego\\\" wraz z\\u00a0Rosyjskim Korpusem Ochotniczym<\\/strong>.<\\/p>\\r\\n<div class=\\\"article--text iFQN8OU2 iYwaUr3X\\\" data-reactid=\\\"383\\\">\\r\\n<h2 style=\\\"text-align: center;\\\" data-reactid=\\\"384\\\">\\\"Dla naszego oddzia\\u0142u by\\u0142 to zaszczyt\\\"<\\/h2>\\r\\n<\\/div>\\r\\n<div class=\\\"article--text iFQN8OU2 iYwaUr3X\\\" data-reactid=\\\"385\\\">\\r\\n<p>\\\"\\u0141\\u0105cz\\u0105 nas nie tylko wi\\u0119zy braterstwa broni, ale tak\\u017ce osobiste przyja\\u017anie i\\u00a0kole\\u017ce\\u0144stwo\\\" -\\u00a0zapewnili polscy ochotnicy. Dalej napisano: \\\"W akcji wzi\\u0119\\u0142a udzia\\u0142 pierwsza grupa szturmowa Korpusu.\\u00a0<strong>Wszyscy wr\\u00f3cili z\\u00a0zadania cali i\\u00a0zdrowi<\\/strong>. Wyznaczone zadanie wykonano pomy\\u015blnie. Mo\\u017cemy wskaza\\u0107, \\u017ce jako pierwsi, razem z\\u00a0jedn\\u0105 z\\u00a0grup bojowych RDK, dotarli\\u015bmy do miejsca przeznaczenia. Dla naszego oddzia\\u0142u by\\u0142 to zaszczyt uczestniczy\\u0107 w\\u00a0tego typu operacji, cho\\u0107by ze wzgl\\u0119du na historyczne znaczenie tego typu dzia\\u0142a\\u0144\\\".<\\/p>\\r\\n<div data-reactid=\\\"392\\\">\\r\\n<div class=\\\"article--text iFQN8OU2 iYwaUr3X\\\" data-reactid=\\\"393\\\">\\r\\n<p>Dlaczego takie informacje pojawi\\u0142y si\\u0119 z\\u00a0op\\u00f3\\u017anieniem? Autorzy wpisu napisali, \\u017ce zosta\\u0142y one\\u00a0<strong>celowo opublikowane teraz ze wzgl\\u0119d\\u00f3w bezpiecze\\u0144stwa<\\/strong>.<\\/p>\\r\\n<\\/div>\\r\\n<\\/div>\\r\\n<div data-reactid=\\\"394\\\">\\r\\n<div class=\\\"article--text iFQN8OU2 iYwaUr3X\\\" data-reactid=\\\"395\\\">\\r\\n<p>Po pewnym czasie wpisy znikn\\u0119\\u0142y z\\u00a0kana\\u0142u na Telegramie. Pojawi\\u0142o si\\u0119 natomiast\\u00a0<strong>oficjalne o\\u015bwiadczenie w\\u00a0tej sprawie Rosyjskiego Korpusu Ochotniczego<\\/strong>. Napisano w\\u00a0nim: \\\"Nasi towarzysze broni z\\u00a0Polskiego Korpusu Ochotniczego rzeczywi\\u015bcie walcz\\u0105 rami\\u0119 w\\u00a0rami\\u0119 z\\u00a0nami o\\u00a0wolno\\u015b\\u0107 i\\u00a0niepodleg\\u0142o\\u015b\\u0107 Ukrainy od wielu miesi\\u0119cy. Wsp\\u00f3lnie przeprowadzili\\u015bmy ju\\u017c szereg operacji w\\u00a0rejonach\\u00a0<strong>orechowskim, zaporoskim i\\u00a0bachmuckim<\\/strong>. Ch\\u0142opcy spisali si\\u0119 znakomicie i\\u00a0wykazali si\\u0119 wysokim poziomem motywacji i\\u00a0wyszkolenia\\\".<\\/p>\\r\\n<div class=\\\"article--text iFQN8OU2 iYwaUr3X\\\" data-reactid=\\\"406\\\">\\r\\n<h2 style=\\\"text-align: center;\\\" data-reactid=\\\"407\\\">\\u017baryn: brak powi\\u0105zania z Si\\u0142ami Zbrojnymi RP<\\/h2>\\r\\n<\\/div>\\r\\n<div class=\\\"article--text iFQN8OU2 iYwaUr3X\\\" data-reactid=\\\"408\\\">\\r\\n<p>Bardzo szybko przysz\\u0142o dementi ze stron polskich w\\u0142adz. \\\"Opisywany w\\u00a0mediach Polski Korpus Ochotniczy nie jest w\\u00a0\\u017caden spos\\u00f3b powi\\u0105zany z\\u00a0Si\\u0142ami Zbrojnymi RP ani \\u017cadn\\u0105 instytucj\\u0105 RP.\\u00a0<strong>Dzia\\u0142a\\u0144 polskich ochotnik\\u00f3w wspieraj\\u0105cych Ukrain\\u0119 w\\u00a0walce z\\u00a0Rosj\\u0105 nie nale\\u017cy uto\\u017csamia\\u0107 z\\u00a0w\\u0142adzami RP<\\/strong>\\\" -\\u00a0napisa\\u0142 na Twitterze Stanis\\u0142aw \\u017baryn, sekretarz stanu w\\u00a0KPRM, zast\\u0119pca ministra koordynatora s\\u0142u\\u017cb specjalnych, pe\\u0142nomocnik rz\\u0105du ds. bezpiecze\\u0144stwa przestrzeni informacyjnej Rzeczypospolitej Polskiej.<\\/p>\\r\\n<div class=\\\"article--text iFQN8OU2 iYwaUr3X\\\" data-reactid=\\\"417\\\">\\r\\n<h2 style=\\\"text-align: center;\\\" data-reactid=\\\"418\\\">\\\"Ka\\u017cdy walczy o swoje\\\"<\\/h2>\\r\\n<\\/div>\\r\\n<div class=\\\"article--text iFQN8OU2 iYwaUr3X\\\" data-reactid=\\\"419\\\">\\r\\n<p>- Podchodzi\\u0142bym do tego z\\u00a0du\\u017c\\u0105 rezerw\\u0105 -\\u00a0m\\u00f3wi Maciej Matysiak, pu\\u0142kownik rezerwy, ekspert fundacji Stratpoints, by\\u0142y zast\\u0119pca szefa\\u00a0<a class=\\\"seolinker\\\" href=\\\"https:\\/\\/wiadomosci.wp.pl\\/skw-sluzba-kontrwywiadu-wojskowego-6172756444919937c\\\" rel=\\\"noopener noreferrer seolink\\\">S\\u0142u\\u017cby Kontrwywiadu Wojskowego<\\/a>, w\\u00a0rozmowie z\\u00a0Wirtualn\\u0105 Polsk\\u0105.<\\/p>\\r\\n<p>I zaznacza, \\u017ce to wszystko ma na celu przeci\\u0105ganie liny. -\\u00a0Nie wykluczam, \\u017ce mog\\u0105 by\\u0107 takie trendy po stronie ukrai\\u0144skiej -\\u00a0inspirowane przez Rosjan, ale i\\u00a0sami Ukrai\\u0144cy mogli o\\u00a0tym pomy\\u015ble\\u0107 -\\u00a0by popycha\\u0107 troch\\u0119 kraje NATO, by sta\\u0142y si\\u0119 cz\\u0119\\u015bci\\u0105 konfliktu.\\u00a0<strong>Ukraina ma, bezsprzecznie, n\\u00f3\\u017c na gardle<\\/strong>\\u00a0-\\u00a0dodaje.<\\/p>\\r\\n<p>-\\u00a0<strong>Spowodowanie przez Ukrain\\u0119 sytuacji, w\\u00a0kt\\u00f3rej Sojusz wszed\\u0142by aktywnie w\\u00a0konflikt, wiele by im rozwi\\u0105za\\u0142o.\\u00a0<\\/strong>Dla Rosjan niewykluczone, \\u017ce ten scenariusz by\\u0142by bardzo korzystny, tak\\u017ce propagandowo. Pytanie o\\u00a0to, co kto tak naprawd\\u0119 rozgrywa -\\u00a0zaznacza rozm\\u00f3wca WP.<\\/p>\\r\\n<div class=\\\"article--text iFQN8OU2 iYwaUr3X\\\" data-reactid=\\\"440\\\">\\r\\n<h2 style=\\\"text-align: center;\\\" data-reactid=\\\"441\\\">\\\"Lobbowanie przekaz\\u00f3w o \'krwawych Polakach\'\\\"<\\/h2>\\r\\n<\\/div>\\r\\n<div class=\\\"article--text iFQN8OU2 iYwaUr3X\\\" data-reactid=\\\"442\\\">\\r\\n<p>Dr Micha\\u0142 Marek, autor monografii \\\"Operacja Ukraina\\\" i\\u00a0ekspert w\\u00a0dziedzinie dezinformacji, w\\u00a0rozmowie z\\u00a0Wirtualn\\u0105 Polsk\\u0105 podkre\\u015bla, \\u017ce \\\"rosyjskie dzia\\u0142anie dezinformacyjne, dotycz\\u0105ce obecno\\u015bci obywateli RP na terenie obwodu bie\\u0142gorodzkiego, sprowadzi\\u0142y si\\u0119 do wzmacniania negatywnych odczu\\u0107 Rosjan wzgl\\u0119dem Polski i\\u00a0Polak\\u00f3w\\\".<\\/p>\\r\\n<p>- Moskwa wykorzysta\\u0142a dan\\u0105 kwesti\\u0119 do lobbowania przekaz\\u00f3w o\\u00a0\\\"krwawych Polakach\\\", \\\"mordercach cywili\\\", kt\\u00f3rzy<strong>\\u00a0rzekomo odpowiadaj\\u0105 za \\u015bmier\\u0107 rosyjskiej ludno\\u015bci\\u00a0<\\/strong>- m\\u00f3wi. I\\u00a0dodaje, \\u017ce doprowadzi\\u0142a tak\\u017ce swoich obywateli \\\"do stanu, w\\u00a0kt\\u00f3rym s\\u0105 oni sk\\u0142onni uwierzy\\u0107, i\\u017c Polacy zajmuj\\u0105 si\\u0119 na froncie m.in. obcinaniem g\\u0142\\u00f3w rosyjskim je\\u0144com\\\".<\\/p>\\r\\n<div data-reactid=\\\"460\\\">\\r\\n<div class=\\\"article--text iFQN8OU2 iYwaUr3X\\\" data-reactid=\\\"461\\\">\\r\\n<h2 style=\\\"text-align: center;\\\" data-reactid=\\\"462\\\">Rosjanie b\\u0119d\\u0105 to wykorzystywa\\u0107<\\/h2>\\r\\n<\\/div>\\r\\n<div class=\\\"article--text iFQN8OU2 iYwaUr3X\\\" data-reactid=\\\"463\\\">\\r\\n<p>Dr Micha\\u0142 Marek podkre\\u015bla, \\u017ce \\\"prorosyjscy propagandy\\u015bci dzia\\u0142aj\\u0105cy w\\u00a0polskiej infosferze rezonowali m.in. rosyjskie komentarze dotycz\\u0105ce mo\\u017cliwo\\u015bci przekroczenia granicy z\\u00a0Polsk\\u0105 przez grup\\u0119 czecze\\u0144skich \\u017co\\u0142nierzy (podleg\\u0142ych Si\\u0142om Zbrojnym Federacji Rosyjskiej)\\\".<\\/p>\\r\\n<\\/div>\\r\\n<\\/div>\\r\\n<div data-reactid=\\\"464\\\">\\r\\n<div class=\\\"article--text iFQN8OU2 iYwaUr3X\\\" data-reactid=\\\"465\\\">\\r\\n<p>- W\\u00a0danym kontek\\u015bcie warto podkre\\u015bli\\u0107, i\\u017c Rosjanie b\\u0119d\\u0105 wykorzystywa\\u0107 przysz\\u0142e podobne wydarzenia,\\u00a0<strong>aby przekonywa\\u0107 Polak\\u00f3w, i\\u017c wsparcie udzielane przez Warszaw\\u0119 Kijowowi sprowadza na Polak\\u00f3w widmo wojny\\u00a0<\\/strong>- ostrzega ekspert.<\\/p>\\r\\n<\\/div>\\r\\n<\\/div>\\r\\n<\\/div>\\r\\n<\\/div>\\r\\n<\\/div>\\r\\n<\\/div>\\r\\n<\\/div>\\r\\n<\\/div>\",\"state\":\"1\",\"catid\":8,\"created\":\"2023-06-06 08:30:59\",\"created_by\":588,\"created_by_alias\":\"\",\"modified\":\"2023-06-06 08:30:59\",\"modified_by\":588,\"checked_out\":null,\"checked_out_time\":null,\"publish_up\":\"2023-06-06 08:30:59\",\"publish_down\":null,\"images\":\"{\\\"image_intro\\\":\\\"images\\\\\\/1234.webp#joomlaImage:\\\\\\/\\\\\\/local-images\\\\\\/1234.webp?width=1200&height=800\\\",\\\"image_intro_alt\\\":\\\"\\\",\\\"float_intro\\\":\\\"\\\",\\\"image_intro_caption\\\":\\\"\\\",\\\"image_fulltext\\\":\\\"images\\\\\\/546456.jpg#joomlaImage:\\\\\\/\\\\\\/local-images\\\\\\/546456.jpg?width=4300&height=2867\\\",\\\"image_fulltext_alt\\\":\\\"\\\",\\\"float_fulltext\\\":\\\"\\\",\\\"image_fulltext_caption\\\":\\\"\\\"}\",\"urls\":\"{\\\"urla\\\":\\\"\\\",\\\"urlatext\\\":\\\"\\\",\\\"targeta\\\":\\\"\\\",\\\"urlb\\\":\\\"\\\",\\\"urlbtext\\\":\\\"\\\",\\\"targetb\\\":\\\"\\\",\\\"urlc\\\":\\\"\\\",\\\"urlctext\\\":\\\"\\\",\\\"targetc\\\":\\\"\\\"}\",\"attribs\":\"{\\\"article_layout\\\":\\\"\\\",\\\"show_title\\\":\\\"\\\",\\\"link_titles\\\":\\\"\\\",\\\"show_tags\\\":\\\"\\\",\\\"show_intro\\\":\\\"\\\",\\\"info_block_position\\\":\\\"\\\",\\\"info_block_show_title\\\":\\\"\\\",\\\"show_category\\\":\\\"\\\",\\\"link_category\\\":\\\"\\\",\\\"show_parent_category\\\":\\\"\\\",\\\"link_parent_category\\\":\\\"\\\",\\\"show_author\\\":\\\"\\\",\\\"link_author\\\":\\\"\\\",\\\"show_create_date\\\":\\\"\\\",\\\"show_modify_date\\\":\\\"\\\",\\\"show_publish_date\\\":\\\"\\\",\\\"show_item_navigation\\\":\\\"\\\",\\\"show_hits\\\":\\\"\\\",\\\"show_noauth\\\":\\\"\\\",\\\"urls_position\\\":\\\"\\\",\\\"alternative_readmore\\\":\\\"\\\",\\\"article_page_title\\\":\\\"\\\",\\\"show_publishing_options\\\":\\\"\\\",\\\"show_article_options\\\":\\\"\\\",\\\"show_urls_images_backend\\\":\\\"\\\",\\\"show_urls_images_frontend\\\":\\\"\\\"}\",\"version\":\"1\",\"ordering\":null,\"metakey\":\"\",\"metadesc\":\"\",\"access\":1,\"hits\":0,\"metadata\":\"{\\\"robots\\\":\\\"\\\",\\\"author\\\":\\\"\\\",\\\"rights\\\":\\\"\\\"}\",\"featured\":\"0\",\"language\":\"*\",\"note\":\"\"}', 0),
(5, 'com_content.article.3', '', '2023-06-06 09:19:59', 588, 5901, '107670457ec13e73279d61369126ac9ac8c8e61f', '{\"id\":3,\"asset_id\":100,\"title\":\"Ostrze ukrai\\u0144skiej w\\u0142\\u00f3czni\",\"alias\":\"ostrze-ukrainskiej-wloczni\",\"introtext\":\"<h1 class=\\\"article--title i1xAmRvR\\\" style=\\\"text-align: center;\\\">\\\"Ostrze ukrai\\u0144skiej w\\u0142\\u00f3czni\\\". Oni maj\\u0105 prze\\u0142ama\\u0107 Rosjan<\\/h1>\\r\\n<p>Wyszkolone przez NATO jednostki armii Ukrainy dysponuj\\u0105 nie tylko wiedz\\u0105 i praktycznymi umiej\\u0119tno\\u015bciami, ale r\\u00f3wnie\\u017c zachodni\\u0105 technologi\\u0105. To te elitarne szeregi b\\u0119d\\u0105 stanowi\\u0142y najwi\\u0119kszy potencja\\u0142 w kontrofensywie Ukrainy. \\u017bo\\u0142nierze i \\u017co\\u0142nierki 47 Oddzielnej Brygady Zmechanizowanej s\\u0105 gotowi na sygna\\u0142 do dzia\\u0142ania.<\\/p>\\r\\n\",\"fulltext\":\"\\r\\n<p><img src=\\\"images\\/546456.jpg#joomlaImage:\\/\\/local-images\\/546456.jpg?width=4300&amp;height=2867\\\" width=\\\"788\\\" height=\\\"525\\\" \\/><br \\/><br \\/><span style=\\\"font-size: 1rem;\\\">Walk\\u0119 poprowadz\\u0105 brygady uzbrojone nie tylko w zachodni\\u0105 bro\\u0144, ale tak\\u017ce w zachodnie know-how, zebrane podczas miesi\\u0119cy szkole\\u0144 maj\\u0105cych na celu przekszta\\u0142cenie ukrai\\u0144skiej armii w nowoczesn\\u0105 si\\u0142\\u0119, wyszkolon\\u0105 w najbardziej zaawansowanych taktykach wojennych NATO .<\\/span><\\/p>\\r\\n<p><span style=\\\"font-size: 1rem;\\\">Jak opisuje \\\"The Washington Post\\\", podczas gdy regularna armia Ukrainy walczy\\u0142a z okupantem na wielu frontach, 47. Oddzielna Brygada Zmechanizowana przygotowywa\\u0142a si\\u0119 do nast\\u0119pnej fazy wojny w bazie NATO w Niemczech.<br \\/><\\/span><\\/p>\\r\\n<div>\\r\\n<div class=\\\"article--text iFQN8OU2 iYwaUr3X\\\">\\r\\n<p>Dow\\u00f3dztwo brygady szkoli\\u0142o si\\u0119 w\\u00a0pracowniach komputerowych, gdzie na ekranach mo\\u017cna by\\u0142o analizowa\\u0107 strategiczne posuni\\u0119cia i\\u00a0rozwa\\u017ca\\u0107 decyzje, kt\\u00f3re przychodzi im tak\\u017ce podejmowa\\u0107 w\\u00a0realnym \\u017cyciu na wojnie. Zast\\u0119pca dow\\u00f3dcy major Iwan Szalamaha i\\u00a0inni wojskowi korzystali z\\u00a0program\\u00f3w, kt\\u00f3re przypomina\\u0142y gry wojenne.<\\/p>\\r\\n<div>\\r\\n<div class=\\\"article--text iFQN8OU2 iYwaUr3X\\\">\\r\\n<p>Takie symulacje pomagaj\\u0105 zobaczy\\u0107 na ch\\u0142odno og\\u00f3lny obraz wojskowych operacji. -\\u00a0Rozumiesz, gdzie i\\u00a0jakie by\\u0142y twoje niedoci\\u0105gni\\u0119cia. Zwracasz uwag\\u0119 na rzeczy, kt\\u00f3re mog\\u0105 by\\u0107 przeoczone i\\u00a0przyczyni\\u0107 si\\u0119 do niepowodzenia -\\u00a0m\\u00f3wi Szalamaha.<\\/p>\\r\\n<\\/div>\\r\\n<\\/div>\\r\\n<div>\\r\\n<div class=\\\"article--text iFQN8OU2 iYwaUr3X\\\">\\r\\n<p>Teraz gry wojenne si\\u0119 sko\\u0144czy\\u0142y. Jednostka trafi\\u0142a ju\\u017c do Ukrainy gdzie oczekuje na rozkazy.<\\/p>\\r\\n<\\/div>\\r\\n<\\/div>\\r\\n<div>\\r\\n<div class=\\\"article--text iFQN8OU2 iYwaUr3X\\\">\\r\\n<p>Podobne szkolenia od zesz\\u0142ego lata zapewnia\\u0142a obro\\u0144com Ukrainy Wielka Brytania. Do Niemiec natomiast wys\\u0142ano nie poszczeg\\u00f3lnych rekrut\\u00f3w, ale ju\\u017c sformowane jednostki ukrai\\u0144skie, aby nauczy\\u0142y si\\u0119 sp\\u00f3jnego dzia\\u0142anie wewn\\u0105trz grupy, ale tak\\u017ce interoperacyjno\\u015bci mi\\u0119dzy r\\u00f3\\u017cnymi oddzia\\u0142ami.<\\/p>\\r\\n<p>- Potrzebujemy kurs\\u00f3w szkoleniowych na poziomie kompanii, plutonu, batalionu z\\u00a0technikami, z\\u00a0ich bojowymi wozami piechoty, z\\u00a0dow\\u00f3dc\\u0105, kt\\u00f3ry zrozumie, jak kierowa\\u0107 swoimi si\\u0142ami, wspiera\\u0107 artyleri\\u0119, wspiera\\u0107 operacje rozpoznawcze \\u2013\\u00a0m\\u00f3wi minister obrony Ukrainy O\\u0142eksij Reznikow.<\\/p>\\r\\n<p>\\u017bo\\u0142nierze 47. brygady przeszli te\\u017c szkolenia techniczne w obs\\u0142udze broni lub pojazd\\u00f3w.<\\/p>\\r\\n<p>32-letni szeregowiec powiedzia\\u0142 \\\"The Washington Post\\\", \\u017ce pozostaje w kontakcie z niekt\\u00f3rymi ameryka\\u0144skimi instruktorami, kt\\u00f3rych spotka\\u0142 podczas kursu. - W Niemczech naprawd\\u0119 dali nam szans\\u0119 poczu\\u0107, jak to b\\u0119dzie. Jako lider zespo\\u0142u mog\\u0119 dowodzi\\u0107 5-7 osobami. Kidy masz do czynienia z liczniejszymi grupami, potrzebujesz wi\\u0119cej praktyki. A dowodzenie batalionem jest naprawd\\u0119 trudne - powiedzia\\u0142 \\u017co\\u0142nierz.<\\/p>\\r\\n<\\/div>\\r\\n<\\/div>\\r\\n<\\/div>\\r\\n<\\/div>\",\"state\":\"1\",\"catid\":8,\"created\":\"2023-06-06 09:19:59\",\"created_by\":588,\"created_by_alias\":\"\",\"modified\":\"2023-06-06 09:19:59\",\"modified_by\":588,\"checked_out\":null,\"checked_out_time\":null,\"publish_up\":\"2023-06-06 09:19:59\",\"publish_down\":null,\"images\":\"{\\\"image_intro\\\":\\\"images\\\\\\/gasdgdsgsgs.jpg#joomlaImage:\\\\\\/\\\\\\/local-images\\\\\\/gasdgdsgsgs.jpg?width=5334&height=3364\\\",\\\"image_intro_alt\\\":\\\"\\\",\\\"float_intro\\\":\\\"\\\",\\\"image_intro_caption\\\":\\\"\\\",\\\"image_fulltext\\\":\\\"images\\\\\\/Lithuanian_Stingers.jpg#joomlaImage:\\\\\\/\\\\\\/local-images\\\\\\/Lithuanian_Stingers.jpg?width=840&height=594\\\",\\\"image_fulltext_alt\\\":\\\"\\\",\\\"float_fulltext\\\":\\\"\\\",\\\"image_fulltext_caption\\\":\\\"\\\"}\",\"urls\":\"{\\\"urla\\\":\\\"\\\",\\\"urlatext\\\":\\\"\\\",\\\"targeta\\\":\\\"\\\",\\\"urlb\\\":\\\"\\\",\\\"urlbtext\\\":\\\"\\\",\\\"targetb\\\":\\\"\\\",\\\"urlc\\\":\\\"\\\",\\\"urlctext\\\":\\\"\\\",\\\"targetc\\\":\\\"\\\"}\",\"attribs\":\"{\\\"article_layout\\\":\\\"\\\",\\\"show_title\\\":\\\"\\\",\\\"link_titles\\\":\\\"\\\",\\\"show_tags\\\":\\\"\\\",\\\"show_intro\\\":\\\"\\\",\\\"info_block_position\\\":\\\"\\\",\\\"info_block_show_title\\\":\\\"\\\",\\\"show_category\\\":\\\"\\\",\\\"link_category\\\":\\\"\\\",\\\"show_parent_category\\\":\\\"\\\",\\\"link_parent_category\\\":\\\"\\\",\\\"show_author\\\":\\\"\\\",\\\"link_author\\\":\\\"\\\",\\\"show_create_date\\\":\\\"\\\",\\\"show_modify_date\\\":\\\"\\\",\\\"show_publish_date\\\":\\\"\\\",\\\"show_item_navigation\\\":\\\"\\\",\\\"show_hits\\\":\\\"\\\",\\\"show_noauth\\\":\\\"\\\",\\\"urls_position\\\":\\\"\\\",\\\"alternative_readmore\\\":\\\"\\\",\\\"article_page_title\\\":\\\"\\\",\\\"show_publishing_options\\\":\\\"\\\",\\\"show_article_options\\\":\\\"\\\",\\\"show_urls_images_backend\\\":\\\"\\\",\\\"show_urls_images_frontend\\\":\\\"\\\"}\",\"version\":\"1\",\"ordering\":null,\"metakey\":\"\",\"metadesc\":\"\",\"access\":1,\"hits\":0,\"metadata\":\"{\\\"robots\\\":\\\"\\\",\\\"author\\\":\\\"\\\",\\\"rights\\\":\\\"\\\"}\",\"featured\":\"0\",\"language\":\"*\",\"note\":\"\"}', 0),
(6, 'com_content.article.4', '', '2023-06-07 07:32:36', 588, 6069, '4d4ee1b20b4f9a8adfb92708064807defa8887e1', '{\"id\":4,\"asset_id\":101,\"title\":\"Siostry wielkiej wagi\",\"alias\":\"siostry-wielkiej-wagi\",\"introtext\":\"<h1 style=\\\"text-align: center;\\\">\\\"Siostry wielkiej wagi\\\" przesz\\u0142y spektakularn\\u0105 metamorfoz\\u0119. Zrzuci\\u0142y ju\\u017c \\u0107wier\\u0107 tony<\\/h1>\\r\\n<p>Amy i Tammy Slaton, siostry znane z programu \\\"Siostry wielkiej wagi\\\", zawalczy\\u0142y o swoje zdrowie i sylwetki. Amerykanki, kt\\u00f3re zmagaj\\u0105 si\\u0119 z oty\\u0142o\\u015bci\\u0105, zrzuci\\u0142y \\u0142\\u0105cznie ponad 250 kilogram\\u00f3w.<\\/p>\\r\\n<h2 id=\\\"siostry-walcza-z-otyloscia\\\">Siostry walcz\\u0105 z oty\\u0142o\\u015bci\\u0105<\\/h2>\\r\\n<p>Amy Slaton-Halterman i jej siostra Tammy Slaton z Dixon w USA s\\u0105 zdeterminowane, by wygra\\u0107 z\\u00a0<a href=\\\"https:\\/\\/portal.abczdrowie.pl\\/otylosc\\\">oty\\u0142o\\u015bci\\u0105<\\/a> i ju\\u017c maj\\u0105 pierwsze sukcesy.Amerykanki znane z programu \\\"Siostry wielkiej wagi\\\" przesz\\u0142y spektakularn\\u0105 metomorfoz\\u0119. Od czasu, kiedy wyemitowano pierwszy odcinek (w 2020 roku), \\u0142\\u0105cznie zrzuci\\u0142y 250 kilogram\\u00f3w.<\\/p>\\r\\n<p><strong>Przed t\\u0105 niezwyk\\u0142\\u0105 przemian\\u0105 Tammy wa\\u017cy\\u0142a 325 kilogram\\u00f3w, jej siostra Amy - 180 kilogram\\u00f3w<\\/strong>.<\\/p>\\r\\n<p>Ich walk\\u0119 o zdrowie mo\\u017cna \\u015bledzi\\u0107 w mediach spo\\u0142eczno\\u015bciowych, a program z udzia\\u0142em si\\u00f3str sta\\u0142 si\\u0119 hitem.<\\/p>\\r\\n<p>Nie oby\\u0142o si\\u0119 jednak bez kryzysowych chwil. Pod koniec 2021 roku stan zdrowia Tammy by\\u0142 bardzo ci\\u0119\\u017cki, a rodzina ba\\u0142a si\\u0119, \\u017ce kobieta nie zdo\\u0142a z tego wyj\\u015b\\u0107.<\\/p>\\r\\n<p>Jak t\\u0142umaczyli lekarze,\\u00a0<strong>jej p\\u0142uca zacz\\u0119\\u0142y by\\u0107 niewydolne<\\/strong>, co mog\\u0142o sko\\u0144czy\\u0107 si\\u0119 tragedi\\u0105. Na szcz\\u0119\\u015bcie kobiet\\u0119 uda\\u0142o si\\u0119 j\\u0105 uratowa\\u0107.<\\/p>\\r\\n<h2 id=\\\"wielka-metamorfoza\\\">Wielka metamorfoza<\\/h2>\\r\\n<p>Oty\\u0142o\\u015b\\u0107 jest uwa\\u017cana za pandemi\\u0119 XXI wieku, a chorych, kt\\u00f3rzy si\\u0119 z ni\\u0105 zmagaj\\u0105, gwa\\u0142townie przybywa.\\u00a0<strong>W Polsce nadwag\\u0119 ma ju\\u017c 3 na 5 doros\\u0142ych, a co 4. jest oty\\u0142y<\\/strong>.<\\/p>\\r\\n<p>Oty\\u0142o\\u015b\\u0107 ma wp\\u0142yw na funkcjonowanie ca\\u0142ego organizmu i mo\\u017ce przyczyni\\u0107 si\\u0119 do wielu chor\\u00f3b. Zwi\\u0119ksza ryzyko zapale\\u0144 staw\\u00f3w i ko\\u015bci,\\u00a0<a href=\\\"https:\\/\\/portal.abczdrowie.pl\\/choroby-ukladu-krazenia\\\">chor\\u00f3b sercowo-naczyniowych<\\/a>,\\u00a0<a href=\\\"https:\\/\\/portal.abczdrowie.pl\\/nadcisnienie-tetnicze\\\">nadci\\u015bnienia t\\u0119tniczego<\\/a>,\\u00a0<a href=\\\"https:\\/\\/portal.abczdrowie.pl\\/cukrzyca-typu-2\\\">cukrzycy typu 2<\\/a>,\\u00a0<a href=\\\"https:\\/\\/portal.abczdrowie.pl\\/bezdech-senny\\\">bezdechu sennego<\\/a>.<\\/p>\\r\\n<p>Powa\\u017cnym problemem ludzi, kt\\u00f3rzy walcz\\u0105 z oty\\u0142o\\u015bci\\u0105 mog\\u0105 by\\u0107 tak\\u017ce\\u00a0<a href=\\\"https:\\/\\/portal.abczdrowie.pl\\/zylaki-konczyn-dolnych\\\">\\u017cylaki ko\\u0144czyn dolnych<\\/a>\\u00a0oraz wzrost ryzyka\\u00a0<a href=\\\"https:\\/\\/portal.abczdrowie.pl\\/udar-mozgu\\\">udaru m\\u00f3zgu<\\/a>, nowotwor\\u00f3w czy\\u00a0<a href=\\\"https:\\/\\/portal.abczdrowie.pl\\/bezplodnosc\\\">bezp\\u0142odno\\u015bci<\\/a>.<\\/p>\\r\\n<p>Dlatego Amerykanki postanowi\\u0142y walczy\\u0107 o zdrowie. Do tej pory s\\u0142ynne siostry zrobi\\u0142y ogromny post\\u0119p w swojej walce.\\u00a0<strong>Razem straci\\u0142y ponad 250 kilogram\\u00f3w<\\/strong>. Kobiety, kt\\u00f3re nie mog\\u0142y si\\u0119 porusza\\u0107 bez w\\u00f3zka i tlenu, mog\\u0105 coraz \\u0142atwiej \\u017cy\\u0107.<\\/p>\\r\\n<p>Amy spe\\u0142nia si\\u0119 te\\u017c w roli matki. Kobieta urodzi\\u0142a dwoje dzieci i ch\\u0119tnie dzieli si\\u0119 nowymi do\\u015bwiadczenami w mediach spo\\u0142eczno\\u015bciowych.<\\/p>\\r\\n<p><img style=\\\"display: block; margin-left: auto; margin-right: auto;\\\" src=\\\"https:\\/\\/v.wpimg.pl\\/eXkwLnBuSjkKFTpdbQ5HLElNbgcrV0l6HlV2TG06Sm5dTjRebQUKKh8WIEMjFwYiDwUjGSsQSy8bFCgAbAUJdwIaLQknNgQ7AxJjXHJHVndbQmNdc1oENRJaNkMmDww9CBwlCy8qXDwKEmJDOkUcaBMPfBc7RUsoBRBuEw\\\" alt=\\\"Amy urodzi\\u0142a niedawno drugie dziecko\\\" \\/><\\/p>\\r\\n<p>\\u00a0<\\/p>\\r\\n<p>\\u00a0<\\/p>\\r\\n<div class=\\\"article__textbox wvdxqce t6etug9 bqzsno3 jmzr05p\\\">\\r\\n<div id=\\\"c64802fa70d5855\\\" class=\\\"wwz5k4i\\\"><\\/div>\\r\\n<\\/div>\",\"fulltext\":\"\",\"state\":\"1\",\"catid\":2,\"created\":\"2023-06-07 07:32:36\",\"created_by\":588,\"created_by_alias\":\"\",\"modified\":\"2023-06-07 07:32:36\",\"modified_by\":588,\"checked_out\":null,\"checked_out_time\":null,\"publish_up\":\"2023-06-07 07:32:36\",\"publish_down\":null,\"images\":\"{\\\"image_intro\\\":\\\"images\\\\\\/250lb.webp#joomlaImage:\\\\\\/\\\\\\/local-images\\\\\\/250lb.webp?width=916&height=471\\\",\\\"image_intro_alt\\\":\\\"\\\",\\\"float_intro\\\":\\\"\\\",\\\"image_intro_caption\\\":\\\"\\\",\\\"image_fulltext\\\":\\\"images\\\\\\/1000-lb-Sisters-Tammy-Slaton-Amy-Slaton-5489-800x445.jpg#joomlaImage:\\\\\\/\\\\\\/local-images\\\\\\/1000-lb-Sisters-Tammy-Slaton-Amy-Slaton-5489-800x445.jpg?width=800&height=445\\\",\\\"image_fulltext_alt\\\":\\\"\\\",\\\"float_fulltext\\\":\\\"\\\",\\\"image_fulltext_caption\\\":\\\"\\\"}\",\"urls\":\"{\\\"urla\\\":\\\"\\\",\\\"urlatext\\\":\\\"\\\",\\\"targeta\\\":\\\"\\\",\\\"urlb\\\":\\\"\\\",\\\"urlbtext\\\":\\\"\\\",\\\"targetb\\\":\\\"\\\",\\\"urlc\\\":\\\"\\\",\\\"urlctext\\\":\\\"\\\",\\\"targetc\\\":\\\"\\\"}\",\"attribs\":\"{\\\"article_layout\\\":\\\"\\\",\\\"show_title\\\":\\\"\\\",\\\"link_titles\\\":\\\"\\\",\\\"show_tags\\\":\\\"\\\",\\\"show_intro\\\":\\\"\\\",\\\"info_block_position\\\":\\\"\\\",\\\"info_block_show_title\\\":\\\"\\\",\\\"show_category\\\":\\\"\\\",\\\"link_category\\\":\\\"\\\",\\\"show_parent_category\\\":\\\"\\\",\\\"link_parent_category\\\":\\\"\\\",\\\"show_author\\\":\\\"\\\",\\\"link_author\\\":\\\"\\\",\\\"show_create_date\\\":\\\"\\\",\\\"show_modify_date\\\":\\\"\\\",\\\"show_publish_date\\\":\\\"\\\",\\\"show_item_navigation\\\":\\\"\\\",\\\"show_hits\\\":\\\"\\\",\\\"show_noauth\\\":\\\"\\\",\\\"urls_position\\\":\\\"\\\",\\\"alternative_readmore\\\":\\\"\\\",\\\"article_page_title\\\":\\\"\\\",\\\"show_publishing_options\\\":\\\"\\\",\\\"show_article_options\\\":\\\"\\\",\\\"show_urls_images_backend\\\":\\\"\\\",\\\"show_urls_images_frontend\\\":\\\"\\\"}\",\"version\":\"1\",\"ordering\":null,\"metakey\":\"\",\"metadesc\":\"\",\"access\":1,\"hits\":0,\"metadata\":\"{\\\"robots\\\":\\\"\\\",\\\"author\\\":\\\"\\\",\\\"rights\\\":\\\"\\\"}\",\"featured\":\"0\",\"language\":\"*\",\"note\":\"\"}', 0),
(7, 'com_content.category.9', '', '2023-06-07 07:32:58', 588, 471, 'bb9c30775c87550ee129d0f7464201ab7d92c6b9', '{\"id\":9,\"asset_id\":102,\"parent_id\":1,\"lft\":13,\"rgt\":14,\"level\":1,\"path\":null,\"extension\":\"com_content\",\"title\":\"Social Media\",\"alias\":\"social-media\",\"note\":null,\"description\":null,\"published\":1,\"checked_out\":null,\"checked_out_time\":null,\"access\":1,\"params\":null,\"metadesc\":null,\"metakey\":null,\"metadata\":null,\"created_user_id\":588,\"created_time\":\"2023-06-07 07:32:58\",\"modified_user_id\":588,\"modified_time\":\"2023-06-07 07:32:58\",\"hits\":null,\"language\":\"*\",\"version\":null}', 0),
(8, 'com_content.article.4', '', '2023-06-07 07:32:58', 588, 6084, 'c15b393a5a21e00a53a68dcc5a85fe42e223c796', '{\"id\":\"4\",\"asset_id\":101,\"title\":\"Siostry wielkiej wagi\",\"alias\":\"siostry-wielkiej-wagi\",\"introtext\":\"<h1 style=\\\"text-align: center;\\\">\\\"Siostry wielkiej wagi\\\" przesz\\u0142y spektakularn\\u0105 metamorfoz\\u0119. Zrzuci\\u0142y ju\\u017c \\u0107wier\\u0107 tony<\\/h1>\\r\\n<p>Amy i Tammy Slaton, siostry znane z programu \\\"Siostry wielkiej wagi\\\", zawalczy\\u0142y o swoje zdrowie i sylwetki. Amerykanki, kt\\u00f3re zmagaj\\u0105 si\\u0119 z oty\\u0142o\\u015bci\\u0105, zrzuci\\u0142y \\u0142\\u0105cznie ponad 250 kilogram\\u00f3w.<\\/p>\\r\\n<h2 id=\\\"siostry-walcza-z-otyloscia\\\">Siostry walcz\\u0105 z oty\\u0142o\\u015bci\\u0105<\\/h2>\\r\\n<p>Amy Slaton-Halterman i jej siostra Tammy Slaton z Dixon w USA s\\u0105 zdeterminowane, by wygra\\u0107 z\\u00a0<a href=\\\"https:\\/\\/portal.abczdrowie.pl\\/otylosc\\\">oty\\u0142o\\u015bci\\u0105<\\/a> i ju\\u017c maj\\u0105 pierwsze sukcesy.Amerykanki znane z programu \\\"Siostry wielkiej wagi\\\" przesz\\u0142y spektakularn\\u0105 metomorfoz\\u0119. Od czasu, kiedy wyemitowano pierwszy odcinek (w 2020 roku), \\u0142\\u0105cznie zrzuci\\u0142y 250 kilogram\\u00f3w.<\\/p>\\r\\n<p><strong>Przed t\\u0105 niezwyk\\u0142\\u0105 przemian\\u0105 Tammy wa\\u017cy\\u0142a 325 kilogram\\u00f3w, jej siostra Amy - 180 kilogram\\u00f3w<\\/strong>.<\\/p>\\r\\n<p>Ich walk\\u0119 o zdrowie mo\\u017cna \\u015bledzi\\u0107 w mediach spo\\u0142eczno\\u015bciowych, a program z udzia\\u0142em si\\u00f3str sta\\u0142 si\\u0119 hitem.<\\/p>\\r\\n<p>Nie oby\\u0142o si\\u0119 jednak bez kryzysowych chwil. Pod koniec 2021 roku stan zdrowia Tammy by\\u0142 bardzo ci\\u0119\\u017cki, a rodzina ba\\u0142a si\\u0119, \\u017ce kobieta nie zdo\\u0142a z tego wyj\\u015b\\u0107.<\\/p>\\r\\n<p>Jak t\\u0142umaczyli lekarze,\\u00a0<strong>jej p\\u0142uca zacz\\u0119\\u0142y by\\u0107 niewydolne<\\/strong>, co mog\\u0142o sko\\u0144czy\\u0107 si\\u0119 tragedi\\u0105. Na szcz\\u0119\\u015bcie kobiet\\u0119 uda\\u0142o si\\u0119 j\\u0105 uratowa\\u0107.<\\/p>\\r\\n<h2 id=\\\"wielka-metamorfoza\\\">Wielka metamorfoza<\\/h2>\\r\\n<p>Oty\\u0142o\\u015b\\u0107 jest uwa\\u017cana za pandemi\\u0119 XXI wieku, a chorych, kt\\u00f3rzy si\\u0119 z ni\\u0105 zmagaj\\u0105, gwa\\u0142townie przybywa.\\u00a0<strong>W Polsce nadwag\\u0119 ma ju\\u017c 3 na 5 doros\\u0142ych, a co 4. jest oty\\u0142y<\\/strong>.<\\/p>\\r\\n<p>Oty\\u0142o\\u015b\\u0107 ma wp\\u0142yw na funkcjonowanie ca\\u0142ego organizmu i mo\\u017ce przyczyni\\u0107 si\\u0119 do wielu chor\\u00f3b. Zwi\\u0119ksza ryzyko zapale\\u0144 staw\\u00f3w i ko\\u015bci,\\u00a0<a href=\\\"https:\\/\\/portal.abczdrowie.pl\\/choroby-ukladu-krazenia\\\">chor\\u00f3b sercowo-naczyniowych<\\/a>,\\u00a0<a href=\\\"https:\\/\\/portal.abczdrowie.pl\\/nadcisnienie-tetnicze\\\">nadci\\u015bnienia t\\u0119tniczego<\\/a>,\\u00a0<a href=\\\"https:\\/\\/portal.abczdrowie.pl\\/cukrzyca-typu-2\\\">cukrzycy typu 2<\\/a>,\\u00a0<a href=\\\"https:\\/\\/portal.abczdrowie.pl\\/bezdech-senny\\\">bezdechu sennego<\\/a>.<\\/p>\\r\\n<p>Powa\\u017cnym problemem ludzi, kt\\u00f3rzy walcz\\u0105 z oty\\u0142o\\u015bci\\u0105 mog\\u0105 by\\u0107 tak\\u017ce\\u00a0<a href=\\\"https:\\/\\/portal.abczdrowie.pl\\/zylaki-konczyn-dolnych\\\">\\u017cylaki ko\\u0144czyn dolnych<\\/a>\\u00a0oraz wzrost ryzyka\\u00a0<a href=\\\"https:\\/\\/portal.abczdrowie.pl\\/udar-mozgu\\\">udaru m\\u00f3zgu<\\/a>, nowotwor\\u00f3w czy\\u00a0<a href=\\\"https:\\/\\/portal.abczdrowie.pl\\/bezplodnosc\\\">bezp\\u0142odno\\u015bci<\\/a>.<\\/p>\\r\\n<p>Dlatego Amerykanki postanowi\\u0142y walczy\\u0107 o zdrowie. Do tej pory s\\u0142ynne siostry zrobi\\u0142y ogromny post\\u0119p w swojej walce.\\u00a0<strong>Razem straci\\u0142y ponad 250 kilogram\\u00f3w<\\/strong>. Kobiety, kt\\u00f3re nie mog\\u0142y si\\u0119 porusza\\u0107 bez w\\u00f3zka i tlenu, mog\\u0105 coraz \\u0142atwiej \\u017cy\\u0107.<\\/p>\\r\\n<p>Amy spe\\u0142nia si\\u0119 te\\u017c w roli matki. Kobieta urodzi\\u0142a dwoje dzieci i ch\\u0119tnie dzieli si\\u0119 nowymi do\\u015bwiadczenami w mediach spo\\u0142eczno\\u015bciowych.<\\/p>\\r\\n<p><img style=\\\"display: block; margin-left: auto; margin-right: auto;\\\" src=\\\"https:\\/\\/v.wpimg.pl\\/eXkwLnBuSjkKFTpdbQ5HLElNbgcrV0l6HlV2TG06Sm5dTjRebQUKKh8WIEMjFwYiDwUjGSsQSy8bFCgAbAUJdwIaLQknNgQ7AxJjXHJHVndbQmNdc1oENRJaNkMmDww9CBwlCy8qXDwKEmJDOkUcaBMPfBc7RUsoBRBuEw\\\" alt=\\\"Amy urodzi\\u0142a niedawno drugie dziecko\\\" \\/><\\/p>\\r\\n<p>\\u00a0<\\/p>\\r\\n<p>\\u00a0<\\/p>\\r\\n<div class=\\\"article__textbox wvdxqce t6etug9 bqzsno3 jmzr05p\\\">\\r\\n<div id=\\\"c64802fa70d5855\\\" class=\\\"wwz5k4i\\\"><\\/div>\\r\\n<\\/div>\",\"fulltext\":\"\",\"state\":\"1\",\"catid\":9,\"created\":\"2023-06-07 07:32:36\",\"created_by\":\"588\",\"created_by_alias\":\"\",\"modified\":\"2023-06-07 07:32:58\",\"modified_by\":588,\"checked_out\":588,\"checked_out_time\":\"2023-06-07 07:32:46\",\"publish_up\":\"2023-06-07 07:32:36\",\"publish_down\":null,\"images\":\"{\\\"image_intro\\\":\\\"images\\\\\\/250lb.webp#joomlaImage:\\\\\\/\\\\\\/local-images\\\\\\/250lb.webp?width=916&height=471\\\",\\\"image_intro_alt\\\":\\\"\\\",\\\"float_intro\\\":\\\"\\\",\\\"image_intro_caption\\\":\\\"\\\",\\\"image_fulltext\\\":\\\"images\\\\\\/1000-lb-Sisters-Tammy-Slaton-Amy-Slaton-5489-800x445.jpg#joomlaImage:\\\\\\/\\\\\\/local-images\\\\\\/1000-lb-Sisters-Tammy-Slaton-Amy-Slaton-5489-800x445.jpg?width=800&height=445\\\",\\\"image_fulltext_alt\\\":\\\"\\\",\\\"float_fulltext\\\":\\\"\\\",\\\"image_fulltext_caption\\\":\\\"\\\"}\",\"urls\":\"{\\\"urla\\\":\\\"\\\",\\\"urlatext\\\":\\\"\\\",\\\"targeta\\\":\\\"\\\",\\\"urlb\\\":\\\"\\\",\\\"urlbtext\\\":\\\"\\\",\\\"targetb\\\":\\\"\\\",\\\"urlc\\\":\\\"\\\",\\\"urlctext\\\":\\\"\\\",\\\"targetc\\\":\\\"\\\"}\",\"attribs\":\"{\\\"article_layout\\\":\\\"\\\",\\\"show_title\\\":\\\"\\\",\\\"link_titles\\\":\\\"\\\",\\\"show_tags\\\":\\\"\\\",\\\"show_intro\\\":\\\"\\\",\\\"info_block_position\\\":\\\"\\\",\\\"info_block_show_title\\\":\\\"\\\",\\\"show_category\\\":\\\"\\\",\\\"link_category\\\":\\\"\\\",\\\"show_parent_category\\\":\\\"\\\",\\\"link_parent_category\\\":\\\"\\\",\\\"show_author\\\":\\\"\\\",\\\"link_author\\\":\\\"\\\",\\\"show_create_date\\\":\\\"\\\",\\\"show_modify_date\\\":\\\"\\\",\\\"show_publish_date\\\":\\\"\\\",\\\"show_item_navigation\\\":\\\"\\\",\\\"show_hits\\\":\\\"\\\",\\\"show_noauth\\\":\\\"\\\",\\\"urls_position\\\":\\\"\\\",\\\"alternative_readmore\\\":\\\"\\\",\\\"article_page_title\\\":\\\"\\\",\\\"show_publishing_options\\\":\\\"\\\",\\\"show_article_options\\\":\\\"\\\",\\\"show_urls_images_backend\\\":\\\"\\\",\\\"show_urls_images_frontend\\\":\\\"\\\"}\",\"version\":2,\"ordering\":0,\"metakey\":\"\",\"metadesc\":\"\",\"access\":1,\"hits\":0,\"metadata\":\"{\\\"robots\\\":\\\"\\\",\\\"author\\\":\\\"\\\",\\\"rights\\\":\\\"\\\"}\",\"featured\":\"0\",\"language\":\"*\",\"note\":\"\"}', 0);
INSERT INTO `buf3w_history` (`version_id`, `item_id`, `version_note`, `save_date`, `editor_user_id`, `character_count`, `sha1_hash`, `version_data`, `keep_forever`) VALUES
(9, 'com_content.article.5', '', '2023-06-07 07:40:46', 588, 5228, '77e12b5dea6a6464110d210f3936f4c1c1295653', '{\"id\":5,\"asset_id\":103,\"title\":\"TikTok\\u00a0szykuje zmiany\",\"alias\":\"tiktok-szykuje-zmiany\",\"introtext\":\"<h1 class=\\\"C3ct\\\" style=\\\"text-align: center;\\\">TikTok\\u00a0szykuje zmiany. Obejm\\u0105 najm\\u0142odszych\\u00a0u\\u017cytkownik\\u00f3w<\\/h1>\\r\\n<p>TikTok\\u00a0od dawna jest krytykowany za niedostateczn\\u0105 ochron\\u0119 swoich najm\\u0142odszych u\\u017cytkownik\\u00f3w, dlatego teraz serwis wprowadzi nowe mechanizmy chroni\\u0105ce dzieci przed pedofili\\u0105 w sieci. Firma og\\u0142osi\\u0142a w \\u015brod\\u0119, \\u017ce konta u\\u017cytkownik\\u00f3w poni\\u017cej 16 roku domy\\u015blnie b\\u0119d\\u0105 mia\\u0142y najsilniejsze ustawienia prywatno\\u015bci.<\\/p>\\r\\n\",\"fulltext\":\"\\r\\n<p><img style=\\\"display: block; margin-left: auto; margin-right: auto;\\\" src=\\\"https:\\/\\/v.wpimg.pl\\/YmMyOGYudgwsGzl0dg57GW9DbS4wV3VPOFt1ZXZEa1V9AWAuNBJ3CSIbPSIpBzYKPxgiPncFNUIEFC4gPAZ2IygOPGhoRWladEFgcz1Dal4vSylqbUNpWmBNLXE7WDtYL0tiJmlNaF8rTC0ka00_QycJKGUk\\\" alt=\\\"fot. Unsplash\\\" width=\\\"783\\\" height=\\\"522\\\" \\/><\\/p>\\r\\n<div class=\\\"RDe3\\\">\\r\\n<p>Zmiany zostan\\u0105 zastosowane automatycznie wzgl\\u0119dem wszystkich kont utworzonych przez osoby poni\\u017cej 16 roku \\u017cycia i oznaczaj\\u0105, \\u017ce konta stan\\u0105 si\\u0119 prywatne. Co za tym idzie, wszystkie pro\\u015bby o mo\\u017cliwo\\u015b\\u0107 ich obserwowania b\\u0119dzie trzeba zatwierdza\\u0107 samodzielnie.<\\/p>\\r\\n<\\/div>\\r\\n<div class=\\\"RDe3\\\">\\r\\n<p>Profile oznaczone jako prywatne nie mog\\u0105 r\\u00f3wnie\\u017c by\\u0107 oznaczane w materia\\u0142ach wideo nagrywanych w ramach funkcji \\\"Duet\\\", kt\\u00f3ra cz\\u0119sto by\\u0142a wykorzystywana przez pedofil\\u00f3w do \\u0142\\u0105czenia swoich ofiar z materia\\u0142ami pornograficznymi.<\\/p>\\r\\n<div class=\\\"RDe3\\\">\\r\\n<ul>\\r\\n<li>Prawo do prywatno\\u015bci i bezpiecze\\u0144stwo naszej spo\\u0142eczno\\u015bci to najwy\\u017cszy priorytet dla TikToka. Szczeg\\u00f3lny nacisk k\\u0142adziemy na prywatno\\u015b\\u0107 i bezpiecze\\u0144stwo naszych m\\u0142odszych u\\u017cytkownik\\u00f3w i dlatego dla nich wprowadzamy te znacz\\u0105ce zmiany - powiedzia\\u0142a cytowana przez serwis Busiess Insider dyrektor prywatno\\u015bci TikToka dla regionu Europy, Bliskiego Wschodu i Afryki Elaine Fox.<\\/li>\\r\\n<\\/ul>\\r\\n<\\/div>\\r\\n<div class=\\\"RDe3\\\">\\r\\n<p>Zdaniem TikToka, ma to pom\\u00f3c w eliminowaniu potencjalnych pedofil\\u00f3w, poniewa\\u017c ograniczy im mo\\u017cliwo\\u015b\\u0107 obserwowania nieletnich oraz przesy\\u0142ania im wiadomo\\u015bci prywatnych. Eksperci maj\\u0105 jednak co do tego w\\u0105tpliwo\\u015bci. Cytowana r\\u00f3wnie\\u017c przez BI du\\u0144ska ekspertka ds. bezpiecze\\u0144stwa dzieci i m\\u0142odzie\\u017cy Eva Fog Noer powiedzia\\u0142a, \\u017ce\\u00a0<em>zamiana dzia\\u0142ania g\\u0142\\u00f3wnych funkcji aplikacji i blokowanie mo\\u017cliwo\\u015bci korzystania z nich nie jest dobrym rozwi\\u0105zaniem<\\/em><\\/p>\\r\\n<\\/div>\\r\\n<div class=\\\"RDe3\\\">\\r\\n<p>Zdaniem ekspertki m\\u0142odzie\\u017c z \\u0142atwo\\u015bci\\u0105 ominie obostrzenia TikToka i b\\u0119dzie zak\\u0142ada\\u0107 konta, podaj\\u0105c fa\\u0142szyw\\u0105 dat\\u0119 urodzenia. Nie wiadomo dok\\u0142adnie, jakiej liczby kont b\\u0119d\\u0105 dotyczy\\u0107 zmiany zapowiedziane przez TikTok. Wed\\u0142ug szacunk\\u00f3w \\\"New York Times\\\" w sierpniu 2020 TikTok mia\\u0142 ponad 49 mln u\\u017cytkownik\\u00f3w w USA, z czego ponad jedn\\u0105 trzeci\\u0105 stanowi\\u0142y osoby poni\\u017cej 14 roku \\u017cycia.<\\/p>\\r\\n<\\/div>\\r\\n<\\/div>\",\"state\":\"1\",\"catid\":9,\"created\":\"2023-06-07 07:40:46\",\"created_by\":588,\"created_by_alias\":\"\",\"modified\":\"2023-06-07 07:40:46\",\"modified_by\":588,\"checked_out\":null,\"checked_out_time\":null,\"publish_up\":\"2023-06-07 07:40:46\",\"publish_down\":null,\"images\":\"{\\\"image_intro\\\":\\\"images\\\\\\/z29498988AMPTikTok-zwalnia----Polski-dzial-badan-i-rozwoju-uci.jpg#joomlaImage:\\\\\\/\\\\\\/local-images\\\\\\/z29498988AMPTikTok-zwalnia----Polski-dzial-badan-i-rozwoju-uci.jpg?width=1200&height=800\\\",\\\"image_intro_alt\\\":\\\"\\\",\\\"float_intro\\\":\\\"\\\",\\\"image_intro_caption\\\":\\\"\\\",\\\"image_fulltext\\\":\\\"images\\\\\\/tiktok-1-mld-uzytkownikow.png#joomlaImage:\\\\\\/\\\\\\/local-images\\\\\\/tiktok-1-mld-uzytkownikow.png?width=1080&height=518\\\",\\\"image_fulltext_alt\\\":\\\"\\\",\\\"float_fulltext\\\":\\\"\\\",\\\"image_fulltext_caption\\\":\\\"\\\"}\",\"urls\":\"{\\\"urla\\\":\\\"\\\",\\\"urlatext\\\":\\\"\\\",\\\"targeta\\\":\\\"\\\",\\\"urlb\\\":\\\"\\\",\\\"urlbtext\\\":\\\"\\\",\\\"targetb\\\":\\\"\\\",\\\"urlc\\\":\\\"\\\",\\\"urlctext\\\":\\\"\\\",\\\"targetc\\\":\\\"\\\"}\",\"attribs\":\"{\\\"article_layout\\\":\\\"\\\",\\\"show_title\\\":\\\"\\\",\\\"link_titles\\\":\\\"\\\",\\\"show_tags\\\":\\\"\\\",\\\"show_intro\\\":\\\"\\\",\\\"info_block_position\\\":\\\"\\\",\\\"info_block_show_title\\\":\\\"\\\",\\\"show_category\\\":\\\"\\\",\\\"link_category\\\":\\\"\\\",\\\"show_parent_category\\\":\\\"\\\",\\\"link_parent_category\\\":\\\"\\\",\\\"show_author\\\":\\\"\\\",\\\"link_author\\\":\\\"\\\",\\\"show_create_date\\\":\\\"\\\",\\\"show_modify_date\\\":\\\"\\\",\\\"show_publish_date\\\":\\\"\\\",\\\"show_item_navigation\\\":\\\"\\\",\\\"show_hits\\\":\\\"\\\",\\\"show_noauth\\\":\\\"\\\",\\\"urls_position\\\":\\\"\\\",\\\"alternative_readmore\\\":\\\"\\\",\\\"article_page_title\\\":\\\"\\\",\\\"show_publishing_options\\\":\\\"\\\",\\\"show_article_options\\\":\\\"\\\",\\\"show_urls_images_backend\\\":\\\"\\\",\\\"show_urls_images_frontend\\\":\\\"\\\"}\",\"version\":\"1\",\"ordering\":null,\"metakey\":\"\",\"metadesc\":\"\",\"access\":1,\"hits\":0,\"metadata\":\"{\\\"robots\\\":\\\"\\\",\\\"author\\\":\\\"\\\",\\\"rights\\\":\\\"\\\"}\",\"featured\":\"0\",\"language\":\"*\",\"note\":\"\"}', 0),
(10, 'com_content.article.6', '', '2023-06-07 07:49:03', 588, 5498, '911735517db59803ce7b50df4e0ba0a6e9d490a2', '{\"id\":6,\"asset_id\":104,\"title\":\"Facebook na \\\"czarnej li\\u015bcie\\\"\",\"alias\":\"facebook-na-czarnej-liscie\",\"introtext\":\"<h1 class=\\\"sc-1mskw74-0 sc-7eqdwf-0 iPHSOH\\\" style=\\\"text-align: center;\\\">Facebook na \\\"czarnej li\\u015bcie\\\". Du\\u017cy bank nie b\\u0119dzie kupowa\\u0142 akcji<\\/h1>\\r\\n<p>Ju\\u017c trzeci dzie\\u0144 z rz\\u0119du w d\\u00f3\\u0142 lec\\u0105 notowania akcji Facebooka.<\\/p>\\r\\n<p>Przez to warto\\u015b\\u0107 rynkowa firmy spad\\u0142a o kilkadziesi\\u0105t miliard\\u00f3w dolar\\u00f3w. Do czasu wyja\\u015bnienia afery z Cambridge Analytica, z inwestycji w akcje sp\\u00f3\\u0142ki Marka Zuckerberga rezygnuj\\u0105 niekt\\u00f3re fundusze Nordea Banku.<\\/p>\\r\\n\",\"fulltext\":\"\\r\\n<div class=\\\"sc-1mskw74-0 sc-7eqdwf-0 sc-1fanasd-0 bbIjFG sc-1kwzqcy-0 ckLauT\\\">\\r\\n<p><img src=\\\"https:\\/\\/v.wpimg.pl\\/QUJDREVGfjQrJiR2eTxzIWh-cCw_ZX13P2ZoZ3lwaWEyaz8qOCIoez00MSE4aSE5ZS19LXl1Y2VlKyA8MXRjY3JzZGs8NzZ3Nw\\\" alt=\\\"Wizerunek Facebooka mocno podupad\\u0142 po wybuchu afery z Cambridge Analytica.\\\" \\/><\\/p>\\r\\n<p>Najwi\\u0119kszy bank w Skandynawii i jedna z najwi\\u0119kszych grup finansowych w Europie zdecydowa\\u0142a o umieszczeniu akcji Facebooka na \\\"czarnej li\\u015bcie\\\". W\\u0142adze Nordea Banku og\\u0142osi\\u0142y, \\u017ce m.in. nale\\u017c\\u0105ce do niego fundusze inwestycyjne o zr\\u00f3wnowa\\u017conym profilu ryzyka nie b\\u0119d\\u0105 mog\\u0142y a\\u017c do odwo\\u0142ania kupowa\\u0107 udzia\\u0142\\u00f3w w w Facebooku.<\\/p>\\r\\n<\\/div>\\r\\n<div class=\\\"sc-1mskw74-0 sc-7eqdwf-0 sc-1fanasd-0 bbIjFG sc-1kwzqcy-0 ckLauT\\\">\\r\\n<p>Jak donosi agencja Bloomberg, jest to rodzaj \\\"kwarantanny\\\", jaki bank na\\u0142o\\u017cy\\u0142 na akcje. Potrwa ona do momentu, a\\u017c opadn\\u0105 emocje w\\u015br\\u00f3d inwestor\\u00f3w i popularny serwis spo\\u0142eczno\\u015bciowy wyja\\u015bni wszystkie w\\u0105tpliwo\\u015bci w zwi\\u0105zku z afer\\u0105 odkryt\\u0105 przez dziennikarzy \\u015bledczych \\\"New York Timesa\\\" oraz \\\"Observera\\\".<\\/p>\\r\\n<p>Przypomnijmy, \\u017ce dane blisko 50 mln u\\u017cytkownik\\u00f3w Facebooka mia\\u0142y zosta\\u0107 nielegalnie u\\u017cyte przez firm\\u0119 Cambridge Analytica w kampanii wyborczej w 2016 roku. Pos\\u0142u\\u017cy\\u0142y do \\\"promowania\\\" Donalda Trumpa lub jak m\\u00f3wi\\u0105 niekt\\u00f3rzy - do zmanipulowania wyborc\\u00f3w. Firma mia\\u0142a za to zainkasowa\\u0107 niemal 9 mln dolar\\u00f3w.<\\/p>\\r\\n<p>Sprawa wysz\\u0142a na jaw w weekend. Akcje Facebooka tylko w poniedzia\\u0142ek polecia\\u0142y w d\\u00f3\\u0142 a\\u017c o 7 proc.\\u00a0Tak panicznej reakcji inwestor\\u00f3w posiadaj\\u0105cych papiery firmy nie widzieli\\u015bmy od wrze\\u015bnia 2012 roku. W jeden dzie\\u0144 warto\\u015b\\u0107 sp\\u00f3\\u0142ki zmala\\u0142a a\\u017c o 40 mld dolar\\u00f3w.<\\/p>\\r\\n<div class=\\\"sc-1mskw74-0 sc-7eqdwf-0 sc-1fanasd-0 bbIjFG sc-1kwzqcy-0 ckLauT\\\">\\r\\n<p>Sytuacja ci\\u0105gle jest napi\\u0119ta. R\\u00f3wnie\\u017c we wtorek notowania firmy by\\u0142y pod presj\\u0105, trac\\u0105c ostatecznie 2,5 proc. Pocz\\u0105tek \\u015brodowej sesji r\\u00f3wnie\\u017c przynosi delikatne spadki. W\\u0142adze Nordei widz\\u0105c to, stwierdzi\\u0142y, \\u017ce bezpieczniej b\\u0119dzie wstrzyma\\u0107 si\\u0119 na razie z inwestycjami w akcje Facebooka.<\\/p>\\r\\n<\\/div>\\r\\n<div class=\\\"sc-1mskw74-0 sc-7eqdwf-0 sc-1fanasd-0 bbIjFG sc-1kwzqcy-0 ckLauT\\\">\\r\\n<p>Emocje staraj\\u0105 si\\u0119 tonowa\\u0107 przedstawiciele Facebooka, kt\\u00f3rzy odrzucaj\\u0105 zarzuty o niedope\\u0142nienie obowi\\u0105zk\\u00f3w i luki w systemie ochrony danych u\\u017cytkownik\\u00f3w. Wkr\\u00f3tkim o\\u015bwiadczeniu wskazuj\\u0105, \\u017ce zostali oszukani\\u00a0przez Cambridge Analytica. To jednak nie przekonuje inwestor\\u00f3w.<\\/p>\\r\\n<\\/div>\\r\\n<\\/div>\",\"state\":\"1\",\"catid\":9,\"created\":\"2023-06-07 07:49:03\",\"created_by\":588,\"created_by_alias\":\"\",\"modified\":\"2023-06-07 07:49:03\",\"modified_by\":588,\"checked_out\":null,\"checked_out_time\":null,\"publish_up\":\"2023-06-07 07:49:03\",\"publish_down\":null,\"images\":\"{\\\"image_intro\\\":\\\"images\\\\\\/408653.jpg#joomlaImage:\\\\\\/\\\\\\/local-images\\\\\\/408653.jpg?width=1600&height=1033\\\",\\\"image_intro_alt\\\":\\\"\\\",\\\"float_intro\\\":\\\"\\\",\\\"image_intro_caption\\\":\\\"\\\",\\\"image_fulltext\\\":\\\"images\\\\\\/lbDk9kqTURBXy9jY2VkZWJmODVlMWJiZmYxNGI5Yzk4NDA0YzQxNGI3YS5qcGVnkpUDAMxszQwmzQbVkwXNBLDNAljeAAGhMAE.jpg#joomlaImage:\\\\\\/\\\\\\/local-images\\\\\\/lbDk9kqTURBXy9jY2VkZWJmODVlMWJiZmYxNGI5Yzk4NDA0YzQxNGI3YS5qcGVnkpUDAMxszQwmzQbVkwXNBLDNAljeAAGhMAE.jpg?width=1200&height=600\\\",\\\"image_fulltext_alt\\\":\\\"\\\",\\\"float_fulltext\\\":\\\"\\\",\\\"image_fulltext_caption\\\":\\\"\\\"}\",\"urls\":\"{\\\"urla\\\":\\\"\\\",\\\"urlatext\\\":\\\"\\\",\\\"targeta\\\":\\\"\\\",\\\"urlb\\\":\\\"\\\",\\\"urlbtext\\\":\\\"\\\",\\\"targetb\\\":\\\"\\\",\\\"urlc\\\":\\\"\\\",\\\"urlctext\\\":\\\"\\\",\\\"targetc\\\":\\\"\\\"}\",\"attribs\":\"{\\\"article_layout\\\":\\\"\\\",\\\"show_title\\\":\\\"\\\",\\\"link_titles\\\":\\\"\\\",\\\"show_tags\\\":\\\"\\\",\\\"show_intro\\\":\\\"\\\",\\\"info_block_position\\\":\\\"\\\",\\\"info_block_show_title\\\":\\\"\\\",\\\"show_category\\\":\\\"\\\",\\\"link_category\\\":\\\"\\\",\\\"show_parent_category\\\":\\\"\\\",\\\"link_parent_category\\\":\\\"\\\",\\\"show_author\\\":\\\"\\\",\\\"link_author\\\":\\\"\\\",\\\"show_create_date\\\":\\\"\\\",\\\"show_modify_date\\\":\\\"\\\",\\\"show_publish_date\\\":\\\"\\\",\\\"show_item_navigation\\\":\\\"\\\",\\\"show_hits\\\":\\\"\\\",\\\"show_noauth\\\":\\\"\\\",\\\"urls_position\\\":\\\"\\\",\\\"alternative_readmore\\\":\\\"\\\",\\\"article_page_title\\\":\\\"\\\",\\\"show_publishing_options\\\":\\\"\\\",\\\"show_article_options\\\":\\\"\\\",\\\"show_urls_images_backend\\\":\\\"\\\",\\\"show_urls_images_frontend\\\":\\\"\\\"}\",\"version\":\"1\",\"ordering\":null,\"metakey\":\"\",\"metadesc\":\"\",\"access\":1,\"hits\":0,\"metadata\":\"{\\\"robots\\\":\\\"\\\",\\\"author\\\":\\\"\\\",\\\"rights\\\":\\\"\\\"}\",\"featured\":\"0\",\"language\":\"*\",\"note\":\"\"}', 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `buf3w_languages`
--

CREATE TABLE `buf3w_languages` (
  `lang_id` int(10) UNSIGNED NOT NULL,
  `asset_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `lang_code` char(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_native` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sef` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  `metakey` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `metadesc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `sitename` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `published` int(11) NOT NULL DEFAULT 0,
  `access` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `ordering` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `buf3w_languages`
--

INSERT INTO `buf3w_languages` (`lang_id`, `asset_id`, `lang_code`, `title`, `title_native`, `sef`, `image`, `description`, `metakey`, `metadesc`, `sitename`, `published`, `access`, `ordering`) VALUES
(1, 0, 'en-GB', 'English (en-GB)', 'English (United Kingdom)', 'en', 'en_gb', '', '', '', '', 1, 1, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `buf3w_mail_templates`
--

CREATE TABLE `buf3w_mail_templates` (
  `template_id` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `extension` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `htmlbody` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attachments` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `buf3w_mail_templates`
--

INSERT INTO `buf3w_mail_templates` (`template_id`, `extension`, `language`, `subject`, `body`, `htmlbody`, `attachments`, `params`) VALUES
('com_actionlogs.notification', 'com_actionlogs', '', 'COM_ACTIONLOGS_EMAIL_SUBJECT', 'COM_ACTIONLOGS_EMAIL_BODY', 'COM_ACTIONLOGS_EMAIL_HTMLBODY', '', '{\"tags\":[\"message\",\"date\",\"extension\",\"username\"]}'),
('com_config.test_mail', 'com_config', '', 'COM_CONFIG_SENDMAIL_SUBJECT', 'COM_CONFIG_SENDMAIL_BODY', '', '', '{\"tags\":[\"sitename\",\"method\"]}'),
('com_contact.mail', 'com_contact', '', 'COM_CONTACT_ENQUIRY_SUBJECT', 'COM_CONTACT_ENQUIRY_TEXT', '', '', '{\"tags\":[\"sitename\",\"name\",\"email\",\"subject\",\"body\",\"url\",\"customfields\"]}'),
('com_contact.mail.copy', 'com_contact', '', 'COM_CONTACT_COPYSUBJECT_OF', 'COM_CONTACT_COPYTEXT_OF', '', '', '{\"tags\":[\"sitename\",\"name\",\"email\",\"subject\",\"body\",\"url\",\"customfields\",\"contactname\"]}'),
('com_messages.new_message', 'com_messages', '', 'COM_MESSAGES_NEW_MESSAGE', 'COM_MESSAGES_NEW_MESSAGE_BODY', '', '', '{\"tags\":[\"subject\",\"message\",\"fromname\",\"sitename\",\"siteurl\",\"fromemail\",\"toname\",\"toemail\"]}'),
('com_privacy.notification.admin.export', 'com_privacy', '', 'COM_PRIVACY_EMAIL_ADMIN_REQUEST_SUBJECT_EXPORT_REQUEST', 'COM_PRIVACY_EMAIL_ADMIN_REQUEST_BODY_EXPORT_REQUEST', '', '', '{\"tags\":[\"sitename\",\"url\",\"tokenurl\",\"formurl\",\"token\"]}'),
('com_privacy.notification.admin.remove', 'com_privacy', '', 'COM_PRIVACY_EMAIL_ADMIN_REQUEST_SUBJECT_REMOVE_REQUEST', 'COM_PRIVACY_EMAIL_ADMIN_REQUEST_BODY_REMOVE_REQUEST', '', '', '{\"tags\":[\"sitename\",\"url\",\"tokenurl\",\"formurl\",\"token\"]}'),
('com_privacy.notification.export', 'com_privacy', '', 'COM_PRIVACY_EMAIL_REQUEST_SUBJECT_EXPORT_REQUEST', 'COM_PRIVACY_EMAIL_REQUEST_BODY_EXPORT_REQUEST', '', '', '{\"tags\":[\"sitename\",\"url\",\"tokenurl\",\"formurl\",\"token\"]}'),
('com_privacy.notification.remove', 'com_privacy', '', 'COM_PRIVACY_EMAIL_REQUEST_SUBJECT_REMOVE_REQUEST', 'COM_PRIVACY_EMAIL_REQUEST_BODY_REMOVE_REQUEST', '', '', '{\"tags\":[\"sitename\",\"url\",\"tokenurl\",\"formurl\",\"token\"]}'),
('com_privacy.userdataexport', 'com_privacy', '', 'COM_PRIVACY_EMAIL_DATA_EXPORT_COMPLETED_SUBJECT', 'COM_PRIVACY_EMAIL_DATA_EXPORT_COMPLETED_BODY', '', '', '{\"tags\":[\"sitename\",\"url\"]}'),
('com_users.massmail.mail', 'com_users', '', 'COM_USERS_MASSMAIL_MAIL_SUBJECT', 'COM_USERS_MASSMAIL_MAIL_BODY', '', '', '{\"tags\":[\"subject\",\"body\",\"subjectprefix\",\"bodysuffix\"]}'),
('com_users.password_reset', 'com_users', '', 'COM_USERS_EMAIL_PASSWORD_RESET_SUBJECT', 'COM_USERS_EMAIL_PASSWORD_RESET_BODY', '', '', '{\"tags\":[\"name\",\"email\",\"sitename\",\"link_text\",\"link_html\",\"token\"]}'),
('com_users.registration.admin.new_notification', 'com_users', '', 'COM_USERS_EMAIL_ACCOUNT_DETAILS', 'COM_USERS_EMAIL_REGISTERED_NOTIFICATION_TO_ADMIN_BODY', '', '', '{\"tags\":[\"name\",\"sitename\",\"siteurl\",\"username\"]}'),
('com_users.registration.admin.verification_request', 'com_users', '', 'COM_USERS_EMAIL_ACTIVATE_WITH_ADMIN_ACTIVATION_SUBJECT', 'COM_USERS_EMAIL_ACTIVATE_WITH_ADMIN_ACTIVATION_BODY', '', '', '{\"tags\":[\"name\",\"sitename\",\"email\",\"username\",\"activate\"]}'),
('com_users.registration.user.admin_activated', 'com_users', '', 'COM_USERS_EMAIL_ACTIVATED_BY_ADMIN_ACTIVATION_SUBJECT', 'COM_USERS_EMAIL_ACTIVATED_BY_ADMIN_ACTIVATION_BODY', '', '', '{\"tags\":[\"name\",\"sitename\",\"siteurl\",\"username\"]}'),
('com_users.registration.user.admin_activation', 'com_users', '', 'COM_USERS_EMAIL_ACCOUNT_DETAILS', 'COM_USERS_EMAIL_REGISTERED_WITH_ADMIN_ACTIVATION_BODY_NOPW', '', '', '{\"tags\":[\"name\",\"sitename\",\"activate\",\"siteurl\",\"username\"]}'),
('com_users.registration.user.admin_activation_w_pw', 'com_users', '', 'COM_USERS_EMAIL_ACCOUNT_DETAILS', 'COM_USERS_EMAIL_REGISTERED_WITH_ADMIN_ACTIVATION_BODY', '', '', '{\"tags\":[\"name\",\"sitename\",\"activate\",\"siteurl\",\"username\",\"password_clear\"]}'),
('com_users.registration.user.registration_mail', 'com_users', '', 'COM_USERS_EMAIL_ACCOUNT_DETAILS', 'COM_USERS_EMAIL_REGISTERED_BODY_NOPW', '', '', '{\"tags\":[\"name\",\"sitename\",\"siteurl\",\"username\"]}'),
('com_users.registration.user.registration_mail_w_pw', 'com_users', '', 'COM_USERS_EMAIL_ACCOUNT_DETAILS', 'COM_USERS_EMAIL_REGISTERED_BODY', '', '', '{\"tags\":[\"name\",\"sitename\",\"siteurl\",\"username\",\"password_clear\"]}'),
('com_users.registration.user.self_activation', 'com_users', '', 'COM_USERS_EMAIL_ACCOUNT_DETAILS', 'COM_USERS_EMAIL_REGISTERED_WITH_ACTIVATION_BODY_NOPW', '', '', '{\"tags\":[\"name\",\"sitename\",\"activate\",\"siteurl\",\"username\"]}'),
('com_users.registration.user.self_activation_w_pw', 'com_users', '', 'COM_USERS_EMAIL_ACCOUNT_DETAILS', 'COM_USERS_EMAIL_REGISTERED_WITH_ACTIVATION_BODY', '', '', '{\"tags\":[\"name\",\"sitename\",\"activate\",\"siteurl\",\"username\",\"password_clear\"]}'),
('com_users.reminder', 'com_users', '', 'COM_USERS_EMAIL_USERNAME_REMINDER_SUBJECT', 'COM_USERS_EMAIL_USERNAME_REMINDER_BODY', '', '', '{\"tags\":[\"name\",\"username\",\"sitename\",\"email\",\"link_text\",\"link_html\"]}'),
('plg_multifactorauth_email.mail', 'plg_multifactorauth_email', '', 'PLG_MULTIFACTORAUTH_EMAIL_EMAIL_SUBJECT', 'PLG_MULTIFACTORAUTH_EMAIL_EMAIL_BODY', '', '', '{\"tags\":[\"code\",\"sitename\",\"siteurl\",\"username\",\"email\",\"fullname\"]}'),
('plg_system_privacyconsent.request.reminder', 'plg_system_privacyconsent', '', 'PLG_SYSTEM_PRIVACYCONSENT_EMAIL_REMIND_SUBJECT', 'PLG_SYSTEM_PRIVACYCONSENT_EMAIL_REMIND_BODY', '', '', '{\"tags\":[\"sitename\",\"url\",\"tokenurl\",\"formurl\",\"token\"]}'),
('plg_system_tasknotification.failure_mail', 'plg_system_tasknotification', '', 'PLG_SYSTEM_TASK_NOTIFICATION_FAILURE_MAIL_SUBJECT', 'PLG_SYSTEM_TASK_NOTIFICATION_FAILURE_MAIL_BODY', '', '', '{\"tags\": [\"task_id\", \"task_title\", \"exit_code\", \"exec_data_time\", \"task_output\"]}'),
('plg_system_tasknotification.fatal_recovery_mail', 'plg_system_tasknotification', '', 'PLG_SYSTEM_TASK_NOTIFICATION_FATAL_MAIL_SUBJECT', 'PLG_SYSTEM_TASK_NOTIFICATION_FATAL_MAIL_BODY', '', '', '{\"tags\": [\"task_id\", \"task_title\"]}'),
('plg_system_tasknotification.orphan_mail', 'plg_system_tasknotification', '', 'PLG_SYSTEM_TASK_NOTIFICATION_ORPHAN_MAIL_SUBJECT', 'PLG_SYSTEM_TASK_NOTIFICATION_ORPHAN_MAIL_BODY', '', '', '{\"tags\": [\"task_id\", \"task_title\"]}'),
('plg_system_tasknotification.success_mail', 'plg_system_tasknotification', '', 'PLG_SYSTEM_TASK_NOTIFICATION_SUCCESS_MAIL_SUBJECT', 'PLG_SYSTEM_TASK_NOTIFICATION_SUCCESS_MAIL_BODY', '', '', '{\"tags\":[\"task_id\", \"task_title\", \"exec_data_time\", \"task_output\"]}'),
('plg_system_updatenotification.mail', 'plg_system_updatenotification', '', 'PLG_SYSTEM_UPDATENOTIFICATION_EMAIL_SUBJECT', 'PLG_SYSTEM_UPDATENOTIFICATION_EMAIL_BODY', '', '', '{\"tags\":[\"newversion\",\"curversion\",\"sitename\",\"url\",\"link\",\"releasenews\"]}'),
('plg_user_joomla.mail', 'plg_user_joomla', '', 'PLG_USER_JOOMLA_NEW_USER_EMAIL_SUBJECT', 'PLG_USER_JOOMLA_NEW_USER_EMAIL_BODY', '', '', '{\"tags\":[\"name\",\"sitename\",\"url\",\"username\",\"password\",\"email\"]}');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `buf3w_menu`
--

CREATE TABLE `buf3w_menu` (
  `id` int(11) NOT NULL,
  `menutype` varchar(24) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The type of menu this item belongs to. FK to #__menu_types.menutype',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The display title of the menu item.',
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'The SEF alias of the menu item.',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `path` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The computed path of the menu item based on the alias field.',
  `link` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The actually link the menu item refers to.',
  `type` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The type of link: Component, URL, Alias, Separator',
  `published` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'The published state of the menu link.',
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT 1 COMMENT 'The parent menu item in the menu tree.',
  `level` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'The relative level in the tree.',
  `component_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'FK to #__extensions.id',
  `checked_out` int(10) UNSIGNED DEFAULT NULL COMMENT 'FK to #__users.id',
  `checked_out_time` datetime DEFAULT NULL COMMENT 'The time the menu item was checked out.',
  `browserNav` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'The click behaviour of the link.',
  `access` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'The access level required to view the menu item.',
  `img` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The image of the menu item.',
  `template_style_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JSON encoded data for the menu item.',
  `lft` int(11) NOT NULL DEFAULT 0 COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT 0 COMMENT 'Nested set rgt.',
  `home` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Indicates if this menu item is the home or default page.',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `client_id` tinyint(4) NOT NULL DEFAULT 0,
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `buf3w_menu`
--

INSERT INTO `buf3w_menu` (`id`, `menutype`, `title`, `alias`, `note`, `path`, `link`, `type`, `published`, `parent_id`, `level`, `component_id`, `checked_out`, `checked_out_time`, `browserNav`, `access`, `img`, `template_style_id`, `params`, `lft`, `rgt`, `home`, `language`, `client_id`, `publish_up`, `publish_down`) VALUES
(1, '', 'Menu_Item_Root', 'root', '', '', '', '', 1, 0, 0, 0, NULL, NULL, 0, 0, '', 0, '', 0, 43, 0, '*', 0, NULL, NULL),
(2, 'main', 'com_banners', 'Banners', '', 'Banners', 'index.php?option=com_banners', 'component', 1, 1, 1, 3, NULL, NULL, 0, 0, 'class:bookmark', 0, '', 1, 10, 0, '*', 1, NULL, NULL),
(3, 'main', 'com_banners', 'Banners', '', 'Banners/Banners', 'index.php?option=com_banners&view=banners', 'component', 1, 2, 2, 3, NULL, NULL, 0, 0, 'class:banners', 0, '', 2, 3, 0, '*', 1, NULL, NULL),
(4, 'main', 'com_banners_categories', 'Categories', '', 'Banners/Categories', 'index.php?option=com_categories&view=categories&extension=com_banners', 'component', 1, 2, 2, 5, NULL, NULL, 0, 0, 'class:banners-cat', 0, '', 4, 5, 0, '*', 1, NULL, NULL),
(5, 'main', 'com_banners_clients', 'Clients', '', 'Banners/Clients', 'index.php?option=com_banners&view=clients', 'component', 1, 2, 2, 3, NULL, NULL, 0, 0, 'class:banners-clients', 0, '', 6, 7, 0, '*', 1, NULL, NULL),
(6, 'main', 'com_banners_tracks', 'Tracks', '', 'Banners/Tracks', 'index.php?option=com_banners&view=tracks', 'component', 1, 2, 2, 3, NULL, NULL, 0, 0, 'class:banners-tracks', 0, '', 8, 9, 0, '*', 1, NULL, NULL),
(7, 'main', 'com_contact', 'Contacts', '', 'Contacts', 'index.php?option=com_contact', 'component', 1, 1, 1, 7, NULL, NULL, 0, 0, 'class:address-book', 0, '', 11, 20, 0, '*', 1, NULL, NULL),
(8, 'main', 'com_contact_contacts', 'Contacts', '', 'Contacts/Contacts', 'index.php?option=com_contact&view=contacts', 'component', 1, 7, 2, 7, NULL, NULL, 0, 0, 'class:contact', 0, '', 12, 13, 0, '*', 1, NULL, NULL),
(9, 'main', 'com_contact_categories', 'Categories', '', 'Contacts/Categories', 'index.php?option=com_categories&view=categories&extension=com_contact', 'component', 1, 7, 2, 5, NULL, NULL, 0, 0, 'class:contact-cat', 0, '', 14, 15, 0, '*', 1, NULL, NULL),
(10, 'main', 'com_newsfeeds', 'News Feeds', '', 'News Feeds', 'index.php?option=com_newsfeeds', 'component', 1, 1, 1, 16, NULL, NULL, 0, 0, 'class:rss', 0, '', 23, 28, 0, '*', 1, NULL, NULL),
(11, 'main', 'com_newsfeeds_feeds', 'Feeds', '', 'News Feeds/Feeds', 'index.php?option=com_newsfeeds&view=newsfeeds', 'component', 1, 10, 2, 16, NULL, NULL, 0, 0, 'class:newsfeeds', 0, '', 24, 25, 0, '*', 1, NULL, NULL),
(12, 'main', 'com_newsfeeds_categories', 'Categories', '', 'News Feeds/Categories', 'index.php?option=com_categories&view=categories&extension=com_newsfeeds', 'component', 1, 10, 2, 5, NULL, NULL, 0, 0, 'class:newsfeeds-cat', 0, '', 26, 27, 0, '*', 1, NULL, NULL),
(13, 'main', 'com_finder', 'Smart Search', '', 'Smart Search', 'index.php?option=com_finder', 'component', 1, 1, 1, 23, NULL, NULL, 0, 0, 'class:search-plus', 0, '', 29, 38, 0, '*', 1, NULL, NULL),
(14, 'main', 'com_tags', 'Tags', '', 'Tags', 'index.php?option=com_tags&view=tags', 'component', 1, 1, 1, 25, NULL, NULL, 0, 1, 'class:tags', 0, '', 39, 40, 0, '', 1, NULL, NULL),
(15, 'main', 'com_associations', 'Multilingual Associations', '', 'Multilingual Associations', 'index.php?option=com_associations&view=associations', 'component', 1, 1, 1, 30, NULL, NULL, 0, 0, 'class:language', 0, '', 21, 22, 0, '*', 1, NULL, NULL),
(16, 'main', 'mod_menu_fields', 'Contact Custom Fields', '', 'contact/Custom Fields', 'index.php?option=com_fields&context=com_contact.contact', 'component', 1, 7, 2, 29, NULL, NULL, 0, 0, 'class:messages-add', 0, '', 16, 17, 0, '*', 1, NULL, NULL),
(17, 'main', 'mod_menu_fields_group', 'Contact Custom Fields Group', '', 'contact/Custom Fields Group', 'index.php?option=com_fields&view=groups&context=com_contact.contact', 'component', 1, 7, 2, 29, NULL, NULL, 0, 0, 'class:messages-add', 0, '', 18, 19, 0, '*', 1, NULL, NULL),
(18, 'main', 'com_finder_index', 'Smart-Search-Index', '', 'Smart Search/Index', 'index.php?option=com_finder&view=index', 'component', 1, 13, 2, 23, NULL, NULL, 0, 0, 'class:finder', 0, '', 30, 31, 0, '*', 1, NULL, NULL),
(19, 'main', 'com_finder_maps', 'Smart-Search-Maps', '', 'Smart Search/Maps', 'index.php?option=com_finder&view=maps', 'component', 1, 13, 2, 23, NULL, NULL, 0, 0, 'class:finder-maps', 0, '', 32, 33, 0, '*', 1, NULL, NULL),
(20, 'main', 'com_finder_filters', 'Smart-Search-Filters', '', 'Smart Search/Filters', 'index.php?option=com_finder&view=filters', 'component', 1, 13, 2, 23, NULL, NULL, 0, 0, 'class:finder-filters', 0, '', 34, 35, 0, '*', 1, NULL, NULL),
(21, 'main', 'com_finder_searches', 'Smart-Search-Searches', '', 'Smart Search/Searches', 'index.php?option=com_finder&view=searches', 'component', 1, 13, 2, 23, NULL, NULL, 0, 0, 'class:finder-searches', 0, '', 36, 37, 0, '*', 1, NULL, NULL),
(101, 'mainmenu', 'Home', 'home', '', 'home', 'index.php?option=com_content&view=featured', 'component', 1, 1, 1, 19, NULL, NULL, 0, 1, '', 0, '{\"featured_categories\":[\"\"],\"layout_type\":\"blog\",\"blog_class_leading\":\"\",\"blog_class\":\"\",\"num_leading_articles\":\"1\",\"num_intro_articles\":\"3\",\"num_links\":\"0\",\"link_intro_image\":\"\",\"orderby_pri\":\"\",\"orderby_sec\":\"front\",\"order_date\":\"\",\"show_pagination\":\"2\",\"show_pagination_results\":\"1\",\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_readmore\":\"\",\"show_readmore_title\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"show_feed_link\":\"1\",\"feed_summary\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_image_css\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"1\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"robots\":\"\"}', 41, 42, 1, '*', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `buf3w_menu_types`
--

CREATE TABLE `buf3w_menu_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `asset_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `menutype` varchar(24) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(48) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `client_id` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `buf3w_menu_types`
--

INSERT INTO `buf3w_menu_types` (`id`, `asset_id`, `menutype`, `title`, `description`, `client_id`) VALUES
(1, 0, 'mainmenu', 'Main Menu', 'The main menu for the site', 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `buf3w_messages`
--

CREATE TABLE `buf3w_messages` (
  `message_id` int(10) UNSIGNED NOT NULL,
  `user_id_from` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `user_id_to` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `folder_id` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `date_time` datetime NOT NULL,
  `state` tinyint(4) NOT NULL DEFAULT 0,
  `priority` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `buf3w_messages_cfg`
--

CREATE TABLE `buf3w_messages_cfg` (
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `cfg_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `cfg_value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `buf3w_modules`
--

CREATE TABLE `buf3w_modules` (
  `id` int(11) NOT NULL,
  `asset_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'FK to the #__assets table.',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ordering` int(11) NOT NULL DEFAULT 0,
  `position` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `checked_out` int(10) UNSIGNED DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL,
  `published` tinyint(4) NOT NULL DEFAULT 0,
  `module` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `access` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `showtitle` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_id` tinyint(4) NOT NULL DEFAULT 0,
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `buf3w_modules`
--

INSERT INTO `buf3w_modules` (`id`, `asset_id`, `title`, `note`, `content`, `ordering`, `position`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `published`, `module`, `access`, `showtitle`, `params`, `client_id`, `language`) VALUES
(1, 39, 'Main Menu', '', '', 1, 'sidebar-right', NULL, NULL, NULL, NULL, 1, 'mod_menu', 1, 1, '{\"menutype\":\"mainmenu\",\"startLevel\":\"0\",\"endLevel\":\"0\",\"showAllChildren\":\"1\",\"tag_id\":\"\",\"class_sfx\":\"\",\"window_open\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"itemid\"}', 0, '*'),
(2, 40, 'Login', '', '', 1, 'login', NULL, NULL, NULL, NULL, 1, 'mod_login', 1, 1, '', 1, '*'),
(3, 41, 'Popular Articles', '', '', 6, 'cpanel', NULL, NULL, NULL, NULL, 1, 'mod_popular', 3, 1, '{\"count\":\"5\",\"catid\":\"\",\"user_id\":\"0\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\", \"bootstrap_size\": \"12\",\"header_tag\":\"h2\"}', 1, '*'),
(4, 42, 'Recently Added Articles', '', '', 4, 'cpanel', NULL, NULL, NULL, NULL, 1, 'mod_latest', 3, 1, '{\"count\":\"5\",\"ordering\":\"c_dsc\",\"catid\":\"\",\"user_id\":\"0\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\", \"bootstrap_size\": \"12\",\"header_tag\":\"h2\"}', 1, '*'),
(8, 43, 'Toolbar', '', '', 1, 'toolbar', NULL, NULL, NULL, NULL, 1, 'mod_toolbar', 3, 1, '', 1, '*'),
(9, 44, 'Notifications', '', '', 3, 'icon', NULL, NULL, NULL, NULL, 1, 'mod_quickicon', 3, 1, '{\"context\":\"update_quickicon\",\"header_icon\":\"icon-sync\",\"show_jupdate\":\"1\",\"show_eupdate\":\"1\",\"show_oupdate\":\"1\",\"show_privacy\":\"1\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":1,\"cache_time\":900,\"style\":\"0\",\"module_tag\":\"div\",\"bootstrap_size\":\"12\",\"header_tag\":\"h2\",\"header_class\":\"\"}', 1, '*'),
(10, 45, 'Logged-in Users', '', '', 2, 'cpanel', NULL, NULL, NULL, NULL, 1, 'mod_logged', 3, 1, '{\"count\":\"5\",\"name\":\"1\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\", \"bootstrap_size\": \"12\",\"header_tag\":\"h2\"}', 1, '*'),
(12, 46, 'Admin Menu', '', '', 1, 'menu', NULL, NULL, NULL, NULL, 1, 'mod_menu', 3, 1, '{\"layout\":\"\",\"moduleclass_sfx\":\"\",\"shownew\":\"1\",\"showhelp\":\"1\",\"cache\":\"0\"}', 1, '*'),
(15, 49, 'Title', '', '', 1, 'title', NULL, NULL, NULL, NULL, 1, 'mod_title', 3, 1, '', 1, '*'),
(16, 50, 'Login Form', '', '', 7, 'sidebar-right', NULL, NULL, NULL, NULL, 1, 'mod_login', 1, 1, '{\"greeting\":\"1\",\"name\":\"0\"}', 0, '*'),
(17, 51, 'Breadcrumbs', '', '', 1, 'breadcrumbs', NULL, NULL, NULL, NULL, 1, 'mod_breadcrumbs', 1, 1, '{\"moduleclass_sfx\":\"\",\"showHome\":\"1\",\"homeText\":\"\",\"showComponent\":\"1\",\"separator\":\"\",\"cache\":\"0\",\"cache_time\":\"0\",\"cachemode\":\"itemid\"}', 0, '*'),
(79, 52, 'Multilanguage status', '', '', 2, 'status', NULL, NULL, NULL, NULL, 1, 'mod_multilangstatus', 3, 1, '{\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\"}', 1, '*'),
(86, 53, 'Joomla Version', '', '', 1, 'status', NULL, NULL, NULL, NULL, 1, 'mod_version', 3, 1, '{\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\"}', 1, '*'),
(87, 55, 'Sample Data', '', '', 1, 'cpanel', NULL, NULL, NULL, NULL, 1, 'mod_sampledata', 6, 1, '{\"bootstrap_size\": \"12\",\"header_tag\":\"h2\"}', 1, '*'),
(88, 67, 'Latest Actions', '', '', 3, 'cpanel', NULL, NULL, NULL, NULL, 1, 'mod_latestactions', 6, 1, '{\"bootstrap_size\": \"12\",\"header_tag\":\"h2\"}', 1, '*'),
(89, 68, 'Privacy Dashboard', '', '', 5, 'cpanel', NULL, NULL, NULL, NULL, 1, 'mod_privacy_dashboard', 6, 1, '{\"bootstrap_size\": \"12\",\"header_tag\":\"h2\"}', 1, '*'),
(90, 89, 'Login Support', '', '', 1, 'sidebar', NULL, NULL, NULL, NULL, 1, 'mod_loginsupport', 1, 1, '{\"forum_url\":\"https://forum.joomla.org/\",\"documentation_url\":\"https://docs.joomla.org/\",\"news_url\":\"https://www.joomla.org/announcements.html\",\"automatic_title\":1,\"prepare_content\":1,\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":1,\"cache_time\":900,\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}', 1, '*'),
(91, 72, 'System Dashboard', '', '', 1, 'cpanel-system', NULL, NULL, NULL, NULL, 1, 'mod_submenu', 1, 0, '{\"menutype\":\"*\",\"preset\":\"system\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"module_tag\":\"div\",\"bootstrap_size\":\"12\",\"header_tag\":\"h2\",\"header_class\":\"\",\"style\":\"System-none\"}', 1, '*'),
(92, 73, 'Content Dashboard', '', '', 1, 'cpanel-content', NULL, NULL, NULL, NULL, 1, 'mod_submenu', 1, 0, '{\"menutype\":\"*\",\"preset\":\"content\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"module_tag\":\"div\",\"bootstrap_size\":\"12\",\"header_tag\":\"h2\",\"header_class\":\"\",\"style\":\"System-none\"}', 1, '*'),
(93, 74, 'Menus Dashboard', '', '', 1, 'cpanel-menus', NULL, NULL, NULL, NULL, 1, 'mod_submenu', 1, 0, '{\"menutype\":\"*\",\"preset\":\"menus\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"module_tag\":\"div\",\"bootstrap_size\":\"12\",\"header_tag\":\"h2\",\"header_class\":\"\",\"style\":\"System-none\"}', 1, '*'),
(94, 75, 'Components Dashboard', '', '', 1, 'cpanel-components', NULL, NULL, NULL, NULL, 1, 'mod_submenu', 1, 0, '{\"menutype\":\"*\",\"preset\":\"components\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"module_tag\":\"div\",\"bootstrap_size\":\"12\",\"header_tag\":\"h2\",\"header_class\":\"\",\"style\":\"System-none\"}', 1, '*'),
(95, 76, 'Users Dashboard', '', '', 1, 'cpanel-users', NULL, NULL, NULL, NULL, 1, 'mod_submenu', 1, 0, '{\"menutype\":\"*\",\"preset\":\"users\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"module_tag\":\"div\",\"bootstrap_size\":\"12\",\"header_tag\":\"h2\",\"header_class\":\"\",\"style\":\"System-none\"}', 1, '*'),
(96, 86, 'Popular Articles', '', '', 3, 'cpanel-content', NULL, NULL, NULL, NULL, 1, 'mod_popular', 3, 1, '{\"count\":\"5\",\"catid\":\"\",\"user_id\":\"0\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\", \"bootstrap_size\": \"12\",\"header_tag\":\"h2\"}', 1, '*'),
(97, 87, 'Recently Added Articles', '', '', 4, 'cpanel-content', NULL, NULL, NULL, NULL, 1, 'mod_latest', 3, 1, '{\"count\":\"5\",\"ordering\":\"c_dsc\",\"catid\":\"\",\"user_id\":\"0\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\", \"bootstrap_size\": \"12\",\"header_tag\":\"h2\"}', 1, '*'),
(98, 88, 'Logged-in Users', '', '', 2, 'cpanel-users', NULL, NULL, NULL, NULL, 1, 'mod_logged', 3, 1, '{\"count\":\"5\",\"name\":\"1\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\", \"bootstrap_size\": \"12\",\"header_tag\":\"h2\"}', 1, '*'),
(99, 77, 'Frontend Link', '', '', 5, 'status', NULL, NULL, NULL, NULL, 1, 'mod_frontend', 1, 1, '', 1, '*'),
(100, 78, 'Messages', '', '', 4, 'status', NULL, NULL, NULL, NULL, 1, 'mod_messages', 3, 1, '', 1, '*'),
(101, 79, 'Post Install Messages', '', '', 3, 'status', NULL, NULL, NULL, NULL, 1, 'mod_post_installation_messages', 3, 1, '', 1, '*'),
(102, 80, 'User Status', '', '', 6, 'status', NULL, NULL, NULL, NULL, 1, 'mod_user', 3, 1, '', 1, '*'),
(103, 70, 'Site', '', '', 1, 'icon', NULL, NULL, NULL, NULL, 1, 'mod_quickicon', 1, 1, '{\"context\":\"site_quickicon\",\"header_icon\":\"icon-desktop\",\"show_users\":\"1\",\"show_articles\":\"1\",\"show_categories\":\"1\",\"show_media\":\"1\",\"show_menuItems\":\"1\",\"show_modules\":\"1\",\"show_plugins\":\"1\",\"show_templates\":\"1\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":1,\"cache_time\":900,\"style\":\"0\",\"module_tag\":\"div\",\"bootstrap_size\":\"12\",\"header_tag\":\"h2\",\"header_class\":\"\"}', 1, '*'),
(104, 71, 'System', '', '', 2, 'icon', NULL, NULL, NULL, NULL, 1, 'mod_quickicon', 1, 1, '{\"context\":\"system_quickicon\",\"header_icon\":\"icon-wrench\",\"show_global\":\"1\",\"show_checkin\":\"1\",\"show_cache\":\"1\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":1,\"cache_time\":900,\"style\":\"0\",\"module_tag\":\"div\",\"bootstrap_size\":\"12\",\"header_tag\":\"h2\",\"header_class\":\"\"}', 1, '*'),
(105, 82, '3rd Party', '', '', 4, 'icon', NULL, NULL, NULL, NULL, 1, 'mod_quickicon', 1, 1, '{\"context\":\"mod_quickicon\",\"header_icon\":\"icon-boxes\",\"load_plugins\":\"1\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":1,\"cache_time\":900,\"style\":\"0\",\"module_tag\":\"div\",\"bootstrap_size\":\"12\",\"header_tag\":\"h2\",\"header_class\":\"\"}', 1, '*'),
(106, 83, 'Help Dashboard', '', '', 1, 'cpanel-help', NULL, NULL, NULL, NULL, 1, 'mod_submenu', 1, 0, '{\"menutype\":\"*\",\"preset\":\"help\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"style\":\"System-none\",\"module_tag\":\"div\",\"bootstrap_size\":\"12\",\"header_tag\":\"h2\",\"header_class\":\"\"}', 1, '*'),
(107, 84, 'Privacy Requests', '', '', 1, 'cpanel-privacy', NULL, NULL, NULL, NULL, 1, 'mod_privacy_dashboard', 1, 1, '{\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":1,\"cache_time\":900,\"cachemode\":\"static\",\"style\":\"0\",\"module_tag\":\"div\",\"bootstrap_size\":\"12\",\"header_tag\":\"h2\",\"header_class\":\"\"}', 1, '*'),
(108, 85, 'Privacy Status', '', '', 1, 'cpanel-privacy', NULL, NULL, NULL, NULL, 1, 'mod_privacy_status', 1, 1, '{\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":1,\"cache_time\":900,\"cachemode\":\"static\",\"style\":\"0\",\"module_tag\":\"div\",\"bootstrap_size\":\"12\",\"header_tag\":\"h2\",\"header_class\":\"\"}', 1, '*'),
(109, 96, 'Guided Tours', '', '', 1, 'status', NULL, NULL, NULL, NULL, 1, 'mod_guidedtours', 1, 1, '', 1, '*');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `buf3w_modules_menu`
--

CREATE TABLE `buf3w_modules_menu` (
  `moduleid` int(11) NOT NULL DEFAULT 0,
  `menuid` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `buf3w_modules_menu`
--

INSERT INTO `buf3w_modules_menu` (`moduleid`, `menuid`) VALUES
(1, 0),
(2, 0),
(3, 0),
(4, 0),
(6, 0),
(7, 0),
(8, 0),
(9, 0),
(10, 0),
(12, 0),
(14, 0),
(15, 0),
(16, 0),
(17, 0),
(79, 0),
(86, 0),
(87, 0),
(88, 0),
(89, 0),
(90, 0),
(91, 0),
(92, 0),
(93, 0),
(94, 0),
(95, 0),
(96, 0),
(97, 0),
(98, 0),
(99, 0),
(100, 0),
(101, 0),
(102, 0),
(103, 0),
(104, 0),
(105, 0),
(106, 0),
(107, 0),
(108, 0),
(109, 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `buf3w_newsfeeds`
--

CREATE TABLE `buf3w_newsfeeds` (
  `catid` int(11) NOT NULL DEFAULT 0,
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `link` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `published` tinyint(4) NOT NULL DEFAULT 0,
  `numarticles` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `cache_time` int(10) UNSIGNED NOT NULL DEFAULT 3600,
  `checked_out` int(10) UNSIGNED DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `ordering` int(11) NOT NULL DEFAULT 0,
  `rtl` tinyint(4) NOT NULL DEFAULT 0,
  `access` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `created_by` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified` datetime NOT NULL,
  `modified_by` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `metakey` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `metadesc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadata` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `hits` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `images` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `buf3w_overrider`
--

CREATE TABLE `buf3w_overrider` (
  `id` int(11) NOT NULL COMMENT 'Primary Key',
  `constant` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `string` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `buf3w_postinstall_messages`
--

CREATE TABLE `buf3w_postinstall_messages` (
  `postinstall_message_id` bigint(20) UNSIGNED NOT NULL,
  `extension_id` bigint(20) NOT NULL DEFAULT 700 COMMENT 'FK to #__extensions',
  `title_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Lang key for the title',
  `description_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Lang key for description',
  `action_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `language_extension` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'com_postinstall' COMMENT 'Extension holding lang keys',
  `language_client_id` tinyint(4) NOT NULL DEFAULT 1,
  `type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'link' COMMENT 'Message type - message, link, action',
  `action_file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'RAD URI to the PHP file containing action method',
  `action` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'Action method name or URL',
  `condition_file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'RAD URI to file holding display condition method',
  `condition_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Display condition method, must return boolean',
  `version_introduced` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '3.2.0' COMMENT 'Version when this message was introduced',
  `enabled` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `buf3w_postinstall_messages`
--

INSERT INTO `buf3w_postinstall_messages` (`postinstall_message_id`, `extension_id`, `title_key`, `description_key`, `action_key`, `language_extension`, `language_client_id`, `type`, `action_file`, `action`, `condition_file`, `condition_method`, `version_introduced`, `enabled`) VALUES
(1, 227, 'COM_CPANEL_WELCOME_BEGINNERS_TITLE', 'COM_CPANEL_WELCOME_BEGINNERS_MESSAGE', '', 'com_cpanel', 1, 'message', '', '', '', '', '3.2.0', 1),
(2, 227, 'COM_CPANEL_MSG_STATS_COLLECTION_TITLE', 'COM_CPANEL_MSG_STATS_COLLECTION_BODY', '', 'com_cpanel', 1, 'message', '', '', 'admin://components/com_admin/postinstall/statscollection.php', 'admin_postinstall_statscollection_condition', '3.5.0', 1),
(3, 227, 'PLG_SYSTEM_UPDATENOTIFICATION_POSTINSTALL_UPDATECACHETIME', 'PLG_SYSTEM_UPDATENOTIFICATION_POSTINSTALL_UPDATECACHETIME_BODY', 'PLG_SYSTEM_UPDATENOTIFICATION_POSTINSTALL_UPDATECACHETIME_ACTION', 'plg_system_updatenotification', 1, 'action', 'site://plugins/system/updatenotification/postinstall/updatecachetime.php', 'updatecachetime_postinstall_action', 'site://plugins/system/updatenotification/postinstall/updatecachetime.php', 'updatecachetime_postinstall_condition', '3.6.3', 1),
(4, 227, 'PLG_SYSTEM_HTTPHEADERS_POSTINSTALL_INTRODUCTION_TITLE', 'PLG_SYSTEM_HTTPHEADERS_POSTINSTALL_INTRODUCTION_BODY', 'PLG_SYSTEM_HTTPHEADERS_POSTINSTALL_INTRODUCTION_ACTION', 'plg_system_httpheaders', 1, 'action', 'site://plugins/system/httpheaders/postinstall/introduction.php', 'httpheaders_postinstall_action', 'site://plugins/system/httpheaders/postinstall/introduction.php', 'httpheaders_postinstall_condition', '4.0.0', 1),
(5, 227, 'COM_USERS_POSTINSTALL_MULTIFACTORAUTH_TITLE', 'COM_USERS_POSTINSTALL_MULTIFACTORAUTH_BODY', 'COM_USERS_POSTINSTALL_MULTIFACTORAUTH_ACTION', 'com_users', 1, 'action', 'admin://components/com_users/postinstall/multifactorauth.php', 'com_users_postinstall_mfa_action', 'admin://components/com_users/postinstall/multifactorauth.php', 'com_users_postinstall_mfa_condition', '4.2.0', 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `buf3w_privacy_consents`
--

CREATE TABLE `buf3w_privacy_consents` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `state` int(11) NOT NULL DEFAULT 1,
  `created` datetime NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `remind` tinyint(4) NOT NULL DEFAULT 0,
  `token` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `buf3w_privacy_requests`
--

CREATE TABLE `buf3w_privacy_requests` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `requested_at` datetime NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `request_type` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `confirm_token` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `confirm_token_created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `buf3w_redirect_links`
--

CREATE TABLE `buf3w_redirect_links` (
  `id` int(10) UNSIGNED NOT NULL,
  `old_url` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `new_url` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referer` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `hits` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `published` tinyint(4) NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  `header` smallint(6) NOT NULL DEFAULT 301
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `buf3w_scheduler_tasks`
--

CREATE TABLE `buf3w_scheduler_tasks` (
  `id` int(10) UNSIGNED NOT NULL,
  `asset_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'FK to the #__assets table.',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `type` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'unique identifier for job defined by plugin',
  `execution_rules` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Execution Rules, Unprocessed',
  `cron_rules` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Processed execution rules, crontab-like JSON form',
  `state` tinyint(4) NOT NULL DEFAULT 0,
  `last_exit_code` int(11) NOT NULL DEFAULT 0 COMMENT 'Exit code when job was last run',
  `last_execution` datetime DEFAULT NULL COMMENT 'Timestamp of last run',
  `next_execution` datetime DEFAULT NULL COMMENT 'Timestamp of next (planned) run, referred for execution on trigger',
  `times_executed` int(11) DEFAULT 0 COMMENT 'Count of successful triggers',
  `times_failed` int(11) DEFAULT 0 COMMENT 'Count of failures',
  `locked` datetime DEFAULT NULL,
  `priority` smallint(6) NOT NULL DEFAULT 0,
  `ordering` int(11) NOT NULL DEFAULT 0 COMMENT 'Configurable list ordering',
  `cli_exclusive` smallint(6) NOT NULL DEFAULT 0 COMMENT 'If 1, the task is only accessible via CLI',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created` datetime NOT NULL,
  `created_by` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `checked_out` int(10) UNSIGNED DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `buf3w_schemas`
--

CREATE TABLE `buf3w_schemas` (
  `extension_id` int(11) NOT NULL,
  `version_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `buf3w_schemas`
--

INSERT INTO `buf3w_schemas` (`extension_id`, `version_id`) VALUES
(227, '4.3.2-2023-05-20');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `buf3w_session`
--

CREATE TABLE `buf3w_session` (
  `session_id` varbinary(192) NOT NULL,
  `client_id` tinyint(3) UNSIGNED DEFAULT NULL,
  `guest` tinyint(3) UNSIGNED DEFAULT 1,
  `time` int(11) NOT NULL DEFAULT 0,
  `data` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `userid` int(11) DEFAULT 0,
  `username` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `buf3w_session`
--

INSERT INTO `buf3w_session` (`session_id`, `client_id`, `guest`, `time`, `data`, `userid`, `username`) VALUES
(0x306b35726f6632683638376e3765366a3135637569617366396c, 0, 0, 1686044010, 'joomla|s:780:\"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjQ6e3M6Nzoic2Vzc2lvbiI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJjb3VudGVyIjtpOjg7czo1OiJ0aW1lciI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo1OiJzdGFydCI7aToxNjg2MDM4OTY1O3M6NDoibGFzdCI7aToxNjg2MDQzMTcwO3M6Mzoibm93IjtpOjE2ODYwNDQwMTA7fXM6NToidG9rZW4iO3M6MzI6IjZkZjE5NGY1OGVjYjIxMDY3NGY2ZjkyZDMzODcwYzhlIjt9czo4OiJyZWdpc3RyeSI7TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjA6e31zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6MTI6IgAqAHNlcGFyYXRvciI7czoxOiIuIjt9czo0OiJ1c2VyIjtPOjIwOiJKb29tbGFcQ01TXFVzZXJcVXNlciI6MTp7czoyOiJpZCI7aTo1ODg7fXM6OToiY29tX3VzZXJzIjtPOjg6InN0ZENsYXNzIjoxOntzOjExOiJtZmFfY2hlY2tlZCI7aToxO319czoxNDoiACoAaW5pdGlhbGl6ZWQiO2I6MDtzOjEyOiIAKgBzZXBhcmF0b3IiO3M6MToiLiI7fQ==\";', 588, 'Admin'),
(0x3633306f6e74736237376d6f3061336d386f76736a75396a7169, 1, 0, 1686044607, 'joomla|s:1036:\"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjU6e3M6Nzoic2Vzc2lvbiI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJjb3VudGVyIjtpOjY2O3M6NToidGltZXIiO086ODoic3RkQ2xhc3MiOjM6e3M6NToic3RhcnQiO2k6MTY4NjAzODc5NztzOjQ6Imxhc3QiO2k6MTY4NjA0Mzc2NztzOjM6Im5vdyI7aToxNjg2MDQ0NjA3O31zOjU6InRva2VuIjtzOjMyOiJlNzk3OGFkMGM3MDUwZTRmNjZhNDAyN2U0YTRkNzI2MiI7fXM6ODoicmVnaXN0cnkiO086MjQ6Ikpvb21sYVxSZWdpc3RyeVxSZWdpc3RyeSI6Mzp7czo3OiIAKgBkYXRhIjtPOjg6InN0ZENsYXNzIjoxOntzOjExOiJjb21fY29udGVudCI7Tzo4OiJzdGRDbGFzcyI6MTp7czo0OiJlZGl0IjtPOjg6InN0ZENsYXNzIjoxOntzOjc6ImFydGljbGUiO086ODoic3RkQ2xhc3MiOjI6e3M6NDoiZGF0YSI7TjtzOjI6ImlkIjthOjE6e2k6MDtpOjE7fX19fX1zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6MTI6IgAqAHNlcGFyYXRvciI7czoxOiIuIjt9czo0OiJ1c2VyIjtPOjIwOiJKb29tbGFcQ01TXFVzZXJcVXNlciI6MTp7czoyOiJpZCI7aTo1ODg7fXM6OToiY29tX3VzZXJzIjtPOjg6InN0ZENsYXNzIjoxOntzOjExOiJtZmFfY2hlY2tlZCI7aToxO31zOjExOiJhcHBsaWNhdGlvbiI7Tzo4OiJzdGRDbGFzcyI6MTp7czo1OiJxdWV1ZSI7YTowOnt9fX1zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6MTI6IgAqAHNlcGFyYXRvciI7czoxOiIuIjt9\";', 588, 'Admin'),
(0x6a696b6d39726b356171386539386e6939666b766c6c7231356a, 1, 0, 1686034637, 'joomla|s:2200:\"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjU6e3M6Nzoic2Vzc2lvbiI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJjb3VudGVyIjtpOjYyO3M6NToidGltZXIiO086ODoic3RkQ2xhc3MiOjM6e3M6NToic3RhcnQiO2k6MTY4NjAzMTAyNDtzOjQ6Imxhc3QiO2k6MTY4NjAzNDYzMjtzOjM6Im5vdyI7aToxNjg2MDM0NjM3O31zOjU6InRva2VuIjtzOjMyOiI0N2U5ZTM0YTc4YmZiYzlkNjk5NDVhY2RhMWU3MzAyZiI7fXM6ODoicmVnaXN0cnkiO086MjQ6Ikpvb21sYVxSZWdpc3RyeVxSZWdpc3RyeSI6Mzp7czo3OiIAKgBkYXRhIjtPOjg6InN0ZENsYXNzIjo0OntzOjExOiJjb21fY29udGVudCI7Tzo4OiJzdGRDbGFzcyI6MTp7czo0OiJlZGl0IjtPOjg6InN0ZENsYXNzIjoxOntzOjc6ImFydGljbGUiO086ODoic3RkQ2xhc3MiOjI6e3M6NDoiZGF0YSI7TjtzOjI6ImlkIjthOjE6e2k6MDtpOjE7fX19fXM6MTA6ImNvbV9maWVsZHMiO086ODoic3RkQ2xhc3MiOjI6e3M6NjoiZmllbGRzIjtPOjg6InN0ZENsYXNzIjoyOntzOjc6ImNvbnRleHQiO3M6MTk6ImNvbV9jb250ZW50LmFydGljbGUiO3M6NDoibGlzdCI7YTo0OntzOjk6ImRpcmVjdGlvbiI7czozOiJhc2MiO3M6NToibGltaXQiO2k6MjA7czo4OiJvcmRlcmluZyI7czoxMDoiYS5vcmRlcmluZyI7czo1OiJzdGFydCI7ZDowO319czo2OiJncm91cHMiO086ODoic3RkQ2xhc3MiOjE6e3M6NzoiY29udGV4dCI7czoxOToiY29tX2NvbnRlbnQuYXJ0aWNsZSI7fX1zOjk6ImNvbV9tZW51cyI7Tzo4OiJzdGRDbGFzcyI6MTp7czo1OiJpdGVtcyI7Tzo4OiJzdGRDbGFzcyI6MTp7czo1OiJtb2RhbCI7Tzo4OiJzdGRDbGFzcyI6Mjp7czo4OiJtZW51dHlwZSI7czowOiIiO3M6NDoibGlzdCI7YTo0OntzOjk6ImRpcmVjdGlvbiI7czozOiJhc2MiO3M6NToibGltaXQiO2k6MjA7czo4OiJvcmRlcmluZyI7czo1OiJhLmxmdCI7czo1OiJzdGFydCI7ZDowO319fX1zOjE0OiJjb21fY2F0ZWdvcmllcyI7Tzo4OiJzdGRDbGFzcyI6Mjp7czoxMDoiY2F0ZWdvcmllcyI7Tzo4OiJzdGRDbGFzcyI6MTp7czo3OiJjb250ZW50IjtPOjg6InN0ZENsYXNzIjoyOntzOjY6ImZpbHRlciI7Tzo4OiJzdGRDbGFzcyI6MTp7czo5OiJleHRlbnNpb24iO3M6MTE6ImNvbV9jb250ZW50Ijt9czo0OiJsaXN0IjthOjQ6e3M6OToiZGlyZWN0aW9uIjtzOjM6ImFzYyI7czo1OiJsaW1pdCI7aToyMDtzOjg6Im9yZGVyaW5nIjtzOjU6ImEubGZ0IjtzOjU6InN0YXJ0IjtkOjA7fX19czo0OiJlZGl0IjtPOjg6InN0ZENsYXNzIjoxOntzOjg6ImNhdGVnb3J5IjtPOjg6InN0ZENsYXNzIjoxOntzOjQ6ImRhdGEiO047fX19fXM6MTQ6IgAqAGluaXRpYWxpemVkIjtiOjA7czoxMjoiACoAc2VwYXJhdG9yIjtzOjE6Ii4iO31zOjQ6InVzZXIiO086MjA6Ikpvb21sYVxDTVNcVXNlclxVc2VyIjoxOntzOjI6ImlkIjtpOjU4ODt9czo5OiJjb21fdXNlcnMiO086ODoic3RkQ2xhc3MiOjE6e3M6MTE6Im1mYV9jaGVja2VkIjtpOjE7fXM6MTE6ImFwcGxpY2F0aW9uIjtPOjg6InN0ZENsYXNzIjoxOntzOjU6InF1ZXVlIjthOjA6e319fXM6MTQ6IgAqAGluaXRpYWxpemVkIjtiOjA7czoxMjoiACoAc2VwYXJhdG9yIjtzOjE6Ii4iO30=\";', 588, 'Admin'),
(0x6c666b707461667073346b6f34656e6d676a65336c626d6c6534, 1, 0, 1686124212, 'joomla|s:1340:\"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjU6e3M6Nzoic2Vzc2lvbiI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJjb3VudGVyIjtpOjYzO3M6NToidGltZXIiO086ODoic3RkQ2xhc3MiOjM6e3M6NToic3RhcnQiO2k6MTY4NjEyMjE1NDtzOjQ6Imxhc3QiO2k6MTY4NjEyNDIxMDtzOjM6Im5vdyI7aToxNjg2MTI0MjExO31zOjU6InRva2VuIjtzOjMyOiIyZmNiMDFkMjY3NzliYzg5YWExYTVhYWYzMTMxMmJiMSI7fXM6ODoicmVnaXN0cnkiO086MjQ6Ikpvb21sYVxSZWdpc3RyeVxSZWdpc3RyeSI6Mzp7czo3OiIAKgBkYXRhIjtPOjg6InN0ZENsYXNzIjozOntzOjExOiJjb21fY29udGVudCI7Tzo4OiJzdGRDbGFzcyI6MTp7czo0OiJlZGl0IjtPOjg6InN0ZENsYXNzIjoxOntzOjc6ImFydGljbGUiO086ODoic3RkQ2xhc3MiOjI6e3M6NDoiZGF0YSI7TjtzOjI6ImlkIjthOjA6e319fX1zOjE0OiJjb21fY2F0ZWdvcmllcyI7Tzo4OiJzdGRDbGFzcyI6MTp7czo0OiJlZGl0IjtPOjg6InN0ZENsYXNzIjoxOntzOjg6ImNhdGVnb3J5IjtPOjg6InN0ZENsYXNzIjoyOntzOjI6ImlkIjthOjE6e2k6MDtpOjI7fXM6NDoiZGF0YSI7Tjt9fX1zOjEzOiJjb21faW5zdGFsbGVyIjtPOjg6InN0ZENsYXNzIjoyOntzOjc6Im1lc3NhZ2UiO3M6MDoiIjtzOjE3OiJleHRlbnNpb25fbWVzc2FnZSI7czowOiIiO319czoxNDoiACoAaW5pdGlhbGl6ZWQiO2I6MDtzOjEyOiIAKgBzZXBhcmF0b3IiO3M6MToiLiI7fXM6NDoidXNlciI7TzoyMDoiSm9vbWxhXENNU1xVc2VyXFVzZXIiOjE6e3M6MjoiaWQiO2k6NTg4O31zOjk6ImNvbV91c2VycyI7Tzo4OiJzdGRDbGFzcyI6MTp7czoxMToibWZhX2NoZWNrZWQiO2k6MTt9czoxMToiYXBwbGljYXRpb24iO086ODoic3RkQ2xhc3MiOjE6e3M6NToicXVldWUiO2E6MDp7fX19czoxNDoiACoAaW5pdGlhbGl6ZWQiO2I6MDtzOjEyOiIAKgBzZXBhcmF0b3IiO3M6MToiLiI7fQ==\";', 588, 'Admin'),
(0x6f383061686771343933693639663664626734656c7173316933, 0, 0, 1686030994, 'joomla|s:1104:\"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjU6e3M6Nzoic2Vzc2lvbiI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo1OiJ0aW1lciI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo1OiJzdGFydCI7aToxNjg2MDMwOTc2O3M6NDoibGFzdCI7aToxNjg2MDMwOTkzO3M6Mzoibm93IjtpOjE2ODYwMzA5OTQ7fXM6NzoiY291bnRlciI7aTo2O3M6NToidG9rZW4iO3M6MzI6ImUzYjFiZTFlYWVmOGRkNmY1NWE4ZTA4ZTM0NjI4ZjY0Ijt9czoxMToiYXBwbGljYXRpb24iO086ODoic3RkQ2xhc3MiOjE6e3M6NToicXVldWUiO2E6MDp7fX1zOjg6InJlZ2lzdHJ5IjtPOjI0OiJKb29tbGFcUmVnaXN0cnlcUmVnaXN0cnkiOjM6e3M6NzoiACoAZGF0YSI7Tzo4OiJzdGRDbGFzcyI6Mjp7czo1OiJ1c2VycyI7Tzo4OiJzdGRDbGFzcyI6MTp7czo1OiJsb2dpbiI7Tzo4OiJzdGRDbGFzcyI6MTp7czo0OiJmb3JtIjtPOjg6InN0ZENsYXNzIjoyOntzOjY6InJldHVybiI7czozMzoiaHR0cDovL2xvY2FsaG9zdC9Qcm9qZWt0Sm9vbWxhS0svIjtzOjQ6ImRhdGEiO2E6MDp7fX19fXM6MTM6InJlbWVtYmVyTG9naW4iO2I6MTt9czoxNDoiACoAaW5pdGlhbGl6ZWQiO2I6MDtzOjEyOiIAKgBzZXBhcmF0b3IiO3M6MToiLiI7fXM6NDoidXNlciI7TzoyMDoiSm9vbWxhXENNU1xVc2VyXFVzZXIiOjE6e3M6MjoiaWQiO2k6NTg4O31zOjk6ImNvbV91c2VycyI7Tzo4OiJzdGRDbGFzcyI6MTp7czoxMToibWZhX2NoZWNrZWQiO2k6MTt9fXM6MTQ6IgAqAGluaXRpYWxpemVkIjtiOjA7czoxMjoiACoAc2VwYXJhdG9yIjtzOjE6Ii4iO30=\";', 588, 'Admin'),
(0x7137746c75666368673972717269396935356c736236646f6438, 0, 0, 1686123796, 'joomla|s:780:\"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjQ6e3M6Nzoic2Vzc2lvbiI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJjb3VudGVyIjtpOjM7czo1OiJ0aW1lciI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo1OiJzdGFydCI7aToxNjg2MTIyMTA4O3M6NDoibGFzdCI7aToxNjg2MTIyOTU2O3M6Mzoibm93IjtpOjE2ODYxMjM3OTY7fXM6NToidG9rZW4iO3M6MzI6ImUyYTk0NDUzZTlkMjJiZjZiMjVmYTM4NzY2ZDQxOTNhIjt9czo4OiJyZWdpc3RyeSI7TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjA6e31zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6MTI6IgAqAHNlcGFyYXRvciI7czoxOiIuIjt9czo0OiJ1c2VyIjtPOjIwOiJKb29tbGFcQ01TXFVzZXJcVXNlciI6MTp7czoyOiJpZCI7aTo1ODg7fXM6OToiY29tX3VzZXJzIjtPOjg6InN0ZENsYXNzIjoxOntzOjExOiJtZmFfY2hlY2tlZCI7aToxO319czoxNDoiACoAaW5pdGlhbGl6ZWQiO2I6MDtzOjEyOiIAKgBzZXBhcmF0b3IiO3M6MToiLiI7fQ==\";', 588, 'Admin');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `buf3w_tags`
--

CREATE TABLE `buf3w_tags` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `lft` int(11) NOT NULL DEFAULT 0,
  `rgt` int(11) NOT NULL DEFAULT 0,
  `level` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `path` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `published` tinyint(4) NOT NULL DEFAULT 0,
  `checked_out` int(10) UNSIGNED DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `access` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadesc` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The meta description for the page.',
  `metakey` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'The keywords for the page.',
  `metadata` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JSON encoded metadata properties.',
  `created_user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_time` datetime NOT NULL,
  `created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified_user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `modified_time` datetime NOT NULL,
  `images` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `urls` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `hits` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `buf3w_tags`
--

INSERT INTO `buf3w_tags` (`id`, `parent_id`, `lft`, `rgt`, `level`, `path`, `title`, `alias`, `note`, `description`, `published`, `checked_out`, `checked_out_time`, `access`, `params`, `metadesc`, `metakey`, `metadata`, `created_user_id`, `created_time`, `created_by_alias`, `modified_user_id`, `modified_time`, `images`, `urls`, `hits`, `language`, `version`, `publish_up`, `publish_down`) VALUES
(1, 0, 0, 1, 0, '', 'ROOT', 'root', '', '', 1, NULL, NULL, 1, '', '', '', '', 588, '2023-06-06 05:52:03', '', 588, '2023-06-06 05:52:03', '', '', 0, '*', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `buf3w_template_overrides`
--

CREATE TABLE `buf3w_template_overrides` (
  `id` int(10) UNSIGNED NOT NULL,
  `template` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `hash_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `extension_id` int(11) DEFAULT 0,
  `state` tinyint(4) NOT NULL DEFAULT 0,
  `action` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `client_id` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `created_date` datetime NOT NULL,
  `modified_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `buf3w_template_styles`
--

CREATE TABLE `buf3w_template_styles` (
  `id` int(10) UNSIGNED NOT NULL,
  `template` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `client_id` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `home` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `inheritable` tinyint(4) NOT NULL DEFAULT 0,
  `parent` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `buf3w_template_styles`
--

INSERT INTO `buf3w_template_styles` (`id`, `template`, `client_id`, `home`, `title`, `inheritable`, `parent`, `params`) VALUES
(10, 'atum', 1, '1', 'Atum - Default', 1, '', '{\"hue\":\"hsl(214, 63%, 20%)\",\"bg-light\":\"#f0f4fb\",\"text-dark\":\"#495057\",\"text-light\":\"#ffffff\",\"link-color\":\"#2a69b8\",\"special-color\":\"#001b4c\",\"monochrome\":\"0\",\"loginLogo\":\"\",\"loginLogoAlt\":\"\",\"logoBrandLarge\":\"\",\"logoBrandLargeAlt\":\"\",\"logoBrandSmall\":\"\",\"logoBrandSmallAlt\":\"\"}'),
(11, 'cassiopeia', 0, '1', 'Cassiopeia - Default', 1, '', '{\"brand\":\"1\",\"logoFile\":\"\",\"siteTitle\":\"\",\"siteDescription\":\"\",\"useFontScheme\":\"0\",\"colorName\":\"colors_standard\",\"fluidContainer\":\"0\",\"stickyHeader\":0,\"backTop\":0}');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `buf3w_ucm_base`
--

CREATE TABLE `buf3w_ucm_base` (
  `ucm_id` int(10) UNSIGNED NOT NULL,
  `ucm_item_id` int(11) NOT NULL,
  `ucm_type_id` int(11) NOT NULL,
  `ucm_language_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `buf3w_ucm_content`
--

CREATE TABLE `buf3w_ucm_content` (
  `core_content_id` int(10) UNSIGNED NOT NULL,
  `core_type_alias` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'FK to the content types table',
  `core_title` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `core_alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `core_body` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `core_state` tinyint(4) NOT NULL DEFAULT 0,
  `core_checked_out_time` datetime DEFAULT NULL,
  `core_checked_out_user_id` int(10) UNSIGNED DEFAULT NULL,
  `core_access` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `core_params` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `core_featured` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `core_metadata` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'JSON encoded metadata properties.',
  `core_created_user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `core_created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `core_created_time` datetime NOT NULL,
  `core_modified_user_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Most recent user that modified',
  `core_modified_time` datetime NOT NULL,
  `core_language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `core_publish_up` datetime DEFAULT NULL,
  `core_publish_down` datetime DEFAULT NULL,
  `core_content_item_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'ID from the individual type table',
  `asset_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'FK to the #__assets table.',
  `core_images` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `core_urls` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `core_hits` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `core_version` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `core_ordering` int(11) NOT NULL DEFAULT 0,
  `core_metakey` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `core_metadesc` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `core_catid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `core_type_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Contains core content data in name spaced fields';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `buf3w_updates`
--

CREATE TABLE `buf3w_updates` (
  `update_id` int(11) NOT NULL,
  `update_site_id` int(11) DEFAULT 0,
  `extension_id` int(11) DEFAULT 0,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `element` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `folder` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `client_id` tinyint(4) DEFAULT 0,
  `version` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `detailsurl` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `infourl` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `changelogurl` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extra_query` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Available Updates';

--
-- Zrzut danych tabeli `buf3w_updates`
--

INSERT INTO `buf3w_updates` (`update_id`, `update_site_id`, `extension_id`, `name`, `description`, `element`, `type`, `folder`, `client_id`, `version`, `data`, `detailsurl`, `infourl`, `changelogurl`, `extra_query`) VALUES
(105, 2, 0, 'Afrikaans', '', 'pkg_af-ZA', 'package', '', 0, '4.3.2.1', '', 'https://update.joomla.org/language/details4/af-ZA_details.xml', '', '', ''),
(106, 2, 0, 'Arabic Unitag', '', 'pkg_ar-AA', 'package', '', 0, '4.0.2.1', '', 'https://update.joomla.org/language/details4/ar-AA_details.xml', '', '', ''),
(107, 2, 0, 'Bulgarian', '', 'pkg_bg-BG', 'package', '', 0, '4.2.8.2', '', 'https://update.joomla.org/language/details4/bg-BG_details.xml', '', '', ''),
(108, 2, 0, 'Catalan', '', 'pkg_ca-ES', 'package', '', 0, '4.0.4.2', '', 'https://update.joomla.org/language/details4/ca-ES_details.xml', '', '', ''),
(109, 2, 0, 'Chinese, Simplified', '', 'pkg_zh-CN', 'package', '', 0, '4.3.0.2', '', 'https://update.joomla.org/language/details4/zh-CN_details.xml', '', '', ''),
(110, 2, 0, 'Chinese, Traditional', '', 'pkg_zh-TW', 'package', '', 0, '4.2.3.1', '', 'https://update.joomla.org/language/details4/zh-TW_details.xml', '', '', ''),
(111, 2, 0, 'Croatian', '', 'pkg_hr-HR', 'package', '', 0, '4.3.1.1', '', 'https://update.joomla.org/language/details4/hr-HR_details.xml', '', '', ''),
(112, 2, 0, 'Czech', '', 'pkg_cs-CZ', 'package', '', 0, '4.3.1.1', '', 'https://update.joomla.org/language/details4/cs-CZ_details.xml', '', '', ''),
(113, 2, 0, 'Danish', '', 'pkg_da-DK', 'package', '', 0, '4.3.2.1', '', 'https://update.joomla.org/language/details4/da-DK_details.xml', '', '', ''),
(114, 2, 0, 'Dutch', '', 'pkg_nl-NL', 'package', '', 0, '4.3.2.1', '', 'https://update.joomla.org/language/details4/nl-NL_details.xml', '', '', ''),
(115, 2, 0, 'English, Australia', '', 'pkg_en-AU', 'package', '', 0, '4.3.1.1', '', 'https://update.joomla.org/language/details4/en-AU_details.xml', '', '', ''),
(116, 2, 0, 'English, Canada', '', 'pkg_en-CA', 'package', '', 0, '4.3.1.1', '', 'https://update.joomla.org/language/details4/en-CA_details.xml', '', '', ''),
(117, 2, 0, 'English, New Zealand', '', 'pkg_en-NZ', 'package', '', 0, '4.3.1.1', '', 'https://update.joomla.org/language/details4/en-NZ_details.xml', '', '', ''),
(118, 2, 0, 'English, USA', '', 'pkg_en-US', 'package', '', 0, '4.3.1.1', '', 'https://update.joomla.org/language/details4/en-US_details.xml', '', '', ''),
(119, 2, 0, 'Estonian', '', 'pkg_et-EE', 'package', '', 0, '4.3.0.1', '', 'https://update.joomla.org/language/details4/et-EE_details.xml', '', '', ''),
(120, 2, 0, 'Finnish', '', 'pkg_fi-FI', 'package', '', 0, '4.1.1.2', '', 'https://update.joomla.org/language/details4/fi-FI_details.xml', '', '', ''),
(121, 2, 0, 'Flemish', '', 'pkg_nl-BE', 'package', '', 0, '4.3.2.1', '', 'https://update.joomla.org/language/details4/nl-BE_details.xml', '', '', ''),
(122, 2, 0, 'French', '', 'pkg_fr-FR', 'package', '', 0, '4.3.2.1', '', 'https://update.joomla.org/language/details4/fr-FR_details.xml', '', '', ''),
(123, 2, 0, 'Georgian', '', 'pkg_ka-GE', 'package', '', 0, '4.3.2.1', '', 'https://update.joomla.org/language/details4/ka-GE_details.xml', '', '', ''),
(124, 2, 0, 'German', '', 'pkg_de-DE', 'package', '', 0, '4.3.2.1', '', 'https://update.joomla.org/language/details4/de-DE_details.xml', '', '', ''),
(125, 2, 0, 'German, Austria', '', 'pkg_de-AT', 'package', '', 0, '4.3.2.1', '', 'https://update.joomla.org/language/details4/de-AT_details.xml', '', '', ''),
(126, 2, 0, 'German, Liechtenstein', '', 'pkg_de-LI', 'package', '', 0, '4.3.2.1', '', 'https://update.joomla.org/language/details4/de-LI_details.xml', '', '', ''),
(127, 2, 0, 'German, Luxembourg', '', 'pkg_de-LU', 'package', '', 0, '4.3.2.1', '', 'https://update.joomla.org/language/details4/de-LU_details.xml', '', '', ''),
(128, 2, 0, 'German, Switzerland', '', 'pkg_de-CH', 'package', '', 0, '4.3.2.1', '', 'https://update.joomla.org/language/details4/de-CH_details.xml', '', '', ''),
(129, 2, 0, 'Greek', '', 'pkg_el-GR', 'package', '', 0, '4.3.2.1', '', 'https://update.joomla.org/language/details4/el-GR_details.xml', '', '', ''),
(130, 2, 0, 'Hungarian', '', 'pkg_hu-HU', 'package', '', 0, '4.3.2.1', '', 'https://update.joomla.org/language/details4/hu-HU_details.xml', '', '', ''),
(131, 2, 0, 'Irish', '', 'pkg_ga-IE', 'package', '', 0, '4.2.8.1', '', 'https://update.joomla.org/language/details4/ga-IE_details.xml', '', '', ''),
(132, 2, 0, 'Italian', '', 'pkg_it-IT', 'package', '', 0, '4.3.2.1', '', 'https://update.joomla.org/language/details4/it-IT_details.xml', '', '', ''),
(133, 2, 0, 'Japanese', '', 'pkg_ja-JP', 'package', '', 0, '4.3.2.1', '', 'https://update.joomla.org/language/details4/ja-JP_details.xml', '', '', ''),
(134, 2, 0, 'Kazakh', '', 'pkg_kk-KZ', 'package', '', 0, '4.1.2.1', '', 'https://update.joomla.org/language/details4/kk-KZ_details.xml', '', '', ''),
(135, 2, 0, 'Latvian', '', 'pkg_lv-LV', 'package', '', 0, '4.3.1.1', '', 'https://update.joomla.org/language/details4/lv-LV_details.xml', '', '', ''),
(136, 2, 0, 'Lithuanian', '', 'pkg_lt-LT', 'package', '', 0, '4.2.9.1', '', 'https://update.joomla.org/language/details4/lt-LT_details.xml', '', '', ''),
(137, 2, 0, 'Macedonian', '', 'pkg_mk-MK', 'package', '', 0, '4.2.4.1', '', 'https://update.joomla.org/language/details4/mk-MK_details.xml', '', '', ''),
(138, 2, 0, 'Norwegian Bokmål', '', 'pkg_nb-NO', 'package', '', 0, '4.0.1.1', '', 'https://update.joomla.org/language/details4/nb-NO_details.xml', '', '', ''),
(139, 2, 0, 'Persian Farsi', '', 'pkg_fa-IR', 'package', '', 0, '4.3.2.1', '', 'https://update.joomla.org/language/details4/fa-IR_details.xml', '', '', ''),
(140, 2, 0, 'Polish', '', 'pkg_pl-PL', 'package', '', 0, '4.2.8.2', '', 'https://update.joomla.org/language/details4/pl-PL_details.xml', '', '', ''),
(141, 2, 0, 'Portuguese, Brazil', '', 'pkg_pt-BR', 'package', '', 0, '4.0.3.1', '', 'https://update.joomla.org/language/details4/pt-BR_details.xml', '', '', ''),
(142, 2, 0, 'Portuguese, Portugal', '', 'pkg_pt-PT', 'package', '', 0, '4.0.0-rc4.2', '', 'https://update.joomla.org/language/details4/pt-PT_details.xml', '', '', ''),
(143, 2, 0, 'Romanian', '', 'pkg_ro-RO', 'package', '', 0, '4.3.1.1', '', 'https://update.joomla.org/language/details4/ro-RO_details.xml', '', '', ''),
(144, 2, 0, 'Russian', '', 'pkg_ru-RU', 'package', '', 0, '4.3.2.1', '', 'https://update.joomla.org/language/details4/ru-RU_details.xml', '', '', ''),
(145, 2, 0, 'Serbian, Cyrillic', '', 'pkg_sr-RS', 'package', '', 0, '4.3.2.1', '', 'https://update.joomla.org/language/details4/sr-RS_details.xml', '', '', ''),
(146, 2, 0, 'Serbian, Latin', '', 'pkg_sr-YU', 'package', '', 0, '4.3.2.2', '', 'https://update.joomla.org/language/details4/sr-YU_details.xml', '', '', ''),
(147, 2, 0, 'Slovak', '', 'pkg_sk-SK', 'package', '', 0, '4.3.0.1', '', 'https://update.joomla.org/language/details4/sk-SK_details.xml', '', '', ''),
(148, 2, 0, 'Slovenian', '', 'pkg_sl-SI', 'package', '', 0, '4.3.2.1', '', 'https://update.joomla.org/language/details4/sl-SI_details.xml', '', '', ''),
(149, 2, 0, 'Spanish', '', 'pkg_es-ES', 'package', '', 0, '4.2.3.1', '', 'https://update.joomla.org/language/details4/es-ES_details.xml', '', '', ''),
(150, 2, 0, 'Swedish', '', 'pkg_sv-SE', 'package', '', 0, '4.3.2.2', '', 'https://update.joomla.org/language/details4/sv-SE_details.xml', '', '', ''),
(151, 2, 0, 'Tamil, India', '', 'pkg_ta-IN', 'package', '', 0, '4.3.2.1', '', 'https://update.joomla.org/language/details4/ta-IN_details.xml', '', '', ''),
(152, 2, 0, 'Thai', '', 'pkg_th-TH', 'package', '', 0, '4.3.2.1', '', 'https://update.joomla.org/language/details4/th-TH_details.xml', '', '', ''),
(153, 2, 0, 'Turkish', '', 'pkg_tr-TR', 'package', '', 0, '4.3.2.1', '', 'https://update.joomla.org/language/details4/tr-TR_details.xml', '', '', ''),
(154, 2, 0, 'Ukrainian', '', 'pkg_uk-UA', 'package', '', 0, '4.3.2.1', '', 'https://update.joomla.org/language/details4/uk-UA_details.xml', '', '', ''),
(155, 2, 0, 'Vietnamese', '', 'pkg_vi-VN', 'package', '', 0, '4.2.2.1', '', 'https://update.joomla.org/language/details4/vi-VN_details.xml', '', '', ''),
(156, 2, 0, 'Welsh', '', 'pkg_cy-GB', 'package', '', 0, '4.3.2.1', '', 'https://update.joomla.org/language/details4/cy-GB_details.xml', '', '', '');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `buf3w_update_sites`
--

CREATE TABLE `buf3w_update_sites` (
  `update_site_id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `location` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` int(11) DEFAULT 0,
  `last_check_timestamp` bigint(20) DEFAULT 0,
  `extra_query` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `checked_out` int(10) UNSIGNED DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Update Sites';

--
-- Zrzut danych tabeli `buf3w_update_sites`
--

INSERT INTO `buf3w_update_sites` (`update_site_id`, `name`, `type`, `location`, `enabled`, `last_check_timestamp`, `extra_query`, `checked_out`, `checked_out_time`) VALUES
(1, 'Joomla! Core', 'collection', 'https://update.joomla.org/core/list.xml', 1, 1686122113, '', NULL, NULL),
(2, 'Accredited Joomla! Translations', 'collection', 'https://update.joomla.org/language/translationlist_4.xml', 1, 1686122228, '', NULL, NULL),
(3, 'Joomla! Update Component', 'extension', 'https://update.joomla.org/core/extensions/com_joomlaupdate.xml', 1, 1686122229, '', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `buf3w_update_sites_extensions`
--

CREATE TABLE `buf3w_update_sites_extensions` (
  `update_site_id` int(11) NOT NULL DEFAULT 0,
  `extension_id` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Links extensions to update sites';

--
-- Zrzut danych tabeli `buf3w_update_sites_extensions`
--

INSERT INTO `buf3w_update_sites_extensions` (`update_site_id`, `extension_id`) VALUES
(1, 227),
(2, 228),
(3, 24);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `buf3w_usergroups`
--

CREATE TABLE `buf3w_usergroups` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'Primary Key',
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Adjacency List Reference Id',
  `lft` int(11) NOT NULL DEFAULT 0 COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT 0 COMMENT 'Nested set rgt.',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `buf3w_usergroups`
--

INSERT INTO `buf3w_usergroups` (`id`, `parent_id`, `lft`, `rgt`, `title`) VALUES
(1, 0, 1, 18, 'Public'),
(2, 1, 8, 15, 'Registered'),
(3, 2, 9, 14, 'Author'),
(4, 3, 10, 13, 'Editor'),
(5, 4, 11, 12, 'Publisher'),
(6, 1, 4, 7, 'Manager'),
(7, 6, 5, 6, 'Administrator'),
(8, 1, 16, 17, 'Super Users'),
(9, 1, 2, 3, 'Guest');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `buf3w_users`
--

CREATE TABLE `buf3w_users` (
  `id` int(11) NOT NULL,
  `name` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `username` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `block` tinyint(4) NOT NULL DEFAULT 0,
  `sendEmail` tinyint(4) DEFAULT 0,
  `registerDate` datetime NOT NULL,
  `lastvisitDate` datetime DEFAULT NULL,
  `activation` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastResetTime` datetime DEFAULT NULL COMMENT 'Date of last password reset',
  `resetCount` int(11) NOT NULL DEFAULT 0 COMMENT 'Count of password resets since lastResetTime',
  `otpKey` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Two factor authentication encrypted keys',
  `otep` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Backup Codes',
  `requireReset` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'Require user to reset password on next login',
  `authProvider` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Name of used authentication plugin'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `buf3w_users`
--

INSERT INTO `buf3w_users` (`id`, `name`, `username`, `email`, `password`, `block`, `sendEmail`, `registerDate`, `lastvisitDate`, `activation`, `params`, `lastResetTime`, `resetCount`, `otpKey`, `otep`, `requireReset`, `authProvider`) VALUES
(588, 'Kacper', 'Admin', 'example@example.example', '$2y$10$xCUHT8xmIsGBq1Mp7lEqDeWQdDURi3oL52SQIVKpXSfgoV4rYs34O', 0, 1, '2023-06-06 05:52:07', '2023-06-07 07:17:05', '0', '', NULL, 0, '', '', 0, '');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `buf3w_user_keys`
--

CREATE TABLE `buf3w_user_keys` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `series` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uastring` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `buf3w_user_keys`
--

INSERT INTO `buf3w_user_keys` (`id`, `user_id`, `token`, `series`, `time`, `uastring`) VALUES
(1, 'Admin', '$2y$10$r1MdiGxyfl4jlhatu4TCV.8.e6K4edJ6MOQgKYdy/MqRQdchdTSaO', 'uZlv7S2fu53tZgBIBzY0', '1691214989', 'joomla_remember_me_f49f022310e1bbca744a66c8de53c8d3');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `buf3w_user_mfa`
--

CREATE TABLE `buf3w_user_mfa` (
  `id` int(11) NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `method` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `default` tinyint(4) NOT NULL DEFAULT 0,
  `options` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_on` datetime NOT NULL,
  `last_used` datetime DEFAULT NULL,
  `tries` int(11) NOT NULL DEFAULT 0,
  `last_try` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Multi-factor Authentication settings';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `buf3w_user_notes`
--

CREATE TABLE `buf3w_user_notes` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `catid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `subject` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` tinyint(4) NOT NULL DEFAULT 0,
  `checked_out` int(10) UNSIGNED DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `created_user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_time` datetime NOT NULL,
  `modified_user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `modified_time` datetime NOT NULL,
  `review_time` datetime DEFAULT NULL,
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `buf3w_user_profiles`
--

CREATE TABLE `buf3w_user_profiles` (
  `user_id` int(11) NOT NULL,
  `profile_key` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `profile_value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Simple user profile storage table';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `buf3w_user_usergroup_map`
--

CREATE TABLE `buf3w_user_usergroup_map` (
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Foreign Key to #__users.id',
  `group_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Foreign Key to #__usergroups.id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `buf3w_user_usergroup_map`
--

INSERT INTO `buf3w_user_usergroup_map` (`user_id`, `group_id`) VALUES
(588, 8);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `buf3w_viewlevels`
--

CREATE TABLE `buf3w_viewlevels` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'Primary Key',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ordering` int(11) NOT NULL DEFAULT 0,
  `rules` varchar(5120) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JSON encoded access control.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `buf3w_viewlevels`
--

INSERT INTO `buf3w_viewlevels` (`id`, `title`, `ordering`, `rules`) VALUES
(1, 'Public', 0, '[1]'),
(2, 'Registered', 2, '[6,2,8]'),
(3, 'Special', 3, '[6,3,8]'),
(5, 'Guest', 1, '[9]'),
(6, 'Super Users', 4, '[8]');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `buf3w_webauthn_credentials`
--

CREATE TABLE `buf3w_webauthn_credentials` (
  `id` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Credential ID',
  `user_id` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'User handle',
  `label` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Human readable label',
  `credential` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Credential source data, JSON format'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `buf3w_workflows`
--

CREATE TABLE `buf3w_workflows` (
  `id` int(11) NOT NULL,
  `asset_id` int(11) DEFAULT 0,
  `published` tinyint(4) NOT NULL DEFAULT 0,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `extension` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `default` tinyint(4) NOT NULL DEFAULT 0,
  `ordering` int(11) NOT NULL DEFAULT 0,
  `created` datetime NOT NULL,
  `created_by` int(11) NOT NULL DEFAULT 0,
  `modified` datetime NOT NULL,
  `modified_by` int(11) NOT NULL DEFAULT 0,
  `checked_out_time` datetime DEFAULT NULL,
  `checked_out` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `buf3w_workflows`
--

INSERT INTO `buf3w_workflows` (`id`, `asset_id`, `published`, `title`, `description`, `extension`, `default`, `ordering`, `created`, `created_by`, `modified`, `modified_by`, `checked_out_time`, `checked_out`) VALUES
(1, 56, 1, 'COM_WORKFLOW_BASIC_WORKFLOW', '', 'com_content.article', 1, 1, '2023-06-06 05:52:04', 588, '2023-06-06 05:52:04', 588, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `buf3w_workflow_associations`
--

CREATE TABLE `buf3w_workflow_associations` (
  `item_id` int(11) NOT NULL DEFAULT 0 COMMENT 'Extension table id value',
  `stage_id` int(11) NOT NULL COMMENT 'Foreign Key to #__workflow_stages.id',
  `extension` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `buf3w_workflow_associations`
--

INSERT INTO `buf3w_workflow_associations` (`item_id`, `stage_id`, `extension`) VALUES
(1, 1, 'com_content.article'),
(2, 1, 'com_content.article'),
(3, 1, 'com_content.article'),
(4, 1, 'com_content.article'),
(5, 1, 'com_content.article'),
(6, 1, 'com_content.article');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `buf3w_workflow_stages`
--

CREATE TABLE `buf3w_workflow_stages` (
  `id` int(11) NOT NULL,
  `asset_id` int(11) DEFAULT 0,
  `ordering` int(11) NOT NULL DEFAULT 0,
  `workflow_id` int(11) NOT NULL,
  `published` tinyint(4) NOT NULL DEFAULT 0,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `default` tinyint(4) NOT NULL DEFAULT 0,
  `checked_out_time` datetime DEFAULT NULL,
  `checked_out` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `buf3w_workflow_stages`
--

INSERT INTO `buf3w_workflow_stages` (`id`, `asset_id`, `ordering`, `workflow_id`, `published`, `title`, `description`, `default`, `checked_out_time`, `checked_out`) VALUES
(1, 57, 1, 1, 1, 'COM_WORKFLOW_BASIC_STAGE', '', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `buf3w_workflow_transitions`
--

CREATE TABLE `buf3w_workflow_transitions` (
  `id` int(11) NOT NULL,
  `asset_id` int(11) DEFAULT 0,
  `ordering` int(11) NOT NULL DEFAULT 0,
  `workflow_id` int(11) NOT NULL,
  `published` tinyint(4) NOT NULL DEFAULT 0,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_stage_id` int(11) NOT NULL,
  `to_stage_id` int(11) NOT NULL,
  `options` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `checked_out` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `buf3w_workflow_transitions`
--

INSERT INTO `buf3w_workflow_transitions` (`id`, `asset_id`, `ordering`, `workflow_id`, `published`, `title`, `description`, `from_stage_id`, `to_stage_id`, `options`, `checked_out_time`, `checked_out`) VALUES
(1, 58, 1, 1, 1, 'UNPUBLISH', '', -1, 1, '{\"publishing\":\"0\"}', NULL, NULL),
(2, 59, 2, 1, 1, 'PUBLISH', '', -1, 1, '{\"publishing\":\"1\"}', NULL, NULL),
(3, 60, 3, 1, 1, 'TRASH', '', -1, 1, '{\"publishing\":\"-2\"}', NULL, NULL),
(4, 61, 4, 1, 1, 'ARCHIVE', '', -1, 1, '{\"publishing\":\"2\"}', NULL, NULL),
(5, 62, 5, 1, 1, 'FEATURE', '', -1, 1, '{\"featuring\":\"1\"}', NULL, NULL),
(6, 63, 6, 1, 1, 'UNFEATURE', '', -1, 1, '{\"featuring\":\"0\"}', NULL, NULL),
(7, 64, 7, 1, 1, 'PUBLISH_AND_FEATURE', '', -1, 1, '{\"publishing\":\"1\",\"featuring\":\"1\"}', NULL, NULL);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `buf3w_action_logs`
--
ALTER TABLE `buf3w_action_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_user_id` (`user_id`),
  ADD KEY `idx_user_id_logdate` (`user_id`,`log_date`),
  ADD KEY `idx_user_id_extension` (`user_id`,`extension`),
  ADD KEY `idx_extension_item_id` (`extension`,`item_id`);

--
-- Indeksy dla tabeli `buf3w_action_logs_extensions`
--
ALTER TABLE `buf3w_action_logs_extensions`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `buf3w_action_logs_users`
--
ALTER TABLE `buf3w_action_logs_users`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `idx_notify` (`notify`);

--
-- Indeksy dla tabeli `buf3w_action_log_config`
--
ALTER TABLE `buf3w_action_log_config`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `buf3w_assets`
--
ALTER TABLE `buf3w_assets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_asset_name` (`name`),
  ADD KEY `idx_lft_rgt` (`lft`,`rgt`),
  ADD KEY `idx_parent_id` (`parent_id`);

--
-- Indeksy dla tabeli `buf3w_associations`
--
ALTER TABLE `buf3w_associations`
  ADD PRIMARY KEY (`context`,`id`),
  ADD KEY `idx_key` (`key`);

--
-- Indeksy dla tabeli `buf3w_banners`
--
ALTER TABLE `buf3w_banners`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_state` (`state`),
  ADD KEY `idx_own_prefix` (`own_prefix`),
  ADD KEY `idx_metakey_prefix` (`metakey_prefix`(100)),
  ADD KEY `idx_banner_catid` (`catid`),
  ADD KEY `idx_language` (`language`);

--
-- Indeksy dla tabeli `buf3w_banner_clients`
--
ALTER TABLE `buf3w_banner_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_own_prefix` (`own_prefix`),
  ADD KEY `idx_metakey_prefix` (`metakey_prefix`(100));

--
-- Indeksy dla tabeli `buf3w_banner_tracks`
--
ALTER TABLE `buf3w_banner_tracks`
  ADD PRIMARY KEY (`track_date`,`track_type`,`banner_id`),
  ADD KEY `idx_track_date` (`track_date`),
  ADD KEY `idx_track_type` (`track_type`),
  ADD KEY `idx_banner_id` (`banner_id`);

--
-- Indeksy dla tabeli `buf3w_categories`
--
ALTER TABLE `buf3w_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cat_idx` (`extension`,`published`,`access`),
  ADD KEY `idx_access` (`access`),
  ADD KEY `idx_checkout` (`checked_out`),
  ADD KEY `idx_path` (`path`(100)),
  ADD KEY `idx_left_right` (`lft`,`rgt`),
  ADD KEY `idx_alias` (`alias`(100)),
  ADD KEY `idx_language` (`language`);

--
-- Indeksy dla tabeli `buf3w_contact_details`
--
ALTER TABLE `buf3w_contact_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_access` (`access`),
  ADD KEY `idx_checkout` (`checked_out`),
  ADD KEY `idx_state` (`published`),
  ADD KEY `idx_catid` (`catid`),
  ADD KEY `idx_createdby` (`created_by`),
  ADD KEY `idx_featured_catid` (`featured`,`catid`),
  ADD KEY `idx_language` (`language`);

--
-- Indeksy dla tabeli `buf3w_content`
--
ALTER TABLE `buf3w_content`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_access` (`access`),
  ADD KEY `idx_checkout` (`checked_out`),
  ADD KEY `idx_state` (`state`),
  ADD KEY `idx_catid` (`catid`),
  ADD KEY `idx_createdby` (`created_by`),
  ADD KEY `idx_featured_catid` (`featured`,`catid`),
  ADD KEY `idx_language` (`language`),
  ADD KEY `idx_alias` (`alias`(191));

--
-- Indeksy dla tabeli `buf3w_contentitem_tag_map`
--
ALTER TABLE `buf3w_contentitem_tag_map`
  ADD UNIQUE KEY `uc_ItemnameTagid` (`type_id`,`content_item_id`,`tag_id`),
  ADD KEY `idx_tag_type` (`tag_id`,`type_id`),
  ADD KEY `idx_date_id` (`tag_date`,`tag_id`),
  ADD KEY `idx_core_content_id` (`core_content_id`);

--
-- Indeksy dla tabeli `buf3w_content_frontpage`
--
ALTER TABLE `buf3w_content_frontpage`
  ADD PRIMARY KEY (`content_id`);

--
-- Indeksy dla tabeli `buf3w_content_rating`
--
ALTER TABLE `buf3w_content_rating`
  ADD PRIMARY KEY (`content_id`);

--
-- Indeksy dla tabeli `buf3w_content_types`
--
ALTER TABLE `buf3w_content_types`
  ADD PRIMARY KEY (`type_id`),
  ADD KEY `idx_alias` (`type_alias`(100));

--
-- Indeksy dla tabeli `buf3w_extensions`
--
ALTER TABLE `buf3w_extensions`
  ADD PRIMARY KEY (`extension_id`),
  ADD KEY `element_clientid` (`element`,`client_id`),
  ADD KEY `element_folder_clientid` (`element`,`folder`,`client_id`),
  ADD KEY `extension` (`type`,`element`,`folder`,`client_id`);

--
-- Indeksy dla tabeli `buf3w_fields`
--
ALTER TABLE `buf3w_fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_checkout` (`checked_out`),
  ADD KEY `idx_state` (`state`),
  ADD KEY `idx_created_user_id` (`created_user_id`),
  ADD KEY `idx_access` (`access`),
  ADD KEY `idx_context` (`context`(191)),
  ADD KEY `idx_language` (`language`);

--
-- Indeksy dla tabeli `buf3w_fields_categories`
--
ALTER TABLE `buf3w_fields_categories`
  ADD PRIMARY KEY (`field_id`,`category_id`);

--
-- Indeksy dla tabeli `buf3w_fields_groups`
--
ALTER TABLE `buf3w_fields_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_checkout` (`checked_out`),
  ADD KEY `idx_state` (`state`),
  ADD KEY `idx_created_by` (`created_by`),
  ADD KEY `idx_access` (`access`),
  ADD KEY `idx_context` (`context`(191)),
  ADD KEY `idx_language` (`language`);

--
-- Indeksy dla tabeli `buf3w_fields_values`
--
ALTER TABLE `buf3w_fields_values`
  ADD KEY `idx_field_id` (`field_id`),
  ADD KEY `idx_item_id` (`item_id`(191));

--
-- Indeksy dla tabeli `buf3w_finder_filters`
--
ALTER TABLE `buf3w_finder_filters`
  ADD PRIMARY KEY (`filter_id`);

--
-- Indeksy dla tabeli `buf3w_finder_links`
--
ALTER TABLE `buf3w_finder_links`
  ADD PRIMARY KEY (`link_id`),
  ADD KEY `idx_type` (`type_id`),
  ADD KEY `idx_title` (`title`(100)),
  ADD KEY `idx_md5` (`md5sum`),
  ADD KEY `idx_url` (`url`(75)),
  ADD KEY `idx_language` (`language`),
  ADD KEY `idx_published_list` (`published`,`state`,`access`,`publish_start_date`,`publish_end_date`,`list_price`),
  ADD KEY `idx_published_sale` (`published`,`state`,`access`,`publish_start_date`,`publish_end_date`,`sale_price`);

--
-- Indeksy dla tabeli `buf3w_finder_links_terms`
--
ALTER TABLE `buf3w_finder_links_terms`
  ADD PRIMARY KEY (`link_id`,`term_id`),
  ADD KEY `idx_term_weight` (`term_id`,`weight`),
  ADD KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`);

--
-- Indeksy dla tabeli `buf3w_finder_logging`
--
ALTER TABLE `buf3w_finder_logging`
  ADD PRIMARY KEY (`md5sum`),
  ADD KEY `searchterm` (`searchterm`(191));

--
-- Indeksy dla tabeli `buf3w_finder_taxonomy`
--
ALTER TABLE `buf3w_finder_taxonomy`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_state` (`state`),
  ADD KEY `idx_access` (`access`),
  ADD KEY `idx_path` (`path`(100)),
  ADD KEY `idx_level` (`level`),
  ADD KEY `idx_left_right` (`lft`,`rgt`),
  ADD KEY `idx_alias` (`alias`(100)),
  ADD KEY `idx_language` (`language`),
  ADD KEY `idx_parent_published` (`parent_id`,`state`,`access`);

--
-- Indeksy dla tabeli `buf3w_finder_taxonomy_map`
--
ALTER TABLE `buf3w_finder_taxonomy_map`
  ADD PRIMARY KEY (`link_id`,`node_id`),
  ADD KEY `link_id` (`link_id`),
  ADD KEY `node_id` (`node_id`);

--
-- Indeksy dla tabeli `buf3w_finder_terms`
--
ALTER TABLE `buf3w_finder_terms`
  ADD PRIMARY KEY (`term_id`),
  ADD UNIQUE KEY `idx_term_language` (`term`,`language`),
  ADD KEY `idx_stem` (`stem`),
  ADD KEY `idx_term_phrase` (`term`,`phrase`),
  ADD KEY `idx_stem_phrase` (`stem`,`phrase`),
  ADD KEY `idx_soundex_phrase` (`soundex`,`phrase`),
  ADD KEY `idx_language` (`language`);

--
-- Indeksy dla tabeli `buf3w_finder_terms_common`
--
ALTER TABLE `buf3w_finder_terms_common`
  ADD UNIQUE KEY `idx_term_language` (`term`,`language`),
  ADD KEY `idx_lang` (`language`);

--
-- Indeksy dla tabeli `buf3w_finder_tokens`
--
ALTER TABLE `buf3w_finder_tokens`
  ADD KEY `idx_word` (`term`),
  ADD KEY `idx_stem` (`stem`),
  ADD KEY `idx_context` (`context`),
  ADD KEY `idx_language` (`language`);

--
-- Indeksy dla tabeli `buf3w_finder_tokens_aggregate`
--
ALTER TABLE `buf3w_finder_tokens_aggregate`
  ADD KEY `token` (`term`),
  ADD KEY `keyword_id` (`term_id`);

--
-- Indeksy dla tabeli `buf3w_finder_types`
--
ALTER TABLE `buf3w_finder_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `title` (`title`);

--
-- Indeksy dla tabeli `buf3w_guidedtours`
--
ALTER TABLE `buf3w_guidedtours`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_access` (`access`),
  ADD KEY `idx_state` (`published`),
  ADD KEY `idx_language` (`language`);

--
-- Indeksy dla tabeli `buf3w_guidedtour_steps`
--
ALTER TABLE `buf3w_guidedtour_steps`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_tour` (`tour_id`),
  ADD KEY `idx_state` (`published`),
  ADD KEY `idx_language` (`language`);

--
-- Indeksy dla tabeli `buf3w_history`
--
ALTER TABLE `buf3w_history`
  ADD PRIMARY KEY (`version_id`),
  ADD KEY `idx_ucm_item_id` (`item_id`),
  ADD KEY `idx_save_date` (`save_date`);

--
-- Indeksy dla tabeli `buf3w_languages`
--
ALTER TABLE `buf3w_languages`
  ADD PRIMARY KEY (`lang_id`),
  ADD UNIQUE KEY `idx_sef` (`sef`),
  ADD UNIQUE KEY `idx_langcode` (`lang_code`),
  ADD KEY `idx_access` (`access`),
  ADD KEY `idx_ordering` (`ordering`);

--
-- Indeksy dla tabeli `buf3w_mail_templates`
--
ALTER TABLE `buf3w_mail_templates`
  ADD PRIMARY KEY (`template_id`,`language`);

--
-- Indeksy dla tabeli `buf3w_menu`
--
ALTER TABLE `buf3w_menu`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_client_id_parent_id_alias_language` (`client_id`,`parent_id`,`alias`(100),`language`),
  ADD KEY `idx_componentid` (`component_id`,`menutype`,`published`,`access`),
  ADD KEY `idx_menutype` (`menutype`),
  ADD KEY `idx_left_right` (`lft`,`rgt`),
  ADD KEY `idx_alias` (`alias`(100)),
  ADD KEY `idx_path` (`path`(100)),
  ADD KEY `idx_language` (`language`);

--
-- Indeksy dla tabeli `buf3w_menu_types`
--
ALTER TABLE `buf3w_menu_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_menutype` (`menutype`);

--
-- Indeksy dla tabeli `buf3w_messages`
--
ALTER TABLE `buf3w_messages`
  ADD PRIMARY KEY (`message_id`),
  ADD KEY `useridto_state` (`user_id_to`,`state`);

--
-- Indeksy dla tabeli `buf3w_messages_cfg`
--
ALTER TABLE `buf3w_messages_cfg`
  ADD UNIQUE KEY `idx_user_var_name` (`user_id`,`cfg_name`);

--
-- Indeksy dla tabeli `buf3w_modules`
--
ALTER TABLE `buf3w_modules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `published` (`published`,`access`),
  ADD KEY `newsfeeds` (`module`,`published`),
  ADD KEY `idx_language` (`language`);

--
-- Indeksy dla tabeli `buf3w_modules_menu`
--
ALTER TABLE `buf3w_modules_menu`
  ADD PRIMARY KEY (`moduleid`,`menuid`);

--
-- Indeksy dla tabeli `buf3w_newsfeeds`
--
ALTER TABLE `buf3w_newsfeeds`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_access` (`access`),
  ADD KEY `idx_checkout` (`checked_out`),
  ADD KEY `idx_state` (`published`),
  ADD KEY `idx_catid` (`catid`),
  ADD KEY `idx_createdby` (`created_by`),
  ADD KEY `idx_language` (`language`);

--
-- Indeksy dla tabeli `buf3w_overrider`
--
ALTER TABLE `buf3w_overrider`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `buf3w_postinstall_messages`
--
ALTER TABLE `buf3w_postinstall_messages`
  ADD PRIMARY KEY (`postinstall_message_id`);

--
-- Indeksy dla tabeli `buf3w_privacy_consents`
--
ALTER TABLE `buf3w_privacy_consents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_user_id` (`user_id`);

--
-- Indeksy dla tabeli `buf3w_privacy_requests`
--
ALTER TABLE `buf3w_privacy_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `buf3w_redirect_links`
--
ALTER TABLE `buf3w_redirect_links`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_old_url` (`old_url`(100)),
  ADD KEY `idx_link_modified` (`modified_date`);

--
-- Indeksy dla tabeli `buf3w_scheduler_tasks`
--
ALTER TABLE `buf3w_scheduler_tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_type` (`type`),
  ADD KEY `idx_state` (`state`),
  ADD KEY `idx_last_exit` (`last_exit_code`),
  ADD KEY `idx_next_exec` (`next_execution`),
  ADD KEY `idx_locked` (`locked`),
  ADD KEY `idx_priority` (`priority`),
  ADD KEY `idx_cli_exclusive` (`cli_exclusive`),
  ADD KEY `idx_checked_out` (`checked_out`);

--
-- Indeksy dla tabeli `buf3w_schemas`
--
ALTER TABLE `buf3w_schemas`
  ADD PRIMARY KEY (`extension_id`,`version_id`);

--
-- Indeksy dla tabeli `buf3w_session`
--
ALTER TABLE `buf3w_session`
  ADD PRIMARY KEY (`session_id`),
  ADD KEY `userid` (`userid`),
  ADD KEY `time` (`time`),
  ADD KEY `client_id_guest` (`client_id`,`guest`);

--
-- Indeksy dla tabeli `buf3w_tags`
--
ALTER TABLE `buf3w_tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tag_idx` (`published`,`access`),
  ADD KEY `idx_access` (`access`),
  ADD KEY `idx_checkout` (`checked_out`),
  ADD KEY `idx_path` (`path`(100)),
  ADD KEY `idx_left_right` (`lft`,`rgt`),
  ADD KEY `idx_alias` (`alias`(100)),
  ADD KEY `idx_language` (`language`);

--
-- Indeksy dla tabeli `buf3w_template_overrides`
--
ALTER TABLE `buf3w_template_overrides`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_template` (`template`),
  ADD KEY `idx_extension_id` (`extension_id`);

--
-- Indeksy dla tabeli `buf3w_template_styles`
--
ALTER TABLE `buf3w_template_styles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_template` (`template`),
  ADD KEY `idx_client_id` (`client_id`),
  ADD KEY `idx_client_id_home` (`client_id`,`home`);

--
-- Indeksy dla tabeli `buf3w_ucm_base`
--
ALTER TABLE `buf3w_ucm_base`
  ADD PRIMARY KEY (`ucm_id`),
  ADD KEY `idx_ucm_item_id` (`ucm_item_id`),
  ADD KEY `idx_ucm_type_id` (`ucm_type_id`),
  ADD KEY `idx_ucm_language_id` (`ucm_language_id`);

--
-- Indeksy dla tabeli `buf3w_ucm_content`
--
ALTER TABLE `buf3w_ucm_content`
  ADD PRIMARY KEY (`core_content_id`),
  ADD KEY `tag_idx` (`core_state`,`core_access`),
  ADD KEY `idx_access` (`core_access`),
  ADD KEY `idx_alias` (`core_alias`(100)),
  ADD KEY `idx_language` (`core_language`),
  ADD KEY `idx_title` (`core_title`(100)),
  ADD KEY `idx_modified_time` (`core_modified_time`),
  ADD KEY `idx_created_time` (`core_created_time`),
  ADD KEY `idx_content_type` (`core_type_alias`(100)),
  ADD KEY `idx_core_modified_user_id` (`core_modified_user_id`),
  ADD KEY `idx_core_checked_out_user_id` (`core_checked_out_user_id`),
  ADD KEY `idx_core_created_user_id` (`core_created_user_id`),
  ADD KEY `idx_core_type_id` (`core_type_id`);

--
-- Indeksy dla tabeli `buf3w_updates`
--
ALTER TABLE `buf3w_updates`
  ADD PRIMARY KEY (`update_id`);

--
-- Indeksy dla tabeli `buf3w_update_sites`
--
ALTER TABLE `buf3w_update_sites`
  ADD PRIMARY KEY (`update_site_id`);

--
-- Indeksy dla tabeli `buf3w_update_sites_extensions`
--
ALTER TABLE `buf3w_update_sites_extensions`
  ADD PRIMARY KEY (`update_site_id`,`extension_id`);

--
-- Indeksy dla tabeli `buf3w_usergroups`
--
ALTER TABLE `buf3w_usergroups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_usergroup_parent_title_lookup` (`parent_id`,`title`),
  ADD KEY `idx_usergroup_title_lookup` (`title`),
  ADD KEY `idx_usergroup_adjacency_lookup` (`parent_id`),
  ADD KEY `idx_usergroup_nested_set_lookup` (`lft`,`rgt`) USING BTREE;

--
-- Indeksy dla tabeli `buf3w_users`
--
ALTER TABLE `buf3w_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_username` (`username`),
  ADD KEY `idx_name` (`name`(100)),
  ADD KEY `idx_block` (`block`),
  ADD KEY `email` (`email`);

--
-- Indeksy dla tabeli `buf3w_user_keys`
--
ALTER TABLE `buf3w_user_keys`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `series` (`series`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeksy dla tabeli `buf3w_user_mfa`
--
ALTER TABLE `buf3w_user_mfa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_user_id` (`user_id`);

--
-- Indeksy dla tabeli `buf3w_user_notes`
--
ALTER TABLE `buf3w_user_notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_user_id` (`user_id`),
  ADD KEY `idx_category_id` (`catid`);

--
-- Indeksy dla tabeli `buf3w_user_profiles`
--
ALTER TABLE `buf3w_user_profiles`
  ADD UNIQUE KEY `idx_user_id_profile_key` (`user_id`,`profile_key`);

--
-- Indeksy dla tabeli `buf3w_user_usergroup_map`
--
ALTER TABLE `buf3w_user_usergroup_map`
  ADD PRIMARY KEY (`user_id`,`group_id`);

--
-- Indeksy dla tabeli `buf3w_viewlevels`
--
ALTER TABLE `buf3w_viewlevels`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_assetgroup_title_lookup` (`title`);

--
-- Indeksy dla tabeli `buf3w_webauthn_credentials`
--
ALTER TABLE `buf3w_webauthn_credentials`
  ADD PRIMARY KEY (`id`(100)),
  ADD KEY `user_id` (`user_id`(100));

--
-- Indeksy dla tabeli `buf3w_workflows`
--
ALTER TABLE `buf3w_workflows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_asset_id` (`asset_id`),
  ADD KEY `idx_title` (`title`(191)),
  ADD KEY `idx_extension` (`extension`),
  ADD KEY `idx_default` (`default`),
  ADD KEY `idx_created` (`created`),
  ADD KEY `idx_created_by` (`created_by`),
  ADD KEY `idx_modified` (`modified`),
  ADD KEY `idx_modified_by` (`modified_by`),
  ADD KEY `idx_checked_out` (`checked_out`);

--
-- Indeksy dla tabeli `buf3w_workflow_associations`
--
ALTER TABLE `buf3w_workflow_associations`
  ADD PRIMARY KEY (`item_id`,`extension`),
  ADD KEY `idx_item_stage_extension` (`item_id`,`stage_id`,`extension`),
  ADD KEY `idx_item_id` (`item_id`),
  ADD KEY `idx_stage_id` (`stage_id`),
  ADD KEY `idx_extension` (`extension`);

--
-- Indeksy dla tabeli `buf3w_workflow_stages`
--
ALTER TABLE `buf3w_workflow_stages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_workflow_id` (`workflow_id`),
  ADD KEY `idx_checked_out` (`checked_out`),
  ADD KEY `idx_title` (`title`(191)),
  ADD KEY `idx_asset_id` (`asset_id`),
  ADD KEY `idx_default` (`default`);

--
-- Indeksy dla tabeli `buf3w_workflow_transitions`
--
ALTER TABLE `buf3w_workflow_transitions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_title` (`title`(191)),
  ADD KEY `idx_asset_id` (`asset_id`),
  ADD KEY `idx_checked_out` (`checked_out`),
  ADD KEY `idx_from_stage_id` (`from_stage_id`),
  ADD KEY `idx_to_stage_id` (`to_stage_id`),
  ADD KEY `idx_workflow_id` (`workflow_id`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `buf3w_action_logs`
--
ALTER TABLE `buf3w_action_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT dla tabeli `buf3w_action_logs_extensions`
--
ALTER TABLE `buf3w_action_logs_extensions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT dla tabeli `buf3w_action_log_config`
--
ALTER TABLE `buf3w_action_log_config`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT dla tabeli `buf3w_assets`
--
ALTER TABLE `buf3w_assets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Primary Key', AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT dla tabeli `buf3w_banners`
--
ALTER TABLE `buf3w_banners`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `buf3w_banner_clients`
--
ALTER TABLE `buf3w_banner_clients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `buf3w_categories`
--
ALTER TABLE `buf3w_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT dla tabeli `buf3w_contact_details`
--
ALTER TABLE `buf3w_contact_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `buf3w_content`
--
ALTER TABLE `buf3w_content`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT dla tabeli `buf3w_content_types`
--
ALTER TABLE `buf3w_content_types`
  MODIFY `type_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10000;

--
-- AUTO_INCREMENT dla tabeli `buf3w_extensions`
--
ALTER TABLE `buf3w_extensions`
  MODIFY `extension_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=232;

--
-- AUTO_INCREMENT dla tabeli `buf3w_fields`
--
ALTER TABLE `buf3w_fields`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `buf3w_fields_groups`
--
ALTER TABLE `buf3w_fields_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `buf3w_finder_filters`
--
ALTER TABLE `buf3w_finder_filters`
  MODIFY `filter_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `buf3w_finder_links`
--
ALTER TABLE `buf3w_finder_links`
  MODIFY `link_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT dla tabeli `buf3w_finder_taxonomy`
--
ALTER TABLE `buf3w_finder_taxonomy`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT dla tabeli `buf3w_finder_terms`
--
ALTER TABLE `buf3w_finder_terms`
  MODIFY `term_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1741;

--
-- AUTO_INCREMENT dla tabeli `buf3w_finder_types`
--
ALTER TABLE `buf3w_finder_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT dla tabeli `buf3w_guidedtours`
--
ALTER TABLE `buf3w_guidedtours`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT dla tabeli `buf3w_guidedtour_steps`
--
ALTER TABLE `buf3w_guidedtour_steps`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;

--
-- AUTO_INCREMENT dla tabeli `buf3w_history`
--
ALTER TABLE `buf3w_history`
  MODIFY `version_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT dla tabeli `buf3w_languages`
--
ALTER TABLE `buf3w_languages`
  MODIFY `lang_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT dla tabeli `buf3w_menu`
--
ALTER TABLE `buf3w_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT dla tabeli `buf3w_menu_types`
--
ALTER TABLE `buf3w_menu_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT dla tabeli `buf3w_messages`
--
ALTER TABLE `buf3w_messages`
  MODIFY `message_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `buf3w_modules`
--
ALTER TABLE `buf3w_modules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT dla tabeli `buf3w_newsfeeds`
--
ALTER TABLE `buf3w_newsfeeds`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `buf3w_overrider`
--
ALTER TABLE `buf3w_overrider`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key';

--
-- AUTO_INCREMENT dla tabeli `buf3w_postinstall_messages`
--
ALTER TABLE `buf3w_postinstall_messages`
  MODIFY `postinstall_message_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT dla tabeli `buf3w_privacy_consents`
--
ALTER TABLE `buf3w_privacy_consents`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `buf3w_privacy_requests`
--
ALTER TABLE `buf3w_privacy_requests`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `buf3w_redirect_links`
--
ALTER TABLE `buf3w_redirect_links`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `buf3w_scheduler_tasks`
--
ALTER TABLE `buf3w_scheduler_tasks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `buf3w_tags`
--
ALTER TABLE `buf3w_tags`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT dla tabeli `buf3w_template_overrides`
--
ALTER TABLE `buf3w_template_overrides`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `buf3w_template_styles`
--
ALTER TABLE `buf3w_template_styles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT dla tabeli `buf3w_ucm_content`
--
ALTER TABLE `buf3w_ucm_content`
  MODIFY `core_content_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `buf3w_updates`
--
ALTER TABLE `buf3w_updates`
  MODIFY `update_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=157;

--
-- AUTO_INCREMENT dla tabeli `buf3w_update_sites`
--
ALTER TABLE `buf3w_update_sites`
  MODIFY `update_site_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `buf3w_usergroups`
--
ALTER TABLE `buf3w_usergroups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Primary Key', AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT dla tabeli `buf3w_users`
--
ALTER TABLE `buf3w_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=589;

--
-- AUTO_INCREMENT dla tabeli `buf3w_user_keys`
--
ALTER TABLE `buf3w_user_keys`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT dla tabeli `buf3w_user_mfa`
--
ALTER TABLE `buf3w_user_mfa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `buf3w_user_notes`
--
ALTER TABLE `buf3w_user_notes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `buf3w_viewlevels`
--
ALTER TABLE `buf3w_viewlevels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Primary Key', AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT dla tabeli `buf3w_workflows`
--
ALTER TABLE `buf3w_workflows`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT dla tabeli `buf3w_workflow_stages`
--
ALTER TABLE `buf3w_workflow_stages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT dla tabeli `buf3w_workflow_transitions`
--
ALTER TABLE `buf3w_workflow_transitions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
