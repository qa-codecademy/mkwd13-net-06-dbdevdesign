CREATE PROCEDURE TestPrint
(
	@First AS INT = 0,
	@Second AS INT = 1
)
AS
BEGIN
	PRINT 'First'
	PRINT @First
	PRINT '-------------'
	PRINT 'Second'
	PRINT @Second
END


-- Different ways of executing a stored procedure

EXEC TestPrint
EXEC TestPrint @First = 10
EXEC TestPrint @second = 20
EXEC TestPrint 10, 20
EXEC TestPrint @second = 10, @first = 20

DECLARE @ReturnValue INT
EXEC @ReturnValue = TestPrint

SELECT @ReturnValue as Result
