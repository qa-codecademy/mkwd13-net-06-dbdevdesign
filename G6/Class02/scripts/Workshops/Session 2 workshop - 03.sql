/*

List all BusinessEntity Names and Customer Names in single result set with duplicates
List all regions where some BusinessEntity is based, or some Customer is based. Remove duplicates
List all regions where we have BusinessEntities and Customers in the same time

*/

SELECT Name
FROM BusinessEntities
UNION ALL
SELECT Name 
FROM dbo.Customers
GO

SELECT Region
FROM BusinessEntities
UNION
SELECT RegionName 
FROM dbo.Customers
GO

SELECT Region
FROM BusinessEntities
INTERSECT
--EXCEPT
SELECT RegionName 
FROM dbo.Customers
GO
