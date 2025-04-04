/*
Find all Employees with FirstName = Aleksandar ordered by Last Name
List all Employees ordered by FirstName
Find all Male employees ordered by HireDate, starting from the last hired

*/

SELECT * 
FROM Employees
WHERE FirstName = 'Aleksandar'
Order by LastName
GO

SELECT * 
FROM Employees
Order by LastName 
GO


SELECT * 
FROM Employees
WHERE Gender = 'M'
ORDER by HireDate desc
GO
