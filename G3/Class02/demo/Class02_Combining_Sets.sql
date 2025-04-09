-- ***** UNION *****
-- Combines the results of two or more SELECT queries
-- Removes duplicates by default
-- NOTE: All SELECT statements must have the same number of columns and compatible data types

-- Example 1: List all unique names from Customers and Employees
SELECT [FirstName] FROM dbo.Employee
UNION
SELECT [Name] FROM dbo.Customer

-- Example 2: List all unique cities and regions from Customer
SELECT City FROM dbo.Customer
UNION
SELECT RegionName FROM dbo.Customer


-- ***** UNION ALL *****
-- Similar to UNION
-- Keeps all duplicate values

-- Example 1: List all names from Customers and Employees including duplicates
SELECT Name FROM Customer
UNION ALL
SELECT FirstName FROM Employee;

-- Example 2: List all cities and regions from Customer
SELECT City FROM Customer
UNION ALL
SELECT RegionName FROM Customer;
GO


-- ***** INTERSECT *****
--Returns only the rows that appear in both SELECT query results
--Removes duplicates (like UNION)
--Columns must match in number and data type

-- Example 1: List all product IDs that exist in both Product table and OrderDetails (i.e. products that have been ordered)
SELECT Id FROM dbo.Product
INTERSECT
SELECT ProductId FROM dbo.OrderDetails

-- ==== WORKSHOP 03 ====
-- List all regions where we have BusinessEntities and Customers in the same time

SELECT Region FROM dbo.BusinessEntity
INTERSECT
SELECT RegionName FROM dbo.Customer