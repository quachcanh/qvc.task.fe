﻿--
-- Script was generated by Devart dbForge Studio 2020 for MySQL, Version 9.0.338.0
-- Product home page: http://www.devart.com/dbforge/mysql/studio
-- Script date 18/2/2023 8:55:55 AM
-- Server version: 8.0.32
-- Client version: 4.1
--

-- 
-- Disable foreign keys
-- 
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

-- 
-- Set SQL mode
-- 
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 
-- Set character set the client will use to send SQL statements to the server
--
SET NAMES 'utf8';

--
-- Set default database
--
USE qvc_task_info;

--
-- Drop procedure `Proc_GetOne_Employee`
--
DROP PROCEDURE IF EXISTS Proc_GetOne_Employee;

--
-- Drop table `databaseinfo`
--
DROP TABLE IF EXISTS databaseinfo;

--
-- Drop procedure `Proc_GetByCode_Company`
--
DROP PROCEDURE IF EXISTS Proc_GetByCode_Company;

--
-- Drop table `company`
--
DROP TABLE IF EXISTS company;

--
-- Drop procedure `Proc_GetByUserPass_Employee`
--
DROP PROCEDURE IF EXISTS Proc_GetByUserPass_Employee;

--
-- Drop procedure `Proc_GetUserByEmail_Employee`
--
DROP PROCEDURE IF EXISTS Proc_GetUserByEmail_Employee;

--
-- Drop procedure `Proc_Insert_Employee`
--
DROP PROCEDURE IF EXISTS Proc_Insert_Employee;

--
-- Drop procedure `Proc_UpdateByUserName_Employee`
--
DROP PROCEDURE IF EXISTS Proc_UpdateByUserName_Employee;

--
-- Drop table `employee`
--
DROP TABLE IF EXISTS employee;

--
-- Set default database
--
USE qvc_task_info;

--
-- Create table `employee`
--
CREATE TABLE employee (
  EmployeeID char(36) NOT NULL DEFAULT '',
  EmployeeCode varchar(20) NOT NULL DEFAULT '',
  EmployeeName varchar(100) NOT NULL DEFAULT '',
  UserName varchar(128) NOT NULL DEFAULT '',
  Password varchar(128) NOT NULL DEFAULT '',
  AccountType tinyint DEFAULT NULL COMMENT 'Trạng thái tài khoản; 0: Ngưng sử dụng; 1: Đang sử dụng; 2: Chưa xác minh',
  DateOfBirth date DEFAULT NULL,
  Gender tinyint DEFAULT NULL COMMENT 'Giới tính; 0: Nữ; 1: Nam; 2: Khác',
  Email varchar(100) DEFAULT NULL,
  PhoneNumber varchar(50) DEFAULT NULL,
  Address varchar(255) DEFAULT NULL,
  CompanyID char(36) DEFAULT NULL,
  DepartmentID char(36) DEFAULT NULL,
  PositionID char(36) DEFAULT NULL,
  CreatedDate datetime DEFAULT NULL,
  CreatedBy varchar(100) DEFAULT NULL,
  ModifiedDate datetime DEFAULT NULL,
  ModifiedBy varchar(100) DEFAULT NULL,
  Code int DEFAULT NULL COMMENT 'Mã xác thực tài khoản',
  PRIMARY KEY (EmployeeID)
)
ENGINE = INNODB,
AVG_ROW_LENGTH = 4096,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_general_ci,
COMMENT = 'Bảng thông tin nhân viên';

--
-- Create index `Email` on table `employee`
--
ALTER TABLE employee
ADD UNIQUE INDEX Email (Email);

--
-- Create index `EmployeeCode` on table `employee`
--
ALTER TABLE employee
ADD UNIQUE INDEX EmployeeCode (EmployeeCode);

--
-- Create index `UserName` on table `employee`
--
ALTER TABLE employee
ADD UNIQUE INDEX UserName (UserName);

DELIMITER $$

