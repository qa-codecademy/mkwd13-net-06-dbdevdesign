USE SEDC
GO

-- ====> Example 1: Get Employees by Gender and their count
CREATE OR ALTER PROCEDURE usp_GetEmployeesByGender
(
	@Gender NCHAR = 'M',
	@GenderCount INT OUT
)
AS
	BEGIN
		SELECT * 
		FROM dbo.Employee e
		WHERE e.Gender = @Gender

		SET @GenderCount = 
		(SELECT COUNT(Id) 
		FROM dbo.Employee e
		WHERE e.Gender = @Gender)
	END
GO

DECLARE @GenderCountResult INT;

EXEC usp_GetEmployeesByGender
	@Gender = 'M',
	@GenderCount = @GenderCountResult OUT

SELECT @GenderCountResult AS 'Gender Count'
GO


-- ====> Example 2: Find Product Details (name, description, price, quantity ordered) by Product Name
-- Also return the Product price and total quantity ordered

CREATE OR ALTER PROCEDURE sp_FindProductDetailsByName
(
	@ProductName NVARCHAR(100),
	@TotalQuantityOrdered INT OUT,
	@ProductPrice DECIMAL(18, 2) OUT
)
AS
	BEGIN
		SELECT
			p.[Name] AS ProductName,
			p.[Description],
			p.Price as ProductPrice,
			SUM(od.Quantity) AS TotalQuantityOrdered
		FROM dbo.[Product] p
		JOIN dbo.OrderDetails od ON p.Id = od.ProductId
		WHERE p.[Name] LIKE '%'+ @ProductName + '%' 
		GROUP BY p.[Name], p.[Description], p.Price

		SELECT @TotalQuantityOrdered = SUM(od.Quantity) FROM dbo.[Product] p
		JOIN dbo.OrderDetails od ON p.Id = od.ProductId
		WHERE p.[Name] LIKE '%'+ @ProductName + '%' 

		SELECT @ProductPrice = p.Price 
		FROM dbo.[Product] p
		WHERE p.[Name] LIKE '%'+ @ProductName + '%' 
	END
GO

DECLARE @OrdersQuantity INT, @ProductPrice DECIMAL(18, 2)

EXEC sp_FindProductDetailsByName
	@ProductName = 'Kids Bar',
	@TotalQuantityOrdered = @OrdersQuantity OUT,
	@ProductPrice = @ProductPrice OUT

SELECT @ProductPrice as ProductPrice, @OrdersQuantity as TotalQuantityOrdered
