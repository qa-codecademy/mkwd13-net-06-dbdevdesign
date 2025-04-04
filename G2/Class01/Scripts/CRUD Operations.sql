USE [master]
GO

DROP DATABASE IF EXISTS [SEDC_NEW]

CREATE DATABASE [SEDC_NEW]
GO


USE [SEDC_NEW]
GO

-- CREATE TABLE
DROP TABLE IF EXISTS Customers

CREATE TABLE [Customers] (
	[Id] [int] IDENTITY(1, 1) NOT NULL,
	[Name] [nvarchar] (100) NOT NULL, 
	[City] [nvarchar] (100) NULL,
	CONSTRAINT [PK_Customers] PRIMARY KEY ([Id])
)
GO


-- INSERT COMMAND
INSERT INTO [Customers] ([Name], [City])
VALUES ('Vero Skopje', 'Skopje')

INSERT INTO [Customers] ([Name], [City])
VALUES ('Tineks Skopje', 'Skopje')

INSERT INTO [Customers] ([Name], [City])
VALUES ('Vero Strumica', 'Strumica')

INSERT INTO [Customers] ([Name], [City])
VALUES ('Vero Bitola', 'Bitola'), 
	   ('Vero Tetovo', 'Tetovo'),
	   ('Vero Ohrid', 'Skopje')


INSERT INTO [Customers] ([Name], [City])
VALUES ('Kam-Market Skopje', 'Skopje')


-- SELECT COMMAND

SELECT *
FROM Customers

SELECT Id, [Name] 
FROM Customers


SELECT * 
FROM Customers
WHERE City = 'Skopje'


-- UPDATE COMMAND
UPDATE Customers
SET City = 'Ohrid'
WHERE Id = 6


UPDATE Customers
SET Name = 'Vero Kumanovo', City = 'Kumanovo'
WHERE Id = 2

-- DELETE COMMAND - Delete one/all records from a table
DELETE 
FROM Customers
WHERE Id = 3


-- DROP COMMAND - Deletes whole table 
DROP TABLE Customers