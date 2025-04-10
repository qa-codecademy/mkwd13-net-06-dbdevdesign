CREATE PROCEDURE SP_GetEmployeesByGender
(
	@Gender NCHAR(1) = 'M',
	@GenderCount INT OUT
)
AS 
BEGIN

	SELECT *
	FROM Employees
	WHERE Gender = @Gender

	SELECT @GenderCount = 
						COUNT(*)
						FROM Employees
						WHERE Gender = @Gender
	
END


DECLARE @ReturnValue INT
DECLARE @GenderCounOut INT

EXEC @ReturnValue = 
				SP_GetEmployeesByGender 'F', 
				@GenderCounOut OUTPUT

SELECT 
	@ReturnValue AS ReturnValue, 
	@GenderCounOut AS GenderCountOut