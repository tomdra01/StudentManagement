START TRANSACTION;

ALTER TABLE `Courses` MODIFY COLUMN `Credits` decimal(5,2) NOT NULL;

INSERT INTO `__EFMigrationsHistory` (`MigrationId`, `ProductVersion`)
VALUES ('20250225210836_ModifyCreditsColumn', '8.0.4');

COMMIT;

