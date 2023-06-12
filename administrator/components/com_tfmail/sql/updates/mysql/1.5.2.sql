ALTER TABLE `#__tfm_mail` ADD COLUMN `note` VARCHAR(255) AFTER `mail_type`;

ALTER TABLE `#__tfm_campaign` ADD COLUMN `note` VARCHAR(255) AFTER `filter`;