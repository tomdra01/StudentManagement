START TRANSACTION;

ALTER TABLE `Courses` ADD `InstructorId` int NOT NULL DEFAULT 0;

CREATE TABLE `Instructors` (
    `Id` int NOT NULL AUTO_INCREMENT,
    `FirstName` longtext CHARACTER SET utf8mb4 NOT NULL,
    `LastName` longtext CHARACTER SET utf8mb4 NOT NULL,
    `Email` longtext CHARACTER SET utf8mb4 NOT NULL,
    `HireDate` date NOT NULL,
    CONSTRAINT `PK_Instructors` PRIMARY KEY (`Id`)
) CHARACTER SET=utf8mb4;

CREATE INDEX `IX_Courses_InstructorId` ON `Courses` (`InstructorId`);

ALTER TABLE `Courses` ADD CONSTRAINT `FK_Courses_Instructors_InstructorId` FOREIGN KEY (`InstructorId`) REFERENCES `Instructors` (`Id`) ON DELETE CASCADE;

INSERT INTO `__EFMigrationsHistory` (`MigrationId`, `ProductVersion`)
VALUES ('20250225204757_AddInstructor', '8.0.4');

COMMIT;

