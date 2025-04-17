IF OBJECT_ID('sp_CreateOrderDetails', 'P') IS NOT NULL
	DROP PROCEDURE sp_CreateOrderDetails
GO

CREATE OR ALTER PROCEDURE sp_CreateOrderDetails (@OrderId INT, @ProductId INT, @Quantity INT)
AS
BEGIN
	DECLARE @SingleProductItemPrice decimal(18,2)
	DECLARE @TotalPrice decimal(18,2)

	--get product price
	SELECT @SingleProductItemPrice = Price
							FROM Products
							WHERE Id = @ProductId

	BEGIN TRY
		INSERT INTO OrderDetails (OrderId, ProductId, Quantity, Price)
		VALUES (@OrderId, @ProductId, @Quantity, @SingleProductItemPrice)
	END TRY
	BEGIN CATCH
		SELECT  ERROR_NUMBER() AS ErrorNumber,
				ERROR_SEVERITY() AS ErrorSeverity,
				ERROR_STATE() AS ErrorState,
				ERROR_MESSAGE() AS ErrorMessage,
				ERROR_LINE() AS ErrorLine
	END CATCH

	--Calculate the total price
	SET @TotalPrice = (
		SELECT SUM(Quantity * Price)
		FROM OrderDetails
		WHERE OrderId = @OrderId
	)

	UPDATE o SET TotalPrice = @TotalPrice
			 FROM Orders o
			 WHERE Id = @OrderId


	-- output
	SELECT p.Name, p.Price, SUM(od.Quantity) AS TotalQuantity, SUM(od.Quantity * od.Price) AS TotalPricePerProduct
	FROM OrderDetails od
	INNER JOIN Products p ON od.ProductId = p.Id
	WHERE od.OrderId = @OrderId
	GROUP BY p.Name, p.Price
END


EXEC dbo.sp_CreateOrderDetails @OrderId = 5, @ProductId = 90, @Quantity = 4


select * from Products