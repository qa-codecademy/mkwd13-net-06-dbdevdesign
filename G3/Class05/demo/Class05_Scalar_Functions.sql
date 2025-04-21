-- ==================== SCALAR FUNCTIONS ====================
-- A scalar function returns a single value (scalar) as a result.

-- Use Cases:
-- To simplify repeated logic in queries 
-- To encapsulate business logic 

-- Example: Function to return specific Employee full name
CREATE FUNCTION fn_EmployeeFullName (@EmployeeId INT)
	RETURNS NVARCHAR(300)
AS
	BEGIN
		DECLARE @Result NVARCHAR(300);

		SET @Result = 
		(SELECT e.FirstName + ' ' + e.LastName 
		FROM dbo.Employee e
		WHERE e.Id = @EmployeeId)

		RETURN @Result
	END
GO

PRINT [dbo].[fn_EmployeeFullName](45)
PRINT [dbo].[fn_EmployeeFullName](23)