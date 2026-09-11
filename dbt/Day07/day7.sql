--AGENDA
-- Pending Topics :
    -- FOREIGN KEY
            -- ON DELETE CASCADE
            -- ON UPDATE CASCADE
        -- CHECK    
    -- Views
        -- Simple Views
        -- Complex Views

-- Subqueries
    -- Single Row Subqueries
    -- Multi Row Subqueries
    -- Co-related Subqueries
    -- Subqueries in DML
    -- Subqueries in Projection

-- DCL
    -- Grant
    -- Revoke


--**************************************************************
--____________________________________________________________
-- Composite Primary Key 
-- Create a table student with roll_no,std,name,marks

/*
std    roll_no     name     marks
1        1          A         90
1        2          B         92
1        3          C         94
2        1          D         80
2        2          E         85
2        3          F         97
3        1          G         93
3        2          H         95
3        3          I         98
*/

DROP TABLE IF EXISTS students;

CREATE TABLE students
(
    std INT,
    roll_no INT,
    name VARCHAR(20),
    marks DECIMAL(5,2),
    PRIMARY KEY(std,roll_no)
);

-- composite primary key should compulsorily mentioned at the table level.

-- SHOW INDEXES FROM students;
SHOW INDEXES FROM students;

--_______________________________________________________
-- Surrogate Primary Key :
-- Create a table products : 

--product_name,category,brand,price,quantity 
/*
product_id
*/

CREATE TABLE products
(
    product_id INT PRIMARY KEY,
    product_name VARCHAR(20),
    category VARCHAR(20),
    brand VARCHAR(20),
    price DECIMAL(5,2),
    quantity INT
);

--____________________________________________
-- foreign key

-- create the d1 table and e1 table with primary and foreign key 
--for deptno and mgr.

CREATE TABLE d1
(
    dept_id INT PRIMARY KEY,
    dname VARCHAR(20)
);

CREATE TABLE e1
(
    emp_id INT PRIMARY KEY,
    ename VARCHAR(20),
    sal DECIMAL(9,2),
    dept_id INT,
    mgr_id INT,
    FOREIGN KEY(dept_id) REFERENCES d1(dept_id),
    FOREIGN KEY(mgr_id) REFERENCES e1(emp_id)
);


INSERT INTO d1 VALUES (10,'Training');
INSERT INTO d1 VALUES (20,'Sales');
INSERT INTO d1 VALUES (30,'Management');
INSERT INTO d1 VALUES (40,'HR');


mysql> SELECT * FROM d1;
+---------+------------+
| dept_id | dname      |
+---------+------------+
|      10 | Training   |
|      20 | Sales      |
|      30 | Management |
|      40 | HR         |
+---------+------------+
4 rows in set (0.00 sec)



INSERT INTO e1 VALUES(101,'ABC',1000,10,101);
INSERT INTO e1 VALUEs(102,'XYZ',2000,30,NULL);
INSERT INTO e1 VALUEs(103,'AAA',3000,20,101);
INSERT INTO e1 VALUEs(104,'BBB',4000,10,107);
-- ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`ac_classwork_db`.`e1`, CONSTRAINT `e1_ibfk_2`  FOREIGN KEY (`mgr_id`) REFERENCES `e1` (`emp_id`))




-- @@foreign_key_checks :
mysql> SELECT @@foreign_key_checks;
+----------------------+
| @@foreign_key_checks |
+----------------------+
|                    1 |
+----------------------+
1 row in set (0.01 sec)
/*
By default the variable value is true (1). 
It means for every DML the foreign key constraint is checked.
*/

-- We can disable the foreign key checking for sometime 
-- during data migration.
SET @@foreign_key_checks = 0;

SELECT @@foreign_key_checks;
+----------------------+
| @@foreign_key_checks |
+----------------------+
|                    0 |
+----------------------+
1 row in set (0.00 sec)


-- After the job is done , we should again enable it.

SET @@foreign_key_checks = 1;

INSERT INTO e1 VALUES(105,'AAA',1500,20,107);




-- ON UPDATE CASCADE / ON DELETE CASCADE
DELETE FROM d1 WHERE dept_id = 20;
/*
ERROR 1451 (23000): Cannot delete or update a parent row: a foreign key constraint fails (`ac_classwork_db`.`e1`, CONSTRAINT `e1_ibfk_1` FOREIGN KEY (`dept_id`) REFERENCES `d1` (`dept_id`))
*/

