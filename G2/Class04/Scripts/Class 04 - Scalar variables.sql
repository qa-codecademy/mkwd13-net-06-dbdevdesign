
-- DECLARE and USE of Scalar Variable in SQL

DECLARE @FirstName NVARCHAR(100)
DECLARE @LastName NVARCHAR(100)
DECLARE @FullName NVARCHAR(100)

SET @FirstName = 'Martin'
SET @LastName = 'Panovski'

SELECT @FirstName + ' ' + @LastName AS [FullName with no CONCAT]

SELECT CONCAT(@FirstName, @LastName) AS [FullName using CONCAT]

SET @FullName = CONCAT(@FirstName, @LastName)

SELECT @FullName AS [FullName variable result]


-- Use variables in a SELECT query

-- Uncoment if you want to use the SELECT query below

--DECLARE @FirstName NVARCHAR(100)
--DECLARE @LastName NVARCHAR(100)
--SET @FirstName = 'Aleksandar'
--SET @LastName = 'Stojanovski'

SELECT * 
FROM Employees
WHERE FirstName = @FirstName AND LastName = @LastName



