/*
	Create new procedure called CreateOrder
	Procedure should create only Order header info (not Order details) 
	Procedure should return the total number of orders in the system for the Customer from the new order (regardless the BusinessEntity)
	Procedure should return second resultset with the total amount of all orders for the customer and business entity on input (regardless the BusinessEntity)
*/
CREATE PROCEDURE dbo.sp_CreateOrder (
	@BusinessEntityId INT,
	@CustomerId INT,
	@EmployeeId INT,
	@Comment NVARCHAR(MAX)
)
AS
BEGIN
	INSERT INTO [dbo].[Order] ([OrderDate],[Status],[BusinessEntityId],[CustomerId],[EmployeeId],[TotalPrice],[Comment])
	VALUES (GETDATE(),0,@BusinessEntityId,@CustomerId,@EmployeeId,0,@Comment)

	SELECT COUNT(*) CustomerTotalOrders
	FROM [Order]
	WHERE CustomerId = @CustomerId

	SELECT SUM(o.TotalPrice) AS TotalPrice
	FROM [Order] o
	WHERE o.CustomerId = @CustomerId
		AND o.BusinessEntityId = @BusinessEntityId
END
GO

/*
	Create new procedure called CreateOrderDetail
	Procedure should add details for specific order (new record for new Product/Quantity for specific order)
	Procedure should take the single price for item from Product table (Price column)
	When the order detail is inserted procedure should correct the TotalPrice column in the main table (dbo.order)
	Output from this procedure should be resultset with order details in a form of pairs: ProductName and TotalPrice per product (Price*Quantity)
*/
CREATE PROCEDURE dbo.sp_CreateOrderDetails (
	@OrderId INT,
	@ProductId INT,
	@Quantity INT
)
AS
BEGIN
	DECLARE @ProductPrice INT

	SELECT @ProductPrice = Price
	FROM Product
	WHERE Id = @ProductId

	INSERT INTO [dbo].[OrderDetails] ([OrderId],[ProductId],[Quantity],[Price])
	VALUES (@OrderId,@ProductId,@Quantity,@Quantity * @ProductPrice)

	UPDATE [Order]
	SET TotalPrice = TotalPrice + (@Quantity * @ProductPrice)
	WHERE Id = @OrderId
	
	SELECT 
		p.[Name],
		CONVERT(NVARCHAR, od.Quantity) + N'X' + 
		CONVERT(NVARCHAR, p.Price) + N'=' + 
		CONVERT(NVARCHAR, od.Quantity * p.Price)
	FROM OrderDetails od
	INNER JOIN Product p ON od.ProductId = p.Id
	WHERE od.OrderId = @OrderId

	SELECT OrderDate, TotalPrice
	FROM [Order]
	WHERE Id = @OrderId
END
GO