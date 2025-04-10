USE [master]
GO

DROP DATABASE IF EXISTS [SEDC]
GO

CREATE DATABASE [SEDC]
GO

USE [SEDC]
GO

DROP TABLE IF EXISTS [dbo].[OrderDetails]
DROP TABLE IF EXISTS [dbo].[Order]
DROP TABLE IF EXISTS [dbo].[BusinessEntity]
DROP TABLE IF EXISTS [dbo].[Customer]
DROP TABLE IF EXISTS [dbo].[Employee]
DROP TABLE IF EXISTS [dbo].[Product]
GO

-- CREATING TABLES

-- BusinessEntity Table
CREATE TABLE [dbo].[BusinessEntity](
	[Id] int IDENTITY(1,1) NOT NULL,
	[Name] nvarchar(100) NULL,
	[Region] nvarchar(1000) NULL,
	[Zipcode] nvarchar(10) NULL,
	[Size] nvarchar(10) NULL,
	
	CONSTRAINT [PK_BusinessEntity] PRIMARY KEY (Id)
)

-- Employee Table
CREATE TABLE Employee (
	[Id] int IDENTITY(1,1) NOT NULL,
	[FirstName] nvarchar(100) NOT NULL,
	[LastName] nvarchar(100) NOT NULL,
	[DateOfBirth] date NULL, 
	[Gender] nchar(1) NULL, -- 'F' / 'M'
	[HireDate] date NULL,
	[NationalIdNumber] nvarchar(20) NULL
	
	CONSTRAINT [PK_Employee] PRIMARY KEY (Id)
)

-- Product Table
CREATE TABLE [Product] (
	[Id] int IDENTITY(1,1) NOT NULL,
	[Code] nvarchar(50) NULL,
	[Name] nvarchar(100) NULL,
	[Description] nvarchar(max) NULL,
	[Weight] decimal(18, 2) NULL,
	[Price] decimal(18,2) NULL,
	[Cost] decimal(18,2) NULL,
	
	CONSTRAINT [PK_Product] PRIMARY KEY (Id)
)

-- Customer Table
CREATE TABLE [dbo].[Customer] (
	[Id] int IDENTITY(1,1) NOT NULL,
	[Name] nvarchar(100) NOT NULL,
	[AccountNumber] nvarchar(100) NULL,
	[City] nvarchar(100) NULL,
	[RegionName] nvarchar(100) NULL,
	[CustomerSize] nvarchar(10) NULL,
	[PhoneNumber] nvarchar(20) NULL,
	[IsActive] bit NOT NULL,

	CONSTRAINT [PK_Customer] PRIMARY KEY (Id)
)

-- Order Table
CREATE TABLE [Order](
	[Id] bigint IDENTITY(1,1) NOT NULL,
	[OrderDate] date NULL,
	[Status] smallint NULL,
	[BusinessEntityId] int NULL,
	[CustomerId] int NULL,
	[EmployeeId] int NULL,
	[TotalPrice] decimal(18,2) NULL,
	[Comment] nvarchar(max) NULL
	
	CONSTRAINT [PK_Order] PRIMARY KEY (Id)
)

-- OrderDetails Table
CREATE TABLE OrderDetails(
	[Id] int IDENTITY(1,1) NOT NULL,
	[OrderId] bigint NULL,
	[ProductId] int NULL,
	[Quantity] int NULL,
	[Price] decimal(18,2) NULL,
	
	CONSTRAINT [PK_OrderDetails] PRIMARY KEY (Id)
)

GO