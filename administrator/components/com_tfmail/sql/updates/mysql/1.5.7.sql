ALTER TABLE `#__tfm_campaign` DROP COLUMN `auto_delay`;

ALTER TABLE `#__tfm_campaign` DROP COLUMN `endDate`;

ALTER TABLE `#__tfm_campaign` ADD COLUMN `onregister` TINYINT(3);

ALTER TABLE `#__tfm_campaign` ADD COLUMN `onmodify` TINYINT(3);

CREATE TABLE IF NOT EXISTS `#__tfm_campsub` (
    `camp_id` INT(11),
    `user_id` INT(11),
    `created` DATETIME
)
    ENGINE=InnoDB
	AUTO_INCREMENT=0
	DEFAULT CHARSET=utf8mb4
    DEFAULT COLLATE=utf8mb4_unicode_ci;