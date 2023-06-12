ALTER TABLE `#__tfm_links` ADD COLUMN `message` VARCHAR(1024) AFTER `campaign_id`;

ALTER TABLE `#__tfm_campsub` ADD COLUMN `remarks` VARCHAR(1024) AFTER `user_id`;