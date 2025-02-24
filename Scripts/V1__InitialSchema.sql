CREATE TABLE IF NOT EXISTS `__EFMigrationsHistory` (
    `MigrationId` varchar(150) CHARACTER SET utf8mb4 NOT NULL,
    `ProductVersion` varchar(32) CHARACTER SET utf8mb4 NOT NULL,
    CONSTRAINT `PK___EFMigrationsHistory` PRIMARY KEY (`MigrationId`)
) CHARACTER SET=utf8mb4;

START TRANSACTION;

ALTER DATABASE CHARACTER SET utf8mb4;

CREATE TABLE `Courses` (
    `Id` int NOT NULL AUTO_INCREMENT,
    `Title` longtext CHARACTER SET utf8mb4 NOT NULL,
    `Credits` int NOT NULL,
    CONSTRAINT `PK_Courses` PRIMARY KEY (`Id`)
) CHARACTER SET=utf8mb4;

CREATE TABLE `Students` (
    `Id` int NOT NULL AUTO_INCREMENT,
    `FirstName` longtext CHARACTER SET utf8mb4 NOT NULL,
    `LastName` longtext CHARACTER SET utf8mb4 NOT NULL,
    `Email` longtext CHARACTER SET utf8mb4 NOT NULL,
    `EnrollmentDate` datetime(6) NOT NULL,
    CONSTRAINT `PK_Students` PRIMARY KEY (`Id`)
) CHARACTER SET=utf8mb4;

CREATE TABLE `Enrollments` (
    `Id` int NOT NULL AUTO_INCREMENT,
    `StudentId` int NOT NULL,
    `CourseId` int NOT NULL,
    `Grade` longtext CHARACTER SET utf8mb4 NULL,
    CONSTRAINT `PK_Enrollments` PRIMARY KEY (`Id`),
    CONSTRAINT `FK_Enrollments_Courses_CourseId` FOREIGN KEY (`CourseId`) REFERENCES `Courses` (`Id`) ON DELETE CASCADE,
    CONSTRAINT `FK_Enrollments_Students_StudentId` FOREIGN KEY (`StudentId`) REFERENCES `Students` (`Id`) ON DELETE CASCADE
) CHARACTER SET=utf8mb4;

CREATE INDEX `IX_Enrollments_CourseId` ON `Enrollments` (`CourseId`);

CREATE INDEX `IX_Enrollments_StudentId` ON `Enrollments` (`StudentId`);

INSERT INTO `__EFMigrationsHistory` (`MigrationId`, `ProductVersion`)
VALUES ('20250224134634_InitialSchema', '8.0.4');

COMMIT;

