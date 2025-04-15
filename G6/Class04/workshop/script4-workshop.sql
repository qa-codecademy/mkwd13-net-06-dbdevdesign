/*
Declare scalar variable for storing FirstName values
	Assign value ‘Goran’ to the FirstName variable
	Find all Employees having FirstName same as the variable

Declare table variable that will contain EmployeeId and DateOfBirth
	Fill the table variable with all Female employees

Declare temp table that will contain LastName and HireDate columns
	Fill the temp table with all Female employees having First Name starting with ‘V’
	
Select all the Employees that have LastName lenght = 7	
*/

-- scalar variable
DECLARE @FirstName nvarchar(100)
SET @FirstName = 'Goran'
--SELECT @FirstName = 'Goran'

SELECT * 
FROM Employee
WHERE FirstName = @FirstName
GO

-- table variable
DECLARE @EmployeeList TABLE 
(EmployeeId int, FirstName NVARCHAR(100), DateOfBirth date);

INSERT INTO @EmployeeList
SELECT Id, FirstName, DateOfBirth
FROM dbo.Employee
WHERE Gender = 'F'

select * from @EmployeeList
GO

-- Temp table 
CREATE TABLE #EmployeeList 
(LastName NVARCHAR(100), HireDate date);

INSERT INTO #EmployeeList
SELECT LastName, HireDate 
FROM dbo.Employee
WHERE Gender = 'F' and FirstName like 'V%'

SELECT * 
FROM #EmployeeList
where Len(LastName) = 7

drop table #EmployeeList
GO


--Declare scalar function (fn_FormatProductName) for retrieving the Product description for specific ProductId in the following format:
--Second and Third character from the Code
--Last three characters from the Name
--Product Price



CREATE OR ALTER FUNCTION dbo.fn_FormatProductName (@ProductId int)
RETURNS Nvarchar(100)
AS 
BEGIN

DECLARE @Output Nvarchar(100)

select @Output = SUBSTRING(Code,2,2) + '-' + right(Name,3) + '-' + cast(Price as nvarchar(10))
from dbo.Product
where id = @ProductId

RETURN @Output

END
GO

-- test execution
select dbo.fn_FormatProductName (1) as FunctionOutput
from dbo.Product

select * from Product