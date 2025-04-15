USE SEDC
GO

-- ===================== VIEWS =====================
-- => view is a virtual table whose contents are defined by a query
-- => stored queries that display data from the base tables
-- => views can be queried, updated and joined, just like regular tables

-- Usecases :
-- 1) Simplify Complex Queries (queries with multiple joins etc..)
-- 2) Restrict access only to needed data, rather than the whole data
-- 3) Performance and Readability improvements
-- 4) Mostly used for retriving data rather than manipulating


SELECT * FROM dbo.[Product] p
GO

-- ===> Example: Product Detail View 
-- we need only Name, Description, Weight from the Product table
CREATE VIEW vw_ProductDetail 
AS
SELECT 
	p.[Name], 
	p.[Description], 
	p.[Weight] 
FROM dbo.[Product] p
GO
-- NOTE: Prefixes like vw, vv are added before the name of the new View for better recognition

SELECT * FROM vw_ProductDetail
SELECT * FROM dbo.Product

-- Updating the base table Product (will affect vw_ProductDetail as well)
UPDATE dbo.[Product]
SET [Description] = 'Yummmmmmmmmmmmy'
WHERE [Name] = 'Cookies'
-- vw_ProductDetail is also updated

-- Inserting new records in the view (will affect the base table Product)
INSERT INTO dbo.vw_ProductDetail ([Name], [Description], [Weight])
VALUES ('New Product', 'New Description', 100)
-- Product table is updated (rarely used in this form)
DELETE FROM dbo.vw_ProductDetail  
WHERE Name = 'New Product'
GO


-- ===> Example: Create Order Summary View
-- Needed data:
-- Order table: Id, OrderDate, Status, TotalPrice
-- BusinessEntity table: Name
-- Employee table: Full Name (FirstName + LastName)
-- Customer table: Name

SELECT * FROM dbo.[Order] o
JOIN dbo.BusinessEntity be ON be.Id = o.BusinessEntityId
JOIN dbo.Customer c ON c.Id = o.CustomerId
JOIN dbo.Employee e ON e.Id = o.EmployeeId

DROP VIEW IF EXISTS vw_OrderSummary
GO

CREATE VIEW vw_OrderSummary AS
--ALTER VIEW vw_OrderSummary AS -- used for altering existing view
SELECT 
	o.Id as OrderId, 
	o.OrderDate, 
	o.Status as OrderStatus, 
	o.TotalPrice,
	be.Name as BusinessEntity,
	e.FirstName + ' ' + e.LastName AS EmployeeFullName,
	c.Name as CustomerName
FROM dbo.[Order] o
JOIN dbo.BusinessEntity be ON be.Id = o.BusinessEntityId
JOIN dbo.Customer c ON c.Id = o.CustomerId
JOIN dbo.Employee e ON e.Id = o.EmployeeId

-- Get All Data 
SELECT * FROM vw_OrderSummary

-- NOTE: The columns in the view are created with the names of the aliases
SELECT os.BusinessEntity, os.CustomerName, os.TotalPrice FROM vw_OrderSummary os

SELECT os.BusinessEntity, SUM(os.TotalPrice) as TotalPrice FROM vw_OrderSummary os
GROUP BY os.BusinessEntity


INSERT INTO dbo.vw_OrderSummary (BusinessEntity, CustomerName)
VALUES('Test Entity', 'Test Customer')
GO -- ERROR!
-- NOTE: View is not updatable if the modification affects multiple base tables !!!