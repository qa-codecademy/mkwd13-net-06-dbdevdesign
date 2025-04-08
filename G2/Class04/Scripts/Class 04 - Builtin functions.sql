SELECT FirstName,
LEFT(FirstName, 4) AS LeftFunction,
RIGHT(LastName, 4) AS RightFunction,
LEN(CONCAT(FirstName, LastName)) AS FullNameLength,
SUBSTRING(FirstName, 1, 5) AS SubStringFromFirstName,
CONCAT(FirstName, CAST(DateOfBirth AS datetime)) AS EmployeeNameWithBirthDate
FROM Employees



SELECT 
CAST(Quantity AS VARCHAR) AS QuantityAsVarChar,
CAST(Price AS VARCHAR) AS PriceAsVarChar
FROM OrderDetails
