ALTER TABLE `#__tfm_statistics` ADD `type` VARCHAR(100) AFTER `id`;

ALTER TABLE `#__tfm_statistics` ADD `link_id` INT(11) AFTER `user_id`;

ALTER TABLE `#__tfm_statistics` ADD `click_date` DATETIME AFTER `open_date`;

ALTER TABLE `#__tfm_statistics` ADD `clicks` INT(11) AFTER `opens`;