As there is an employee working in deptno 20, we cannot delete that
dept.
delete the parent row from the parent table is not allowed,
if the child table has the row corresponding to it.

DELETE FROM d1 WHERE dept_id = 40;
-- Query OK, 1 row affected (0.02 sec)

/*
Deleteing dept no 40 is allowed as there is not child row dependent
on it in the e1 table.

If we have to delete the parent row, we should first delete the child row from the e1 table and then delete the corresponding parent row from the d1 table.


UPDATE d1 SET dept_id = 50
WHERE dept_id = 20; 
This is also not allowed.
*/

DROP TABLE IF EXISTS e1;
CREATE TABLE e1
(
    emp_id INT PRIMARY KEY,
    ename VARCHAR(20),
    sal DECIMAL(9,2),
    dept_id INT,
    mgr_id INT,
    FOREIGN KEY(dept_id) REFERENCES d1(dept_id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY(mgr_id) REFERENCES e1(emp_id)
);


INSERT INTO e1 VALUES(101,'ABC',1000,10,101);
INSERT INTO e1 VALUEs(102,'XYZ',2000,30,NULL);
INSERT INTO e1 VALUEs(103,'AAA',3000,20,101);



mysql> DELETE FROM d1 WHERE dept_id = 20;
Query OK, 1 row affected (0.02 sec)

mysql> SELECT * FROM e1;
+--------+-------+---------+---------+--------+
| emp_id | ename | sal     | dept_id | mgr_id |
+--------+-------+---------+---------+--------+
|    101 | ABC   | 1000.00 |      10 |    101 |
|    102 | XYZ   | 2000.00 |      30 |   NULL |
+--------+-------+---------+---------+--------+
2 rows in set (0.00 sec)

mysql> SELECT * FROM d1;
+---------+------------+
| dept_id | dname      |
+---------+------------+
|      10 | Training   |
|      30 | Management |
+---------+------------+
2 rows in set (0.00 sec)


--______________________________________________________
-- CHECK constraint :
/*
Create a check_emp table
emp_id INT : 
emp_name varchar(20):
 age INT: should be between 20 to 65
 salary DECIMAL(8,2): should be greater than 1000
 comm INT: should be between 500 and 800
 total salary  (salary + comm) should be greater 1200
*/

CREATE TABLE check_emp
(
    emp_id INT,
    emp_name VARCHAR(20),
    age INT CHECK (age BETWEEN 20 AND 65),
    sal DECIMAL(8,2) CHECK (sal > 1000),
    comm DECIMAL (5,2) CHECK(comm BETWEEN 500 AND 800),
    CHECK(sal + IFNULL(comm,0) > 1200)
);

INSERT INTO check_emp(emp_id,emp_name,age) VALUES(101,'A',16);
-- ERROR 3819 (HY000): Check constraint 'check_emp_chk_1' is violated.

INSERT INTO check_emp(emp_id,emp_name,age) VALUES(101,'A',25);
-- Query OK, 1 row affected (0.01 sec)

INSERT INTO check_emp(emp_id,emp_name,age,sal) VALUES(101,'A',25,900);
-- ERROR 3819 (HY000): Check constraint 'check_emp_chk_2' is violated.

INSERT INTO check_emp(emp_id,emp_name,age,sal) VALUES(101,'A',25,1100);
-- ERROR 3819 (HY000): Check constraint 'check_emp_chk_4' is violated.

INSERT INTO check_emp(emp_id,emp_name,age,sal) VALUES(101,'A',25,1500);

--______________________________________________________

/*
LAB WORK :
Create a emp1 table with following constraints


emp_id INT primary key
emp_name VARCHAR(20) should not be null
email VARCHAR(30) should be unique
age INT should be 20 and above
salary DECIMAL(8,2) should be greater than 1000
manager_id INT should have a valid mgr id
Incentives INT should be more than 500
*/

/*
ALTER TABLE syntax for table level constraints :
ALTER TABLE tb_name ADD const_name(col1);

ALTER TABLE emp ADD UNIQUE(email);
 the name to the constraint is given by mysql

 to give the name to the constraint :
 ALTER TABLE emp ADD CONSTRAINT uni_emp_email UNIQUE(email);


As NOT NULL is the column level contraint, we can add that with the Modify keyword.
ALTER TABLE emp MODIFY COLUMN ename VARCHAR(20) NOT NULL;
*/


--__________________________VIEW________________________________
-- views : 


-- Create a simple view with empno,ename and mgr from emp table.

CREATE VIEW v1_emp AS
SELECT empno,ename,mgr FROM emp;

SELECT * FROM v1_emp;




-- insert into that view.
INSERT INTO v1_emp VALUES(111,'XYZ',100);

mysql> SELECT * FROM emp;
+-------+--------+-----------+------+------------+---------+---------+--------+
| empno | ename  | job       | mgr  | hire       | sal     | comm    | deptno |
+-------+--------+-----------+------+------------+---------+---------+--------+
|  7369 | SMITH  | CLERK     | 7902 | 1980-12-17 |  800.00 |    NULL |     20 |
|  7499 | ALLEN  | SALESMAN  | 7698 | 1981-02-20 | 1600.00 |  300.00 |     30 |
|  7521 | WARD   | SALESMAN  | 7698 | 1981-02-22 | 1250.00 |  500.00 |     30 |
|  7566 | JONES  | MANAGER   | 7839 | 1981-04-02 | 2975.00 |    NULL |     20 |
|  7654 | MARTIN | SALESMAN  | 7698 | 1981-09-28 | 1250.00 | 1400.00 |     30 |
|  7698 | BLAKE  | MANAGER   | 7839 | 1981-05-01 | 2850.00 |    NULL |     30 |
|  7782 | CLARK  | MANAGER   | 7839 | 1981-06-09 | 2450.00 |    NULL |     10 |
|  7788 | SCOTT  | ANALYST   | 7566 | 1982-12-09 | 3000.00 |    NULL |     20 |
|  7839 | KING   | PRESIDENT | NULL | 1981-11-17 | 5000.00 |    NULL |     10 |
|  7844 | TURNER | SALESMAN  | 7698 | 1981-09-08 | 1500.00 |    0.00 |     30 |
|  7876 | ADAMS  | CLERK     | 7788 | 1983-01-12 | 1100.00 |    NULL |     20 |
|  7900 | JAMES  | CLERK     | 7698 | 1981-12-03 |  950.00 |    NULL |     30 |
|  7902 | FORD   | ANALYST   | 7566 | 1981-12-03 | 3000.00 |    NULL |     20 |
|  7934 | MILLER | CLERK     | 7782 | 1982-01-23 | 1300.00 |    NULL |     10 |
|   111 | XYZ    | NULL      |  100 | NULL       |    NULL |    NULL |   NULL |
+-------+--------+-----------+------+------------+---------+---------+--------+
15 rows in set (0.00 sec)



-- Grant privileges on the view to the intern.
GRANT SELECT ON classwork_db.v1_emp TO intern;

--___________________________________________________
-- complex view
-- create a view on dept wise total,avg,max,min sal of emp table.
CREATE VIEW v_deptwise_sal AS
SELECT deptno,SUM(Sal) total_sal,MAX(sal) max_sal ,MIN(sal)min_sal,AVG(sal) avg_sal
FROM emp
GROUP BY deptno;


-- desc the views and select from the views.
DESC v_deptwise_sal;
SELECT * FROM v_deptwise_sal;


mysql> DESC v_deptwise_sal;
+-----------+---------------+------+-----+---------+-------+
| Field     | Type          | Null | Key | Default | Extra |
+-----------+---------------+------+-----+---------+-------+
| deptno    | int           | YES  |     | NULL    |       |
| total_sal | decimal(30,2) | YES  |     | NULL    |       |
| max_sal   | decimal(8,2)  | YES  |     | NULL    |       |
| min_sal   | decimal(8,2)  | YES  |     | NULL    |       |
| avg_sal   | decimal(12,6) | YES  |     | NULL    |       |
+-----------+---------------+------+-----+---------+-------+
5 rows in set (0.00 sec)

mysql> SELECT * FROM v_deptwise_sal;
+--------+-----------+---------+---------+-------------+
| deptno | total_sal | max_sal | min_sal | avg_sal     |
+--------+-----------+---------+---------+-------------+
|   NULL |      NULL |    NULL |    NULL |        NULL | 
|     10 |   8750.00 | 5000.00 | 1300.00 | 2916.666667 |
|     20 |  10875.00 | 3000.00 |  800.00 | 2175.000000 |
|     30 |   9400.00 | 2850.00 |  950.00 | 1566.666667 |
+--------+-----------+---------+---------+-------------+
4 rows in set (0.01 sec)

-- Shows the NULL in the first row because of the INSERT command in the above view v1_emp;


INSERT INTO v_deptwise_sal VALUES(40,11111,222222,3333,444);
-- Error : 

-- create a view showing the 
--empno,ename,sal,job,deptno,dname,location

CREATE VIEW v_emp_dept AS
SELECT e.empno,e.ename,e.sal,e.job,d.deptno,d.dname,d.loc
FROM emp e INNER JOIN dept d 
ON e.deptno = d.deptno;



-- Select and desc the above view

DESC v_emp_dept;
SELECT * FROM v_emp_dept;

mysql> SELECT * FROM v_emp_dept;
+-------+--------+---------+-----------+--------+------------+----------+
| empno | ename  | sal     | job       | deptno | dname      | loc      |
+-------+--------+---------+-----------+--------+------------+----------+
|  7782 | CLARK  | 2450.00 | MANAGER   |     10 | ACCOUNTING | NEW YORK |
|  7839 | KING   | 5000.00 | PRESIDENT |     10 | ACCOUNTING | NEW YORK |
|  7934 | MILLER | 1300.00 | CLERK     |     10 | ACCOUNTING | NEW YORK |
|  7369 | SMITH  |  800.00 | CLERK     |     20 | RESEARCH   | DALLAS   |
|  7566 | JONES  | 2975.00 | MANAGER   |     20 | RESEARCH   | DALLAS   |
|  7788 | SCOTT  | 3000.00 | ANALYST   |     20 | RESEARCH   | DALLAS   |
|  7876 | ADAMS  | 1100.00 | CLERK     |     20 | RESEARCH   | DALLAS   |
|  7902 | FORD   | 3000.00 | ANALYST   |     20 | RESEARCH   | DALLAS   |
|  7499 | ALLEN  | 1600.00 | SALESMAN  |     30 | SALES      | CHICAGO  |
|  7521 | WARD   | 1250.00 | SALESMAN  |     30 | SALES      | CHICAGO  |
|  7654 | MARTIN | 1250.00 | SALESMAN  |     30 | SALES      | CHICAGO  |
|  7698 | BLAKE  | 2850.00 | MANAGER   |     30 | SALES      | CHICAGO  |
|  7844 | TURNER | 1500.00 | SALESMAN  |     30 | SALES      | CHICAGO  |
|  7900 | JAMES  |  950.00 | CLERK     |     30 | SALES      | CHICAGO  |
+-------+--------+---------+-----------+--------+------------+----------+
14 rows in set (0.01 sec)


-- Try the Insert on the above view.
INSERT INTO v_emp_dept(empno,ename,sal,job,deptno,dname,loc) VALUES (1234,'AAA',1000,'CLERK',30,'SALES','CHICAGO');
-- Error :

/*
when there are joins, group functions, sub-queries etc on the View,
such type of view is called a complex view.
Performing DML operations on the complex view is not allowed.
*/

-- display the total salaries of emps based on the group of dname
-- using the above view.

SELECT dname,SUM(sal)
FROM v_emp_dept
GROUP BY dname;

+------------+----------+
| dname      | SUM(sal) |
+------------+----------+
| ACCOUNTING |  8750.00 |
| RESEARCH   | 10875.00 |
| SALES      |  9400.00 |
+------------+----------+


-- filter the above data of view for sum of sal of dname > 10000.
SELECT dname,SUM(sal)
FROM v_emp_dept
GROUP BY dname
HAVING SUM(Sal) > 10000;



-- delete from complex view
DELETE FROM v_emp_dept WHERE dname = 'SALES';
-- Error :


-- create a view with emps having no comm

CREATE VIEW v_emp_no_comm AS
SELECT * FROM emp
WHERE comm IS NULL;


-- insert the row into the above view and add the value in the comm.
INSERT INTO v_emp_no_comm (empno,ename,sal,comm,deptno) VALUES
(12345,'ABCD',10000,0.12,30);

-- Row inserted in the main table.


SELECT * FROM v_emp_no_comm;
-- This does not show th above inserted row.


SELECT * FROM emp;


--___________________________________________
-- with check option

CREATE VIEW v1 AS
SELECT * FROM emp
WHERE comm IS NULL WITH CHECK OPTION;

INSERT INTO v1 (empno,ename,sal,comm,deptno) VALUES
(12111,'ABCD',10000,0.12,30);
-- ERROR 1369 (HY000): CHECK OPTION failed 'ac_classwork_db.v1'


-- ______________________________________
-- show all views with full tables.
SHOW FULL TABLES;

 meeting                   | BASE TABLE |
| orders                    | BASE TABLE |
| repetition                | BASE TABLE |
| salespeople               | BASE TABLE |
| salgrade                  | BASE TABLE |
| students                  | BASE TABLE |
| temp                      | BASE TABLE |
| v1                        | VIEW       |
| v1_emp                    | VIEW       |
| v_deptwise_sal            | VIEW       |
| v_emp_dept                | VIEW       |
| v_emp_no_comm             | VIEW       |

-- show the create table query
SHOW CREATE TABLE emp;

SHOW CREATE TABLE v1_emp;
-- drop a view


--********************************************
--__________________________subqueries_________________________________
/*
Sub-queries : Nested Queries : Query inside query.
Most of the times The inner query is executed first sending the output 
to the outer query.
The outer query uses the output sent by inner query and executes.
Maximum times the sub-queries are SELECT inside SELECT.
*/

-- Single Row Sub-Queries :
 -- Return single value from the inner query to the outer query.
 -- They are combined with the relational ops : <, <=, >, >=, =, <>,!=


-- Display Max salary of emp From emp table.

SELECT MAX(sal) FROM emp;
-- 5000


-- Display the details of emp earning the max sal.
SELECT * FROM emp
WHERE sal = MAX(sal);
-- error : GROUP function cannot be the part of WHERE clause.

SELECT * FROM emp WHERE sal = 5000;

-- using variable

SET @max_sal = (SELECT MAX(sal) FROM emp);
-- SET @max_sal = 5000

SELECT @max_Sal;
+----------+
| @max_Sal |
+----------+
|  5000.00 |
+----------+
1 row in set (0.00 sec)

SELECT * FROM emp 
WHERE sal = @max_sal;

+-------+-------+-----------+------+------------+---------+------+--------+
| empno | ename | job       | mgr  | hire       | sal     | comm | deptno |
+-------+-------+-----------+------+------------+---------+------+--------+
|  7839 | KING  | PRESIDENT | NULL | 1981-11-17 | 5000.00 | NULL |     10 |
+-------+-------+-----------+------+------------+---------+------+--------+
1 row in set (0.00 sec)

-- Sub-query
SELECT * FROM emp
WHERE sal = (SELECT MAX(sal) FROM emp);
-- SELECT * FROM emp WHERE sal = (5000);

-- _________________________________________
-- Display the emp with 2nd highest salary
SELECT DISTINCT sal 
FROM emp
ORDER BY sal DESC;

+---------+
| sal     |
+---------+
| 5000.00 |
| 3000.00 |
| 2975.00 |
| 2850.00 |
| 2450.00 |
| 1600.00 |
| 1500.00 |
| 1300.00 |
| 1250.00 |
| 1100.00 |
|  950.00 |
|  800.00 |
+---------+
12 rows in set (0.00 sec)


-- using variable

SET @sal2 = (SELECT DISTINCT sal FROM emp 
ORDER BY sal DESC
LIMIT 1,1);

mysql> SELECT @sal2;
+---------+
| @sal2   |
+---------+
| 3000.00 |
+---------+
1 row in set (0.00 sec)



SELECT * FROM emp WHERE sal = @sal2;




-- using sub-query

SELECT * FROM emp WHERE sal = 
(SELECT DISTINCT sal FROM emp ORDER BY sal DESC LIMIT 1,1);
-- SELECT * FROM emp WHERE sal = 3000;


--__________________________________________
-- Display the details of emp who earns 3rd highest sal.

SELECT * FROM emp
WHERE sal = (SELECT DISTINCT sal FROM emp ORDER BY sal DESC LIMIT 2,1);
-- SELECT * FROM emp WHERE sal = 2975;

-- if the sub-query returns empty set :
-- SELECT * FROM emp WHERE sal = NULL;
-- empty set

--_______________________________________
-- Display all the employees who work in the same dept 
--as that of allen.



SELECT deptno
FROM emp 
WHERE ename = 'allen';

SELECT * FROm emp WHERE deptno = 30;


-- OR

SET @dept_no = (SELECT deptno
FROM emp 
WHERE ename = 'allen');

SELECT * FROM emp WHERE deptno = @dept_no;

-- OR

SELECT * FROM emp
WHERE deptno = (SELECT deptno FROM emp WHERE ename = 'allen');


--________________________________________

--Display the details of all the employees 
--who have the same job like blake 
--and who earn the salary greater than employee clark.
SET @job_id = (SELECT job FROM emp WHERE ename = 'blake');
SET @sal = (SELECT sal FROM emp WHERE ename = 'clark');
mysql> SELECT @job_id;
+---------+
| @job_id |
+---------+
| MANAGER |
+---------+
1 row in set (0.00 sec)

mysql> SELECT @sal;
+---------+
| @sal    |
+---------+
| 2450.00 |
+---------+
1 row in set (0.00 sec)

SELECT * FROM emp
WHERE job = @job_id
AND sal > @sal;


-- OR

SELECT * FROM emp
WHERE job = (SELECT job FROM emp WHERE ename = 'blake')
AND 
sal > (SELECT sal FROM emp WHERE ename = 'clark');

+-------+-------+---------+------+------------+---------+------+--------+
| empno | ename | job     | mgr  | hire       | sal     | comm | deptno |
+-------+-------+---------+------+------------+---------+------+--------+
|  7566 | JONES | MANAGER | 7839 | 1981-04-02 | 2975.00 | NULL |     20 |
|  7698 | BLAKE | MANAGER | 7839 | 1981-05-01 | 2850.00 | NULL |     30 |
+-------+-------+---------+------+------------+---------+------+--------+
2 rows in set (0.00 sec)


--_____________________________________________________
--Display the details of employees whose salary is LESS THAN 
--the average salary of all the employees from the emp table.


SELECT * FROM emp
WHERE sal < (SELECT AVG(sal) FROM emp);




--************************************************************
--_________________________________________
-- Multi Row Subqueries :
-- Operators : ANY , ALL 

-- ANY :
-- Compares will all values from subquery and returns true if 
-- condition is TRUE for any of them.
-- Similar to LOGICAL OR
    -- =Any : Equivalent to IN
    
    
    -- <ANY : Less Than Maximum
    -- weight <any of the weights from the subquery
    -- weight <ANY (45,65,55,70);
    -- Weight < 45 OR weight < 65 OR weight <55 OR weight < 70
    -- Weight < max value(70)

    -- >ANY : Greater Than Minimum
    -- sal >ANY(3000,2500,1500,1200,1700)
    -- sal >ANY 1200

--____________________________________________________________
-- Display the details of departments from dept table who have emps
-- working into it.
-- op : =ANY

SELECT * FROM dept;


SELECT DISTINCT deptno FROM emp;

SELECT * FROM dept
WHERE deptno =ANY (SELECT DISTINCT deptno FROM emp);

+--------+------------+----------+
| deptno | dname      | loc      |
+--------+------------+----------+
|     10 | ACCOUNTING | NEW YORK |
|     20 | RESEARCH   | DALLAS   |
|     30 | SALES      | CHICAGO  |
+--------+------------+----------+
3 rows in set (0.00 sec)


SELECT * FROM dept
WHERE deptno IN(SELECT DISTINCT deptno FROM emp);


/*
=ANY operator works like IN operator.
Both give the same result.
*/



SELECT * FROM dept
WHERE deptno =ANY (10,20,30);



--____________________________________________________
--	Display all the emps who earn salary less than 
--any of the emps in dept 20.




-- check sals of dept 20
SELECT sal FROM emp WHERE deptno = 20;


+---------+
| sal     |
+---------+
|  800.00 |
| 2975.00 |
| 3000.00 |
| 1100.00 |
| 3000.00 |
+---------+
5 rows in set (0.00 sec)


SELECT * FROM emp
WHERE sal <ANY (SELECT sal FROM emp WHERE deptno = 20);

SELECT * FROM emp
WHERE sal <ANY
 (800,2975,3000,1100,3000); 


 /*

 <ANY considers LESS THAN MAXIMUM value coming frm the sub-query.

<ANY (3000)

SELECT * FROM emp
WHERE sal <ANY  (3000)

The above multi row subquery can be written as the single row sub-query as below :
*/


SELECT * FROM emp
WHERE sal < (SELECT MAX(sal) FROM emp WHERE deptno = 20);



--________________________________________________________
--Display all the emps who earn salary more than 
--any of the salesman.

-- check the salaries of salesman.
SELECT sal FROM emp WHERE job = 'salesman';


+---------+
| sal     |
+---------+
| 1600.00 |
| 1250.00 |
| 1250.00 |
| 1500.00 |
+---------+
4 rows in set (0.00 sec)





-- using multi-row sub-query

-- >ANY considers greater than minimum value from all the values coming from
-- inner query.

SELECT * FROM emp
WHERE sal >ANY (SELECT sal FROM emp WHERE job = 'salesman');

/*
SELECT * FROM emp
WHERE sal >ANY (1600,1250,1250,1500);

SELECT * FROM emp
WHERE sal >ANY (1250)
*/

-- using single row sub-query
SELECT * FROM emp 
WHERE sal > (SELECT MIN(Sal) FROM emp WHERE job = 'salesman');


--____________________________________________________
-- ALL operator :
---- Compares with all values from subquery and returns true if 
-- condition is TRUE for all of them.
-- Similar to LOGICAL AND
 
    -- < ALL : Less than Minimum
    -- weight < ALL 
    -- WEIGHT <ALL (45,65,75,80)
    -- WEIGHT < 45 AND weight < 65 AND weight < 75
    -- weight < 45(most minimum)

-- > ALL : Greater tha max
    -- WEIGHT >ALL (45,65,75,80)
   -- WEIGHT > 45 AND weight>65 AND weight > 75 
   -- weight > 80(maximum)
    
    -- = ALL : not possible
    
    -- <> ALL : equivalent to NOt IN

--________________________________________________________
--Display the details of emps who earn salary 
--more than all the salesman.
SELECT sal FROM emp WHERE job = 'salesman';

+---------+
| sal     |
+---------+
| 1600.00 |
| 1250.00 |
| 1250.00 |
| 1500.00 |
+---------+
4 rows in set (0.00 sec)

-- <ALL means GREATER THAN MAXIMUM value coming from the subquery.

--using multi-row sub-query
SELECT * FROM emp
WHERE sal >ALL (SELECT sal FROM emp WHERE job = 'salesman');

/*

SELECT * FROM emp
WHERE sal >ALL (1600,1250,1250,1500)

> ALL considers (1600)

*/


-- using single row sub-query
SELECT * FROM emp
WHERE sal > (SELECT MAX(sal) FROM emp WHERE job = 'salesman');

--______________________________________________
--Display the details of emps who earn the salary 
--less than all the emps working in department 30.


-- using multi-row sub-query
SELECT * FROM emp
WHERE sal <ALL (SELECT sal FROM emp WHERE deptno = 30);
-- Less Than Minimum value coming from subquery

-- using single-row sub-query
SELECT * FROM emp
WHERE sal < (SELECT MIN(sal) FROM emp WHERE deptno = 30);


--__________________________________________
-- 	Display the depts who do not have emps.

SELECT * FROM dept
WHERE deptno <>ALL (SELECT deptno FROM emp);

-- SELECT * FROM dept
-- WHERE deptno <>ALL(10,20,30);


+--------+------------+--------+
| deptno | dname      | loc    |
+--------+------------+--------+
|     40 | OPERATIONS | BOSTON |
+--------+------------+--------+
1 row in set (0.01 sec)


SELECT * FROM dept
WHERE deptno NOT IN (SELECT deptno FROM emp);




--*******************************************************
--_______________________________________________
-- Co-related Subquery

/*
1) Each row from the outer query table is sent one by one to the inner query.
2) The inner query executes itself using the row sent from the outer query and then sends the output to the outer query.
3) The outer query then prints that row if the condition matches with the output sent from inner query.
*/



-- Display the details of emps with max sal in each dept.
SELECT deptno,MAX(sal)
FROM emp
GROUP BY deptno;

+--------+----------+
| deptno | MAX(sal) |
+--------+----------+
|     10 |  5000.00 |
|     20 |  3000.00 |
|     30 |  2850.00 |
+--------+----------+
3 rows in set (0.00 sec)


SELECT * FROM emp e1
WHERE sal = (SELECT MAX(sal) FROM emp e2 WHERE e2.deptno = e1.deptno);
 -- 1st row sent : CLARK - 2450 - dept 10
 --      (SELECT MAX(sal) FROM emp e2 WHERE e2.deptno = 10)
 --     5000
  ---    clark from dept 10 does not earn the max sal in that dept, that row is not displayed 5000
  

  -- 2nd row of allen from dept 30 with sal 1600 is sent to inner query
  -- inner query will execute itself depending on that current row sent.
  -- SELECT MAX(sal) FROM emp WHERE deptno = 30
  -- 2850 
  -- as allens sal is 1600 it does not match the 2850 coming from inner query.
  -- hence not displayed.

+-------+-------+-----------+------+------------+---------+------+--------+
| empno | ename | job       | mgr  | hire       | sal     | comm | deptno |
+-------+-------+-----------+------+------------+---------+------+--------+
|  7698 | BLAKE | MANAGER   | 7839 | 1981-05-01 | 2850.00 | NULL |     30 |
|  7788 | SCOTT | ANALYST   | 7566 | 1982-12-09 | 3000.00 | NULL |     20 |
|  7839 | KING  | PRESIDENT | NULL | 1981-11-17 | 5000.00 | NULL |     10 |
|  7902 | FORD  | ANALYST   | 7566 | 1981-12-03 | 3000.00 | NULL |     20 |
+-------+-------+-----------+------+------------+---------+------+--------+
4 rows in set (0.00 sec)


-- Display the details of emps who are earning more than 
--the avg sal of their dept.

SELECT * FROM emp e1
WHERE sal > (SELECT AVG(sal) FROM emp e2 WHERE e2.deptno = e1.deptno);


-- Display the departments which have emps working in it.

SELECT * FROM dept
WHERE deptno =ANY(SELECT DISTINCT deptno FROM emp);

SELECT * FROM dept
WHERE deptno IN(SELECT DISTINCT deptno FROM emp);


SELECT * FROM dept d 
WHERE deptno = (SELECT deptno FROM emp e WHERE e.deptno = d.deptno);



SELECT * FROM dept d 
WHERE EXISTS (SELECT * FROM emp e WHERE e.deptno = d.deptno);

--------+------------+----------+
| deptno | dname      | loc      |
+--------+------------+----------+
|     10 | ACCOUNTING | NEW YORK |
|     20 | RESEARCH   | DALLAS   |
|     30 | SALES      | CHICAGO  |
+--------+------------+----------+
3 rows in set (0.00 sec)

/*
The EXISTS operator is a boolean operator that returns either true or false. 
The EXISTS operator is often used to test for the existence of rows 
returned by the subquery.
In addition, the EXISTS operator terminates further processing immediately 
once it finds a matching row, 
which can help improve the performance of the query.
Note that you can use SELECT *, SELECT column, SELECT a_constant, 
or anything in the subquery. The results are the same 
because MySQL ignores the select list that appeared in the SELECT clause.
*/


/*
The NOT operator negates the EXISTS operator. In other words, the NOT EXISTS 
returns true if the subquery returns no row, otherwise it returns false.
*/

-- Display the depts which do not have any emps.

SELECT * FROM dept d 
WHERE NOT EXISTS (SELECT * FROM emp e WHERE e.deptno = d.deptno);

+--------+------------+--------+
| deptno | dname      | loc    |
+--------+------------+--------+
|     40 | OPERATIONS | BOSTON |
+--------+------------+--------+
1 row in set (0.00 sec)


--***************************************************
