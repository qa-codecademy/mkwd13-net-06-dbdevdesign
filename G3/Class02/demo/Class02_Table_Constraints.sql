USE [SEDC]
GO

DROP TABLE IF EXISTS [dbo].[ProductTest]
GO

CREATE TABLE [ProductTest] (
	[Id] int IDENTITY(1,1) NOT NULL,
	[Code] nvarchar(50) NULL, --CONSTRAINT UQ_ProductTest_Code UNIQUE,
	[Name] nvarchar(100) NULL,
	[Description] nvarchar(max) NULL,
	[Weight] decimal(18, 2) NULL,
	[Price] decimal(18,2) NULL,
	[Cost] decimal(18,2) NULL,
	
	CONSTRAINT [PK_ProductTest] PRIMARY KEY (Id)
)


-- ====================
-- ***** NOT NULL *****
-- Ensures that a column cannot have NULL values

ALTER TABLE ProductTest 
ALTER COLUMN [Name] nvarchar(100) NOT NULL

--INSERT INTO dbo.ProductTest (Code, Description, Weight, Price, Cost)
--VALUES ('P001', 'Laptop', 5.0, 100.00, 50.00)

INSERT INTO dbo.ProductTest (Code, Description, Weight, Price, Cost, Name)
VALUES ('P001', 'Laptop', 5.0, 100.00, 50.00, 'Gaming Laptop')


-- ====================
-- ***** UNIQUE *****
-- Ensures that all values in a column are unique (no duplicates)

ALTER TABLE ProductTest 
ADD CONSTRAINT UQ_ProductTest_Code UNIQUE (Code)

--INSERT INTO dbo.ProductTest (Code, Description, Weight, Price, Cost, Name)
--VALUES ('P001', 'Monitor', 5.0, 200.00, 150.00, 'LCD Monitor')

INSERT INTO dbo.ProductTest (Code, Description, Weight, Price, Cost, Name)
VALUES ('P002', 'Monitor', 5.0, 200.00, 150.00, 'LCD Monitor')


-- ====================
-- ***** CHECK *****
-- Ensures that values meet a specific condition

ALTER TABLE dbo.ProductTest
ADD CONSTRAINT CHK_ProductTest_Weight CHECK (Weight > 0)

--INSERT INTO dbo.ProductTest (Code, Description, Weight, Price, Cost, Name)
--VALUES ('P003', 'Speaker', 0, 200.00, 150.00, 'Bluetooth Speaker')

INSERT INTO dbo.ProductTest (Code, Description, Weight, Price, Cost, Name)
VALUES ('P003', 'Speaker', 2, 80.00, 130.00, 'Bluetooth Speaker')


-- ====================
-- ***** DEFAULT *****
-- Automatically assigns a default value if no value is provided

ALTER TABLE dbo.ProductTest
ADD CONSTRAINT DF_ProductTest_Cost DEFAULT (1.01) FOR Cost;

INSERT INTO dbo.ProductTest (Code, Description, Weight, Price, Name)
VALUES ('P004', 'Keyboard', 2, 80.00, 'Mechanical Keyboard')

SELECT * FROM dbo.ProductTest

