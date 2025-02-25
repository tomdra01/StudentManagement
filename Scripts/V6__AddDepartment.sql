START TRANSACTION;

CREATE TABLE `Departments` (
    `Id` int NOT NULL AUTO_INCREMENT,
    `Name` longtext CHARACTER SET utf8mb4 NOT NULL,
    `Budget` decimal(65,30) NOT NULL,
    `StartDate` date NOT NULL,
    `DepartmentHeadId` int NULL,
    CONSTRAINT `PK_Departments` PRIMARY KEY (`Id`),
    CONSTRAINT `FK_Departments_Instructors_DepartmentHeadId` FOREIGN KEY (`DepartmentHeadId`) REFERENCES `Instructors` (`Id`)
) CHARACTER SET=utf8mb4;

CREATE INDEX `IX_Departments_DepartmentHeadId` ON `Departments` (`DepartmentHeadId`);

INSERT INTO `__EFMigrationsHistory` (`MigrationId`, `ProductVersion`)
VALUES ('20250225210341_AddDepartment', '8.0.4');

COMMIT;

