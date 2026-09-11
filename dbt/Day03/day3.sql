/*
AGENDA :
Pending Agenda :
-SELECT Continued :
	NOT BETWEEN
	IN and NOT IN
	LIKE	
-UPDATE
-DELETE
-TRUNCATE
-DROP

	1. Single Row FUNCTIONS 
	DUAL table :
	    SQL FUNCTIONS :
	        1) SINGLE Row Functions
	        2) MULTI Row Functions
	        
	1) SINGLE Row :
	            a) Numeric Functions
	            b) String Functions
					 c) DateTime Functions
					 d) Flow Control functions
*/



-- ________________________NOT BETWEEN_______________________
-- excludes the range
-- Display all the emps who are not earning the salaries 
--in the range of 1500 to 2500

SELECT empno,ename,sal,deptno
FROM emp
WHERE sal NOT BETWEEN 1500 AND 2500;


-- ____________________________IN____________________________
/*
IN operator is used when we are comparing multiple values for 1 column
using equality relational operator.
*/
--Display details of all managers and analyst
SELECT empno,ename,deptno,job
FROM emp 
WHERE job = 'manager'
OR
job = 'analyst';


SELECT empno,ename,deptno,job
FROM emp
WHERE job IN('manager','analyst');


-- Display all the emps working in dept 20 and 30.
SELECT * FROM emp
WHERE deptno = 20
OR
deptno = 30;

SELECT * FROM emp
WHERE deptno IN(20,30);



-- Display the details of james,king and martin
SELECT * FROM emp
WHERE ename = 'james'
OR ename = 'king'
OR ename = 'martin';

SELECT * FROM emp
WHERE ename IN('james','king','martin');


+-------+--------+-----------+------+------------+---------+---------+--------+
| empno | ename  | job       | mgr  | hire       | sal     | comm    | deptno |
+-------+--------+-----------+------+------------+---------+---------+--------+
|  7654 | MARTIN | SALESMAN  | 7698 | 1981-09-28 | 1250.00 | 1400.00 |     30 |
|  7839 | KING   | PRESIDENT | NULL | 1981-11-17 | 5000.00 |    NULL |     10 |
|  7900 | JAMES  | CLERK     | 7698 | 1981-12-03 |  950.00 |    NULL |     30 |
+-------+--------+-----------+------+------------+---------+---------+--------+
3 rows in set (0.00 sec)




-- Display the details of employees earning sal > 2500 
--or job = manager

SELECT * FROM emp
WHERE sal > 2500
OR
job = 'manager';

/*
In the above query, as the logical OR is based on 2 different
columns, we cannot use the IN operator here.
IN operator is used , when we are checking for multiple values
based on only one column.
*/



--________________________NOT IN________________________
-- display all emps not working as clerk or salesman

SELECT * FROM emp
WHERE job NOT IN ('clerk','salesman');

--- OR

SELECT * FROM emp
WHERE job != 'clerk'
AND
job != 'salesman';

+-------+-------+-----------+------+------------+---------+------+--------+
| empno | ename | job       | mgr  | hire       | sal     | comm | deptno |
+-------+-------+-----------+------+------------+---------+------+--------+
|  7566 | JONES | MANAGER   | 7839 | 1981-04-02 | 2975.00 | NULL |     20 |
|  7698 | BLAKE | MANAGER   | 7839 | 1981-05-01 | 2850.00 | NULL |     30 |
|  7782 | CLARK | MANAGER   | 7839 | 1981-06-09 | 2450.00 | NULL |     10 |
|  7788 | SCOTT | ANALYST   | 7566 | 1982-12-09 | 3000.00 | NULL |     20 |
|  7839 | KING  | PRESIDENT | NULL | 1981-11-17 | 5000.00 | NULL |     10 |
|  7902 | FORD  | ANALYST   | 7566 | 1981-12-03 | 3000.00 | NULL |     20 |
+-------+-------+-----------+------+------------+---------+------+--------+
6 rows in set (0.00 sec)


-- __________________ combine IN and BETWEEN____________________
-- Display all the emps who are working as managers or analyst 
-- and earning the sal between 2500 and 3500



--__________________________LIKE___________________________________

