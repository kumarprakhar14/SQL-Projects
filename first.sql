CREATE DATABASE college;

USE college;

CREATE TABLE student(
rollno INT PRIMARY KEY,
name VARCHAR(50),
marks INT NOT NULL,
grade VARCHAR(1), 
city VARCHAR(20)
);

INSERT INTO student
(rollno, name, marks, grade, city)
VALUES
(101, "anil", 78, "C", "Pune"),
(102, "bhumika", 93, "A", "Mumbai"),
(103, "chetan", 85, "B", "Mumbai"),
(104, "dhruv", 96, "A", "Delhi"),
(105, "emanuel", 12, "F", "Delhi"),
(106, "farah", 82, "B", "Delhi");

SELECT DISTINCT city FROM student;

SELECT * FROM student WHERE marks > 80;
SELECT * FROM student WHERE city = "Mumbai";

SELECT * FROM student WHERE marks >80 AND city = "Mumbai";

SELECT * FROM student WHERE maks+10 > 100;

SELECT * FROM student WHERE marks BETWEEN 80 AND 90;

SELECT * FROM student WHERE city IN ("Delhi", "Mumbai", "Gurgaon");

SELECT * FROM student WHERE marks BETWEEN 80 AND 90;

SELECT * FROM student WHERE city NOT IN ("Delhi", "Mumbai", "Gurgaon");

SELECT * FROM student
LIMIT 3;

SELECT * 
FROM student
ORDER BY marks DESC
LIMIT 3;

SELECT marks
FROM student;

SELECT MAX(marks)
FROM student;

SELECT MIN(marks)
FROM student;

SELECT AVG(marks)
FROM student;

SELECT COUNT(rollno)
FROM student;

SELECT city, COUNT(name)
FROM student
GROUP BY city;

SELECT city, name, COUNT(name)
FROM student
GROUP BY city, name;

SELECT city, AVG(marks)
FROM student
GROUP BY city;

-- Write the query to find avg marks in each city in ascending order.

SELECT city, AVG(marks)
FROM student
GROUP BY city
ORDER BY city ASC; 

SELECT grade, COUNT(rollno)
FROM student
GROUP BY grade;

/*HaVING Clause
Similar to Where i.e applies some condition on rows. Used when we want to apply
any conditiion after grouping*/

-- Count no. of students in each city whose max marks cross 90.

SELECT city, COUNT(rollno)
FROM student
GROUP BY city
HAVING MAX(marks) > 90;

/*General Order:- 
SELECT column(s)
FROM table_name
WHERE condition
GROUP BY column(s)
HAVING condition
ORDER BY column(s) ASC;*/

/*Table related Querries
1. UPDATE(to update existing rows)

NOTE: To use update operation we need to turn off safe mode 
in mysql
SET SQL_SAFE_UPDATES = 0;*/

SET SQL_SAFE_UPDATES = 0;
UPDATE student 
SET grade = "O"
WHERE grade = "A";  

SELECT * FROM student;

UPDATE student 
SET marks = 92
WHERE rollno = 105;

SELECT * FROM student;

UPDATE student
SET grade = "A"
WHERE marks BETWEEN 90 AND 99;

SELECT * FROM student;

UPDATE student 
SET marks =marks + 1;

UPDATE student 
SET marks = 12
WHERE rollno = 105;

DELETE FROM student 
WHERE marks < 33;

-- Using Foreign Key

/*Cascading for FK
1. On Delete Cascade
2. On Update Cascade*/

CREATE TABLE dept(
id INT PRIMARY KEY,
name VARCHAR(50)
);

CREATE TABLE teacher(
id INT PRIMARY KEY,
name VARCHAR(50),
dept_id INT,
FOREIGN KEY (dept_id) REFERENCES dept(id)
ON UPDATE CASCADE
ON DELETE CASCADE
);

INSERT INTO dept
VALUES
(101, "ENGLISH"),
(102, "IT");

INSERT INTO teacher 
VALUES
(101, "Adam", 101),
(102, "Ave", 102);

UPDATE dept
SET id = 103
WHERE id = 102;

-- the above updation changes the dept id for teacher table as well
-- from 102 to 103 though we changed only for dept table
-- this is called cascading of foreign key.

/*2. ALTER (to change the schema of table)
This querry is generally used for 3 operations.
i. ADD column
ii. DROP column
iii. RENAME Table
iv. CHANGE column(rename)
v. MODIFY column(modify datatype/ constriant)*/

ALTER TABLE student
ADD COLUMN age INT;

ALTER TABLE student 
DROP COLUMN age;

ALTER TABLE student
ADD COLUMN age INT NOT NULL DEFAULT 19;

ALTER TABLE student 
MODIFY COLUMN age VARCHAR(2);

INSERT INTO student 
(rollno, name, marks, age)
VALUES
(107, "Bob", 68, 100);

ALTER TABLE student 
CHANGE age stu_age INT;

INSERT INTO student 
(rollno, name, marks, stu_age)
VALUES
(107, "Bob", 68, 100);

ALTER TABLE student 
DROP COLUMN stu_age;

ALTER TABLE student
RENAME TO stu;

ALTER TABLE stu
RENAME TO student;

-- 3. TRUNCATE

TRUNCATE TABLE student;

INSERT INTO student
(rollno, name, marks, grade, city)
VALUES
(101, "anil", 78, "C", "Pune"),
(102, "bhumika", 93, "A", "Mumbai"),
(103, "chetan", 85, "B", "Mumbai"),
(104, "dhruv", 96, "A", "Delhi"),
(105, "emanuel", 12, "F", "Delhi"),
(106, "farah", 82, "B", "Delhi");

/*In the student table:
a. Change the name of column "name" to "full_name".
b. Delete all the students who scored marks less than 80.
c. Delete the column for grades.*/

-- a.
ALTER TABLE student 
CHANGE name full_name VARCHAR(50);

-- b.
DELETE FROM student 
WHERE marks < 80;

-- c.
ALTER TABLE student 
DROP COLUMN grade;

/* Joins in SQL
JOin is used to combine rows from two or more tables, based on a related column between them.
Types:-
a. Inner Join
b. Left Join 
c. Right Join 
d. Full Join 
*/

-- Inner Join

CREATE TABLE student(
id INT PRIMARY KEY,
name VARCHAR(50)
);

CREATE TABLE course(
id INT PRIMARY KEY, 
course VARCHAR(50)
);

INSERT INTO student(id, name)
VALUES
(101, "adam"),
(102, "bob"),
(103, "casey");

INSERT INTO course(id, course)
VALUES
(102, "english"),
(105, "math"),
(103, "science"),
(107, "computer science");

SELECT *
FROM student  -- as s(alias)
INNER JOIN course  -- as c(alias)
ON student.id = course.id;
-- alias names may also be used to perform operations

-- Left Join

SELECT * 
FROM student as s
LEFT JOIN course as c
ON s.id = c.id;

-- Right Join

SELECT * 
FROM student as s
RIGHT JOIN course as c
ON s.id = c.id;

-- Full Join
-- In MySQL there's no command like FULL JOIN, thus it is achieved in alternative way.

SELECT * 
FROM student as s
LEFT JOIN course as c
ON s.id = c.id
UNION
SELECT * 
FROM student as s
RIGHT JOIN course as c
ON s.id = c.id;

/* Other than these, there's two more type of joins:
Left Exclusive Join and Right Exclusive Join