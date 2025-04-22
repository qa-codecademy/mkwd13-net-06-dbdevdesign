-- ============== Create the database ============== 
USE [master]

IF NOT EXISTS (SELECT [Name] FROM sys.databases WHERE [Name] = 'PizzaAppDB')
BEGIN
	CREATE DATABASE PizzaAppDB
END
GO

USE [PizzaAppDB]
GO

-- ============== Create the tables ============== 

-- ===> TABLE: User
CREATE TABLE [User] (
	Id INT NOT NULL IDENTITY(1, 1) PRIMARY KEY CLUSTERED,
	FirstName NVARCHAR(100) NOT NULL,
	LastName NVARCHAR(100) NOT NULL,
	[Address] NVARCHAR(255) NOT NULL,
	Phone NVARCHAR(255) NOT NULL
);
GO

-- ===> TABLE: Order
CREATE TABLE [Order] (
	Id INT NOT NULL IDENTITY(1, 1) PRIMARY KEY CLUSTERED,
	TotalPrice DECIMAL(7, 2) NOT NULL,
	IsDelivered BIT NOT NULL DEFAULT 0,
	UserId INT NOT NULL,

	CONSTRAINT FK_Order_User_UserId FOREIGN KEY (UserId) REFERENCES [User](Id)
)
GO

-- ===> TABLE: Pizza
CREATE TABLE Pizza (
	Id INT NOT NULL IDENTITY(1, 1) PRIMARY KEY CLUSTERED,
	[Name] NVARCHAR(100) NOT NULL,
	Price DECIMAL(6, 2) NOT NULL,
	[Description] NVARCHAR(500) NULL
);
GO

-- ===> TABLE: Topping
CREATE TABLE Topping (
	Id INT NOT NULL IDENTITY(1, 1) PRIMARY KEY CLUSTERED,
	[Name] NVARCHAR(100) NOT NULL,
	Price DECIMAL(6, 2) NOT NULL,
);
GO

-- ===> TABLE: PizzaTopping
CREATE TABLE PizzaTopping (
	-- Id INT NOT NULL IDENTITY(1, 1) PRIMARY KEY CLUSTERED,
	PizzaId INT NOT NULL,
	ToppingId INT NOT NULL,
	-- using Composite Primary Key instead 
	CONSTRAINT PK_PizzaTopping PRIMARY KEY CLUSTERED (PizzaId, ToppingId),
	CONSTRAINT FK_PizzaTopping_Pizza_PizzaId FOREIGN KEY (PizzaId) REFERENCES Pizza(Id),
	CONSTRAINT FK_PizzaTopping_Topping_ToppingId FOREIGN KEY (ToppingId) REFERENCES Topping(Id),
);
GO
/*  
	===> NOTE:
	===> Composite primary key is a primary key made up of two or more columns. Together, these columns uniquely identify each record in the table.
	===> We're using a composite primary key (PizzaId, ToppingId) instead of a separate Id column to:
		- Ensure uniqueness of each pizza-topping combination
		- Avoid unnecessary surrogate keys
		- Reflect the natural relationship more accurately
*/
--INSERT INTO PizzaTopping (PizzaId, ToppingId) VALUES (1, 2)
--INSERT INTO PizzaTopping (PizzaId, ToppingId) VALUES (1, 2)

-- ===> TABLE: PizzaSize
CREATE TABLE PizzaSize (
	Id INT NOT NULL IDENTITY(1, 1) PRIMARY KEY CLUSTERED,
	[Name] NVARCHAR(50) NOT NULL,
);
GO

-- ===> TABLE: PizzaOrderItem
CREATE TABLE PizzaOrderItem (
	Id INT NOT NULL IDENTITY(1, 1) PRIMARY KEY CLUSTERED,
	OrderId INT NOT NULL,
	PizzaId INT NOT NULL,
	PizzaSizeId INT NOT NULL,
	Quantity INT NOT NULL CHECK(Quantity > 0),
	Price DECIMAL(6, 2) NOT NULL,

	CONSTRAINT FK_PizzaOrderItem_Order_OrderId FOREIGN KEY (OrderId) REFERENCES [Order](Id),
	CONSTRAINT FK_PizzaOrderItem_Pizza_PizzaId FOREIGN KEY (PizzaId) REFERENCES [Pizza](Id),
	CONSTRAINT FK_PizzaOrderItem_PizzaSize_PizzaSizeId FOREIGN KEY (PizzaSizeId) REFERENCES PizzaSize(Id),
);
GO