/*
LIKE op is used when we are not aware of the exact data.
This op has 2 wile cards.
1)  _ (underscore) : this specifies any one char
2) % (percent) : this specifies 0 or more chars
*/

-- Display all the details of emps whose names start with M
SELECT empno,ename,sal,deptno
FROM emp
WHERE ename LIKE 'M%';
-- all the emps with the names starting with M are displayed.
-- Also, if there is an emp with the name only 'M', will also
-- be desplayed. Because % denotes 0 or more chars.
+-------+--------+---------+--------+
| empno | ename  | sal     | deptno |
+-------+--------+---------+--------+
|  7654 | MARTIN | 1250.00 |     30 |
|  7934 | MILLER | 1300.00 |     10 |
+-------+--------+---------+--------+
2 rows in set (0.01 sec)


-- Display emps whose names contain A as the 2nd char.

SELECT empno,ename,sal
FROM emp
WHERE ename LIKE '_a%';

/*
_ before a, denotes only one char. % after the 'a' denotes
0 or more chars.
eg : Ka
*/

+-------+--------+---------+
| empno | ename  | sal     |
+-------+--------+---------+
|  7521 | WARD   | 1250.00 |
|  7654 | MARTIN | 1250.00 |
|  7900 | JAMES  |  950.00 |
+-------+--------+---------+
3 rows in set (0.00 sec)


-- Display the names which have only 4 chars..

SELECT empno,ename,sal
FROM emp
WHERE ename LIKE '____';

+-------+-------+---------+
| empno | ename | sal     |
+-------+-------+---------+
|  7521 | WARD  | 1250.00 |
|  7839 | KING  | 5000.00 |
|  7902 | FORD  | 3000.00 |
+-------+-------+---------+
3 rows in set (0.00 sec)


-- Display the emps whose name end with S;
SELECT * FROM emp
WHERE ename LIKE '%s';

+-------+-------+---------+------+------------+---------+------+--------+
| empno | ename | job     | mgr  | hire       | sal     | comm | deptno |
+-------+-------+---------+------+------------+---------+------+--------+
|  7566 | JONES | MANAGER | 7839 | 1981-04-02 | 2975.00 | NULL |     20 |
|  7876 | ADAMS | CLERK   | 7788 | 1983-01-12 | 1100.00 | NULL |     20 |
|  7900 | JAMES | CLERK   | 7698 | 1981-12-03 |  950.00 | NULL |     30 |
+-------+-------+---------+------+------------+---------+------+--------+
3 rows in set (0.00 sec)

-- Display the emps whose names contain 2 A's 
--anywhere(beginning,end or in middle).
SELECT empno,ename,sal
FROM emp
WHERE ename LIKE '%a%a%';

+-------+-------+---------+
| empno | ename | sal     |
+-------+-------+---------+
|  7876 | ADAMS | 1100.00 |
+-------+-------+---------+
1 row in set (0.00 sec)

-- Display enames between C and M
SELECT ename
FROM emp
ORDER BY ename;

SELECT empno,ename,sal
FROM emp
WHERE ename BETWEEN 'C' AND 'M' 
OR
ename LIKE 'M%'
ORDER BY ename;


+-------+--------+---------+
| empno | ename  | sal     |
+-------+--------+---------+
|  7782 | CLARK  | 2450.00 |
|  7902 | FORD   | 3000.00 |
|  7900 | JAMES  |  950.00 |
|  7566 | JONES  | 2975.00 |
|  7839 | KING   | 5000.00 |
|  7654 | MARTIN | 1250.00 |
|  7934 | MILLER | 1300.00 |
+-------+--------+---------+
7 rows in set (0.00 sec)

SELECT ename, sal
FROM emp
WHERE ename BETWEEN 'C' AND 'mz'

SELECT ename,sal
FROM emp
WHERE ename >= 'C'
AND
ename < 'n';

--_____________________________________________________________
-- Display the emp with highest sal between 1000 and 2000
SELECT empno,ename,sal
FROM emp
WHERE sal BETWEEN 1000 and 2000;

SELECT empno,ename,sal
FROM emp
WHERE sal BETWEEN 1000 and 2000
ORDER BY sal DESC;

SELECT empno,ename,sal
FROM emp
WHERE sal BETWEEN 1000 and 2000
ORDER BY sal DESC
LIMIT 1;



-- Display the 5th highest sal between 1000 and 2000
SELECT DISTINCT sal
FROM emp
WHERE sal BETWEEN 1000 AND 2000
ORDER BY sal DESC
LIMIT 4,1;

+---------+
| sal     |
+---------+
| 1100.00 |
+---------+
1 row in set



-- Display the details of clerk with min salary
SELECT empno,ename,job,sal
FROM emp
WHERE job = 'clerk';
-- displays all clerks

SELECT empno,ename,job,sal
FROM emp
WHERE job = 'clerk'
ORDER BY sal;
-- clerks in the ascending order of their salaries


SELECT empno,ename,job,sal
FROM emp
WHERE job = 'clerk'
ORDER BY sal
LIMIT 1;
-- clerk with min sal

+-------+-------+-------+--------+
| empno | ename | job   | sal    |
+-------+-------+-------+--------+
|  7369 | SMITH | CLERK | 800.00 |
+-------+-------+-------+--------+
1 row in set (0.00 sec)



-- Display the 2nd highest salary from the dept 20 and 30.
SELECT DISTINCT sal
FROM emp
WHERE deptno IN(20,30)
ORDER BY sal DESC
LIMIT 1,1;

+---------+
| sal     |
+---------+
| 2975.00 |
+---------+
1 row in set (0.00 sec)



--______________________DML-UPDATE__________________________________

/*
UPDATE is a Data Manipulation Language command used to
update the data from the table.

-- syntax :
UPDATE table_name SET column_name = new_value
WHERE condition;

Giving the WHERE clause is important, as if missing , all the
rows will be updated.
*/

-- Update the books table, increase the price of all 
-- c Prog books by 50/-
UPDATE books SET price = price+50
WHERE subject = 'C Programming';

-- to check the changes done :
SELECT * FROM books;

-- Decrease the price of all the books by 5% 
--whose name contain programming word into it.
UPDATE books SET price = price - price * 0.05
WHERE name LIKE '%programming%';

SELECT * FROM emp;

-- update the salaries of all the clerks to + 20%
UPDATE emp SET sal = sal + sal * 0.2
WHERE job = 'clerk';

--__________________________ DML - DELETE___________________________
/*
DELETE is a Data Manipulation Language command
used to delete specific rows from the table.
--SYNTAX :
DELETE FROM table_name
WHERE condition;

Giving the WHERE clause is important, as, if missing , all the
rows will be deleted.
*/

-- delete the student Ram from the student table.
DELETE FROM students
WHERE name = 'ram';

/*
DML commandss INSERT , UPDATE , DELETE can be Rollbacked(undone)
*/

--___________________TRUNCATE _________________________

/*
TRUNCATE is a Data Definition Language statement.
DDL statements cannot be undone.
TRUNCATE is used to delete all the table data.
TRUNCATE does not have a WHERE clause.
We cannot undo the changes done with truncate.
All the data is deleted leaving the table structure intact.
We can reuse the table struture to insert new data into it.
*/


TRUNCATE TABLE emp;
-- DDL command, deletes all the rows from the table PERMANENTLY.
-- The Data CANNOT be UNDONE.

TRUNCATE TABLE temp;



--___________________DROP_______________________
-- DDL 
-- removes the entire table structure with the data.
-- IT is a DDL command.
-- We cannot undo it.
-- Drop the temp table.

DROP TABLE new_students;

mysql> DESCRIBE new_students;
--ERROR 1146 (42S02): Table 'ac_classwork_db.new_students' doesn't exist



/*
Difference between DELETE DROP AND TRUNCATE :

DELETE : DML command
-> The rows deleted can be un-done.
-> The table structure is in-tact
-> We can use where clause

TRUNCATE : DDL command
-> All the rows are deleted permenantly. It cannot be un-done.
-> The table structure is in-tact.
-> We cannot use where clause.

DROP : DDL command
-> It removes all the rows with its structure permanently.
-> It cannot be un-done.
-> We cannot use where clause.
*/
.


--___________________Pre-Defined SQL FUNCTIONS___________________________________________

/*
Single Row Functions :
These type of functions operate on every row of the table
and return the output per row.

Multi Row Functions/ group functions :
These type of functions operate on the group of rows.
They return one output per group.
*/

-- syntax : SELECT column1,col2.. FROM table;

-- DUAL Table :
-- Dummy/Pseudo/Virtual table to complete the syntax of SELECT.
-- It contains one row and 1 column.

 SELECT * FROM DUAL;
DESC DUAL; 
-- The above SELECT and DESC will give error as the table is dummy.

SELECT USER(),DATABASE() FROM dual;

SELECT USER(),DATABASE();

-- Perform any arithmetic op with/without DUAL table;
SELECT 25*34/3+456 FROM dual;
SELECT 25*34/3+456;

-- display the current user , database and version 
-- with / without DUAL table.
SELECT USER(),DATABASE(),VERSION();

-- Display the current date and time using NOW() from DUAL table.
SELECT NOW() FROM dual;

-- CHECK the HELP for pre-defined functions.
HELP functions;

-- CHECK the HELP for NUMERIC Functions
HELP numeric functions;

--_________________POW() / POWER()______________________

SELECT POW(45,4);

-- ______________SQRT()__________________________
SELECT SQRT(45);


--________________ROUND()____________________________
SELECT ROUND(12345.567);
-- 12346

SELECT ROUND(12345.567,2);
-- 12345.57

SELECT ROUND(12345.567,-1);
/*
as we specified -1 in the 2nd parameter,
the range is 0 to 4 and 5 to 9
considering the ranges the changes are done to the tens place.
if the units place is in 0 to 4 range, the tens place will be
40
if the units place number is in 2nd range the tens number will be 50

*/

SELECT ROUND(12372.567,-1);
-- 12370

SELECT ROUND(12345.567,-2);
-- 12300

SELECT ROUND(12375.567,-2);
-- 12400

SELECT ROUND(12375.567,-5);
-- 0

SELECT ROUND(52375.567,-5);
-- 100000



--Display the name and price of books rounded off to 
--2 digits after the point.
SELECT name, ROUND(price,2) FROM books;

--_________________TRUNCATE()___________________________

SELECT TRUNCATE(12456.84);
-- 12456

SELECT TRUNCATE(12456.845,2);
-- 12456.84

SELECT TRUNCATE(12456.845,-2);
-- 12400



--_________________CEIL() / CEILING()_______________________

-- Gives only int output.
-- gives the output as the next integer value.

SELECT CEIL(12.3);
-- 13

SELECT CEIL(-2.3);
-- -2

-3 -2.3 -2   -1


--___________________FLOOR()_____________________________
-- gives the nearest previous int value

SELECT FLOOR(123.56);
-- 123

SELECT FLOOR(-5.7);
-- -6


--*******************************************************
--________________________String Functions____________________

--_____________LOWER()___________________________

SELECT LOWER('SUNBEAM info');

-- Display the enames from emp table in lower case.

SELECT LOWER(ename) FROM emp;

--___________________UPPER()____________________

-- update the names from the books table to uppercase.

UPDATE books SET name = UPPER(name);

SELECT name FROM books;
-- changes done in the table

--__________________CONCAT()___________________________

--Display the empno, ename and job of the employee as 1 string

SELECT empno,ename,job
FROM emp;

SELECT CONCAT(empno,' - ',ename,' - ',job) AS emp_details
FROM emp;

-- display the string as
-- ename is working as job in deptno with salary
-- ename,job,deptno,sal
-- eg : King is working as president in deptno 10 with salary 5000

SELECT 
CONCAT(ename,' is working as ',job,' in deptno ',deptno,' with salary ',sal) AS emp_details
FROM emp;


-- Display the sal , comm and the combination of sal-comm from emp
SELECT sal,comm,CONCAT(sal,' - ',comm) as "Total sal"
FROM emp;

+---------+---------+-------------------+
| sal     | comm    | Total sal         |
+---------+---------+-------------------+
|  800.00 |    NULL | NULL              |
| 1600.00 |  300.00 | 1600.00 - 300.00  |
| 1250.00 |  500.00 | 1250.00 - 500.00  |
| 2975.00 |    NULL | NULL              |
| 1250.00 | 1400.00 | 1250.00 - 1400.00 |
| 2850.00 |    NULL | NULL              |
| 2450.00 |    NULL | NULL              |
| 3000.00 |    NULL | NULL              |
| 5000.00 |    NULL | NULL              |
| 1500.00 |    0.00 | 1500.00 - 0.00    |
| 1100.00 |    NULL | NULL              |
|  950.00 |    NULL | NULL              |
| 3000.00 |    NULL | NULL              |
| 1300.00 |    NULL | NULL              |
+---------+---------+-------------------+
14 rows in set (0.00 sec)

/*
Single row functions return NULL as the output for the rows,
if any of the parameters has NULL.
*/

--____________________TRIM()______________________
-- TRIM()
-- Used to remove leading or trailing spaces in the string.
SELECT TRIM(' Sunbeam    ')as output;
-- Sunbeam

--LTRIM()
SELECT LTRIM('  Sunbeam ');
--Sunbeam_


--RTRIM()
SELECT RTRIM('Sunbeam  ');
--Sunbeam


--__________________LPAD()_______________________
--syntax : LPAD('string',length,'char');

SELECT LPAD('Sunbeam',10,'*');
-- __________
-- ***Sunbeam


--___________________RPAD()________________________

SELECT RPAD('Sunbeam',10,'*');
-- Sunbeam***



-- Nested function. padding on both sides.
-- display : **********sunbeam**********
--            
SELECT LPAD('Sunbeam',17,'*');

SELECT RPAD('Sunbeam',17,'*');

SELECT RPAD(LPAD('Sunbeam',17,'*'),27,'*') as result;
--       **********sunbeam

--___________________SUBSTRING()___________________

-- HELP SUBSTRING;

SELECT SUBSTRING("Sunbeam Info",5);
-- start from 5th char and give the substring till the last char
-- eam Info
SELECT SUBSTRING("Sunbeam Info" FROM 5);
-- eam Info

SELECT SUBSTRING("Sunbeam Info",5,3);
-- start from 5th char and returns only 3 chars after that.
-- eam


SELECT SUBSTRING("Sunbeam Info" FROM 5 FOR 3);

SELECT SUBSTRING("Sunbeam Info" FROM -5);
-- _Info

SELECT SUBSTRING("Sunbeam Info" FROM -5 for 3);
-- _In


-- Display all emps whose names start with 'M'

SELECT empno,ename,sal
FROM emp
WHERE ename LIKE 'M%';



SELECT empno,ename,sal
FROM emp
WHERE SUBSTRING(ename,1,1) = 'M';


SELECT empno,ename,sal
FROM emp
WHERE SUBSTRING(ename FROM 1 FOR 1) = 'M';


-- Display all emps whose ename starts between 'C' and 'M'

SELECT empno,ename,sal
FROM emp
WHERE SUBSTRING(ename,1,1) BETWEEN 'C' AND 'M';

--____________________LENGTH_________________________
-- gives the total length of output string

SELECT LENGTH("Sunbeam Infotech") as result;


SELECT LENGTH("Sunbeam Infotech  ") as result;


--________________________LEFT()__RIGHT()___________________

SELECT SUBSTRING("sunbeam",3);
-- starts from 3rd char till the end
--nbeam

SELECT LEFT("sunbeam",3);
-- returns 3 chars from the left
-- sun

-- Display all emps between ‘C’ and ‘M’
-- Lab work


-- Display the mobile number in the format
--INPUT :  7057590799
--OUTPUT : 70******99

SELECT LEFT("7057590799",2);
-- 70
SELECT CONCAT(RPAD(LEFT("7057590799",2),8,'*'),RIGHT("7057590799",2)) as result;


-- Try the same using LPAD and RPAD in your labs


-- ASCII()
SELECT ASCII('A');
SELECT ASCII('A' FOR CHAR);

--*************************************************************

--_________________DATETIME FUNCTIONS_______________________
-- NOW()
SELECT NOW(),SYSDATE();
-- SYSDATE()

SELECT NOW(),SLEEP(5),SYSDATE();

-- Difference between NOW() and SYSDATE()
SELECT NOW(),SLEEP(5),NOW();

SELECT SYSDATE(),SLEEP(5),SYSDATE();
/*
NOW() returns the current date and time at which the query 
begins execution.
SYSDATE() returns the current date and time at which the function
actually executes.
*/

--DATE()
SELECT DATE(NOW());

-- TIME()
SELECT TIME(NOW());

--ADDDATE() / DATE_ADD()
-- Add 2 days to NOW()
SELECT DATE_ADD(NOW(),INTERVAL 2 DAY);

-- Add 1 day to the date '2000-05-01'
SELECT DATE_ADD('2000-05-01', INTERVAL 1 DAY);


-- Add 1 second to the date '2023-12-31 23:59:59'


-- Add 1 min 1 second to the date 2100-12-31 23:59:59
SELECT DATE_ADD('2100-12-31 23:59:59',INTERVAL '1:1' MINUTE_SECOND);

-- Add -1 day and 5 hours to '1980-07-21 12:23:12' 
SELECT DATE_ADD('1980-07-21 12:23:12',INTERVAL '-1 5' DAY_HOUR) AS result;
--_______________________________________________________
-- DATE_SUB()/SUBDATE()

--subtract 31 days from the date 1987-08-17
SELECT DATE_SUB('1987-08-17', INTERVAL 31 DAY);

-- subtract 1 year from 2018-05-01
SELECT DATE_SUB('2018-05-01',INTERVAL 1 YEAR);

--_______________________________________________________
--  DATEDIFF() : difference in number of days :
-- TIMESTAMPDIFF() 
--display the difference in number of months between the dates
  --  '2009-1-12'   and   '2010-12-15'

SELECT TIMESTAMPDIFF(MONTH,'1987-08-17',NOW());

-- display the difference in number of months between your birthdate and today


-- display the diff in number of days between your birthdate and today.

SELECT TIMESTAMPDIFF(DAY,'1987-08-17',NOW());
SELECT TIMESTAMPDIFF(SECOND,'1987-08-17',NOW());

-- display the ename and experience of emps in years.
SELECT ename, TIMESTAMPDIFF(YEAR,hire,NOW()) as exp
FROM emp;


-- Display the name and experience of emps in months
SELECT ename, TIMESTAMPDIFF(MONTH,hire,NOW()) as exp
FROM emp;

-- Display the ename and exp in years and months.
-- eg : 44 years and 7 months
SELECT ename, CONCAT(TIMESTAMPDIFF(YEAR,hire,NOW())," years and ", 
TIMESTAMPDIFF(MONTH,hire,NOW())%12," months ") As exp
FROM emp;


+--------+-------------------------+
| ename  | exp                     |
+--------+-------------------------+
| SMITH  | 45 years and 8 months   |
| ALLEN  | 45 years and 6 months   |
| WARD   | 45 years and 6 months   |
| JONES  | 45 years and 4 months   |
| MARTIN | 44 years and 10 months  |
| BLAKE  | 45 years and 3 months   |
| CLARK  | 45 years and 2 months   |
| SCOTT  | 43 years and 8 months   |
| KING   | 44 years and 9 months   |
| TURNER | 44 years and 11 months  |
| ADAMS  | 43 years and 7 months   |
| JAMES  | 44 years and 8 months   |
| FORD   | 44 years and 8 months   |
| MILLER | 44 years and 7 months   |
+--------+-------------------------+
14 rows in set (0.00 sec)

-- display todays date, time , day, month, year, week day.
SELECT DATE(NOW()),TIME(NOW()),DAY(NOW()),MONTH(NOW()),YEAR(NOW()),MONTHNAME(NOW()),WEEKDAY(NOW());

-- Display all the employees hired in 1982
SELECT empno,ename,hire
FROM emp
WHERE hire >= '1982-01-01'
AND hire <= '1982-12-31';

SELECT empno,ename,hire
FROM emp
WHERE hire BETWEEN '1982-01-01' AND '1982-12-31';


SELECT empno,ename,hire
FROM emp
WHERE YEAR(hire) = "1982"; 


--_____________________DATE_FORMAT______________________________
/*
%W → Full weekday name → Sunday
%w → Day of week (0=Sunday) → 6 (Saturday)
%M → Full month name → October
%m → Month number → 10
%Y → 4-digit year → 2009
%y → 2-digit year → 00
%H → Hour (00-23)
%I → 12-hour (01–12) → 10
%i → Minutes
%s → Seconds
%D → Day with suffix → 4th
%a → Abbreviated weekday → Thu
%d → Day (2 digits) → 04
%b → Abbreviated month → Oct
%j → Day of year → 277
*/

-- Display the hire date of employees as
-- eg : January 5th 1982, Monday

SELECT empno,ename,sal,DATE_FORMAT(hire,'%M %D %Y, %W') As hire_date
FROM emp;



--************************************************************************
--__________________FLOW CONTROL FUNCTIONS_______________
-- IFNULL()
-- syntax : IFNULL(exp,value)
-- if the exp/col is NULL, replace is with the 2nd parameter value

SELECT empno,ename,sal,comm, CONCAT(sal,'-',comm) as total FROM emp;

+-------+--------+---------+---------+-----------------+
| empno | ename  | sal     | comm    | total           |
+-------+--------+---------+---------+-----------------+
|  7369 | SMITH  |  800.00 |    NULL | NULL            |
|  7499 | ALLEN  | 1600.00 |  300.00 | 1600.00-300.00  |
|  7521 | WARD   | 1250.00 |  500.00 | 1250.00-500.00  |
|  7566 | JONES  | 2975.00 |    NULL | NULL            |
|  7654 | MARTIN | 1250.00 | 1400.00 | 1250.00-1400.00 |
|  7698 | BLAKE  | 2850.00 |    NULL | NULL            |
|  7782 | CLARK  | 2450.00 |    NULL | NULL            |
|  7788 | SCOTT  | 3000.00 |    NULL | NULL            |
|  7839 | KING   | 5000.00 |    NULL | NULL            |
|  7844 | TURNER | 1500.00 |    0.00 | 1500.00-0.00    |
|  7876 | ADAMS  | 1100.00 |    NULL | NULL            |
|  7900 | JAMES  |  950.00 |    NULL | NULL            |
|  7902 | FORD   | 3000.00 |    NULL | NULL            |
|  7934 | MILLER | 1300.00 |    NULL | NULL            |
+-------+--------+---------+---------+-----------------+
14 rows in set (0.00 sec)


-- Display empno,sal,comm and total income of emps (sal + comm)

SELECT empno,ename,sal,comm, CONCAT(sal,'-',IFNULL(comm,0)) as total FROM emp;

+-------+--------+---------+---------+-----------------+
| empno | ename  | sal     | comm    | total           |
+-------+--------+---------+---------+-----------------+
|  7369 | SMITH  |  800.00 |    NULL | 800.00-0.00     |
|  7499 | ALLEN  | 1600.00 |  300.00 | 1600.00-300.00  |
|  7521 | WARD   | 1250.00 |  500.00 | 1250.00-500.00  |
|  7566 | JONES  | 2975.00 |    NULL | 2975.00-0.00    |
|  7654 | MARTIN | 1250.00 | 1400.00 | 1250.00-1400.00 |
|  7698 | BLAKE  | 2850.00 |    NULL | 2850.00-0.00    |
|  7782 | CLARK  | 2450.00 |    NULL | 2450.00-0.00    |
|  7788 | SCOTT  | 3000.00 |    NULL | 3000.00-0.00    |
|  7839 | KING   | 5000.00 |    NULL | 5000.00-0.00    |
|  7844 | TURNER | 1500.00 |    0.00 | 1500.00-0.00    |
|  7876 | ADAMS  | 1100.00 |    NULL | 1100.00-0.00    |
|  7900 | JAMES  |  950.00 |    NULL | 950.00-0.00     |
|  7902 | FORD   | 3000.00 |    NULL | 3000.00-0.00    |
|  7934 | MILLER | 1300.00 |    NULL | 1300.00-0.00    |
+-------+--------+---------+---------+-----------------+
14 rows in set (0.00 sec)


--______________________________________________________
-- NULLIF()
-- syntax : NULLIF(exp,value)
-- compares 2 parameter values , returns null if both are equal.
-- returns 1st parameter if not equal.
-- sales / orders
-- sales /0  -- division by 0 problem
-- sales / NULLIF(orders,0)

-- old_email and new_email
NULLIF(new_email,old_email)
--if the exp is equal to the value it gives NULL.


-- Display empname,sal and NULL for all the emps who earn the sal as 3000
SELECT ename,sal,NULLIF(sal,3000)
FROM emp;

--________________________________________________________

