
--Find all Employees with FirstName = Goran

SELECT *
FROM Employees
WHERE FirstName = 'Goran'


--Find all Employees with LastName starting With ‘S’

SELECT * 
FROM Employees
WHERE LastName LIKE 'S%'


--Find all Employees with DateOfBirth 
--greater than ‘01.01.1988’

SELECT *
FROM Employees
WHERE DateOfBirth > '1988.01.01'

-- Find all Male employees

SELECT *
FROM Employees
WHERE Gender = 'M'


--Find all employees hired in January/1998

SELECT *
FROM Employees
WHERE HireDate >= '01.01.1998' AND HireDate < '01.02.1998'


-- The same query using BETWEEN 
SELECT *
FROM Employees
WHERE HireDate BETWEEN '01.01.1998' AND '01.31.1998'

-- Find all Employees with LastName 
-- starting With ‘A’ hired in January/2019

SELECT * 
FROM Employees
WHERE LastName LIKE 'A%' AND 
HireDate BETWEEN '01.01.2019' AND '01.31.2019'




-- ORDER BY

--Find all Employees with FirstName = Aleksandar 
-- ordered by Last Name

SELECT * 
FROM Employees 
WHERE FirstName = 'Aleksandar'
ORDER BY LastName


-- List all Employees ordered by FirstName

SELECT * 
FROM Employees
ORDER BY FirstName DESC


-- Find all Male employees ordered by HireDate, 
-- starting from the last hired

SELECT * 
FROM Employees
WHERE Gender = 'M'
ORDER BY HireDate DESC

