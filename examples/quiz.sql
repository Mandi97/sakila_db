-- Students
CREATE TABLE Students
(StudentId INT, StudentName VARCHAR(10));
INSERT INTO Students (StudentId, StudentName)
SELECT 1,'John'
UNION ALL
SELECT 2,'Matt'
UNION ALL
SELECT 3,'James';

-- Classes
CREATE TABLE Classes
(ClassId INT, ClassName VARCHAR(10));
INSERT INTO Classes (ClassId, ClassName)
SELECT 1,'Maths'
UNION ALL
SELECT 2,'Arts'
UNION ALL
SELECT 3,'History';

-- StudentClass
CREATE TABLE StudentClass
(StudentId INT, ClassId INT);
INSERT INTO StudentClass (StudentId, ClassId)
SELECT 1,1
UNION ALL
SELECT 1,2
UNION ALL
SELECT 3,1
UNION ALL
SELECT 3,2
UNION ALL
SELECT 3,3;

SELECT *
FROM  students;

SELECT *
FROM classes;

SELECT *
FROM studentclass;


-- What will be the best possible join if we want to retrieve
-- all the students who have signed up for the classes in the summer
SELECT st.StudentName, cl.ClassName
FROM studentclass sc
INNER JOIN students st ON st.StudentId = sc.StudentId
INNER JOIN classes cl ON cl.ClassId = sc.ClassId;

-- What will be the best possible join if we want to retrieve
-- all the students who have signed up for no classes in summer

SELECT st.studentname, cl.classname
FROM students st
LEFT JOIN studentclass sc ON st.StudentId = sc.StudentId
LEFT JOIN Classes cl ON sc.ClassId = cl.ClassId
WHERE cl.classname IS NULL;

SELECT st.studentname
FROM students st
LEFT JOIN studentclass sc on st.StudentId = sc.studentid
WHERE sc.classid IS NULL;

DROP TABLE Students;
DROP TABLE Classes;
DROP TABLE StudentClass;