
--Calculate the total amount on all orders in the system

SELECT COUNT(*) AS TotalOrders
FROM Orders

SELECT SUM(TotalPrice) AS TotalOrderPrice
FROM Orders

-- Calculate the total amount per BusinessEntity 
-- on all orders in the system

SELECT o.CustomerId, be.Name, SUM(o.TotalPrice) AS TotalOrderPrice 
FROM Orders o
INNER JOIN BusinessEntities be
ON o.BusinessEntityId = be.Id
GROUP BY be.Name, o.CustomerId
HAVING o.CustomerId < 20


-- Find the Maximal Order amount, 
-- and the Average Order amount per 
-- BusinessEntity on all orders in the system

SELECT be.Name, MAX(o.TotalPrice) AS MaximalOrderAmount, AVG(DISTINCT o.TotalPrice) AS AverageOrderAmount
FROM Orders o
INNER JOIN BusinessEntities be
ON o.BusinessEntityId = be.Id
GROUP BY be.Name




select * from BusinessEntities

select * from Orders

select * from Customers

   




