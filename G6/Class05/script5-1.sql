-- Stored procedure 1

CREATE OR ALTER PROCEDURE TestPrint
( 
	@First as int=0,
	@Second as int =1
)
AS
BEGIN
	PRINT 'First' 
	PRINT @First
	PRINT 'Second'
	PRINT @Second
END

-- Different ways of executing the procedure
EXEC TestPrint
EXEC TestPrint @First=1
EXEC TestPrint @second =10
EXEC TestPrint 10,20
EXEC TestPrint @second=50, @First=100

DECLARE	@ReturnValue int
EXEC @ReturnValue = TestPrint
SELECT	@ReturnValue as ReturnValue
GO


-- stored procedure part 2

--Create procedure for adding new customer
--As output from the procedure return the following data:
--Total number of customers starting with the same character as the new customer;
--Additionally in second resultset return how many customers already exist in the new customer region.

select * from Customer
GO

CREATE OR ALTER PROCEDURE dbo.NewCustomer
(
	@Name nvarchar(100), @AccountNumber nvarchar(50), @City nvarchar(100), @RegionName nvarchar(100), @CustomerSize nvarchar(100), @PhoneNumber nvarchar(100), @isActive bit
)
AS
BEGIN
	INSERT INTO [dbo].[Customer] ([Name], [AccountNumber], [City], [RegionName], [CustomerSize], [PhoneNumber], [isActive])
	VALUES (@Name, @AccountNumber, @City, @RegionName, @CustomerSize, @PhoneNumber, @isActive)

	select count(*) as TotalCostomersFirstLetter
	FROM [dbo].[Customer]
	where substring(Name,1,1) = substring(@Name,1,1)

	select count(*) as CustomersInRegion
	FROM [dbo].[Customer]
	where RegionName = @RegionName
END
GO

-- Test
exec dbo.NewCustomer 
	@Name = 'Zito',
	@AccountNumber = '123',
	@City  = 'Skopje',
	@RegionName ='Skopski',
	@CustomerSize = 'Large',
	@PhoneNumber = '078555555',
	@isActive = 1

delete from Customer
where AccountNumber = 123
GO



-- stored procedures part 3

/*
Create new procedure called CreateOrder
Procedure should create only Order header info (not Order details) 
Procedure should return the total number of orders in the system for the Customer from the new order (regardless the BusinessEntity)
Procedure should return second resultset with the total amount of all orders for the customer and business entity on input (regardless the BusinessEntity)
*/


select * from [Order]
select * from [OrderDetails]
GO

CREATE OR ALTER PROCEDURE dbo.CreateOrder (@OrderDate date, @BusinessEntityId int, @CustomerId int, @EmployeeId int)
AS
BEGIN
	INSERT INTO [dbo].[Order] (OrderDate, BusinessEntityId, CustomerId, EmployeeId)
	VALUES (@OrderDate, @BusinessEntityId, @CustomerId, @EmployeeId)

	select
		count(*) as TotalOrdersForCustomer
	from
		[dbo].[Order]
	where
		CustomerId = @CustomerId

	select
		sum(TotalPrice) as TotalOrderPrice
	from
		[dbo].[Order]
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
	[dbo].[Order]
order by
	Id desc
GO

delete from [Order]
where OrderDate = '2020-08-19' and CustomerId = 98



-- Second part
--------------
/*
Create new procedure called CreateOrderDetail
Procedure should add details for specific order (new record for new Product/Quantity for specific order)
Procedure should take the single price for item from Product table (Price column)
When the order detail is inserted procedure should correct the TotalPrice column in the main table (dbo.order)
Output from this procedure should be resultset with order details in a form of pairs: ProductName and TotalPrice per product (Price*Quantity)
*/

