USE SEDC
GO

-- ===================== AGGREGATE FUNCTIONS =====================
-- perform calculations on a set of values and return a single value

-- *** COUNT ***
SELECT * FROM [dbo].[Employee]

-- ===> Example: Total number of employees
SELECT COUNT(*) as [TotalNumberOfEmployees] FROM dbo.Employee
SELECT COUNT(Id) as [TotalNumberOfEmployees] FROM dbo.Employee

-- ===> Example: Total number of employees named Aleksandar
SELECT COUNT(Id) as [TotalNumberOfEmployees named Aleksandar] 
FROM dbo.Employee e
WHERE e.FirstName = 'Aleksandar'

-- *** SUM ***
SELECT * FROM dbo.[Order]
-- ===> Example: Total orders price
SELECT SUM(o.TotalPrice) as PriceOfAllOrders FROM dbo.[Order] o

-- *** AVG ***
-- ===> Example: Average order price
SELECT AVG(o.TotalPrice) as AverageOrderPrice FROM dbo.[Order] as o

-- *** MIN ***
-- ===> Example: Cheapest product price
SELECT MIN(o.TotalPrice) as CheapestOrderPrice FROM dbo.[Order] as o

-- *** MAX ***
-- ===> Example: Most expensive order
SELECT MAX(o.TotalPrice) as MostExpensiveOrderPrice FROM dbo.[Order] as o

-- *** STRING_AGG ***
-- combining multiple string values from rows into a single concatenated string (ex. comma-separated lists)
-- ===> Example: comma-separated names of business entities
SELECT be.Name FROM dbo.BusinessEntity be

SELECT STRING_AGG(be.[Name], ', ') as [Business Entities Names]  FROM dbo.BusinessEntity be


SELECT * FROM [dbo].[BusinessEntity]
SELECT * FROM [dbo].[Order]

-- ===> Example: Total sum of orders by Business Entity (BAD EXAMPLE, missing GROUP BY clause)
SELECT be.Name, SUM(o.TotalPrice) FROM dbo.BusinessEntity be
JOIN dbo.[Order] o ON be.Id = o.BusinessEntityId
WHERE be.Name = 'Vitalia Bitola'


-- ===================== GROUPING (GROUP BY) =====================

-- GROUPING => used to organize data into groups based on one or more columns using the 'GROUP BY' clause

-- ===> Example: Total sum of orders by Business Entity
SELECT be.Name, SUM(o.TotalPrice) FROM dbo.[Order] o 
JOIN dbo.BusinessEntity be ON be.Id = o.BusinessEntityId

SELECT be.Name, SUM(o.TotalPrice) FROM dbo.[Order] o 
JOIN dbo.BusinessEntity be ON be.Id = o.BusinessEntityId
GROUP BY be.Name

-- ===> Example: Count of employees by gender
SELECT COUNT(Id) as MaleEmployeesCount FROM dbo.Employee e
WHERE e.Gender = 'M'
SELECT COUNT(Id) as FemaleEmployeesCount FROM dbo.Employee e
WHERE e.Gender = 'F'

SELECT e.Gender, COUNT(Id) FROM dbo.Employee e
GROUP BY e.Gender

-- ===> Example: Count of Customer orders by region
SELECT c.RegionName as Region, '-', COUNT(c.Id) as OrdersCount FROM dbo.Customer c
INNER JOIN dbo.[Order] o ON c.Id = o.CustomerId
GROUP BY c.RegionName

-- ===> Example: Count of Customer orders by region and city
SELECT c.RegionName as Region, c.City, COUNT(c.Id) as OrdersCount FROM dbo.Customer c
INNER JOIN dbo.[Order] o ON c.Id = o.CustomerId
GROUP BY c.RegionName, c.City


-- ===================== Filtering the Grouped Data with *HAVING* =====================

-- ===> Example: Count of orders by region (without Skopski region)
SELECT c.RegionName as Region, COUNT(c.Id) as OrdersCount FROM dbo.Customer c
INNER JOIN dbo.[Order] o ON c.Id = o.CustomerId
GROUP BY c.RegionName
WHERE c.RegionName <> 'Skopski' -- ERROR! We cannot use WHERE after GROUP BY clause

SELECT c.RegionName as Region, COUNT(c.Id) as OrdersCount FROM dbo.Customer c
INNER JOIN dbo.[Order] o ON c.Id = o.CustomerId
WHERE c.RegionName <> 'Skopski' 
GROUP BY c.RegionName

-- ===> Example: Count of orders by region with orders count above 500
SELECT c.RegionName as Region, COUNT(c.Id) as OrdersCount FROM dbo.Customer c
INNER JOIN dbo.[Order] o ON c.Id = o.CustomerId
WHERE COUNT(c.Id) >= 500 -- ERROR! We cannot use Aggregate Functions in WHERE clause
GROUP BY c.RegionName

SELECT c.RegionName as Region, COUNT(c.Id) as OrdersCount FROM dbo.Customer c
INNER JOIN dbo.[Order] o ON c.Id = o.CustomerId
GROUP BY c.RegionName
HAVING COUNT(c.Id) >= 500

-- ===> Example: Total order price by Business Entity with total price over 1 million
SELECT be.Name as BusinessEntityName, SUM(o.TotalPrice) as OrdersTotal FROM dbo.[Order] o
JOIN dbo.BusinessEntity be ON o.BusinessEntityId = be.Id
GROUP BY be.Name
HAVING SUM(o.TotalPrice) > 1000000