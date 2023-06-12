CREATE TABLE IF NOT EXISTS `#__tfm_bounces` (
    `id` INT(11) NOT NULL AUTO_INCREMENT,
    `published` TINYINT(3),
    `subject` VARCHAR(400),
    `bounce_email` VARCHAR(400),
    `size` VARCHAR(100),
    `emailDate` VARCHAR(100),
    `message` TEXT,
    `created` DATETIME,
    PRIMARY KEY (`id`)
)
    ENGINE=MyISAM
	AUTO_INCREMENT=0
	DEFAULT CHARSET=utf8;