DROP DATABASE IF EXISTS [SEDC_DEMO] 
GO

CREATE DATABASE [SEDC_DEMO]
GO

USE [SEDC_DEMO]
GO

-- To allow Database Diagram creation 
-- (execute the bellow query)
-- USE YourDatabase;
-- EXEC sp_changedbowner 'sa';


-- ***** ONE-TO-ONE (1:1) ***** 
-- Each Person has one Passport, and each Passport belongs to one Person

CREATE TABLE [Person] (
	Id INT PRIMARY KEY,
	[Name] NVARCHAR(100) NOT NULL,
);

CREATE TABLE Passport (
	Id INT PRIMARY KEY,
	PassportNumber NVARCHAR(50) NOT NULL,
	PersonId INT UNIQUE -- with UNIQUE CONSTRAINT we are establishing the 1 : 1 relation,

	CONSTRAINT FK_Passport_Person FOREIGN KEY (PersonId) REFERENCES Person(Id)
)


-- ***** ONE-TO-MANY (1:M) ***** 
-- One Department has many Employees, but each Employee belongs to only one Department

CREATE TABLE Department(
	Id INT PRIMARY KEY,
	Name NVARCHAR(100) NOT NULL
)
-- 1 Dev Team
-- 2 QA Team

CREATE TABLE Employee (
	Id INT PRIMARY KEY,
	FirstName NVARCHAR(50) NOT NULL,
	LastName NVARCHAR(50) NOT NULL,
	DepartmentId INT NOT NULL,

	CONSTRAINT FK_Employee_Department FOREIGN KEY (DepartmentId) REFERENCES Department(Id)
)


-- ***** MANY-TO-MANY (M:M) ***** 
-- created using two 1:M relationships
-- using a bridge (middle) table 
-- A Student can enroll in many Courses, and a Course can have many Students. StudentCourse is the bridge table that enables this M:M relationship.

CREATE TABLE Student(
	Id INT PRIMARY KEY,
	FullName NVARCHAR(100) NOT NULL
) 
-- 1 Bob Bobsky 
-- 2 John Bobsky

CREATE TABLE Course (
	Id INT PRIMARY KEY,
	Name NVARCHAR(100) NOT NULL
)
-- 1 Java
-- 2 C#
-- 3 SQL

CREATE TABLE StudentCourse (
	Id INT PRIMARY KEY,
	StudentId INT,
	CourseId INT,

	CONSTRAINT FK_StudentCourse_Student FOREIGN KEY (StudentId) REFERENCES Student(Id),
    CONSTRAINT FK_StudentCourse_Course FOREIGN KEY (CourseId) REFERENCES Course(Id)
);
-- 1 - 1(Bob) - 2(C#)
-- 2 - 1(Bob) - 3(SQL)
