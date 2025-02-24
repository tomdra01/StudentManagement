START TRANSACTION;

ALTER TABLE `Students` ADD `MiddleName` longtext CHARACTER SET utf8mb4 NOT NULL;

INSERT INTO `__EFMigrationsHistory` (`MigrationId`, `ProductVersion`)
VALUES ('20250224162558_AddMiddleName', '8.0.4');

COMMIT;