--
-- Create procedure `Proc_UpdateByUserName_Employee`
--
CREATE DEFINER = 'root'@'localhost'
PROCEDURE Proc_UpdateByUserName_Employee (IN `@EmployeeID` char(36), IN `@EmployeeCode` varchar(20), IN `@EmployeeName` varchar(100), IN `@UserName` varchar(128), IN `@Password` varchar(128), IN `@AccountType` tinyint, IN `@DateOfBirth` date, IN `@Gender` tinyint, IN `@Email` varchar(100), IN `@PhoneNumber` varchar(50), IN `@Address` varchar(255), IN `@CompanyID` char(36), IN `@DepartmentID` char(36), IN `@PositionID` char(36), IN `@CreatedDate` datetime, IN `@CreatedBy` varchar(100), IN `@ModifiedDate` datetime, IN `@ModifiedBy` varchar(100), IN `@Code` int)
BEGIN
  UPDATE employee e
  SET EmployeeCode = `@EmployeeCode`,
      EmployeeName = `@EmployeeName`,
      UserName = `@UserName`,
      Password = `@Password`,
      AccountType = `@AccountType`,
      DateOfBirth = `@DateOfBirth`,
      Gender = `@Gender`,
      Email = `@Email`,
      PhoneNumber = `@PhoneNumber`,
      Address = `@Address`,
      CompanyID = `@CompanyID`,
      DepartmentID = `@DepartmentID`,
      PositionID = `@PositionID`,
      ModifiedDate = `@ModifiedDate`,
      ModifiedBy = `@ModifiedBy`,
      Code = `@Code`
  WHERE UserName = `@UserName`;
END
$$

--
-- Create procedure `Proc_Insert_Employee`
--
CREATE DEFINER = 'root'@'localhost'
PROCEDURE Proc_Insert_Employee (IN `@EmployeeID` char(36), IN `@EmployeeCode` varchar(20), IN `@EmployeeName` varchar(100), IN `@UserName` varchar(128), IN `@Password` varchar(128), IN `@AccountType` tinyint, IN `@DateOfBirth` date, IN `@Gender` tinyint, IN `@Email` varchar(100), IN `@PhoneNumber` varchar(50), IN `@Address` varchar(255), IN `@CompanyID` char(36), IN `@DepartmentID` char(36), IN `@PositionID` char(36), IN `@CreatedDate` datetime, IN `@CreatedBy` varchar(100), IN `@ModifiedDate` datetime, IN `@ModifiedBy` varchar(100), IN `@Code` int)
BEGIN
  INSERT INTO employee (EmployeeID, EmployeeCode, EmployeeName, UserName, Password, AccountType, DateOfBirth, Gender, Email, PhoneNumber, Address, CompanyID, DepartmentID, PositionID, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy, Code)
    VALUES (`@EmployeeID`, `@EmployeeCode`, `@EmployeeName`, `@UserName`, `@Password`, `@AccountType`, `@DateOfBirth`, `@Gender`, `@Email`, `@PhoneNumber`, `@Address`, `@CompanyID`, `@DepartmentID`, `@PositionID`, `@CreatedDate`, `@CreatedBy`, `@ModifiedDate`, `@ModifiedBy`, `@Code`);
END
$$

--
-- Create procedure `Proc_GetUserByEmail_Employee`
--
CREATE DEFINER = 'root'@'localhost'
PROCEDURE Proc_GetUserByEmail_Employee (IN `@Email` varchar(100))
COMMENT 'Lấy tên user'
BEGIN
  SELECT
    *
  FROM employee e
  WHERE e.Email = `@Email`;
END
$$

--
-- Create procedure `Proc_GetByUserPass_Employee`
--
CREATE DEFINER = 'root'@'localhost'
PROCEDURE Proc_GetByUserPass_Employee (IN `@UserName` varchar(128), IN `@Email` varchar(100), IN `@Password` varchar(128))
COMMENT 'Kiểm tra đăng nhập'
BEGIN
  SELECT
    COUNT(*) AS Record
  FROM employee e
  WHERE (e.UserName = `@UserName`
  AND e.Password = `@Password`)
  OR (e.Email = `@Email`
  AND e.Password = `@Password`);
END
$$

DELIMITER ;

