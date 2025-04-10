CREATE OR ALTER PROCEDURE SP_CreateOrder
(
	@Status SMALLINT,
	@BusinessEntityId INT,
	@CustomerId INT,
	@EmployeeId INT,
	@TotalPrice decimal(18,2),
	@Comment NVARCHAR(MAX)
)
AS
BEGIN
	INSERT INTO Orders (OrderDate, Status, BusinessEntityId, CustomerId, EmployeeId, TotalPrice, Comment)
	VALUES(GETDATE(), @Status, @BusinessEntityId, @EmployeeId, @CustomerId, @TotalPrice, @Comment)

	SELECT COUNT(*)
	FROM Orders
	WHERE CustomerId = @CustomerId

	SELECT SUM(TotalPrice)
	FROM Orders
	WHERE CustomerId = @CustomerId AND BusinessEntityId = @BusinessEntityId
END


EXEC SP_CreateOrder 
	0,
	2,
	4,
	5,
	100,
	'Test comment'