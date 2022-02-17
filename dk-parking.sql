ALTER TABLE `player_vehicles` ADD COLUMN `coords` TEXT NULL DEFAULT NULL
ALTER TABLE `player_vehicles` CHANGE COLUMN `garage` `street` varchar(50) NULL DEFAULT NULL