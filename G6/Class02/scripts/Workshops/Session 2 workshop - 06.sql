/*
List all possible combinations of Customer names and Product names that can be ordered from specific customer
List all Business Entities that has any order 
List all Entities without orders
List all Customers without orders (using Right Join)
*/


select c.Name as CustomerName, p.Name as ProductName
from dbo.Customers c
cross join dbo.Products p
GO

select DISTINCT b.Name
from dbo.[Orders] o
inner join dbo.BusinessEntities b on b.Id = o.BusinessEntityId
GO

select DISTINCT b.Name
from dbo.BusinessEntities b
left join dbo.[Orders] o on b.Id = o.BusinessEntityId
where o.BusinessEntityId is null
GO

-- Customers without orders - RIGHT
select c.*
from dbo.[Orders] o
right join dbo.Customers c on o.CustomerId = c.Id
where o.CustomerId is null

-- right can be writen with Left as well
select c.*
from dbo.Customers c 
left join dbo.[Orders] o on o.CustomerId = c.Id
where o.CustomerId is null

