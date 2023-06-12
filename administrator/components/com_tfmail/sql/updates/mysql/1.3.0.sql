ALTER TABLE `#__tfm_mail` ADD `text_body` LONGTEXT AFTER `body`;

ALTER TABLE `#__tfm_distribution` ADD `text_body` LONGTEXT AFTER `body`;

ALTER TABLE `#__tfm_automation` ADD `text_body` LONGTEXT AFTER `body`;