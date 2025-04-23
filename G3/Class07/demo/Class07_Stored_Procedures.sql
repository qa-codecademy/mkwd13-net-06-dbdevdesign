USE SEDC
GO

-- ================ STORED PROCEDURES ================

-- ============== Scalar Functions vs Stored Procedures  ==============

-- *** Scalar Functions ***
-- The only statement that we can use is SELECT 
-- Must return a single value
-- Cannot modify tables data, nor tables definitions (structure)
-- Primarily used for data transformation and calculation within SQL queries

-- *** Stored Procedures ***
-- Can manipulate with both tables data and tables definitions (structure) and even create new db objects 
-- All statements can be used (SELECT, DROP, ALTER, CREATE, DELETE, INSERT, UPDATE etc...)
-- Doesn't need to return value
-- Can return multiple values
-- More suitable for complex operations and PERFORMANCE IMPROVEMENTS* (important takeaway)


-- ====> Example: Return all Employees
CREATE OR ALTER PROCEDURE usp_GetAllEmployees
AS
	BEGIN
		SELECT * FROM dbo.Employee
	END
GO

EXECUTE [dbo].[usp_GetAllEmployees]
EXEC [dbo].[usp_GetAllEmployees]


-- ====> Example: Get Employee by Id
CREATE OR ALTER PROCEDURE usp_GetEmployeeById
	@EmployeeId INT
AS
	BEGIN
		SELECT * 
		FROM dbo.Employee e 
		WHERE e.Id = @EmployeeId
	END
GO

-- ==> Calling usp_GetEmployeeById 
EXEC usp_GetEmployeeById 10
-- ==> using named argument (BETTER WAY)
EXEC usp_GetEmployeeById @EmployeeId = 32

--EXEC usp_GetEmployeeById 1, 2 -- ERROR !


-- ====> Example: Insert new Employee 
CREATE OR ALTER PROCEDURE dbo.usp_InsertEmployee 
(
	@FirstName NVARCHAR(100),
	@LastName NVARCHAR(100),
	@DateOfBirth DATE,
	@Gender NCHAR,
	@HireDate DATE,
	@NationalIdNumber NVARCHAR(20)
)
AS
	BEGIN
		INSERT INTO dbo.Employee (FirstName, LastName, DateOfBirth, HireDate, Gender, NationalIdNumber)
		VALUES(@FirstName, @LastName, @DateOfBirth, @HireDate, @Gender, @NationalIdNumber)

		SELECT * FROM dbo.Employee ORDER BY Id DESC
	END
GO

EXEC usp_InsertEmployee 
	@FirstName = 'TEST NAME',
	@LastName = 'TEST LAST NAME',
	@NationalIdNumber = '123123123',
	@Gender = 'M',
	@HireDate = '2000-01-01',
	@DateOfBirth = '1980-01-01'
	-- when using named arguments, the order doesn't metter
GO


-- ====> Alter the usp_InsertEmployee procedure to Return the Id of the new Employee

CREATE OR ALTER PROCEDURE dbo.usp_InsertEmployee 
(
	@FirstName NVARCHAR(100),
	@LastName NVARCHAR(100),
	@DateOfBirth DATE,
	@Gender NCHAR,
	@HireDate DATE,
	@NationalIdNumber NVARCHAR(20),
	@EmployeeId INT OUT
	--@EmployeeId INT OUTPUT
	-- using the OUT(OUTPUT) we set the parameters that we are going to use as return values
)
AS
	BEGIN
		INSERT INTO dbo.Employee (FirstName, LastName, DateOfBirth, HireDate, Gender, NationalIdNumber)
		VALUES(@FirstName, @LastName, @DateOfBirth, @HireDate, @Gender, @NationalIdNumber)

		SET @EmployeeId = SCOPE_IDENTITY()
		--SCOPE_IDENTITY() - Returns the last identity value inserted into an identity column in the same scope.

		SELECT * FROM dbo.Employee WHERE Id = @EmployeeId
	END
GO

DECLARE @EmployeeIdOut INT;

EXEC dbo.usp_InsertEmployee
	@FirstName = 'BOB',
	@LastName = 'BOBSKY',
	@NationalIdNumber = '111111111',
	@Gender = 'M',
	@HireDate = '2010-01-21',
	@DateOfBirth = '1990-03-11',
	@EmployeeId = @EmployeeIdOut OUTPUT

SELECT @EmployeeIdOut AS [Last Employee Id]
GO