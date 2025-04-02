USE [master]
GO
IF EXISTS (SELECT name FROM sys.databases WHERE name = N'SEDC')
	ALTER DATABASE [SEDC] SET  SINGLE_USER WITH ROLLBACK IMMEDIATE
GO
USE [Master]
GO
DROP DATABASE IF EXISTS [SEDC]
GO
CREATE DATABASE [SEDC]
GO
USE [SEDC]
GO

--drop table dbo.Customer
-- CREATE
CREATE TABLE [Customer](
[Id] [int] IDENTITY(1,1) NOT NULL,
[Name] [nvarchar](100) NOT NULL,
[City] [nvarchar](100) NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
[Id] ASC
))
GO


select [Name], [City] from dbo.Customer
-- INSERT
INSERT INTO [Customer] ([Name], [City])
VALUES  ('Vero Skopje', 'Skopje')

INSERT INTO [Customer] ([Name], [City])
VALUES  ('Tineks Skopje', 'Skopje')

INSERT INTO [Customer] ([Name], [City])
VALUES  ('Vero Strumica', 'Strumica')

INSERT INTO [Customer] ([Name], [City])
VALUES  ('Vero Kumanovo', 'Kumanovo'), ('Vero Tetovo', 'Tetovo'), ('Vero Ohrid', 'Ohrid')

-- SELECT
SELECT * FROM Customer

SELECT ID, Name, City
FROM Customer

SELECT ID, Name, City
FROM Customer
WHERE City = 'Skopje'

-- UPDATE
--UPDATE Customer SET Name = 'Vero Bitola', City = 'Bitola'
UPDATE Customer SET Name = 'Vero Bitola', City = 'Bitola'
WHERE Name = 'Vero Skopje'

-- DELETE
DELETE 
FROM Customer
WHERE Name = 'Vero Skopje'

-- DROP
DROP TABLE Customer





