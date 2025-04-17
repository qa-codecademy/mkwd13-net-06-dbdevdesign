CREATE OR ALTER PROCEDURE dbo.CreateOrderDetail (@OrderId int, @ProductId int, @Quantity int)
AS 

DECLARE @Price decimal(18,9)
DECLARE @TotalPrice decimal(18,9)

BEGIN TRY
	SELECT @Price = Price
	FROM dbo.Products
	WHERE Id = @ProductId

	INSERT INTO dbo.OrderDetails([OrderId], ProductId, Quantity, Price)
	VALUES (@OrderId, @ProductId, @Quantity, @Price)
END TRY
BEGIN CATCH 
 SELECT  
     ERROR_NUMBER() AS ErrorNumber  
    ,ERROR_SEVERITY() AS ErrorSeverity  
    ,ERROR_STATE() AS ErrorState  
    ,ERROR_PROCEDURE() AS ErrorProcedure  
    ,ERROR_LINE() AS ErrorLine  
    ,ERROR_MESSAGE() AS ErrorMessage;  
END CATCH

SET @TotalPrice = (
    SELECT SUM(Quantity * Price)
	FROM dbo.OrderDetails OD
	WHERE @OrderId = OD.OrderId
)

UPDATE O SET TotalPrice = @TotalPrice
FROM Orders O
WHERE Id = @OrderId


EXECUTE dbo.CreateOrderDetail @OrderId = 123214132, @ProductId = 4, @Quantity = 3