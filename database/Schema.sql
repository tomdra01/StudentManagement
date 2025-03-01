START TRANSACTION;

ALTER DATABASE CHARACTER SET utf8mb4;
      
CREATE TABLE IF NOT EXISTS `Courses` (
    `Id` int NOT NULL AUTO_INCREMENT,
    `Title` longtext CHARACTER SET utf8mb4 NOT NULL,
    `Credits` int NOT NULL,
    CONSTRAINT `PK_Courses` PRIMARY KEY (`Id`)
) CHARACTER SET=utf8mb4;

CREATE TABLE IF NOT EXISTS `Students` (
    `Id` int NOT NULL AUTO_INCREMENT,
    `FirstName` longtext CHARACTER SET utf8mb4 NOT NULL,
    `LastName` longtext CHARACTER SET utf8mb4 NOT NULL,
    `MiddleName` VARCHAR(50) NULL,
    `Email` longtext CHARACTER SET utf8mb4 NOT NULL,
    `EnrollmentDate` datetime(6) NOT NULL,
    CONSTRAINT `PK_Students` PRIMARY KEY (`Id`)
) CHARACTER SET=utf8mb4;

CREATE TABLE IF NOT EXISTS `Enrollments` (
    `Id` int NOT NULL AUTO_INCREMENT,
    `StudentId` int NOT NULL,
    `CourseId` int NOT NULL,
    `Grade` longtext CHARACTER SET utf8mb4 NULL,
    CONSTRAINT `PK_Enrollments` PRIMARY KEY (`Id`),
    CONSTRAINT `FK_Enrollments_Courses_CourseId` FOREIGN KEY (`CourseId`) REFERENCES `Courses` (`Id`) ON DELETE CASCADE,
    CONSTRAINT `FK_Enrollments_Students_StudentId` FOREIGN KEY (`StudentId`) REFERENCES `Students` (`Id`) ON DELETE CASCADE
) CHARACTER SET=utf8mb4;

CREATE INDEX IF NOT EXISTS `IX_Enrollments_CourseId` ON `Enrollments` (`CourseId`);
CREATE INDEX IF NOT EXISTS `IX_Enrollments_StudentId` ON `Enrollments` (`StudentId`);

COMMIT;

