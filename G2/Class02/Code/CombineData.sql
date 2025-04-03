
-- UNION

SELECT [Name]
FROM BusinessEntities
UNION ALL
SELECT NAME 
FROM Customers
ORDER BY Name


-- UNION

SELECT Region
FROM BusinessEntities
UNION
SELECT RegionName
FROM Customers



-- INTERSECT

SELECT Region
FROM BusinessEntities
INTERSECT
SELECT RegionName
FROM Customers