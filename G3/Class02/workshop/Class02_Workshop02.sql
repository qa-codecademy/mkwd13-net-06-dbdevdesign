--Find all Employees with FirstName = Aleksandar ordered by Last Name
SELECT * FROM dbo.Employee
WHERE FirstName = 'Aleksandar'
ORDER BY LastName 

--List all Employees ordered by FirstName descending
SELECT * FROM dbo.Employee
ORDER BY FirstName DESC

--Find all Male employees ordered by HireDate, starting from the last hired
SELECT * FROM dbo.Employee
WHERE Gender = 'M'
ORDER BY HireDate DESC

-- BONUS: Find all Products that weigh over 2000kg and order them starting from the heaviest
SELECT * FROM [dbo].[Product]
WHERE [Weight] >= 2000
ORDER BY [Weight] DESC

-- BONUS: List all Employees ordered by FirstName ASC, then by LastName DESC
SELECT * FROM dbo.Employee
ORDER BY FirstName ASC, LastName DESC