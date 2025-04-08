CREATE FUNCTION fn_EmployeeFullName(@EmployeeID INT)
RETURNS NVARCHAR(100)
 AS
 BEGIN
   DECLARE @Result NVARCHAR(100)

   SELECT @Result = FirstName + ' ' + LastName
   FROM Employees
   WHERE Id = @EmployeeID
   RETURN @Result
 END




 SELECT dbo.fn_EmployeeFullName(40)





 CREATE FUNCTION fn_GetEmployeesByGender(@Gender NCHAR)
RETURNS @EmployeesByGender TABLE 
(
    FirstName VARCHAR(50), 
    LastName VARCHAR(50), 
    Gender NCHAR(1)
)
AS
BEGIN
    INSERT INTO @EmployeesByGender 
    SELECT FirstName, LastName, Gender
    FROM Employees
    WHERE Gender = 
        CASE 
            WHEN @Gender = 'M' THEN 'M' 
            ELSE 'F' 
        END
    RETURN
END
 


CREATE FUNCTION fn_GetEmployeesByGenderIFELSE(@Gender NCHAR)
 RETURNS  @EmployeesByGender TABLE (FirstName VARCHAR(50), LastName VARCHAR(50), Gender NCHAR)
 AS
BEGIN	
      IF(@Gender = 'M')
		BEGIN
			INSERT INTO @EmployeesByGender 
			SELECT FirstName, LastName, Gender
			FROM Employees
			WHERE Gender = 'M'
		END
	  ELSE
		BEGIN
			INSERT INTO @EmployeesByGender 
			SELECT FirstName, LastName, Gender
			FROM Employees
			WHERE Gender = 'F'
		END
	RETURN 
END


SELECT * FROM dbo.fn_GetEmployeesByGender('M')

SELECT * FROM dbo.fn_GetEmployeesByGenderIFELSE('F')