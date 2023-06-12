ALTER TABLE `#__tfm_links` ADD COLUMN `mail_id` INT(11) AFTER `campaign_id`;

ALTER TABLE `#__tfm_links` ADD COLUMN `email_delay` TINYINT(3) AFTER `mail_id`;