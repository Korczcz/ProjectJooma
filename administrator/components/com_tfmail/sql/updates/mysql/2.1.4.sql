ALTER TABLE `#__tfm_campaign` ADD COLUMN `created_by` INT(10) UNSIGNED AFTER `onmodify`;

ALTER TABLE `#__tfm_campaign` ADD COLUMN `created` DATETIME AFTER `created_by`;

ALTER TABLE `#__tfm_campaign` ADD COLUMN `modified` DATETIME AFTER `created`;

ALTER TABLE `#__tfm_mail` ADD COLUMN `created_by` INT(10) UNSIGNED AFTER `sent`;

ALTER TABLE `#__tfm_mail` ADD COLUMN `created` DATETIME AFTER `created_by`;

ALTER TABLE `#__tfm_mail` ADD COLUMN `modified` DATETIME AFTER `created`;

ALTER TABLE `#__tfm_links` ADD COLUMN `created_by` INT(10) UNSIGNED AFTER `published`;

ALTER TABLE `#__tfm_links` ADD COLUMN `created` DATETIME AFTER `created_by`;

ALTER TABLE `#__tfm_links` ADD COLUMN `modified` DATETIME AFTER `created`;

ALTER TABLE `#__tfm_mail` ADD COLUMN `title` VARCHAR(400) AFTER `subject`;

UPDATE `#__tfm_mail` SET `title` = `subject`;