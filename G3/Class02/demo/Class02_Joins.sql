USE SEDC_DEMO
GO

DROP TABLE IF EXISTS TableA;
DROP TABLE IF EXISTS TableB;
GO

CREATE TABLE TableA (idA INT NOT NULL);
CREATE TABLE TableB (idB INT NOT NULL);

INSERT INTO TableA VALUES (1), (2), (3)
INSERT INTO TableB VALUES (2), (3), (4)

SELECT * FROM TableA
SELECT * FROM TableB

-- ========================
-- CROSS JOIN 
-- Returns all possible combinations of rows from both tables.
-- No ON condition is used. The result is a Cartesian product.
-- ========================
SELECT * FROM TableA
CROSS JOIN TableB

-- ========================
-- INNER JOIN
-- Returns only rows that have matching values in both tables.
-- Rows where idA = idB
-- ========================
SELECT * FROM TableA
INNER JOIN TableB ON idA = idB

-- ========================
-- LEFT JOIN (LEFT OUTER JOIN)
-- Returns all rows from the LEFT table (TableA), and matched rows from TableB.
-- If no match is found, NULLs are returned for TableB columns.
-- ========================
SELECT * FROM TableA
LEFT JOIN TableB ON ida = idb

-- ========================
-- RIGHT JOIN (RIGHT OUTER JOIN)
-- Returns all rows from the RIGHT table (TableB), and matched rows from TableA.
-- If no match is found, NULLs are returned for TableA columns.
-- ========================
SELECT * FROM TableA
RIGHT JOIN TableB ON ida = idb

-- ========================
-- FULL JOIN (FULL OUTER JOIN)
-- Returns all rows from both tables.
-- If there's a match, shows combined row. If not, NULLs are used for missing values.
-- Combines results of LEFT and RIGHT JOIN.
-- ========================
SELECT * FROM TableA
FULL JOIN TableB ON idA = idB