ALTER TABLE `#__tfm_queue` ADD `priority` TINYINT(3) NOT NULL DEFAULT 3;

ALTER TABLE `#__tfm_automation` ADD `priority` TINYINT(3) AFTER `frequency`;

ALTER TABLE `#__tfm_mail` ADD `priority` TINYINT(3) AFTER `mail_type`;

ALTER TABLE `#__tfm_campaign` ADD `priority` TINYINT(3) AFTER `published`;