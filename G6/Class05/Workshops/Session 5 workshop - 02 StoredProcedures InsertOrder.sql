/*
Create new procedure called CreateOrder
Procedure should create only Order header info (not Order details) 
Procedure should return the total number of orders in the system for the Customer from the new order (regardless the BusinessEntity)
Procedure should return second resultset with the total amount of all orders for the customer and business entity on input (regardless the BusinessEntity)
*/

CREATE OR ALTER PROCEDURE dbo.CreateOrder (@OrderDate date, @BusinessEntityId int, @CustomerId int, @EmployeeId int)
AS
BEGIN
	INSERT INTO [dbo].[Orders] (OrderDate, BusinessEntityId, CustomerId, EmployeeId)
	VALUES (@OrderDate, @BusinessEntityId, @CustomerId, @EmployeeId)

	select
		count(*) as TotalOrdersForCustomer
	from
		[dbo].[Orders]
	where
		CustomerId = @CustomerId

	select
		sum(TotalPrice) as TotalOrderPrice
	from
		[dbo].[Orders]
	where
		CustomerId = @CustomerId
	and BusinessEntityId = @BusinessEntityId
END
GO

-- test execution
EXEC dbo.CreateOrder @OrderDate = '2020-08-19', @BusinessEntityId = 4, @CustomerId = 98, @EmployeeId = 5
GO

select
	top (10) * 
from
	[dbo].[Orders]
order by
	Id desc
GO

-- Second part
--------------
/*
Create new procedure called CreateOrderDetail
Procedure should add details for specific order (new record for new Product/Quantity for specific order)
Procedure should take the single price for item from Product table (Price column)
When the order detail is inserted procedure should correct the TotalPrice column in the main table (dbo.order)
Output from this procedure should be resultset with order details in a form of pairs: ProductName and TotalPrice per product (Price*Quantity)
*/

CREATE OR ALTER PROCEDURE dbo.CreateOrderDetail (@OrderId int, @ProductId int, @Quantity int)
AS
BEGIN
	declare
		@Price decimal(18,2)
	,	@TotalPrice decimal(18,2)

	-- get the product price
	select
		@Price = Price 
	from
		[dbo].[Products]
	where
		Id = @ProductId

	-- insert new order detail
	INSERT INTO [dbo].[OrderDetails] ([OrderId], [ProductId], [Quantity], [Price])
	VALUES (@OrderId, @ProductId, @Quantity, @Price)

	-- calculate the total price
	select
		@TotalPrice = sum(Quantity * Price)
	from
		[dbo].[OrderDetails]
	where
		OrderId = @OrderId
	
	-- correct the total price
	update
		[Orders]
	set
		TotalPrice = @TotalPrice
	where
		Id = @OrderId

	-- output
	select
		p.[Name], sum(od.Quantity) as TotalQuantity, sum(od.Quantity * od.Price) as TotalPricePerProduct
	from
		[dbo].[OrderDetails] as od
		inner join [dbo].[Products] as p on od.ProductId = p.Id
	where
		od.OrderId = @OrderId
	group by
		p.[Name]
END
GO

-- test execution
-- add details to specific order
exec dbo.CreateOrderDetail @OrderId = 4200, @ProductId = 1, @Quantity = 5
exec dbo.CreateOrderDetail @OrderId = 4200, @ProductId = 2, @Quantity = 10

-- check the totals
select * from dbo.[Orders] 
where id = 4200