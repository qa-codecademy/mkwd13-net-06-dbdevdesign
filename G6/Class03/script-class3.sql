-- Part 1 Grouping

SELECT * FROM Employee

SELECT COUNT(*) as Total
FROM dbo.Employee

SELECT Gender, COUNT(*) as Total
FROM dbo.Employee
GROUP BY Gender

--Calculate the total amount on all orders in the system
SELECT * FROM [Order]

SELECT SUM(TotalPrice) as Total
from [Order]
GO

--Calculate the total amount per BusinessEntity on all orders in the system
SELECT * FROM BusinessEntity
SELECT * FROM [Order]

SELECT BusinessEntityId, SUM(TotalPrice) as Total
From [Order]
GROUP BY BusinessEntityId

-- with join to display Name

SELECT b.Name , SUM(TotalPrice) as Total
FROM [Order] o
left join BusinessEntity b on o.BusinessEntityId = b.Id
GROUP BY b.Name
-- if we want to order them by the total
ORDER BY Total 
GO

--Calculate the total amount per BusinessEntity on all orders in the system from Customers with ID < 20
SELECT * FROM [Order]

SELECT BusinessEntityId, SUM(TotalPrice) as Total
FROM [Order] 
WHERE CustomerId < 20
GROUP By BusinessEntityId
GO


--Find the Maximal Order amount, and the Average Order amount per BusinessEntity on all orders in the system
SELECT BusinessEntityId, Max(TotalPrice) as BiggestValue, AVG(TotalPrice) as Average
FROM [Order]
GROUP BY BusinessEntityId
GO

--Part 2 Filtering Grouped Data

--Calculate the total amount per BusinessEntity on all orders in the system and filter only total orders greater than 635558
SELECT BusinessEntityId, SUM(TotalPrice) as Total
FROM [Order] 
GROUP BY BusinessEntityId
HAVING (SUM(TotalPrice) > 635558)
GO

--Calculate the total amount per BusinessEntity on all orders in the system from Customers with ID < 20 and filter only total orders less than 100000
SELECT BusinessEntityId, SUM(TotalPrice) as Total
FROM [Order] 
WHERE CustomerId < 20
GROUP By BusinessEntityId
HAVING (SUM(TotalPrice) < 100000)
GO

-- Find the Maximal Order amount, and the Average Order amount per BusinessEntity on all orders in the system. Filter only records where Total order amount is more than 4x bigger than average
SELECT BusinessEntityId, Max(TotalPrice) as Total, AVG(TotalPrice) Average
FROM [Order]
GROUP BY BusinessEntityId
HAVING MAX(TotalPrice) > 4 * AVG(TotalPrice)
GO


-- Part 3 Views

--Create new view (vv_CustomerOrders) that will List all CustomerIds and sum of total Orders per customer

DROP VIEW IF exists vv_CustomerOrder
GO

CREATE VIEW vv_CustomerOrder
AS
SELECT CustomerId, SUM(TotalPrice) as TotalPrice
FROM [Order]
GROUP BY CustomerId
GO

SELECT * FROM vv_CustomerOrder
GO

--Change the view to show Customer Names instead of CustomerId

ALTER VIEW vv_CustomerOrder
AS
SELECT c.Name as CustomerName, SUM(TotalPrice) as TotalPrice
FROM [Order] o
inner join Customer c on o.CustomerId = c.Id
GROUP BY c.Name
GO

-- Change the view to show the results ordered by the customer with biggest total price
SELECT * FROM vv_CustomerOrder
ORDER BY TotalPrice desc
GO

--Create new view (vv_EmployeeOrders) that will List all Employees (FirstName and LastName) , Product name and total quantity sold 

DROP VIEW IF exists vv_EmployeeOrders
GO


CREATE VIEW vv_EmployeeOrders
AS
SELECT e.FirstName + N' ' + e.LastName as EmployeeName, p.Name as ProductName, sum(d.Quantity) as TotalQuantity
FROM [Order] o
inner join Employee e on o.EmployeeId = e.Id
inner join OrderDetails d on d.OrderId = o.Id
inner join Product p on p.Id = d.ProductId
GROUP BY e.FirstName, e.LastName, p.Name
GO

SELECT * FROM vv_EmployeeOrders
GO

--Alter the view to show only sales from Business entities belonging to region 'Skopski'
ALTER VIEW vv_EmployeeOrders
AS
SELECT e.FirstName + N' ' + e.LastName as EmployeeName, p.Name as ProductName, sum(d.Quantity) as TotalQuantity --,b.Region
FROM [Order] o
inner join Employee e on o.EmployeeId = e.Id
inner join OrderDetails d on d.OrderId = o.Id
inner join Product p on p.Id = d.ProductId
inner join BusinessEntity b on b.Id = o.BusinessEntityId
WHERE b.Region = 'Skopski'
GROUP BY e.FirstName, e.LastName, p.Name --,b.Region
GO

SELECT * FROM vv_EmployeeOrders 
ORDER BY TotalQuantity desc
GO





