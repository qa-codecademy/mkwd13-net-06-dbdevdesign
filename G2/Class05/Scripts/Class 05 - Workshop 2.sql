CREATE OR ALTER PROCEDURE SP_CreateOrderDetail
(
	@OrderId INT,
	@ProductId INT,
	@Quantity INT
)
AS 
BEGIN
	DECLARE @Price decimal(18,2)
	DECLARE @TotalPrice decimal(18,2)

	--get the price from Products table
	SELECT @Price = Price
		FROM Products
		WHERE Id = @ProductId


	--insert new order detail
	INSERT INTO OrderDetails(OrderId, ProductId, Quantity, Price)
	VALUES(@OrderId, @ProductId, @Quantity, @Price)


	--calculate the total price
	SELECT @TotalPrice = SUM(@Quantity * @Price)
	FROM OrderDetails
	WHERE OrderId = @OrderId


	--correct the total price of the order
	UPDATE Orders 
	SET TotalPrice = @TotalPrice
	WHERE Id = @OrderId

	-- output
	SELECT p.Name, SUM(od.Quantity) AS TotalQuantity, SUM(od.Quantity * od.Price) AS TotalPricePerProduct
	FROM OrderDetails od
	INNER JOIN Products p ON od.ProductId = p.Id
	WHERE od.OrderId = @OrderId
	GROUP BY p.Name
END


EXEC SP_CreateOrderDetail @OrderId = 7, @ProductId = 10, @Quantity = 10

select * from Orders