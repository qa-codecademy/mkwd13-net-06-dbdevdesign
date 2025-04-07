USE master
CREATE DATABASE SEDC -- this is a comment
GO

USE SEDC
GO

-- ***** CREATE *****
CREATE TABLE Customer (
	Id INT NOT NULL,
	FirstName NVARCHAR(30) NOT NULL,
	LastName NVARCHAR(50) NOT NULL,
	City NVARCHAR(20) NULL
)
GO
SELECT * FROM dbo.Customer

-- ***** INSERT *****
INSERT INTO dbo.Customer (Id, FirstName, LastName, City)
VALUES (1, 'Bob', 'Bobsky', 'Skopje')

INSERT INTO dbo.Customer (Id, FirstName, LastName)
VALUES (2, 'John', 'Doe')


-- ***** DROP *****
--DROP TABLE dbo.Customer


CREATE TABLE Customer (
	Id INT IDENTITY(1,1) NOT NULL,
	FirstName NVARCHAR(30) NOT NULL,
	LastName NVARCHAR(50) NOT NULL,
	City NVARCHAR(20) NULL,
	CONSTRAINT PK_Customer_Id PRIMARY KEY CLUSTERED (Id)
)
GO

-- ***** INSERT *****
INSERT INTO dbo.Customer (FirstName, LastName, City)
VALUES ('Bob', 'Bobsky', 'Skopje'),
	   ('Petko', 'Petkovski', 'Tel Aviv'),
	   ('Greg', 'Gregski', 'Tetovo')


-- ***** ALTER *****
ALTER TABLE dbo.Customer
ALTER COLUMN FirstName nvarchar(100) NOT NULL -- update existing column
GO

ALTER TABLE dbo.Customer
ADD Age int NULL -- add new column


-- ***** SELECT *****
SELECT * FROM dbo.Customer

SELECT FirstName, LastName FROM dbo.Customer

SELECT FirstName, LastName, City 
FROM dbo.Customer
WHERE City = 'Skopje'


-- ***** UPDATE *****
UPDATE dbo.Customer
SET FirstName = 'Gregory', City = 'Bitola'
WHERE FirstName = 'Greg'
GO

UPDATE dbo.Customer
SET Age = 29
GO

-- ***** DELETE *****
--DELETE FROM dbo.Customer
--WHERE FirstName = 'Gregory'