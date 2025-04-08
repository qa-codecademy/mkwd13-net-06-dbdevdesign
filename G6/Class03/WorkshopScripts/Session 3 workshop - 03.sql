/*
 Create new view (vv_CustomerOrders) that will List all 
 CustomerIds and sum of total Orders per customer
 Change the view to show Customer Names instead of CustomerId
 Change the view to show the results ordered by the customer with biggest total price

 Create new view (vv_EmployeeOrders) that will List all Employees 
 (FirstName and LastName) , 
 Product name and total quantity they sold 

 Alter the view to show only sales from Business entities belonging to region 'Skopski'
 */







drop view if exists vv_CustomerOrders;
GO

CREATE VIEW vv_CustomerOrders
AS
select CustomerId,SUM(TotalPrice) as TotalPrice
from dbo.[Orders] o
group by CustomerId
GO

ALTER VIEW vv_CustomerOrders
AS
select c.Name as CustomerName,SUM(TotalPrice) as TotalPrice
from dbo.[Orders] o
inner join dbo.Customers c on o.CustomerId = c.Id
group by c.Name
--order by SUM(TotalPrice) desc
GO




select * from vv_CustomerOrders
order by TotalPrice desc
GO
/*
 Create new view (vv_EmployeeOrders) that will List all Employees 
 (FirstName and LastName) Employee, 
 Product name 
 and total quantity they sold 

 Alter the view to show only sales from Business entities 
 belonging to region 'Skopski'
*/
CREATE OR ALTER VIEW vv_EmployeeOrders
AS 
select e.FirstName + ' ' + e.LastName as Employee, p.Name as ProductName,
sum(Quantity) as TotalQuantity
--	select * 
from dbo.[Orders] o
inner join dbo.Employees e on o.EmployeeId = e.Id
inner join dbo.OrderDetails od on o.Id = od.OrderId
inner join dbo.Products p on od.ProductId = p.Id
inner join dbo.BusinessEntities be on o.BusinessEntityId = be.Id
where be.Region = 'Skopski'
group by e.FirstName + ' ' + e.LastName, p.Name
-- vv_EmployeeOrders

select * from vv_EmployeeOrders

ALTER VIEW vv_EmployeeOrders
AS 
select e.FirstName + N' ' + e.LastName as EmployeeName, p.Name as ProductName,  sum(d.Quantity) as TotalQuantity
from dbo.[Orders] o
inner join dbo.Employees e on o.EmployeeId = e.Id
inner join dbo.OrderDetails d on d.OrderId = o.Id
inner join dbo.Products p  on p.Id = d.ProductId 
--where o.id in (1,2)
group by e.FirstName , e.LastName, p.Name
GO

select * from vv_EmployeeOrders


CREATE VIEW vv_EmployeeOrders_v3
AS 
select e.FirstName + N' ' + e.LastName as EmployeeName, p.Name as ProductName,  sum(d.Quantity) as TotalQuantity
from dbo.[Orders] o
inner join dbo.Employees e on o.EmployeeId = e.Id
inner join dbo.OrderDetails d on d.OrderId = o.Id
inner join dbo.Products p  on p.Id = d.ProductId
inner join dbo.BusinessEntities b on b.Id = o.BusinessEntityId 
where b.Region = 'Skopski'
group by e.FirstName , e.LastName, p.Name
GO


select * from vv_EmployeeOrders

select Size, STRING_AGG(Region, ';') from dbo.BusinessEntities
group by Size
having LEN(STRING_AGG(Region, ';')) < 20
