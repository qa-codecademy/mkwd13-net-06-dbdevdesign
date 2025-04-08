-- Table Variable in SQL

DECLARE @FemaleEmployeeList TABLE 
(EmployeeID INT NOT NULL, FirstName VARCHAR(50) NULL, LastName VARCHAR(50) NULL)


--INSERT INTO @FemaleEmployeeList (EmployeeID, FirstName, LastName)
--VALUES (1, 'Frosina', 'Stamenkovska'),
--	   (2, 'Ana', 'Marjanovikj')

SELECT * FROM @FemaleEmployeeList

INSERT INTO @FemaleEmployeeList (EmployeeID, FirstName)
SELECT Id, FirstName
FROM Employees
WHERE Gender = 'F'

SELECT * FROM @FemaleEmployeeList
