ALTER TABLE `player_vehicles` CHANGE COLUMN `garage` `street` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8_general_ci' AFTER `fakeplate`;
ALTER TABLE `player_vehicles` ADD COLUMN `coords` TEXT NULL DEFAULT NULL
