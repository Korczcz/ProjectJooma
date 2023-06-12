CREATE TABLE IF NOT EXISTS `#__tfm_statistics` (
    `id` INT(11) NOT NULL AUTO_INCREMENT,
    `mail_id` INT(11),
    `user_id` INT(11),
    `send_date` DATETIME,
    `open_date` DATETIME,
    `track_code` VARCHAR(100),
    `opens` INT(11),
    `clicks` INT(11),
    PRIMARY KEY (`id`)
)
    ENGINE=InnoDB
	AUTO_INCREMENT=0
	DEFAULT CHARSET=utf8mb4
    DEFAULT COLLATE=utf8mb4_unicode_ci;