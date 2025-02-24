START TRANSACTION;

ALTER TABLE `Students` ADD `DateOfBirth` date NOT NULL DEFAULT '0001-01-01';

INSERT INTO `__EFMigrationsHistory` (`MigrationId`, `ProductVersion`)
VALUES ('20250224163745_AddDateOfBirth', '8.0.4');

COMMIT;

