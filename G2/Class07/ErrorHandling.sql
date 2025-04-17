--ERROR_NUMBER()

BEGIN TRY
-- Generate a divide by zero error.
	SELECT 1/0;
	--SELECT GETDATE()
END TRY
BEGIN CATCH
	PRINT 'Error Occured!'
	SELECT ERROR_NUMBER() AS ErrorNumber
END CATCH



-- ERROR_SEVERITY()
BEGIN TRY
-- Generate a divide by zero error.
	SELECT 1/0;
	--SELECT GETDATE()
END TRY
BEGIN CATCH
	PRINT 'Error Occured!'
	SELECT ERROR_SEVERITY() AS ErrorSeverity
END CATCH

--SELECT ERROR_NUMBER()


-- ERROR_STATE()
BEGIN TRY
-- Generate a divide by zero error.
	SELECT 1/0;
	--SELECT GETDATE()
END TRY
BEGIN CATCH
	PRINT 'Error Occured!'
	SELECT ERROR_STATE() AS ErrorState
END CATCH


-- Check if procedure exists then delete it
IF OBJECT_ID('sp_ExampleProc', 'P') IS NOT NULL
	DROP PROCEDURE sp_ExampleProc
GO

-- Create the procedure
CREATE PROCEDURE sp_ExampleProc
AS
BEGIN
	SELECT 1/0;
END

-- ERROR_PROCEDURE()

BEGIN TRY
	EXEC sp_ExampleProc

END TRY
BEGIN CATCH
	SELECT ERROR_PROCEDURE() AS ErrorProcedure,
		   ERROR_MESSAGE() AS ErrorMessage,
		   ERROR_LINE() AS ErrorLineNumber,
		   ERROR_NUMBER() AS ErrorNumber,
		   ERROR_STATE() AS ErrorState
END CATCH
