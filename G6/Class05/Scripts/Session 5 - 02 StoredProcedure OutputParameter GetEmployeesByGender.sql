CREATE PROCEDURE usp_GetEmployeesByGender
(
	@Gender nchar(1) = 'M',
	@GenderCount int OUT
)
AS
BEGIN
	select
		*
	from
		[dbo].[Employee]
	where
		Gender = @Gender

	select
		@GenderCount = count(*)
	from
		[dbo].[Employee]
	where
		Gender = @Gender
END
GO

DECLARE
	@ReturnValue int
,	@GenderCountOut int

EXEC @ReturnValue = usp_GetEmployeesByGender @Gender = 'M', @GenderCount = @GenderCountOut OUTPUT;

SELECT @ReturnValue as ReturnValue, @GenderCountOut as GenderCountOut
