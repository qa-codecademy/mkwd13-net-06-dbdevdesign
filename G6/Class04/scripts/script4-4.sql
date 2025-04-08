-- Scalar Functions

CREATE FUNCTION dbo.fn_EmployeeFullName (@EmployeeID int)
RETURNS NVARCHAR(200)
AS
BEGIN

DECLARE @Result nvarchar(200)

SELECT @Result = e.FirstName + N' ' + e.LastName
FROM Employee e
WHERE Id = @EmployeeID

RETURN @Result

END
GO

-- how to call the scalar function

SELECT dbo.fn_EmployeeFullName(70)