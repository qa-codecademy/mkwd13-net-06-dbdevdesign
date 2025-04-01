use [SEDC-2025-test]


select * from Customer

select * from Product

CREATE DATABASE [SEDC-2025-test]

DROP DATABASE [SEDC-2025-test]


CREATE TABLE [Customer1](
	[Id] [nvarchar](100) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[City] [nvarchar](20) NULL,
	[Number of Employees] [nvarchar](100) NULL
)


DROP TABLE [Customer1]

ALTER TABLE Customer1 ALTER COLUMN Id int


INSERT INTO Customer1(Id, Name, City, [Number Of Employees])
VALUES(1, 'Kam', 'Skopje', 40)

INSERT INTO Customer1
VALUES(2, 'Tinex', 'Skopje', 70)

INSERT INTO Customer1(Id, Name, City)
VALUES(3, 'Stokomak', 'Veles')

INSERT INTO Customer1(Name, City)
VALUES('Stokomak', 'Veles')



SELECT * FROM Customer1


drop table dbo.Customer
-- CREATE
CREATE TABLE [Customer](
[Id] [int] IDENTITY(1,1) NOT NULL,
[Name] [nvarchar](100) NOT NULL,
[City] [nvarchar](100) NULL,
[Number of Employees] [nvarchar](100) NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
[Id] ASC
))
GO

INSERT INTO Customer (Name, City)
VALUES('Vero', 'Skopje')

INSERT INTO Customer (Name, City)
VALUES('Tinex', 'Bitola')

SELECT * FROM Customer


UPDATE Customer SET NAME = 'Vero1', City = 'Ohrid'
WHERE Name = 'Vero1'


DELETE FROM Customer
WHERE City = 'Bitola'

SELECT * FROM Customer