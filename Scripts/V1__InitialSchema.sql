CREATE TABLE IF NOT EXISTS `__EFMigrationsHistory` (
    `MigrationId` varchar(150) CHARACTER SET utf8mb4 NOT NULL,
    `ProductVersion` varchar(32) CHARACTER SET utf8mb4 NOT NULL,
    CONSTRAINT `PK___EFMigrationsHistory` PRIMARY KEY (`MigrationId`)
) CHARACTER SET=utf8mb4;

START TRANSACTION;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20250301191941_TempMigration') THEN

    ALTER DATABASE CHARACTER SET utf8mb4;

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20250301191941_TempMigration') THEN

    CREATE TABLE `Courses` (
        `Id` int NOT NULL AUTO_INCREMENT,
        `Title` longtext CHARACTER SET utf8mb4 NOT NULL,
        `Credits` int NOT NULL,
        CONSTRAINT `PK_Courses` PRIMARY KEY (`Id`)
    ) CHARACTER SET=utf8mb4;

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20250301191941_TempMigration') THEN

    CREATE TABLE `Students` (
        `Id` int NOT NULL AUTO_INCREMENT,
        `FirstName` longtext CHARACTER SET utf8mb4 NOT NULL,
        `LastName` longtext CHARACTER SET utf8mb4 NOT NULL,
        `Email` longtext CHARACTER SET utf8mb4 NOT NULL,
        `EnrollmentDate` datetime(6) NOT NULL,
        CONSTRAINT `PK_Students` PRIMARY KEY (`Id`)
    ) CHARACTER SET=utf8mb4;

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20250301191941_TempMigration') THEN

    CREATE TABLE `Enrollments` (
        `Id` int NOT NULL AUTO_INCREMENT,
        `StudentId` int NOT NULL,
        `CourseId` int NOT NULL,
        `Grade` longtext CHARACTER SET utf8mb4 NULL,
        CONSTRAINT `PK_Enrollments` PRIMARY KEY (`Id`),
        CONSTRAINT `FK_Enrollments_Courses_CourseId` FOREIGN KEY (`CourseId`) REFERENCES `Courses` (`Id`) ON DELETE CASCADE,
        CONSTRAINT `FK_Enrollments_Students_StudentId` FOREIGN KEY (`StudentId`) REFERENCES `Students` (`Id`) ON DELETE CASCADE
    ) CHARACTER SET=utf8mb4;

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20250301191941_TempMigration') THEN

    CREATE INDEX `IX_Enrollments_CourseId` ON `Enrollments` (`CourseId`);

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20250301191941_TempMigration') THEN

    CREATE INDEX `IX_Enrollments_StudentId` ON `Enrollments` (`StudentId`);

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20250301191941_TempMigration') THEN

    INSERT INTO `__EFMigrationsHistory` (`MigrationId`, `ProductVersion`)
    VALUES ('20250301191941_TempMigration', '8.0.4');

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

COMMIT;

