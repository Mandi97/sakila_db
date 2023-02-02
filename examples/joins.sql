-- Create table 1
CREATE TABLE table1
(ID INT, Value VARCHAR(10));
INSERT INTO Table1 (ID, Value)
SELECT 1,'First'
UNION ALL
SELECT 2,'Second'
UNION ALL
SELECT 3,'Third'
UNION ALL
SELECT 4,'Fourth'
UNION ALL
SELECT 5,'Fifth';

-- Create table 2
CREATE TABLE table2
(ID INT, Value VARCHAR(10));
INSERT INTO Table2 (ID, Value)
SELECT 1,'First'
UNION ALL
SELECT 2,'Second'
UNION ALL
SELECT 3,'Third'
UNION ALL
SELECT 6,'Sixth'
UNION ALL
SELECT 7,'Seventh'
UNION ALL
SELECT 8,'Eighth';

SELECT *
FROM table1;

SELECT *
FROM table2;

SELECT *
FROM table1 t1
INNER JOIN table2 t2 ON t1.ID = t2.ID;


SELECT t1.ID AS t1ID, t2.ID AS t2ID, t1.Value AS t1Value, t2.Value AS t2Value
FROM table1 t1
INNER JOIN table2 t2 ON t1.ID = t2.ID;

SELECT *
FROM table1 t1
LEFT JOIN table2 t2 ON t1.ID = t2.ID;

SELECT *
FROM table1 t1
RIGHT JOIN table2 t2 ON t1.ID = t2.ID;

SELECT *
FROM table1 t1
FULL JOIN table2 t2 ON t1.ID = t2.ID;

SELECT *
FROM table1 t1
RIGHT JOIN table2 t2 ON t1.ID = t2.ID
WHERE t1.ID IS NULL;

SELECT *
FROM table1
CROSS JOIN table2 t2;