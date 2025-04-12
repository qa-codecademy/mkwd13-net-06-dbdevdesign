CREATE PROCEDURE TestPrint
( 
	@First as int=0,
	@Second as int =1
)
AS
BEGIN
	PRINT 'First' 
	PRINT @First
	PRINT 'Second'
	PRINT @Second
END

-- Different ways of executing the procedure
EXEC TestPrint
EXEC TestPrint @First=1
EXEC TestPrint @second =10
EXEC TestPrint 10,20
EXEC TestPrint @second=50, @First=100

DECLARE	@ReturnValue int
EXEC @ReturnValue = TestPrint
SELECT	@ReturnValue as ReturnValue