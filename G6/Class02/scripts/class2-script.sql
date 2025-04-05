SELECT * FROM BusinessEntity

SELECT * FROM Customer

SELECT * FROM Employee

SELECT * FROM [Order]

SELECT * FROM OrderDetails

SELECT * FROM Product


-- Part 1 Filtering
--Find all Employees with FirstName = Goran

SELECT *
FROM Employee
WHERE FirstName = 'Goran'
GO

--Find all Employees with LastName starting With ‘S’
SELECT *
FROM Employee
WHERE LastName like 'S%'
GO

--SELECT *
--FROM Employee
--WHERE LastName like 'S%ski'
--GO

--Find all Employees with DateOfBirth greater than ‘01.01.1988’
SELECT *
FROM Employee
WHERE DateOfBirth > '1988.01.01'
GO

--Find all Male employees
SELECT *
FROM Employee
WHERE Gender = 'M'
GO

--Find all employees hired in January/1998
SELECT * 
FROM Employee
WHERE HireDate >= '1998.01.01' and HireDate <= '1998.01.31'
GO

-- alternative way
--SELECT *
--FROM Employee
--WHERE HireDate BETWEEN '1998.01.01' and '1998.02.01'
--GO

--Find all Employees with FirstName starting With ‘A’ hired in January/2000

SELECT * 
FROM Employee
WHERE HireDate >= '2000.01.01' and HireDate < '2000.02.01'
and FirstName like 'A%'
GO


-- Part 2 Sorting

--Find all Employees with FirstName = Aleksandar ordered by Last Name

SELECT *
FROM Employee
WHERE FirstName = 'Aleksandar'
Order By LastName
GO

--List all Employees ordered by FirstName
SELECT * 
FROM Employee
Order by LastName
GO

--Find all Male employees ordered by HireDate, starting from the last hired
SELECT *
FROM Employee
WHERE Gender = 'M'
Order By HireDate desc
GO


-- Part 3 - Combining Data - Unions

--List all regions where we have BusinessEntities and Customers in the same time
select Region from BusinessEntity
select RegionName from Customer

SELECT Region 
FROM BusinessEntity
UNION ALL
SELECT RegionName
FROM Customer
GO

--List all regions where some BusinessEntity is based, or some Customer is based. Remove duplicates
SELECT Region 
FROM BusinessEntity
UNION
SELECT RegionName
FROM Customer
GO

--List all regions where we have BusinessEntities and Customers in the same time

SELECT Region 
FROM BusinessEntity
INTERSECT
SELECT RegionName	
FROM Customer
GO

-- PART 4 Table Constraints

--Change Products table always to insert value 1 in Price column if no price is provided on insert
ALTER TABLE Product
ADD CONSTRAINT DF_Product_Price
DEFAULT 1 FOR Price
GO

--SELECT * FROM Product

--INSERT INTO Product (Name)
--VALUES ('Chips')

--DELETE FROM Product
--WHERE Name = 'Chips'

--Change Products table to prevent inserting Price that will more than 2x bigger then the cost price

ALTER TABLE Product 
ADD CONSTRAINT CHK_Product_Price
CHECK (price <= cost*2)
GO

SELECT * FROM Product

INSERT INTO Product ([Name], Price, Cost)
VALUES ('Chips', 70, 40)

DELETE FROM Product
WHERE Name = 'Chips'
GO

--Change Products table to guarantee unique names across the products

ALTER TABLE Product
ADD CONSTRAINT UC_Product_Name
UNIQUE (Name)
GO

SELECT * FROM Product

UPDATE p set Name = 'Gluten Free New'
FROM Product p
WHERE Name = 'Gluten Free' and Id = 12
GO

UPDATE p set Name = 'Multigrain New'
FROM Product p
WHERE Name = 'Multigrain' and Id = 11
GO

--INSERT INTO Product ([Name], Price, Cost)
--VALUES ('Multigrain', 70, 40)


-- Part 5 Key Constraits


--ALTER TABLE [dbo].[Order] DROP CONSTRAINT [FK_Order_BusinessEntity];
--ALTER TABLE [dbo].[Order] DROP CONSTRAINT [FK_Order_Employee];
--ALTER TABLE [dbo].[Order] DROP CONSTRAINT [FK_Order_Customer];
--ALTER TABLE [dbo].[OrderDetails] DROP CONSTRAINT [FK_OrderDetails_Order];
--ALTER TABLE [dbo].[OrderDetails] DROP CONSTRAINT [FK_OrderDetails_Product];


ALTER TABLE [dbo].[OrderDetails] ADD CONSTRAINT [FK_OrderDetails_Order] FOREIGN KEY ([OrderId]) REFERENCES [dbo].[Order]([Id]);
ALTER TABLE [dbo].[Order] ADD CONSTRAINT [FK_Order_BusinessEntity] FOREIGN KEY ([BusinessEntityId]) REFERENCES [dbo].[BusinessEntity]([Id]);
ALTER TABLE [dbo].[Order] ADD CONSTRAINT [FK_Order_Employee] FOREIGN KEY ([EmployeeId]) REFERENCES [dbo].[Employee]([Id]);
ALTER TABLE [dbo].[Order] ADD CONSTRAINT [FK_Order_Customer] FOREIGN KEY ([CustomerId]) REFERENCES [dbo].[Customer]([Id]);
ALTER TABLE [dbo].[OrderDetails] ADD CONSTRAINT [FK_OrderDetails_Product] FOREIGN KEY ([ProductId]) REFERENCES [dbo].[Product]([Id]);


-- Part 6 Join

DROP TABLE IF EXISTS TableA;
DROP TABLE IF EXISTS TableB;

CREATE TABLE TableA (idA int);
CREATE TABLE TableB (idB int);

Insert into TableA values (1),(2) --(3)
Insert into TableB values (2),(3) --(4)

select * from TableA
select * from TableB

-- cross join

SELECT *
FROM TableA
Cross join TableB
Order By idA, idB
GO

-- inner join

SELECT * 
FROM TableA
inner join TableB On idA=idB
GO

-- left join

SELECT *
from TableA
left join TableB On idA = idB
GO

-- right join

SELECT *
from TableA
right join TableB On idA = idB
go


-- full join

SELECT *
from TableA
full join TableB On idA = idB
GO

select c.Name as CustomerName, p.Name as ProductName 
from dbo.Customer c
cross join dbo.Product p


-- List all possible combinations of Customer names and Product names that can be ordered from specific customer 
select * from Customer
select * from Product

SELECT c.Name as CustomerName, p.Name as ProductName
from Customer c
cross join Product p

--List all Business Entities that have any Order 
select * from [Order]
select * from BusinessEntity

SELECT distinct b.Name as BusinesEntity
from [Order] o
inner join BusinessEntity b on o.BusinessEntityId = b.Id

--List all Entities without orders
SELECT distinct b.Name as BuisnisEntity
FROM BusinessEntity b
left join [Order] o on b.Id = o.BusinessEntityId
where o.id is null


--List all Customers without orders (using Right Join and using Left join)

SELECT distinct c.Name 
from Customer c
left join [Order] o on o.CustomerId = c.Id
where o.CustomerId is null

SELECT distinct c.Name as CustomerName
FROM [Order] o
right join Customer c on c.Id = o.CustomerId
where o.CustomerId is null
