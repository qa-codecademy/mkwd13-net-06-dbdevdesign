USE Qinshift

BEGIN TRY
    --Generate a divide-by-zero-error
	SELECT 1/0; 
END TRY
BEGIN CATCH
	SELECT ERROR_NUMBER() AS ErrorNumber
END CATCH

BEGIN TRY
	SELECT 1/0; 
END TRY
BEGIN CATCH
	SELECT ERROR_SEVERITY() AS ErrorSeverity
END CATCH

BEGIN TRY
	SELECT 1/0; 
END TRY
BEGIN CATCH
	SELECT ERROR_STATE() AS ErrorState
END CATCH

IF OBJECT_Id ('ExampleProcedure', 'P') IS NOT NULL
	DROP PROCEDURE ExampleProcedure

CREATE PROCEDURE ExampleProcedure
AS 
	SELECT 1/0;
GO

BEGIN TRY
	EXECUTE ExampleProcedure
END TRY
BEGIN CATCH
	SELECT ERROR_PROCEDURE() AS ErrorProcedure
END CATCH

IF OBJECT_Id ('usp_ExampleProc', 'P') IS NOT NULL
	DROP PROCEDURE usp_ExampleProc

CREATE PROCEDURE usp_ExampleProc  
AS  
    SELECT 1/0;  
GO  

BEGIN TRY  
    -- Execute the stored procedure inside the TRY block.  
    EXECUTE usp_ExampleProc;  
END TRY  
BEGIN CATCH  
SELECT  
     ERROR_NUMBER() AS ErrorNumber  
    ,ERROR_SEVERITY() AS ErrorSeverity  
    ,ERROR_STATE() AS ErrorState  
    ,ERROR_PROCEDURE() AS ErrorProcedure  
    ,ERROR_LINE() AS ErrorLine  
    ,ERROR_MESSAGE() AS ErrorMessage;  

END CATCH;  
GO  
