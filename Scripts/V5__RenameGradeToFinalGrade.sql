START TRANSACTION;

ALTER TABLE `Enrollments` RENAME COLUMN `Grade` TO `FinalGrade`;

INSERT INTO `__EFMigrationsHistory` (`MigrationId`, `ProductVersion`)
VALUES ('20250225205743_RenameGradeToFinalGrade', '8.0.4');

COMMIT;

