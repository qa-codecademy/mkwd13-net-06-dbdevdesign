USE [SEDC]
GO

-- ============================
-- ***** PRIMARY KEYS *****
-- Uniquely identify each row in a table
-- Cannot contain NULL values
-- Each table should have **one** primary key
-- Often created on the 'Id' column (identity column)
-- Automatically creates a **unique clustered index**

-- Example:
-- CONSTRAINT [PK_Product] PRIMARY KEY (Id)

-- ============================
-- ***** FOREIGN KEYS *****
-- Used to establish a relationship between two tables
-- A Foreign Key in one table points to the Primary Key in another table
-- Prevents inserting values that do not exist in the referenced table

-- Example:
-- CONSTRAINT [FK_Order_Customer]
-- FOREIGN KEY (CustomerId) REFERENCES [Customer](Id)


-- ========= WORKSHOP 05 =========

SELECT * FROM [dbo].[BusinessEntity]
SELECT * FROM [dbo].[Customer]
SELECT * FROM [dbo].[Product]
SELECT * FROM [dbo].[Employee]
SELECT * FROM [dbo].[Order]
SELECT * FROM [dbo].[OrderDetails]

-- Foreign Keys for [Order] table

-- FK: Order => BusinessEntity
-- One-to-Many Relationship
-- One BusinessEntity can have many Orders
ALTER TABLE [dbo].[Order]
ADD CONSTRAINT FK_Order_BusinessEntity FOREIGN KEY (BusinessEntityId) REFERENCES [dbo].[BusinessEntity](Id)

-- FK: Order => Customer
-- One-to-Many Relationship
-- One Customer can place many Orders
ALTER TABLE [dbo].[Order]
ADD CONSTRAINT FK_Order_Customer FOREIGN KEY (CustomerId) REFERENCES [dbo].[Customer](Id)


-- FK: Order => Employee
-- One-to-Many Relationship
-- One Employee can handle many Orders
ALTER TABLE [dbo].[Order]
ADD CONSTRAINT FK_Order_Employee
FOREIGN KEY (EmployeeId) REFERENCES [dbo].[Employee](Id);


-- Foreign Keys for [OrderDetails] table

-- FK: OrderDetails => Order
-- One-to-Many Relationship
-- One Order can have many OrderDetails (items)
ALTER TABLE [dbo].[OrderDetails]
ADD CONSTRAINT FK_OrderDetails_Order
FOREIGN KEY (OrderId) REFERENCES [dbo].[Order](Id);

-- FK: OrderDetails => Product
-- One-to-Many Relationship
-- One Product can appear in many OrderDetails
ALTER TABLE [dbo].[OrderDetails]
ADD CONSTRAINT FK_OrderDetails_Product
FOREIGN KEY (ProductId) REFERENCES [dbo].[Product](Id);
