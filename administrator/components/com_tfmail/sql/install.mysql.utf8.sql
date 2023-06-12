CREATE TABLE IF NOT EXISTS `#__tfm_mail` (
    `id` INT(11) NOT NULL AUTO_INCREMENT,
    `title` VARCHAR(400),
    `description` LONGTEXT,
    `text_body` LONGTEXT,
    `send_date` DATETIME,
    `schedule` TINYINT(3),
    `published` TINYINT(3),
    `mail_type` VARCHAR(100),
    `frequency` SMALLINT(3),
    `check_for_new` TINYINT(3),
    `note` VARCHAR(255),
    `attach` VARCHAR(400),
    `priority` TINYINT(3),
    `filter` TEXT,
    `sent` INT(11) NOT NULL DEFAULT 0,
    `params` TEXT,
    `created_by` INT(10) UNSIGNED,
    `created` DATETIME,
    `modified` DATETIME,
    PRIMARY KEY (`id`)
)
    ENGINE=InnoDB
	AUTO_INCREMENT=0
	DEFAULT CHARSET=utf8mb4
    DEFAULT COLLATE=utf8mb4_unicode_ci;
	
CREATE TABLE IF NOT EXISTS `#__tfm_campaign` (
    `id` INT(11) NOT NULL AUTO_INCREMENT,
    `title` VARCHAR(400),
    `description` TEXT,
    `published` TINYINT(3),
    `priority` TINYINT(3),
    `mails` TEXT,
    `filter` TEXT,
    `note` VARCHAR(255),
    `onregister` TINYINT(3),
    `onmodify` TINYINT(3),
    `created_by` INT(10) UNSIGNED,
    `created` DATETIME,
    `modified` DATETIME,
    PRIMARY KEY (`id`)
)
    ENGINE=InnoDB
	AUTO_INCREMENT=0
	DEFAULT CHARSET=utf8mb4
    DEFAULT COLLATE=utf8mb4_unicode_ci;
	
CREATE TABLE IF NOT EXISTS `#__tfm_queue` (
    `mail_id` INT(11),
    `user_id` INT(11),
    `send_date` DATETIME,
    `priority` TINYINT(3) NOT NULL DEFAULT 3,
    `replaces` TEXT
)
    ENGINE=InnoDB
	AUTO_INCREMENT=0
	DEFAULT CHARSET=utf8mb4
    DEFAULT COLLATE=utf8mb4_unicode_ci;
    
CREATE TABLE IF NOT EXISTS `#__tfm_statistics` (
    `id` INT(11) NOT NULL AUTO_INCREMENT,
    `published` TINYINT(3),
    `type` VARCHAR(100),
    `mail_id` INT(11),
    `user_id` INT(11),
    `link_id` INT(11),
    `send_date` DATETIME,
    `open_date` DATETIME,
    `click_date` DATETIME,
    `opens` INT(11),
    `clicks` INT(11),
    PRIMARY KEY (`id`)
)
    ENGINE=InnoDB
	AUTO_INCREMENT=0
	DEFAULT CHARSET=utf8mb4
    DEFAULT COLLATE=utf8mb4_unicode_ci;
	
CREATE TABLE IF NOT EXISTS `#__tfm_bounces` (
    `id` INT(11) NOT NULL AUTO_INCREMENT,
    `published` TINYINT(3),
    `subject` VARCHAR(400),
    `bounce_email` VARCHAR(400),
    `size` VARCHAR(100),
    `fromaddress` VARCHAR(1024),
    `fromname` VARCHAR(1024),
    `emailDate` VARCHAR(100),
    `message` TEXT,
    `message_plain` TEXT,
    `created` DATETIME,
    PRIMARY KEY (`id`)
)
    ENGINE=InnoDB
	AUTO_INCREMENT=0
	DEFAULT CHARSET=utf8mb4
    DEFAULT COLLATE=utf8mb4_unicode_ci;
    
CREATE TABLE IF NOT EXISTS `#__tfm_campsub` (
    `camp_id` INT(11),
    `user_id` INT(11),
    `remarks` VARCHAR(1024),
    `created` DATETIME
)
    ENGINE=InnoDB
	AUTO_INCREMENT=0
	DEFAULT CHARSET=utf8mb4
    DEFAULT COLLATE=utf8mb4_unicode_ci;
    
CREATE TABLE IF NOT EXISTS `#__tfm_links` (
    `id` INT(11) NOT NULL AUTO_INCREMENT,
    `title` VARCHAR(400),
    `link_text` VARCHAR(400),
    `link_url` VARCHAR(400),
    `campaign_id` INT(11),
    `mail_id` INT(11),
    `email_delay` TINYINT(3),
    `message` VARCHAR(1024),
    `published` TINYINT(3),
    `note` VARCHAR(255),
    `created_by` INT(10) UNSIGNED,
    `created` DATETIME,
    `modified` DATETIME,
    PRIMARY KEY (`id`)
)
    ENGINE=InnoDB
	AUTO_INCREMENT=0
	DEFAULT CHARSET=utf8mb4
    DEFAULT COLLATE=utf8mb4_unicode_ci;