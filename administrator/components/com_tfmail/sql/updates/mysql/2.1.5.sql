ALTER TABLE `#__tfm_mail` ADD COLUMN `description` LONGTEXT AFTER `title`;

UPDATE `#__tfm_mail` SET `description` = `body`;

ALTER TABLE `#__tfm_mail` DROP COLUMN `subject`;

ALTER TABLE `#__tfm_mail` DROP COLUMN `body`;