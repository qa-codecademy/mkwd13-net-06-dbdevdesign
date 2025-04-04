
-- AGGREGATE FUNCTIONS


-- ****** COUNT()

SELECT COUNT(*) AS TotalOrders 
FROM Orders

SELECT COUNT(RegionName) AS CustomerRegionNames
FROM Customers

SELECT COUNT(DISTINCT RegionName) AS [Customer Unique Region Names]
FROM Customers



-- ****** SUM()
SELECT SUM(Cost) AS TotalProductsCost
FROM Products



SELECT SUM(Weight) AS TotalProductsWeight
FROM Products


SELECT SUM(Weight) AS ProductsWeithBetweenRange
FROM Products
WHERE Weight BETWEEN 10 AND 100


-- ******** AVG()
SELECT AVG(DISTINCT Price) AS DistinctProductsAveragePrice
FROM Products


-- ****** MIN()
SELECT MIN(HireDate) AS FirstEmployeed
FROM Employees



-- ****** MAX()
SELECT MAX(HireDate) AS LastEmployeed
FROM Employees



-- ****** STRING_AGG()
SELECT STRING_AGG(FirstName, ', ') as EmployeesNames
FROM Employees


SELECT GETDATE() AS CurrentDate


select * from Customers

select * from Employees

select * from Products






