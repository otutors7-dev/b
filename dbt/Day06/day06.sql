/*
AGENDA 
    Indexes :
        -- Simple Index
        -- Unique Index
        -- Composite Index
        -- Unique Composite Index
	-- constraints
        -- NOT NULL
        -- UNIQUE
        -- PRIMARY KEY
        
*/
--_______________________________________________________________

-- Indexes :
SELECT * FROM emp
WHERE deptno = 20;



EXPLAIN FORMAT = JSON
SELECT * FROM emp
WHERE deptno = 20;

-- "query_cost": "1.65"
--  "access_type": "ALL",

-- Simple Index :
-- syntax : CREATE INDEX index_name ON tbl_name(col);
CREATE INDEX idx_emp_deptno ON emp(deptno);


SELECT * FROM emp
WHERE deptno = 20;
-- Output remains same

-- check the query cost :
EXPLAIN FORMAT = JSON
SELECT * FROM emp
WHERE deptno = 20;
-- "query_cost": "1.00"
-- "access_type": "ref",



-- Create an index on the emps table on sal col in Desc order.

CREATE INDEX idx_emp_sal ON emp(sal DESC);

SELECT * FROM emp
WHERE sal > 1500
ORDER BY sal DESC;

-- check the indexes created.
SHOW INDEXES FROM emp;


/*
When we create indexes on the columns, Our SELECT query gets faster, but the DML
may get slower.
*/
--_____________________________________
--unique Index :
-- Create a unique index on empno col of emps table.
CREATE UNIQUE INDEX idx_emp_empno ON emp(empno);


/*
The UNIQUE INDEX enables faster searching for the empno column,
but, it also ensures that unique data is inserted for that column.
*/

SELECT * FROM emp;

INSERT INTO emp(empno,ename,sal,deptno) VALUES(7499,"ABCD",1000,20);
-- ERROR 1062 (23000): Duplicate entry '7499' for key 'emp.idx_emp_empno'

-- check the index on the table. 
SHOW INDEXES FROM emp;

mysql> DESC emp;
+--------+--------------+------+-----+---------+-------+
| Field  | Type         | Null | Key | Default | Extra |
+--------+--------------+------+-----+---------+-------+
| empno  | int          | YES  | UNI | NULL    |       |
| ename  | varchar(40)  | YES  |     | NULL    |       |
| job    | varchar(40)  | YES  |     | NULL    |       |
| mgr    | int          | YES  |     | NULL    |       |
| hire   | date         | YES  |     | NULL    |       |
| sal    | decimal(8,2) | YES  | MUL | NULL    |       |
| comm   | decimal(8,2) | YES  |     | NULL    |       |
| deptno | int          | YES  | MUL | NULL    |       |
+--------+--------------+------+-----+---------+-------+
8 rows in set (0.01 sec)

/*
UNI in the key column means UNIQUE values allowed.
MUL in the key column means Multiple duplicates allowed.
*/


--____________________________________________________________________
-- Composite Index : Index created on the combination of columns

-- find all emps from emp table working in dept 20 as clerk.
SELECT * FROM emp
WHERE deptno = 20
AND JOB = 'clerk';

+-------+-------+-------+------+------------+---------+------+--------+
| empno | ename | job   | mgr  | hire       | sal     | comm | deptno |
+-------+-------+-------+------+------------+---------+------+--------+
|  7369 | SMITH | CLERK | 7902 | 1980-12-17 |  800.00 | NULL |     20 |
|  7876 | ADAMS | CLERK | 7788 | 1983-01-12 | 1100.00 | NULL |     20 |
+-------+-------+-------+------+------------+---------+------+--------+
2 rows in set (0.00 sec)

-- check the query cost.

EXPLAIN FORMAT = JSON
SELECT * FROM emp
WHERE deptno = 20
AND JOB = 'clerk';

 -- "query_cost": "1.00"

-- Create an index on deptno and job.
CREATE INDEX idx_emp_dept_job ON emp(deptno,job);


-- check the query cost.

EXPLAIN FORMAT = JSON
SELECT * FROM emp
WHERE deptno = 20
AND JOB = 'clerk';
-- "query_cost": "0.70"

-- check the indexes created.
SHOW INDEXES FROM emp;

--_______________________________
-- Composite Unique Index :
-- Create a student table
-- roll_no : int
-- std : int
-- name : varchar(20)
-- marks : decimal(5,2)

DROP TABLE IF EXISTS students;

CREATE TABLE students
(std INT,
roll_no INT,
name VARCHAR(30),
marks DECIMAL(5,2)
);

/*
std     roll_no     Name        marks
________________________________________
1       1           A           90
1       2           B           91
1       3           C           98
2       1           D           80
2       2           E           85
3       1           F           90
3       2           G           92

*/



--insert some rows
INSERT INTO students VALUES(1,1,'A',90);
INSERT INTO students VALUES(1,2,'B',95);
INSERT INTO students VALUES(1,3,'C',92);
INSERT INTO students VALUES(2,1,'D',80);
INSERT INTO students VALUES(2,2,'E',89);
INSERT INTO students VALUES(3,1,'F',91);
INSERT INTO students VALUES(3,2,'G',90);



mysql> SELECT * FROM students;
+------+---------+------+-------+
| std  | roll_no | name | marks |
+------+---------+------+-------+
|    1 |       1 | A    | 90.00 |
|    1 |       2 | B    | 95.00 |
|    1 |       3 | C    | 92.00 |
|    2 |       1 | D    | 80.00 |
|    2 |       2 | E    | 89.00 |
|    3 |       1 | F    | 91.00 |
|    3 |       2 | G    | 90.00 |
+------+---------+------+-------+
7 rows in set (0.00 sec)

