-- Inline table valued function

DROP FUNCTION IF EXISTS dbo.fn_EmployeeDetails_Inline
GO

CREATE FUNCTION dbo.fn_EmployeeDetails_Inline (@EmployeeID int) 
RETURNS TABLE
AS
	RETURN
	SELECT id, FirstName, LastName, DateOfBirth
	FROM Employee
	WHERE Id = @EmployeeID
GO

SELECT * from dbo.fn_EmployeeDetails_Inline(10)

-- multy statment table valued functions

DROP FUNCTION IF EXISTS dbo.fn_EmployeeDetails_MultyStatement  
GO

CREATE FUNCTION dbo.fn_EmployeeDetails_MultyStatement (@EmployeeId int)
RETURNS @output TABLE (id int, FirstName nvarchar(100), LastName nvarchar(100), DateOfBirth date)
AS
BEGIN
	INSERT INTO @output
	SELECT Id, FirstName, LastName, DateOfBirth
	FROM Employee
	WHERE Id = @EmployeeId and Gender = 'M'
	RETURN
END
GO

SELECT * FROM dbo.fn_EmployeeDetails_MultyStatement(9)
GO

