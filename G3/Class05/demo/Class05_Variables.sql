-- ==================== DECLARING VARIABLES ====================

-- ======== Scalar Variable ========

-- A scalar variable holds a single value such as an integer, string, date...

-- Use Cases:
-- Storing a specific value to reuse in queries or logic
-- Storing result of an aggregate function (e.g. COUNT, MAX)
-- Holding user input for stored procedures*

DECLARE @FirstName NVARCHAR(50);
DECLARE @LastName NVARCHAR(50) = 'Bobsky';
SET @FirstName = 'Bob';
--SELECT @FirstName + ' ' + @LastName AS 'Employee Full Name'
PRINT 'Employee full name: ' + @FirstName + ' ' + @LastName
GO

-- Example: Total orders
DECLARE @TotalOrders INT;
SET @TotalOrders = (SELECT COUNT(Id) FROM dbo.[Order])
SELECT @TotalOrders as TotalOrders


-- ======== Table Variable ========

-- Variable that stores tabular data (rows and columns), scoped to the batch or procedure

-- Use Cases :
-- Temporarily storing intermediate query results
-- Performing multiple operations on a small result set
-- Returning result sets from functions

-- Example: Store male employees in a table variable
DECLARE @MaleEmployees TABLE (
	Id INT,
	FirstName NVARCHAR(100),
	LastName NVARCHAR(100)
);

-- Inserting New Male Employees
INSERT INTO @MaleEmployees (Id, FirstName, LastName)
VALUES
	(4, 'John', 'Doe'),
	(34, 'James', 'Smith')

SELECT * FROM @MaleEmployees

-- Inserting Existing Male Employees (from dbo.Employee)
INSERT INTO @MaleEmployees (Id, FirstName, LastName)
--VALUES
SELECT e.Id, e.FirstName, e.LastName 
FROM dbo.Employee e
WHERE LOWER(e.Gender) = 'm'

SELECT * FROM @MaleEmployees


-- ======== Temporary Table ========

-- physical table stored in tempdb that exists for the duration of a session or connection

-- Use Cases:
-- Complex data manipulation (joins, filtering)
-- Working with large datasets
-- Creating indexes or constraints temporarily

-- NOTE: Global Temporary Tables are declared using two ## instead of one #

-- Example: Store female employees in a temp table
CREATE TABLE #FemaleEmployees (
	Id INT,
	FirstName NVARCHAR(100),
	LastName NVARCHAR(100)
)

-- Inserting New Female Employees
INSERT INTO #FemaleEmployees (Id, FirstName, LastName)
VALUES
	(1, 'Jane', 'Doe'),
	(2, 'Emily', 'Johnson')

SELECT * FROM #FemaleEmployees

-- Clean up: Drop the temporary table
DROP TABLE #FemaleEmployees;