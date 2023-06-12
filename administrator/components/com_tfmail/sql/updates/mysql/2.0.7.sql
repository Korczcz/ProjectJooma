ALTER TABLE `#__tfm_mail` ADD COLUMN `frequency` TINYINT(3) AFTER `mail_type`;

CREATE TABLE IF NOT EXISTS `#__tfm_links` (
    `id` INT(11) NOT NULL AUTO_INCREMENT,
    `title` VARCHAR(400),
    `link_text` VARCHAR(400),
    `link_url` VARCHAR(400),
    `published` TINYINT(3),
    PRIMARY KEY (`id`)
)
    ENGINE=InnoDB
	AUTO_INCREMENT=0
	DEFAULT CHARSET=utf8mb4
    DEFAULT COLLATE=utf8mb4_unicode_ci;