--
-- Create table `company`
--
CREATE TABLE company (
  CompanyID char(36) NOT NULL DEFAULT '',
  CompanyCode varchar(128) NOT NULL DEFAULT '',
  CompanyName varchar(255) NOT NULL DEFAULT '',
  Email varchar(100) DEFAULT NULL,
  CreatedDate datetime DEFAULT NULL,
  CreatedBy varchar(100) DEFAULT NULL,
  ModifiedDate datetime DEFAULT NULL,
  ModifiedBy varchar(100) DEFAULT NULL,
  PRIMARY KEY (CompanyID)
)
ENGINE = INNODB,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_general_ci,
COMMENT = 'Bảng thông tin công ty';

--
-- Create index `CompanyCode` on table `company`
--
ALTER TABLE company
ADD UNIQUE INDEX CompanyCode (CompanyCode);

--
-- Create index `CompanyName` on table `company`
--
ALTER TABLE company
ADD UNIQUE INDEX CompanyName (CompanyName);

DELIMITER $$

--
-- Create procedure `Proc_GetByCode_Company`
--
CREATE DEFINER = 'root'@'localhost'
PROCEDURE Proc_GetByCode_Company (IN `@CompanyCode` varchar(128))
COMMENT 'LẤy thông tin công ty từ mã công ty'
BEGIN
  SELECT
    *
  FROM company c
  WHERE c.CompanyCode = `@CompanyCode`;
END
$$

DELIMITER ;

--
-- Create table `databaseinfo`
--
CREATE TABLE databaseinfo (
  DatabaseID char(36) NOT NULL DEFAULT '',
  DatabaseCode varchar(128) NOT NULL DEFAULT '',
  DatabaseName varchar(128) NOT NULL DEFAULT '',
  CreatedDate datetime DEFAULT NULL,
  CreatedBy varchar(100) DEFAULT NULL,
  ModifiedDate datetime DEFAULT NULL,
  ModifiedBy varchar(100) DEFAULT NULL,
  PRIMARY KEY (DatabaseID)
)
ENGINE = INNODB,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_general_ci,
COMMENT = 'Bảng thông tin databse';

--
-- Create index `DatabaseCode` on table `databaseinfo`
--
ALTER TABLE databaseinfo
ADD UNIQUE INDEX DatabaseCode (DatabaseCode);

--
-- Create index `DatabaseName` on table `databaseinfo`
--
ALTER TABLE databaseinfo
ADD UNIQUE INDEX DatabaseName (DatabaseName);

DELIMITER $$

--
-- Create procedure `Proc_GetOne_Employee`
--
CREATE DEFINER = 'root'@'localhost'
PROCEDURE Proc_GetOne_Employee (IN `@EmployeeID` char(36), IN `@UserName` varchar(128), IN `@Email` varchar(100))
BEGIN
  SELECT
    e.EmployeeID,
    e.EmployeeCode,
    e.EmployeeName,
    e.UserName,
    e.Password,
    e.AccountType,
    e.DateOfBirth,
    e.Gender,
    e.Email,
    e.PhoneNumber,
    e.Address,
    e.CompanyID,
    e.DepartmentID,
    e.PositionID,
    e.CreatedDate,
    e.CreatedBy,
    e.ModifiedDate,
    e.ModifiedBy,
    e.Code
  FROM employee e
  WHERE e.EmployeeID = `@EmployeeID`
  OR e.UserName = `@UserName`
  OR e.Email = `@Email`;
END
$$

DELIMITER ;

-- 
-- Dumping data for table employee
--
INSERT INTO employee VALUES
('7300efe3-590a-4832-b782-891c91ad1c63', 'quachcanh', 'Quách Cảnh', 'quachcanh', '123qwe', 1, '1999-05-01', 1, 'canhquach45@gmail.com', '0973137312', 'Hà Nội', NULL, NULL, NULL, '2023-02-18 00:20:28', NULL, '2023-02-18 00:20:35', NULL, 0);

-- 
-- Dumping data for table databaseinfo
--
-- Table qvc_task_info.databaseinfo does not contain any data (it is empty)

-- 
-- Dumping data for table company
--
-- Table qvc_task_info.company does not contain any data (it is empty)

-- 
-- Restore previous SQL mode
-- 
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;

-- 
-- Enable foreign keys
-- 
/*!40014 SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS */;