/*
AGENDA :
    Pending Datatypes :
    INSERT
    SQL Script.

- DQL : SELECT
    - PROJECTION
    - COMPUTED Columns
    -  CASE
    - DISTINCT
    - LIMIT
    - ORDER BY
- WHERE
    - Relational Operators
    - Logical Operators
    - NULL Operators
    - IN,BETWEEN
*/

-- ___________________________________________________________________

--Binary types :
-- Refer PDF

-- Miscellaneous types :
-- Refer PDF


--_________________________________________________________
-- Create an employee table
-- emp_id : INT
-- emp_name :VARCHAR(20)
-- salary : DECIMAL(9,2)
-- designation : CHAR(20)
-- comm : FLOAT
-- hire_date : date

CREATE TABLE employee
(
    emp_id INT,
    emp_name VARCHAR(20),
    salary DECIMAL(9,2),
    designation CHAR(20),
    commission FLOAT,
    hire_date DATE
);

DESCRIBE employee;
-- OR
DESC employee;

-- Shows the table structure : the columns with the corresponding datatypes.

-- INSERT continued

INSERT INTO employee VALUES(101,'Ramesh',11111,'Manager',0.5,'1999-03-10');
INSERT INTO employee VALUES(102,'Suresh',2222,'clerk',NULL,'2002-05-01');

INSERT INTO employee(emp_id,emp_name,salary) VALUES(103,'Mahesh',33333);

INSERT INTO employee(emp_name,emp_id,designation,salary) VALUES ('Dinesh',104,'Salesman',44444);

INSERT INTO employee(emp_id,emp_name,salary) VALUES
(105,'Rakesh',55555),
(106,'Rupesh',6666),
(107,'Lokesh',7777);


-- Create a new table with the name new_students. Copy the data from the students table into the 
-- new_students table.
CREATE TABLE new_students(roll_no INT, name CHAR(30),marks DOUBLE);

INSERT INTO new_students SELECT * FROM students;

INSERT INTO new_students(roll_no,name) SELECT roll_no,name FROM students;

SELECT * FROM new_students;
-- ___________________SQL Script_______________________________

-- USE source command to import the file.

SOURCE file_path




-- _________________________________________________________________
--Projection : Display specific columns

-- Display all columns

SELECT * FROM emp;
-- * denotes all the columns from the table.

-- Display empno, ename and sal from the emp table.
--Syntax : 

SELECT empno,ename,sal FROM emp;
-- Projection : accessing specific columns from the table.


-- Display the empno, hiredate, sal and comm of all the emps.
SELECT empno,hiredate,sal,comm FROM emp;


-- Display empno, ename,salary and allowance(50% of sal)

SELECT empno,ename,sal,sal * 0.5 FROM emp;

SELECT empno,ename `emp name` ,sal salary, sal* 0.5 AS allowance FROM emp;

-- display the empno, name, sal, allowance(sal * 0.5) 
--and total sal(sal+allowance)



SELECT empno,ename,sal,sal * 0.5 AS allowance, sal + allowance FROM emp;
-- error : Unknown column allowance 

SELECT empno,ename,sal,sal * 0.5 AS allowance, sal + (sal * 0.5) AS "Total Sal" FROM emp;

+-------+--------+---------+-----------+-----------+
| empno | ename  | sal     | allowance | Total Sal |
+-------+--------+---------+-----------+-----------+
|  7369 | SMITH  |  800.00 |   400.000 |  1200.000 |
|  7499 | ALLEN  | 1600.00 |   800.000 |  2400.000 |
|  7521 | WARD   | 1250.00 |   625.000 |  1875.000 |
|  7566 | JONES  | 2975.00 |  1487.500 |  4462.500 |
|  7654 | MARTIN | 1250.00 |   625.000 |  1875.000 |
|  7698 | BLAKE  | 2850.00 |  1425.000 |  4275.000 |
|  7782 | CLARK  | 2450.00 |  1225.000 |  3675.000 |
|  7788 | SCOTT  | 3000.00 |  1500.000 |  4500.000 |
|  7839 | KING   | 5000.00 |  2500.000 |  7500.000 |
|  7844 | TURNER | 1500.00 |   750.000 |  2250.000 |
|  7876 | ADAMS  | 1100.00 |   550.000 |  1650.000 |
|  7900 | JAMES  |  950.00 |   475.000 |  1425.000 |
|  7902 | FORD   | 3000.00 |  1500.000 |  4500.000 |
|  7934 | MILLER | 1300.00 |   650.000 |  1950.000 |
+-------+--------+---------+-----------+-----------+
14 rows in set (0.00 sec)



--______________________________CASE_________________________________________

-- Display the empno,ename,deptno, 
--deptname(for deptno 10 display Administration)

SELECT empno,ename,deptno,
CASE 
WHEN deptno = 10 THEN 'Administration'
END AS "dept Name"
FROM emp;

+-------+--------+--------+----------------+
| empno | ename  | deptno | dept Name      |
+-------+--------+--------+----------------+
|  7369 | SMITH  |     20 | NULL           |
|  7499 | ALLEN  |     30 | NULL           |
|  7521 | WARD   |     30 | NULL           |
|  7566 | JONES  |     20 | NULL           |
|  7654 | MARTIN |     30 | NULL           |
|  7698 | BLAKE  |     30 | NULL           |
|  7782 | CLARK  |     10 | Administration |
|  7788 | SCOTT  |     20 | NULL           |
|  7839 | KING   |     10 | Administration |
|  7844 | TURNER |     30 | NULL           |
|  7876 | ADAMS  |     20 | NULL           |
|  7900 | JAMES  |     30 | NULL           |
|  7902 | FORD   |     20 | NULL           |
|  7934 | MILLER |     10 | Administration |
+-------+--------+--------+----------------+
14 rows in set (0.00 sec)

/*
Display the ename,deptno and the dept name as administration for deptno 10,
Testing for deptno 20 and development for deptno 30.
*/
SELECT empno,ename,deptno,
CASE
WHEN deptno = 10 THEN "Administration"
WHEN deptno = 20 THEN "Testing"
WHEN deptno = 30 THEN "Development"
END "Dept Name"
FROM emp;

+-------+--------+--------+----------------+
| empno | ename  | deptno | Dept Name      |
+-------+--------+--------+----------------+
|  7369 | SMITH  |     20 | Testing        |
|  7499 | ALLEN  |     30 | Development    |
|  7521 | WARD   |     30 | Development    |
|  7566 | JONES  |     20 | Testing        |
|  7654 | MARTIN |     30 | Development    |
|  7698 | BLAKE  |     30 | Development    |
|  7782 | CLARK  |     10 | Administration |
|  7788 | SCOTT  |     20 | Testing        |
|  7839 | KING   |     10 | Administration |
|  7844 | TURNER |     30 | Development    |
|  7876 | ADAMS  |     20 | Testing        |
|  7900 | JAMES  |     30 | Development    |
|  7902 | FORD   |     20 | Testing        |
|  7934 | MILLER |     10 | Administration |
+-------+--------+--------+----------------+
14 rows in set (0.00 sec)

--OR

SELECT empno,ename,deptno,
CASE deptno
WHEN 10 THEN "Administration"
WHEN 20 THEN "Testing"
WHEN 30 THEN "Development"
END AS "Dept name"
FROM emp;

/* We can use the above syntax for CASE when the conditions are based only on one column for
equality condition.
for eg : in the above query, we are checking only for the deptno no column.
*/

--_________________________________________________________________
/*
Display the empno,ename,sal and status :
if sal below 2500 display : below avg
if sal is between 2500 and 4000 display : Avg
else display above avg
*/

SELECT empno,ename,sal,
CASE
WHEN sal < 2500 THEN "Below Avg"
WHEN sal >= 2500 AND sal <=4000 THEN "Avg"
ELSE "Above Avg"
END "Status"
FROM emp;


+-------+--------+---------+-----------+
| empno | ename  | sal     | Status    |
+-------+--------+---------+-----------+
|  7369 | SMITH  |  800.00 | Below Avg |
|  7499 | ALLEN  | 1600.00 | Below Avg |
|  7521 | WARD   | 1250.00 | Below Avg |
|  7566 | JONES  | 2975.00 | Avg       |
|  7654 | MARTIN | 1250.00 | Below Avg |
|  7698 | BLAKE  | 2850.00 | Avg       |
|  7782 | CLARK  | 2450.00 | Below Avg |
|  7788 | SCOTT  | 3000.00 | Avg       |
|  7839 | KING   | 5000.00 | Above Avg |
|  7844 | TURNER | 1500.00 | Below Avg |
|  7876 | ADAMS  | 1100.00 | Below Avg |
|  7900 | JAMES  |  950.00 | Below Avg |
|  7902 | FORD   | 3000.00 | Avg       |
|  7934 | MILLER | 1300.00 | Below Avg |
+-------+--------+---------+-----------+
14 rows in set (0.01 sec)


/*
Case with computed columns
Display empno,ename,sal, deptno,
For dept 10 print bonus as sal * 0.10
For dept 20 print bonus sal * 0.20
For dept 30 print bonus sal * 0.30
*/


SELECT empno,ename,sal,deptno,
CASE
WHEN deptno = 10 THEN sal * 0.10
WHEN deptno = 20 THEN sal * 0.20
WHEN deptno = 30 THEN sal * 0.30
END As bonus
FROM emp;

+-------+--------+---------+--------+----------+
| empno | ename  | sal     | deptno | bonus    |
+-------+--------+---------+--------+----------+
|  7369 | SMITH  |  800.00 |     20 | 160.0000 |
|  7499 | ALLEN  | 1600.00 |     30 | 480.0000 |
|  7521 | WARD   | 1250.00 |     30 | 375.0000 |
|  7566 | JONES  | 2975.00 |     20 | 595.0000 |
|  7654 | MARTIN | 1250.00 |     30 | 375.0000 |
|  7698 | BLAKE  | 2850.00 |     30 | 855.0000 |
|  7782 | CLARK  | 2450.00 |     10 | 245.0000 |
|  7788 | SCOTT  | 3000.00 |     20 | 600.0000 |
|  7839 | KING   | 5000.00 |     10 | 500.0000 |
|  7844 | TURNER | 1500.00 |     30 | 450.0000 |
|  7876 | ADAMS  | 1100.00 |     20 | 220.0000 |
|  7900 | JAMES  |  950.00 |     30 | 285.0000 |
|  7902 | FORD   | 3000.00 |     20 | 600.0000 |
|  7934 | MILLER | 1300.00 |     10 | 130.0000 |
+-------+--------+---------+--------+----------+
14 rows in set (0.00 sec)


--_____________________________DISTINCT___________________________________

-- Display all the jobs from emp table.
SELECT job FROM emp;

+-----------+
| job       |
+-----------+
| CLERK     |
| SALESMAN  |
| SALESMAN  |
| MANAGER   |
| SALESMAN  |
| MANAGER   |
| MANAGER   |
| ANALYST   |
| PRESIDENT |
| SALESMAN  |
| CLERK     |
| CLERK     |
| ANALYST   |
| CLERK     |
+-----------+
14 rows in set (0.00 sec)

-- Display unique jobs from emp table.
SELECT DISTINCT job FROM emp;
+-----------+
| job       |
+-----------+
| CLERK     |
| SALESMAN  |
| MANAGER   |
| ANALYST   |
| PRESIDENT |
+-----------+
5 rows in set (0.01 sec)

-- Display all the deptnos from emp table.
SELECT deptno FROM emp;


-- Display unique deptnos from emp table.
SELECT DISTINCT deptno FROM emp;

+--------+
| deptno |
+--------+
|     20 |
|     30 |
|     10 |
+--------+
3 rows in set (0.00 sec)

-- Display deptnos and job from emp table.
SELECT deptno,job FROM emp;

+--------+-----------+
| deptno | job       |
+--------+-----------+
|     20 | CLERK     |
|     30 | SALESMAN  |
|     30 | SALESMAN  |
|     20 | MANAGER   |
|     30 | SALESMAN  |
|     30 | MANAGER   |
|     10 | MANAGER   |
|     20 | ANALYST   |
|     10 | PRESIDENT |
|     30 | SALESMAN  |
|     20 | CLERK     |
|     30 | CLERK     |
|     20 | ANALYST   |
|     10 | CLERK     |
+--------+-----------+
14 rows in set (0.00 sec)


-- Display deptnos and their unique jobs from the emp table.
SELECT DISTINCT deptno,job FROM emp;


+--------+-----------+
| deptno | job       |
+--------+-----------+
|     20 | CLERK     |
|     30 | SALESMAN  |
|     20 | MANAGER   |
|     30 | MANAGER   |
|     10 | MANAGER   |
|     20 | ANALYST   |
|     10 | PRESIDENT |
|     30 | CLERK     |
|     10 | CLERK     |
+--------+-----------+
9 rows in set (0.00 sec)

-- Display the unqiue combinations

-- ________________________________LIMIT_________________________________
-- Display all the emps

SELECT * FROM emp;
-- 14 rows are displayed

-- Display first 5 emps from emp table.
SELECT * FROM emp LIMIT 5;

-- Display first 10 emps from emp table.
SELECT * FROM emp LIMIT 10;


---- Display ename,sal and job of first 8 employees
SELECT ename,sal,job FROM emp LIMIT 8;


-- Display ename,sal and allowance(20% of sal) for first 6 employees
SELECT ename,sal,sal * 0.2 AS allowance FROM emp LIMIT 6;



-- Display 6 records of emp skipping the first 5 records.
SELECT empno,ename,sal
FROM emp
LIMIT 5,6;

+-------+--------+---------+
| empno | ename  | sal     |
+-------+--------+---------+
|  7698 | BLAKE  | 2850.00 |
|  7782 | CLARK  | 2450.00 |
|  7788 | SCOTT  | 3000.00 |
|  7839 | KING   | 5000.00 |
|  7844 | TURNER | 1500.00 |
|  7876 | ADAMS  | 1100.00 |
+-------+--------+---------+
6 rows in set (0.00 sec)


-- _______________________________ORDER BY_____________________________________
/*
ORDER BY clause is used to display the data in the specific order of a column, 
in the ascending or descending order of the column data.
By default with the ORDER BY clause the data of that column is displayed in the ascending order.
Optionally we can also mention the ASC keyword to specify the ascending order.
To display the data in the descing order , we have to specify the DESC keyword after the column.

*/



-- Display ename and salary of all the employees 
--with the data in ascending order of the names.


SELECT ename, sal
FROM emp
ORDER BY ename;


-- OR
SELECT ename, sal
FROM emp
ORDER BY ename ASC;

+--------+---------+
| ename  | sal     |
+--------+---------+
| ADAMS  | 1100.00 |
| ALLEN  | 1600.00 |
| BLAKE  | 2850.00 |
| CLARK  | 2450.00 |
| FORD   | 3000.00 |
| JAMES  |  950.00 |
| JONES  | 2975.00 |
| KING   | 5000.00 |
| MARTIN | 1250.00 |
| MILLER | 1300.00 |
| SCOTT  | 3000.00 |
| SMITH  |  800.00 |
| TURNER | 1500.00 |
| WARD   | 1250.00 |
+--------+---------+
14 rows in set (0.01 sec)



-- Display the empno, ename and sal of all the emps 
--with salaries displayed in the descending order.

SELECT empno,ename,sal
FROM emp
ORDER BY sal DESC;

+-------+--------+---------+
| empno | ename  | sal     |
+-------+--------+---------+
|  7839 | KING   | 5000.00 |
|  7788 | SCOTT  | 3000.00 |
|  7902 | FORD   | 3000.00 |
|  7566 | JONES  | 2975.00 |
|  7698 | BLAKE  | 2850.00 |
|  7782 | CLARK  | 2450.00 |
|  7499 | ALLEN  | 1600.00 |
|  7844 | TURNER | 1500.00 |
|  7934 | MILLER | 1300.00 |
|  7521 | WARD   | 1250.00 |
|  7654 | MARTIN | 1250.00 |
|  7876 | ADAMS  | 1100.00 |
|  7900 | JAMES  |  950.00 |
|  7369 | SMITH  |  800.00 |
+-------+--------+---------+
14 rows in set (0.00 sec)




-- Display the empno,ename,deptno,job from emp with the deptno in ascending order
SELECT empno,ename,deptno,job
FROM emp
ORDER BY deptno ASC;



-- Display the emp details sorted in asc order as per the deptno and job together
SELECT empno,ename,sal,deptno,job
FROM emp
ORDER BY deptno,job;

+-------+--------+---------+--------+-----------+
| empno | ename  | sal     | deptno | job       |
+-------+--------+---------+--------+-----------+
|  7934 | MILLER | 1300.00 |     10 | CLERK     |
|  7782 | CLARK  | 2450.00 |     10 | MANAGER   |
|  7839 | KING   | 5000.00 |     10 | PRESIDENT |
|  7788 | SCOTT  | 3000.00 |     20 | ANALYST   |
|  7902 | FORD   | 3000.00 |     20 | ANALYST   |
|  7369 | SMITH  |  800.00 |     20 | CLERK     |
|  7876 | ADAMS  | 1100.00 |     20 | CLERK     |
|  7566 | JONES  | 2975.00 |     20 | MANAGER   |
|  7900 | JAMES  |  950.00 |     30 | CLERK     |
|  7698 | BLAKE  | 2850.00 |     30 | MANAGER   |
|  7499 | ALLEN  | 1600.00 |     30 | SALESMAN  |
|  7521 | WARD   | 1250.00 |     30 | SALESMAN  |
|  7654 | MARTIN | 1250.00 |     30 | SALESMAN  |
|  7844 | TURNER | 1500.00 |     30 | SALESMAN  |
+-------+--------+---------+--------+-----------+
14 rows in set (0.00 sec)





-- display emp details with deptno sorted in desc order 
--and job sorted in asc order
SELECT empno,ename,deptno,job
FROM emp
ORDER BY deptno DESC,job ASC;


-- deptno and job both in descending

SELECT empno,ename,deptno,job
FROM emp
ORDER BY deptno DESC,job DESC;


-- Display only first 7 emps sorted in the ascending order of sal.

SELECT empno,ename,sal
FROM emp
ORDER BY sal 
LIMIT 7;


+-------+--------+---------+
| empno | ename  | sal     |
+-------+--------+---------+
|  7369 | SMITH  |  800.00 |
|  7900 | JAMES  |  950.00 |
|  7876 | ADAMS  | 1100.00 |
|  7521 | WARD   | 1250.00 |
|  7654 | MARTIN | 1250.00 |
|  7934 | MILLER | 1300.00 |
|  7844 | TURNER | 1500.00 |
+-------+--------+---------+
7 rows in set (0.00 sec)


-- Display the details of emp with the highest salary.


SELECT empno,ename,sal,deptno
FROM emp
ORDER BY sal DESC
LIMIT 1;

+-------+-------+---------+--------+
| empno | ename | sal     | deptno |
+-------+-------+---------+--------+
|  7839 | KING  | 5000.00 |     10 |
+-------+-------+---------+--------+
1 row in set (0.00 sec)



-- Display the details of 4 emps earning the least salary.
SELECT empno,ename,sal,deptno
FROM emp
ORDER BY sal
LIMIT 4;


-- Display the details of emp earning 2nd highest salary.
SELECT * FROM emp
ORDER BY sal DESC
LIMIT 1,1;


-- Display the details of emps earning 3rd highest salary.
SELECT * FROM emp
ORDER BY sal DESC
LIMIT 2,1;
/*
Does not give the required output, as such requirements can be achieved with subqueries.
*/

-- Display the ename, sal and allowance(30% of sal) of emp 
--sorted in the descending order of allowance

SELECT ename,sal,sal*0.3 AS allowance
FROm emp
ORDER BY sal * 0.3 DESC;

-- OR

SELECT empno,ename,sal,sal *0.3 AS allowance, sal + allowance
FROM emp; 
-- error : using alias in SELECT is NOT allowed

SELECT ename,sal,sal*0.3 AS allowance
FROm emp
ORDER BY allowance DESC;
-- Giving the alias in the ORDER BY clause is allowed.


-- Display the data sorted in descending order of the 3rd column 
-- given in the SELECT.

SELECT empno,ename,sal,deptno
FROM emp
ORDER BY 3;
-- It will Sort the data in the Ascending order of the 3rd column of the SELECT clause (sal). 

-- Display the details of 3rd emp recruited.

SELECT empno,ename,sal,hire
FROM emp
ORDER by hire
LIMIT 2,1;


--________________________WHERE________________________________
/*
WHERE clause is used to specify the condition. All the rows satisfying the underlying
condition are displayed. This is called as Selection.
WHERE clause should be given after the FROM clause.
*/

-- RElational ops : <, <=, >, >=, =, (!=,<>)

-- Display the details of all emps working in dept 30.
SELECT empno,ename,sal,deptno
FROM emp
WHERE deptno = 30;


+-------+--------+---------+--------+
| empno | ename  | sal     | deptno |
+-------+--------+---------+--------+
|  7499 | ALLEN  | 1600.00 |     30 |
|  7521 | WARD   | 1250.00 |     30 |
|  7654 | MARTIN | 1250.00 |     30 |
|  7698 | BLAKE  | 2850.00 |     30 |
|  7844 | TURNER | 1500.00 |     30 |
|  7900 | JAMES  |  950.00 |     30 |
+-------+--------+---------+--------+
6 rows in set (0.00 sec)


-- Display all the emps earning the salary less than 2500.
SELECT * FROM emp
WHERE sal < 2500;

+-------+--------+----------+------+------------+---------+---------+--------+
| empno | ename  | job      | mgr  | hire       | sal     | comm    | deptno |
+-------+--------+----------+------+------------+---------+---------+--------+
|  7369 | SMITH  | CLERK    | 7902 | 1980-12-17 |  800.00 |    NULL |     20 |
|  7499 | ALLEN  | SALESMAN | 7698 | 1981-02-20 | 1600.00 |  300.00 |     30 |
|  7521 | WARD   | SALESMAN | 7698 | 1981-02-22 | 1250.00 |  500.00 |     30 |
|  7654 | MARTIN | SALESMAN | 7698 | 1981-09-28 | 1250.00 | 1400.00 |     30 |
|  7782 | CLARK  | MANAGER  | 7839 | 1981-06-09 | 2450.00 |    NULL |     10 |
|  7844 | TURNER | SALESMAN | 7698 | 1981-09-08 | 1500.00 |    0.00 |     30 |
|  7876 | ADAMS  | CLERK    | 7788 | 1983-01-12 | 1100.00 |    NULL |     20 |
|  7900 | JAMES  | CLERK    | 7698 | 1981-12-03 |  950.00 |    NULL |     30 |
|  7934 | MILLER | CLERK    | 7782 | 1982-01-23 | 1300.00 |    NULL |     10 |
+-------+--------+----------+------+------------+---------+---------+--------+
9 rows in set (0.00 sec)


-- Display the empno, ename, sal and job of all the emps working as analyst
SELECT empno,ename,sal,job
FROM emp 
WHERE job = 'analyst';

+-------+-------+---------+---------+
| empno | ename | sal     | job     |
+-------+-------+---------+---------+
|  7788 | SCOTT | 3000.00 | ANALYST |
|  7902 | FORD  | 3000.00 | ANALYST |
+-------+-------+---------+---------+
2 rows in set (0.01 sec)

-- Display the details of all the emps working in dept 30 as salesman.

SELECT * FROM emp
WHERE deptno = 30;

SELECT * FROM emp
WHERE job = 'salesman';


SELECT * FROM emp
WHERE deptno = 30 
AND
job = 'salesman';


+-------+--------+----------+------+------------+---------+---------+--------+
| empno | ename  | job      | mgr  | hire       | sal     | comm    | deptno |
+-------+--------+----------+------+------------+---------+---------+--------+
|  7499 | ALLEN  | SALESMAN | 7698 | 1981-02-20 | 1600.00 |  300.00 |     30 |
|  7521 | WARD   | SALESMAN | 7698 | 1981-02-22 | 1250.00 |  500.00 |     30 |
|  7654 | MARTIN | SALESMAN | 7698 | 1981-09-28 | 1250.00 | 1400.00 |     30 |
|  7844 | TURNER | SALESMAN | 7698 | 1981-09-08 | 1500.00 |    0.00 |     30 |
+-------+--------+----------+------+------------+---------+---------+--------+
4 rows in set (0.00 sec)


-- Display the details of emps earning sal > 1200 and working as clerk.

SELECT * FROM emp
WHERE
sal > 1200
AND
job = 'clerk';

+-------+--------+-------+------+------------+---------+------+--------+
| empno | ename  | job   | mgr  | hire       | sal     | comm | deptno |
+-------+--------+-------+------+------------+---------+------+--------+
|  7934 | MILLER | CLERK | 7782 | 1982-01-23 | 1300.00 | NULL |     10 |
+-------+--------+-------+------+------------+---------+------+--------+
1 row in set (0.00 sec)


-- Display all the emps not working in dept 30.

SELECT * FROM emp
WHERE deptno != 30;

--OR

SELECT * FROM emp
WHERE deptno <> 30;


-- _______________________________________________________________
-- working with NULL

-- Display all the emps who do not have any comm (comm col is NULL)

SELECT empno,ename,sal,comm
FROM emp
WHERE comm = NULL;

-- Empty set (0.00 sec)

SELECT empno,ename,sal,comm
FROM emp
WHERE comm IS NULL;

+-------+--------+---------+------+
| empno | ename  | sal     | comm |
+-------+--------+---------+------+
|  7369 | SMITH  |  800.00 | NULL |
|  7566 | JONES  | 2975.00 | NULL |
|  7698 | BLAKE  | 2850.00 | NULL |
|  7782 | CLARK  | 2450.00 | NULL |
|  7788 | SCOTT  | 3000.00 | NULL |
|  7839 | KING   | 5000.00 | NULL |
|  7876 | ADAMS  | 1100.00 | NULL |
|  7900 | JAMES  |  950.00 | NULL |
|  7902 | FORD   | 3000.00 | NULL |
|  7934 | MILLER | 1300.00 | NULL |
+-------+--------+---------+------+
10 rows in set (0.00 sec)

-- Display all emps who earn the comm ( comm col is not NULL)

SELECT * FROM emp
WHERE comm IS NOT NULL;

+-------+--------+----------+------+------------+---------+---------+--------+
| empno | ename  | job      | mgr  | hire       | sal     | comm    | deptno |
+-------+--------+----------+------+------------+---------+---------+--------+
|  7499 | ALLEN  | SALESMAN | 7698 | 1981-02-20 | 1600.00 |  300.00 |     30 |
|  7521 | WARD   | SALESMAN | 7698 | 1981-02-22 | 1250.00 |  500.00 |     30 |
|  7654 | MARTIN | SALESMAN | 7698 | 1981-09-28 | 1250.00 | 1400.00 |     30 |
|  7844 | TURNER | SALESMAN | 7698 | 1981-09-08 | 1500.00 |    0.00 |     30 |
+-------+--------+----------+------+------------+---------+---------+--------+
4 rows in set (0.00 sec)


--_______________________Logial AND_________________________
-- used to combine multiple conditions 
-- also used to display data in ranges

-- Display the details of emps hired in the year 1981
SELECT empno,ename,sal,hire
FROM emp
WHERE hire >= '1981-01-01' 
AND
hire <= '1981-12-31'; 

+-------+--------+---------+------------+
| empno | ename  | sal     | hire       |
+-------+--------+---------+------------+
|  7499 | ALLEN  | 1600.00 | 1981-02-20 |
|  7521 | WARD   | 1250.00 | 1981-02-22 |
|  7566 | JONES  | 2975.00 | 1981-04-02 |
|  7654 | MARTIN | 1250.00 | 1981-09-28 |
|  7698 | BLAKE  | 2850.00 | 1981-05-01 |
|  7782 | CLARK  | 2450.00 | 1981-06-09 |
|  7839 | KING   | 5000.00 | 1981-11-17 |
|  7844 | TURNER | 1500.00 | 1981-09-08 |
|  7900 | JAMES  |  950.00 | 1981-12-03 |
|  7902 | FORD   | 3000.00 | 1981-12-03 |
+-------+--------+---------+------------+
10 rows in set (0.01 sec)

-- Display all the emps earning the sal between 2000 and 3000.
SELECT empno,ename,sal
FROM emp
WHERE sal >= 2000
AND
sal <= 3000;

+-------+-------+---------+
| empno | ename | sal     |
+-------+-------+---------+
|  7566 | JONES | 2975.00 |
|  7698 | BLAKE | 2850.00 |
|  7782 | CLARK | 2450.00 |
|  7788 | SCOTT | 3000.00 |
|  7902 | FORD  | 3000.00 |
+-------+-------+---------+
5 rows in set (0.00 sec)



-- __________________Logical OR___________________
-- Display all the managers and analyst.

SELECT empno,ename,sal,job
FROM emp
WHERE job = 'manager'
OR
job = 'analyst';

+-------+-------+---------+---------+
| empno | ename | sal     | job     |
+-------+-------+---------+---------+
|  7566 | JONES | 2975.00 | MANAGER |
|  7698 | BLAKE | 2850.00 | MANAGER |
|  7782 | CLARK | 2450.00 | MANAGER |
|  7788 | SCOTT | 3000.00 | ANALYST |
|  7902 | FORD  | 3000.00 | ANALYST |
+-------+-------+---------+---------+
5 rows in set (0.00 sec)


-- Display all the emps who are not managers or analyst


SELECT  empno,ename,sal,job
FROM emp
WHERE job != 'manager'
OR
job != 'analyst';


SELECT  empno,ename,sal,job
FROM emp
WHERE job != 'manager'
AND
job != 'analyst';





--_________________BETWEEN______________________
-- used to display data in ranges.
-- Range is inclusive for both the ends.


-- Display the emps hired in 1982
SELECT empno,ename,sal,hire
FROM emp
WHERE hire BETWEEN '1982-01-01' AND '1982-12-31';


--display the details of emps earning the salaries 
--between 1200 and 3000.

SELECT empno,ename,sal
FROM emp
WHERE sal BETWEEN 1200 AND 3000;


-- Display all emps having the enames starting 
--between 'C' and 'M'


SELECT ename
FROM emp
ORDER BY ename;

-- Expected output
 CLARK  |
| FORD   |
| JAMES  |
| JONES  |
| KING   |
| MARTIN |
| MILLER |

SELECT empno,ename,sal
FROM emp
WHERE ename BETWEEN 'C' AND 'M'
ORDER BY ename;

+-------+-------+---------+
| empno | ename | sal     |
+-------+-------+---------+
|  7782 | CLARK | 2450.00 |
|  7902 | FORD  | 3000.00 |
|  7900 | JAMES |  950.00 |
|  7566 | JONES | 2975.00 |
|  7839 | KING  | 5000.00 |
+-------+-------+---------+
5 rows in set (0.00 sec)

-- The names MARTIN and MILLER are not displayed as "MA" comes after "M"

Optionally :

SELECT empno,ename,sal
FROM emp
WHERE ename BETWEEN 'C' AND 'N'
ORDER BY ename;

OR

SELECT empno,ename,sal
FROM emp
WHERE ename BETWEEN 'C' AND 'MZ'
ORDER BY ename;

--_________________________________________________________________________
