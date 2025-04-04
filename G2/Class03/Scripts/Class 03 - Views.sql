
CREATE OR ALTER VIEW vv_MaleEmployeesOlderThanYear
AS
SELECT e.FirstName, e.LastName, e.Gender, e.DateOfBirth
FROM Employees e
WHERE e.DateOfBirth < '1990-01-01' AND e.Gender = 'M'



SELECT * FROM vv_MaleEmployeesOlderThanYear