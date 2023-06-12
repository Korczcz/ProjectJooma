ALTER TABLE `#__tfm_campaign` ADD `auto_delay` TINYINT(3);

ALTER TABLE `#__tfm_campaign` ADD `endDate` DATETIME;

ALTER TABLE `#__tfm_mail` ADD `mail_type` VARCHAR(100) AFTER `published`;