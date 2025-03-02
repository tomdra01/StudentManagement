START TRANSACTION;

ALTER DATABASE CHARACTER SET utf8mb4;

CREATE TABLE IF NOT EXISTS `Departments` (
    `Id` int NOT NULL AUTO_INCREMENT,
    `Name` VARCHAR(100) CHARACTER SET utf8mb4 NOT NULL,
    `Budget` DECIMAL(15, 2) NOT NULL,
    `StartDate` datetime(6) NOT NULL,
    `DepartmentHeadId` int NULL,
    CONSTRAINT `PK_Departments` PRIMARY KEY (`Id`),
    CONSTRAINT `FK_Departments_Instructors_DepartmentHeadId` FOREIGN KEY (`DepartmentHeadId`) REFERENCES `Instructors` (`Id`) ON DELETE SET NULL
) CHARACTER SET=utf8mb4;

CREATE TABLE IF NOT EXISTS `Instructors` (
    `Id` int NOT NULL AUTO_INCREMENT,
    `FirstName` longtext CHARACTER SET utf8mb4 NOT NULL,
    `LastName` longtext CHARACTER SET utf8mb4 NOT NULL,
    `Email` longtext CHARACTER SET utf8mb4 NOT NULL,
    `HireDate` datetime(6) NOT NULL,
    CONSTRAINT `PK_Instructors` PRIMARY KEY (`Id`)
) CHARACTER SET=utf8mb4;
      
CREATE TABLE IF NOT EXISTS `Courses` (
    `Id` int NOT NULL AUTO_INCREMENT,
    `Title` longtext CHARACTER SET utf8mb4 NOT NULL,
    `Credits` int NOT NULL,
    `InstructorId` int NULL,
    CONSTRAINT `PK_Courses` PRIMARY KEY (`Id`),
    CONSTRAINT `FK_Courses_Instructors_InstructorId` FOREIGN KEY (`InstructorId`) REFERENCES `Instructors` (`Id`) ON DELETE SET NULL
) CHARACTER SET=utf8mb4;

CREATE TABLE IF NOT EXISTS `Students` (
    `Id` int NOT NULL AUTO_INCREMENT,
    `FirstName` longtext CHARACTER SET utf8mb4 NOT NULL,
    `LastName` longtext CHARACTER SET utf8mb4 NOT NULL,
    `MiddleName` VARCHAR(50) NULL,
    `Email` longtext CHARACTER SET utf8mb4 NOT NULL,
    `DateOfBirth` DATE NULL,
    `EnrollmentDate` datetime(6) NOT NULL,
    CONSTRAINT `PK_Students` PRIMARY KEY (`Id`)
) CHARACTER SET=utf8mb4;

CREATE TABLE IF NOT EXISTS `Enrollments` (
    `Id` int NOT NULL AUTO_INCREMENT,
    `StudentId` int NOT NULL,
    `CourseId` int NOT NULL,
    `FinalGrade` longtext CHARACTER SET utf8mb4 NULL,
    CONSTRAINT `PK_Enrollments` PRIMARY KEY (`Id`),
    CONSTRAINT `FK_Enrollments_Courses_CourseId` FOREIGN KEY (`CourseId`) REFERENCES `Courses` (`Id`) ON DELETE CASCADE,
    CONSTRAINT `FK_Enrollments_Students_StudentId` FOREIGN KEY (`StudentId`) REFERENCES `Students` (`Id`) ON DELETE CASCADE
) CHARACTER SET=utf8mb4;

CREATE INDEX IF NOT EXISTS `IX_Enrollments_CourseId` ON `Enrollments` (`CourseId`);
CREATE INDEX IF NOT EXISTS `IX_Enrollments_StudentId` ON `Enrollments` (`StudentId`);

COMMIT;