-- Create composite unique on roll_no + std
CREATE UNIQUE INDEX idx_std_roll ON students(std,roll_no);

SELECT * FROM students
WHERE std = 2 AND roll_no = 1;

-- insert some duplicate rows
INSERT INTO students VALUES (1,2,'N',90);
-- ERROR 1062 (23000): Duplicate entry '1-2' for key 'students.idx_std_roll'


-- Lab Work :
-- check the query cost on join
SELECT e.empno,e.ename,d.dname
FROM emp e INNER JOIN dept d
ON e.deptno = d.deptno;

-- Create an index on deptno of emp and deptno of dept


-- Check the query cost of the above query again,



-- drop the index.
DROP INDEX idx_std_roll; 
-- OR
ALTER TABLE emp DROP INDEX idx_emp_sal;


-- If the table is dropped, its corresponding indexes also get dropped internally.



--___________________________Constraints :_______________________
/*
Constraints are the limitations/restrictions imposed on the columns
for the data to be entered.
*/

-- NOT NULL : if we apply NOT NULL constraint on a column, it ensures that the
-- values for that column are not null. It can have duplicate values.
-- NOT NULL is a column level constraint
-- means, it has to be mentioned with the coulmn name.


-- Create a contacts table
    -- name varchar(20) should be not null
    -- phone char (14)
    -- email varchar(20)


CREATE TABLE contacts
(
    name VARCHAR(20) NOT NULL, -- column level syntax
    phone_no CHAR(15),
    email VARCHAR(20)
);

mysql> DESCRIBE contacts;
+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| name     | varchar(20) | NO   |     | NULL    |       |
| phone_no | char(15)    | YES  |     | NULL    |       |
| email    | varchar(20) | YES  |     | NULL    |       |
+----------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

INSERT INTO contacts VALUES('Nisha','7057590799','nisha@gmail.com');

INSERT INTO contacts VALUES(NULL,'7057590799','nisha@gmail.com');
-- ERROR 1048 (23000): Column 'name' cannot be null

INSERT INTO contacts(phone_no,email) VALUES('7057590799','nisha@gmail.com');
-- ERROR 1364 (HY000): Field 'name' doesn't have a default value


--___________________________________________
-- Unique constraint :
/*
Unique constraint ensures unique values are entered into that column.
this constraint is similar to UNIQUE index.
Constraints can be added at the time of table creation,
 but index can be created only after the table is created.

Internally, the unique index is created on the column on which we have added the
unique constraint. Hence the unique contraint ensures unique values to be inserted
in that column as well as the searching is faster as the index is internally created
for that column. 
*/

/*
Create a contacts table :
name , phone, email)
make phone number as unique at table level
and email as unique at column level
*/

DROP TABLE IF EXISTS contacts;

CREATE TABLE contacts
(
    name VARCHAR(20) NOT NULL,
    phone_no CHAR(15),
    email VARCHAR(20) UNIQUE,     -- column level syntax
    UNIQUE(phone_no)               -- Table level syntax
);

-- OR 
-- Give name to the constraint at the table level syntax only.
-- Names at the column level syntax are not allowed.

CREATE TABLE contacts
(
    name VARCHAR(20) NOT NULL,
    phone_no CHAR(15),
    email VARCHAR(20) UNIQUE,     -- column level syntax
    CONSTRAINT ph_unique UNIQUE(phone_no)            -- Table level syntax
);



INSERT INTO contacts VALUES('Nisha','7057590799','nisha@gmail.com');
-- ok

INSERT INTO contacts VALUES('Nisha','7057590799','n@gmail.com');
-- ERROR 1062 (23000): Duplicate entry '7057590799' for key 'contacts.phone_no'

INSERT INTO contacts VALUES('Nisha',NULL,'n@gmail.com');
-- allowed

INSERT INTO contacts VALUES('ABC',NULL,'ABC@gmail.com');
-- duplicate NULL are allowed as NULL means absence of value.

/*
UNIQUE contraint is a column level as well as table level contraint.
Means we can specify this in 2 ways.
*/

-- At table level we can give name to the constraint.
-- Unique constarint can be table level as well as column level.
-- unique column does not allow duplicate values.
-- You can insert NULL values.
-- Any number of NULL values are allowed in a unique column 
-- as NULL is not a valid value to be compared. NULL means NOTHING. 
-- Internally a unique index is created for the column on 
--which we create a unique constraint.
-- We can check the index by SHOW INDEXES FROM table;


SHOW INDEXES FROM contacts;

DESCRIBE contacts;

--________________________________________________
-- Primary Key :
/*

Primary key helps to uniquely identify rows from one another.
For a primary key column, the data should be UNIQUE and NOT NULL.
It is recommended that every table should have a primary key column.
It is a table level and column level constraint.
A table MUST have ONLY ONE PRIMARY KEY.
*/

--Create a table customers with name,email,phone,addr.

-- column level syntax
CREATE customers
(
    name VARCHAR(20),
    email VARCHAR(20) PRIMARY KEY,
    phone_no CHAR(15),
    addr VARCHAR(50)
);

--OR
-- table level syntax without the constraint name

CREATE TABLE customers
(
    name VARCHAR(20),
    email VARCHAR(20),
    phone_no CHAR(15),
    addr VARCHAR(50),
    PRIMARY KEY(email)
);


-- OR
-- table level with constraint name
CREATE TABLE customers
(
    name VARCHAR(20),
    email VARCHAR(20),
    phone_no CHAR(15),
    addr VARCHAR(50),
    CONSTRAINT email_pk PRIMARY KEY(email)
);



--__________________________________________________________________