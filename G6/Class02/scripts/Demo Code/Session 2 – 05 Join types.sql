DROP TABLE IF EXISTS TableA;
DROP TABLE IF EXISTS TableB;

CREATE TABLE TableA (idA int);
CREATE TABLE TableB (idB int);

Insert into TableA values (1),(2)--,(3)
Insert into TableB values (2),(3)--,(4)

-- Cross join
select * 
from TableA
Cross join TableB
ORDER BY idA,idB

-- INNER JOIN
select * 
from TableA
INNER JOIN TableB ON idA=idB

-- LEFT JOIN
select * 
from TableA
LEFT JOIN TableB ON idA=idB

-- RIGHT JOIN
select * 
from TableA
RIGHT JOIN TableB ON idA=idB

-- FULL JOIN
select * 
from TableA
FULL JOIN TableB ON idA=idB
