-- scalar variable

DECLARE
	@FirstName nvarchar(100),
	@LastName nvarchar(100)


--DECLARE @Firstname nvarchar(100)
--DECLARE @Lastname nvarchar(100)

SET @FirstName = 'Aleksandar'

SELECT @FirstName

SELECT @LastName = 'Stojanovski', @FirstName = 'Pane'
SET @FirstName = 'Aleksandar'

SELECT @FirstName, @LastName

DECLARE @FullName nvarchar(100)
SET @FullName = @FirstName + N' ' + @LastName
SELECT @FullName

SELECT * FROM Employee
WHERE FirstName = @FirstName and LastName = @LastName
GO

--SELECT * FROM Employee

-- table variable
DECLARE @FemaleEmployeeList TABLE
(EmployeeId int not null, FirstName nvarchar(100) null, LastName nvarchar(100) null)

INSERT INTO @FemaleEmployeeList (EmployeeId, FirstName, LastName)
VALUES(100, 'Ana', 'Nikolova')
INSERT INTO @FemaleEmployeeList (EmployeeId, FirstName, LastName)
VALUES(101, 'Aleksandra', 'Nikolova')

--SELECT * FROM @FemaleEmployeeList

INSERT INTO @FemaleEmployeeList (EmployeeId, FirstName, LastName)
VALUES	
	(102, 'Biljana', 'Markova'),
	(103, 'Bojana', 'Filipovska')

--SELECT * FROM @FemaleEmployeeList

INSERT INTO @FemaleEmployeeList (EmployeeId, FirstName, LastName)
SELECT ID, FirstName, LastName 
FROM Employee
WHERE Gender = 'F'

SELECT * FROM @FemaleEmployeeList
GO

-- Temp table
CREATE TABLE #FemaleEmployeeList
(EmployeeID int not null, FirstName nvarchar(100) null, LastName nvarchar(100) null)

INSERT INTO #FemaleEmployeeList (EmployeeId, FirstName, LastName)
VALUES(100, 'Ana', 'Nikolova')
INSERT INTO #FemaleEmployeeList (EmployeeId, FirstName, LastName)
VALUES(101, 'Aleksandra', 'Nikolova')

INSERT INTO #FemaleEmployeeList (EmployeeId, FirstName, LastName)
VALUES	
	(102, 'Biljana', 'Markova'),
	(103, 'Bojana', 'Filipovska')

--SELECT * FROM #FemaleEmployeeList

INSERT INTO #FemaleEmployeeList (EmployeeID, FirstName, LastName)
SELECT ID, FirstName, LastName
FROM Employee
WHERE Gender ='F'

SELECT * FROM #FemaleEmployeeList
GO
--drop table #FemaleEmployeeList

-- String Functions

SELECT
	FirstName,
	LastName,
	replace(FirstName, 'ks', 'X') as Replace_ks_X,
	substring(FirstName, 4, 2) as Substring_4_2,
	left(FirstName, 5) as Left_5,
	right(LastName, 3) as Right_3,
	len(FirstName) as LengthColumn,
	concat(FirstName, N' ', LastName) as FullName,
	len('  Aleksa  ndar     ')
FROM
	Employee
WHERE
	FirstName = 'Aleksandar' and LastName = 'Nikolovski'

