CREATE OR ALTER PROCEDURE dbo.usp_InsertEmployee
(
	@FirstName nvarchar(100), @LastName nvarchar(100), @DateOfBirth date, @Gender nchar(1), @HireDate date, @NationalIdNumber nvarchar(20)
,	@EmployeeID int OUT
)
AS
BEGIN
	INSERT INTO [dbo].[Employees] ([FirstName], [LastName], [DateOfBirth], [Gender], [HireDate], [NationalIdNumber])
	VALUES (@FirstName, @LastName, @DateOfBirth, @Gender, @HireDate, @NationalIdNumber)

--Scope_Identity() - Returns the last identity value inserted into an identity column in the same scope. A scope is a module: a stored procedure, function, or batch
	set @EmployeeID = Scope_Identity()

	select * from [dbo].[Employees] where ID = @EmployeeID
END
GO

DECLARE
	@ReturnValue int
,	@EmployeeIdOut int

EXEC @ReturnValue = dbo.usp_InsertEmployee
	@FirstName = 'TestName'
,	@LastName = 'TestLastName'
,	@DateOfBirth = '1900-01-01'
,	@Gender = 'M'
,	@HireDate = '1900-01-01'
,	@NationalIdNumber = '1111111'
,	@EmployeeId = @EmployeeIdOut OUT

SELECT @ReturnValue as ReturnValue, @EmployeeIdOut as EmployeeIdOut

select * from Employees