select * from [Order]
select * from [OrderDetails]
select * from Product
GO

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
		[dbo].[Product]
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
		[Order]
	set
		TotalPrice = @TotalPrice
	where
		Id = @OrderId

	-- output
	select
		p.[Name], sum(od.Quantity) as TotalQuantity, sum(od.Quantity * od.Price) as TotalPricePerProduct
	from
		[dbo].[OrderDetails] as od
		inner join [dbo].[Product] as p on od.ProductId = p.Id
	where
		od.OrderId = @OrderId
	group by
		p.[Name]
END
GO

-- test execution
-- add details to specific order
exec dbo.CreateOrderDetail @OrderId = 6, @ProductId = 1, @Quantity = 5
exec dbo.CreateOrderDetail @OrderId = 6, @ProductId = 2, @Quantity = 10
exec dbo.CreateOrderDetail @OrderId = 6, @ProductId = 2, @Quantity = 100

-- check the totals
select * from dbo.[Order] 
where id = 6


-- za output parametri primer 1

select * from product
go

drop procedure if exists uspFindProductByName
GO

CREATE OR ALTER PROCEDURE uspFindProductByName (
    @product_name varchar(100),
    @product_count INT OUTPUT,
	@Price_out decimal output
) AS
BEGIN
    SELECT 
        Name,
		Code,
        Price
    FROM
        dbo.Product
    WHERE
        Name Like '%'+@product_name +'%';

    SELECT @product_count = @@ROWCOUNT;
	-- @@ROWCOUNT -Returns the number of rows affected by the last statement. 
	set @Price_out = (select  price from product
	where Name=@product_name)
END;
go
----

DECLARE @count INT;
declare @price decimal;

EXEC uspFindProductByName 'No Sugar Added', @count output, @price output
SELECT @count AS 'Raw Bar'
select @price as Price;
go

select * from Product
GO


-- za output parametri primer 2

CREATE OR ALTER PROCEDURE usp_GetEmployeesByGender
(
	@Gender nchar(1) = 'M',
	@GenderCount int OUT
)
AS
BEGIN
	select
		*
	from
		[dbo].[Employee]
	where
		Gender = @Gender

	select
		@GenderCount = count(*)
	from
		[dbo].[Employee]
	where
		Gender = @Gender
END
GO

DECLARE
	@ReturnValue int
,	@GenderCountOut int

EXEC @ReturnValue = usp_GetEmployeesByGender @Gender = 'M', @GenderCount = @GenderCountOut OUTPUT;

SELECT @ReturnValue as ReturnValue, @GenderCountOut as GenderCountOut
GO

-- za scope identity

CREATE OR ALTER PROCEDURE dbo.usp_InsertEmployee
(
	@FirstName nvarchar(100), @LastName nvarchar(100), @DateOfBirth date, @Gender nchar(1), @HireDate date, @NationalIdNumber nvarchar(20)
,	@EmployeeID int OUT
)
AS
BEGIN
	INSERT INTO [dbo].[Employee] ([FirstName], [LastName], [DateOfBirth], [Gender], [HireDate], [NationalIdNumber])
	VALUES (@FirstName, @LastName, @DateOfBirth, @Gender, @HireDate, @NationalIdNumber)

--Scope_Identity() - Returns the last identity value inserted into an identity column in the same scope. A scope is a module: a stored procedure, function, or batch
	set @EmployeeID = Scope_Identity()

	select * from [dbo].[Employee] where ID = @EmployeeID
END
GO

DECLARE
	@ReturnValue int
,	@EmployeeIdOut int

EXEC @ReturnValue = dbo.usp_InsertEmployee
	@FirstName = 'TestName'
,	@LastName = 'TestLastName'
,	@DateOfBirth = '1900-01-01'
,	@Gender = 'M'
,	@HireDate = '1900-01-01'
,	@NationalIdNumber = '1111111'
,	@EmployeeId = @EmployeeIdOut OUT

SELECT @ReturnValue as ReturnValue, @EmployeeIdOut as EmployeeIdOut

select * from Employee