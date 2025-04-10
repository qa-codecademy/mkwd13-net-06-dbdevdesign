
select * from [dbo].[BusinessEntity]
select * from [dbo].[Employee]
select * from [dbo].[Product]
select * from [dbo].[Customer]
select * from [dbo].[Order]
select * from [dbo].[OrderDetails]

--Find all Employees with FirstName = Goran
SELECT Id, FirstName, LastName
FROM dbo.Employee
WHERE FirstName = 'Goran' -- all Gorans
-- WHERE FirstName <> 'Goran' -- all not Gorans

--Find all Employees with LastName starting With ‘S’
SELECT * 
FROM dbo.Employee
WHERE LastName LIKE 'S%'
-- BONUS: Find all Employees with LastName ending With ‘ski’
SELECT * 
FROM dbo.Employee
WHERE LastName LIKE '%ski'
-- BONUS: Find all Employees containing the word 'san' in their FirstName
SELECT * 
FROM dbo.Employee
WHERE FirstName LIKE '%san%'

--Find all Employees with DateOfBirth greater than ‘01.01.1988’
SELECT * 
FROM dbo.Employee
WHERE DateOfBirth > '01.01.1988'

--Find all Male employees
SELECT * 
FROM dbo.Employee 
WHERE Gender = 'M'

--Find all employees hired in January/1998
SELECT *
FROM dbo.Employee
WHERE HireDate >= '1998-01-01' AND HireDate <= '1998-01-31'

--Find all Employees with LastName starting With ‘A’ hired in January/2019
SELECT * 
FROM dbo.Employee
WHERE LastName LIKE 'A%' AND HireDate >= '2019-01-01' AND HireDate <= '2019-01-31'