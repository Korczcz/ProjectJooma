ALTER TABLE `#__tfm_config` ADD `version` MEDIUMTEXT AFTER `notify`;

ALTER TABLE `#__tfm_config` DROP `is_pro`;