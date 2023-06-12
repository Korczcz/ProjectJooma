ALTER TABLE `#__tfm_fields` ADD `readonly` TINYINT(3) AFTER `required`;

ALTER TABLE `#__tfm_mail` ADD `attach` VARCHAR(400) AFTER `mail_type`;

ALTER TABLE `#__tfm_automation` ADD `attach` VARCHAR(400) AFTER `priority`;