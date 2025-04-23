USE SEDC
GO

-- ================ RECAP - Scalar Functions ================

SELECT * FROM dbo.Employee

SELECT [dbo].[fn_EmployeeFullName](2) AS EmployeeFullName
GO

-- ===> Alter the function to return uppercased full name
CREATE OR ALTER FUNCTION [dbo].[fn_EmployeeFullName] (@EmployeeId INT)
	RETURNS NVARCHAR(300)
AS
	BEGIN
		DECLARE @Result NVARCHAR(300);

		SET @Result = 
		(SELECT e.FirstName + ' ' + e.LastName 
		FROM dbo.Employee e
		WHERE e.Id = @EmployeeId)

		RETURN UPPER(@Result)
	END
GO

DECLARE @FirstEmployeeFullName NVARCHAR(100);
SET @FirstEmployeeFullName = dbo.fn_EmployeeFullName(1);
PRINT @FirstEmployeeFullName


-- ===> Write function to insert new employee (CANNOT BE DONE WITH SCALAR FUNCTIONS!)
CREATE OR ALTER FUNCTION dbo.fn_InsertEmployee 
(
	@FirstName NVARCHAR(100),
	@LastName NVARCHAR(100),
	@DateOfBirth DATE,
	@Gender NCHAR,
	@HireDate DATE,
	@NationalIdNumber NVARCHAR(20)
)
RETURNS INT
AS
	BEGIN
		-- CANNOT MANIPULATE WITH TABLES DATA OR DEFINITION(STRUCTURE) WITH SCALAR FUNCTIONS !!!
		INSERT INTO dbo.Employee (FirstName, LastName, DateOfBirth, Gender, HireDate, NationalIdNumber)
		VALUES (@FirstName, @LastName, @DateOfBirth, @Gender, @HireDate, @NationalIdNumber)

		RETURN SCOPE_IDENTITY();
	END