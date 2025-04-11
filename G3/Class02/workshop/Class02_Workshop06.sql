USE SEDC
GO

--List all possible combinations of Customer names and Product names that can be ordered from specific customer 
SELECT * FROM dbo.Customer
SELECT * FROM dbo.Product

SELECT c.Name AS [CustomerName], p.Name AS [Product Name] FROM dbo.Customer c 
CROSS JOIN dbo.[Product] p

--List all Business Entities that have any Order 
SELECT * FROM dbo.BusinessEntity
SELECT * FROM dbo.[Order]

SELECT DISTINCT be.* FROM dbo.BusinessEntity be
JOIN dbo.[Order] o ON o.BusinessEntityId = be.Id

--List all Entities without orders

--List all Customers without orders (using Right Join and using Left join)
-- 1) Using RIGHT join
-- 2) Using LEFT join
