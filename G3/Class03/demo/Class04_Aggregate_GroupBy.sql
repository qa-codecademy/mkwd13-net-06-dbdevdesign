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
