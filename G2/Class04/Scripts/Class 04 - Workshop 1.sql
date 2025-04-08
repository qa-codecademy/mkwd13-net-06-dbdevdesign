--Declare scalar variable for storing FirstName values
--Assign value ‘Aleksandar’ to the FirstName variable
--Find all Employees having FirstName same as the variable
--Declare table variable that will contain EmployeeId and DateOfBirth
--Fill the table variable with all Female employees
--Declare temp table that will contain LastName and HireDate columns
--Fill the temp table with all Male employees having First Name starting with ‘A’
--Retrieve the employees from the table which last name is with 7 characters


DECLARE @FirstName VARCHAR(100)
SET @FirstName = 'Aleksandar'

SELECT *
FROM Employees
WHERE FirstName = @FirstName


DECLARE @FemaleEmployees TABLE
(EmployeeID INT NOT NULL, DateOfBirth datetime)


INSERT INTO @FemaleEmployees
SELECT Id, DateOFBirth
FROM Employees
WHERE Gender = 'F'

SELECT * FROM @FemaleEmployees



-- TEMP TABLE

DROP TABLE IF EXISTS #MaleEmployeesTempTable

 CREATE TABLE #MaleEmployeesTempTable
 (LastName VARCHAR(100), HireDate DATETIME)

 INSERT INTO #MaleEmployeesTempTable
 SELECT LastName, HireDate
 FROM Employees
 WHERE Gender = 'M' AND FirstName LIKE 'A%'

 SELECT * 
 FROM #MaleEmployeesTempTable
 WHERE LEN(LastName) = 7

