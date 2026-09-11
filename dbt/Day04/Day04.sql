/*
AGENDA :
Pending from last lecture:
    ISNULL() 
    IF()
    List functions

        GROUP functions
        GROUP BY clause
        HAVING clause
        GROUP BY WITH ROLLUP
        GROUPING() function
REGEXP
ALTER Table



*/

--_______________________________________________________
-- ISNULL() : similar to IS NULL
-- returns 0 or 1
-- 1 if the value is NULL
-- 0 if the value is NOt NULL


-- Display all the emps having comm as NULL.
SELECT empno,ename,sal,comm
FROM emp
WHERE comm IS NULL;

SELECT empno,ename,sal,comm,ISNULL(comm)
FROM emp;


SELECT empno,ename,sal,comm
FROM emp
WHERE ISNULL(comm) = 1;

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
10 rows in set (0.01 sec)


-- display all the emps who do have a comm.
SELECT empno,ename,sal,comm
FROM emp
WHERE comm IS NOT NULL;

SELECT empno,ename,sal,comm
FROM emp
WHERE ISNULL(comm) = 0;




-- IF function
-- condition ? exp1 (true): exp2(false)
--syntax : IF(condition,exp1(if true),exp2(if false))

-- Display empno,ename,sal and category of emp as per the sal.
--If sal >= 2500 the print "above avg" else print "avg".
SELECT empno,ename,sal,if(sal >= 2500,"Above Avg","Avg") AS category
FROM emp;


--_______________________________________________________________

-- List Functions (We can give any number of parameters):
-- CONCAT(),GREATEST(),LEAST(),coalesce()


-- GREATEST() : Returns the greatest value from the list of parmaters

-- Display the empno,sal,comm and the highest value among the sal or comm for the emps.

SELECT empno,sal,comm,GREATEST(sal,IFNULL(comm,0)) AS "max_sal" FROM emp;

-- LEAST() : Returns the Least value from the list of parmaters
SELECT empno,sal,comm,LEAST(sal,IFNULL(comm,0)) As "Min_sal" FROM emp;


-- coalesce() : Returns the first NON NULL Value.
SELECT empno,ename,sal,comm, COALESCE(sal,comm) as "salary_comm" FROM emp;


/*
home_number
office_number
mobile_number
Landline_number
*/


SELECT empno,ename,sal,
COALESCE(home_number,office_number,mobile_number,Landline_number,"Not Available") as "contact_number"
FROM emp;

/*
Please Note, we do not have the above columns in our table.
The above SELECT query is just for the reference example. 
*/

--**************************************************************************
--  --MultiRow Functions / Group functions / Aggregate Functions
--Check the SQL_MODE first
/*
SELECT @@sql_mode;
sql_mode is the pre-defined variable having the required settings.
For the group functions to operate properly, we need to add the settings
ONLY_FULL_GROUP_BY to the above variable.
To add the setting we need to use the SET command.

SET @@sql_mode = ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION
The SET command does temprory changes to the variable just for the current session/login.
When we exit from mysql the above settings are gone. 


To make the permanent setting for the sql_mode , we need to add these settings
in the my.ini file. 
Path : C:\ProgramData\MySQL\MySQL Server 8.4> my.ini

Open the file.
after the [mysqld]
look for sql-mode = 
Add the setting ONLY_FULL_GROUP_BY

Restart the machine, open mysql and recheck the setting with
SELECT @@sql_mode;
*/

-- Group functions :
/*
Group functions perform operations on the set of rows and
 they return one single output for the entire group. :
 Group functions : MAX,MIN,SUM,AVG,COUNT.

*/

-- Display the sum of salaries of all employees.
SELECT sal FROM emp;
-- returns 14 rows.

SELECT SUM(sal) FROM emp;
-- performs addition of all the 14 rows from the sal column
-- and returns 1 value for the entire set of rows.

+----------+
| SUM(sal) |
+----------+
| 29025.00 |
+----------+
1 row in set (0.00 sec)

-- display the avg,max,min,sum,count of salaries from emp table. 
SELECT SUM(sal)"Total",MAX(sal)"Max",MIN(sal)"Min",AVG(sal) "Avg",
COUNT(sal) "Count"
FROM emp;

+----------+---------+--------+-------------+-------+
| Total    | Max     | Min    | Avg         | Count |
+----------+---------+--------+-------------+-------+
| 29025.00 | 5000.00 | 800.00 | 2073.214286 |    14 |
+----------+---------+--------+-------------+-------+
1 row in set (0.01 sec)

-- Group functions with NULL

-- Display the avg,max,min,count,sum of comm.
SELECT COUNT(comm),COUNT(sal)
FROM emp;
+-------------+------------+
| COUNT(comm) | COUNT(sal) |
+-------------+------------+
|           4 |         14 |
+-------------+------------+
1 row in set (0.00 sec)


SELECT COUNT(comm),SUM(comm),AVG(comm),MAX(comm),MIN(comm)
FROM emp;
+-------------+-----------+------------+-----------+-----------+
| COUNT(comm) | SUM(comm) | AVG(comm)  | MAX(comm) | MIN(comm) |
+-------------+-----------+------------+-----------+-----------+
|           4 |   2200.00 | 550.000000 |   1400.00 |      0.00 |
+-------------+-----------+------------+-----------+-----------+
1 row in set (0.00 sec)



--____________Rules___________________
--1) Cannot Select a normal column with group function.
/*
eg : SELECT empno,SUM(Sal) FROM emp;
NOT ALLOWED : Error

SELECT empno FROM emp;
returns 14 rows

SELECT SUM(sal) FROM emp;
returns 1 row.

*/

--2) Cannot use single row function with group function
/*
SELECT LOWER(ename),MAX(sal)
FROM emp;
-- NOT ALLOWED : Error

LOWER(ename) returns 14 rows
MAX(sal) returns 1 row
*/

--3) Cannot use group functions in a WHERE clause
/*
-- Display the emp earning max salary :
SELECT empno,ename
FROM emp
WHERE sal = MAX(sal);
-- ERROR : Not allowed
*/

--4) Cannot call a group function in another group function.
-- Nesting of group functions is not allowed
/*
SELECT AVG(COUNT(sal)) FROM emp;
-- ERROR
*/


--_____________________________________________________
-- GROUP BY : 
-- Display the total salaries of emp department wise
SELECT deptno, SUM(Sal) 
FROM emp
GROUP BY deptno;
/*
The GROUP BY clause will create the group of similar rows.
All the rows with deptno 10 are grouped, similarly 20 and 30 are grouped.
The SUM function is applied on each group.
So I can get the total sal on the basis of group of deptno.
*/

+--------+----------+
| deptno | SUM(Sal) |
+--------+----------+
|     20 | 10875.00 |
|     30 |  9400.00 |
|     10 |  8750.00 |
+--------+----------+
3 rows in set (0.01 sec)


-- Display the count of emps department wise
SELECT deptno,COUNT(empno)
FROM emp
GROUP BY deptno;

+--------+--------------+
| deptno | COUNT(empno) |
+--------+--------------+
|     20 |            5 |
|     30 |            6 |
|     10 |            3 |
+--------+--------------+
3 rows in set (0.00 sec)

-- Display the total emps and the salaries in each dept.
SELECT deptno,COUNT(empno),SUM(sal)
FROM emp
GROUP BY deptno;

+--------+--------------+----------+
| deptno | COUNT(empno) | SUM(sal) |
+--------+--------------+----------+
|     20 |            5 | 10875.00 |
|     30 |            6 |  9400.00 |
|     10 |            3 |  8750.00 |
+--------+--------------+----------+
3 rows in set (0.00 sec)


-- Display Count of employees job wise.
SELECT job,COUNT(empno)
FROM emp
GROUP BY job;
+-----------+--------------+
| job       | COUNT(empno) |
+-----------+--------------+
| CLERK     |            4 |
| SALESMAN  |            4 |
| MANAGER   |            3 |
| ANALYST   |            2 |
| PRESIDENT |            1 |
+-----------+--------------+
5 rows in set (0.00 sec)

-- Display the count of employees hired each year.

SELECT YEAR(hire),COUNT(empno)
FROM emp
GROUP BY YEAR(hire);
+------------+--------------+
| YEAR(hire) | COUNT(empno) |
+------------+--------------+
|       1980 |            1 |
|       1981 |           10 |
|       1982 |            2 |
|       1983 |            1 |
+------------+--------------+
4 rows in set (0.01 sec)

-- Display max salary per job.
SELECT job,MAX(sal)
FROM emp
GROUP BY job;

-- Display the count of employees in every dept for every job profile.
-- check the unique deptnos
SELECT DISTINCT deptno FROM emp;
-- 10,20,30


-- Check the unique job profiles
-- CLERK,SALESMAN,MANAGER,PRESIDENT,ANALYST
SELECT DISTINCT job FROM emp;


-- check unique combination of dept and job
SELECT deptno,job,COUNT(empno)
FROM emp
GROUP BY deptno,job
ORDER BY deptno,job;

+--------+-----------+--------------+
| deptno | job       | COUNT(empno) |
+--------+-----------+--------------+
|     10 | CLERK     |            1 |
|     10 | MANAGER   |            1 |
|     10 | PRESIDENT |            1 |
|     20 | ANALYST   |            2 |
|     20 | CLERK     |            2 |
|     20 | MANAGER   |            1 |
|     30 | CLERK     |            1 |
|     30 | MANAGER   |            1 |
|     30 | SALESMAN  |            4 |
+--------+-----------+--------------+
9 rows in set (0.00 sec)

SELECT job,deptno,COUNT(empno)
FROM emp
GROUP BY job,deptno
ORDER BY job,deptno;


-- Columns in GROUP BY clause may or may not be the part of SELECT clause.
-- Display count of emps dept wise

SELECT COUNT(empno)
FROM emp
GROUP BY deptno;



-- Columns in SELECT clause HAVE TO be the part of GROUP BY clause.
SELECT deptno,COUNT(empno)
FROM emp
GROUP BY deptno;


-- Display the dept which spend maximum on the total salaries of employees.
-- display the total sal department wise
SELECT deptno,SUM(sal) AS Total_sal
FROM emp
GROUP BY deptno
ORDER BY SUM(sal) DESC
LIMIT 1;

+--------+-----------+
| deptno | Total_sal |
+--------+-----------+
|     20 |  10875.00 |
+--------+-----------+
1 row in set (0.00 sec)

-- WHERE clause :
-- Display the dept which spend max on total salaries of emps  
-- other than managers.

SELECT deptno,SUM(sal)
FROM emp
WHERE job != 'manager'
GROUP BY deptno
ORDER BY SUM(sal) DESC
LIMIT 1;

+--------+----------+
| deptno | SUM(sal) |
+--------+----------+
|     20 |  7900.00 |
+--------+----------+
1 row in set (0.00 sec)



--__________________________________________________________
/*
WHERE clause is used to apply the filter on the rows.
Having clause is used to filter the groups.
*/

-- HAVING clause : 
-- Filtering the groups
-- Display all the jobs which have more than 3 emps working in it.

SELECT job,COUNT(empno)
FROM emp
GROUP BY job;
+-----------+--------------+
| job       | COUNT(empno) |
+-----------+--------------+
| CLERK     |            4 |
| SALESMAN  |            4 |
| MANAGER   |            3 |
| ANALYST   |            2 |
| PRESIDENT |            1 |
+-----------+--------------+
5 rows in set (0.00 sec)


SELECT job,COUNT(empno)
FROM emp
GROUP BY job
HAVING COUNT(empno) > 3;

+----------+--------------+
| job      | COUNT(empno) |
+----------+--------------+
| CLERK    |            4 |
| SALESMAN |            4 |
+----------+--------------+
2 rows in set (0.01 sec)



/*
 HAVING clause is used to perform the conditions based on the groups.
 It should be written after the GROUP BY clause.
*/



-- Display the departments which have the 
-- average salary more than 2500.

-- display avg sal dept wise
SELECT deptno,AVG(Sal)
FROM emp
GROUP BY deptno;
+--------+-------------+
| deptno | AVG(Sal)    |
+--------+-------------+
|     20 | 2175.000000 |
|     30 | 1566.666667 |
|     10 | 2916.666667 |
+--------+-------------+
3 rows in set (0.01 sec)

-- filter out the depts which have avg sal > 2500.

SELECT deptno,ROUND(AVG(Sal),2)
FROM emp
GROUP BY deptno
HAVING avg(sal) > 2500;

+--------+-------------+
| deptno | AVG(Sal)    |
+--------+-------------+
|     10 | 2916.666667 |
+--------+-------------+
1 row in set (0.00 sec)


-- _________________________________________________
-- Understanding the internal working of queries and choosing the efficient one.



-- Display the count of employees jobwise for manager
--  and analyst.

SELECT job,COUNT(empno)
FROM emp
WHERE job IN('manager','analyst')
GROUP BY job;


SELECT job,COUNT(empno)
FROM emp
GROUP BY job
HAVING job IN('manager','analyst');
-- NOT Efficient
/*
Use the WHERE clause to restrict the rows.
USE the HAVING clause to RESTRICT the groups.
*/



-- Display jobs which have avg salaries < 2000.
SELECT job,AVG(Sal)
FROM emp
GROUP BY job
HAVING AVG(sal) > 2000;


-- Display total sals of managers ,analysts and clerks deptwise 
-- but Only For dept 10 and 20.

SELECT deptno,job,SUM(Sal)
FROM emp
WHERE job IN('manager','analyst','clerk')
AND 
deptno IN(10,20)
GROUP BY deptno,job
ORDER BY deptno;


+--------+---------+----------+
| deptno | job     | SUM(Sal) |
+--------+---------+----------+
|     10 | CLERK   |  1300.00 |
|     10 | MANAGER |  2450.00 |
|     20 | ANALYST |  6000.00 |
|     20 | CLERK   |  1900.00 |
|     20 | MANAGER |  2975.00 |
+--------+---------+----------+
5 rows in set (0.00 sec)


SELECT deptno,job,SUM(sal)
FROM emp
GROUP BY deptno,job
HAVING job IN('manager','analyst','clerk')
AND 
deptno IN(10,20)
ORDER BY deptno;
-- NOT EFFICIENT


/*
Display the count of emps jobwise, 
excluding managers and presidents
But display the jobs which have the count greater than 2
*/
SELECT job,COUNT(empno)
FROM emp
WHERE job NOT IN('manager','president')
GROUP BY job
HAVING COUNT(empno) > 2;

+----------+--------------+
| job      | COUNT(empno) |
+----------+--------------+
| CLERK    |            4 |
| SALESMAN |            4 |
+----------+--------------+
2 rows in set (0.00 sec)


-- Display the total price of all subjects(groupwise)  from the books table whose total price is greater than 1500.
SELECT subject,SUM(price)
FROM books
GROUP BY subject
HAVING SUM(price) > 1500;

+------------------+------------+
| subject          | SUM(price) |
+------------------+------------+
| C++ Programming  |   1976.281 |
| Java Programming |   1536.098 |
+------------------+------------+
2 rows in set (0.00 sec)

--_____________ Group By withRollup________________________

-- Write a query to display the total salary paid in each department 
--using GROUP BY along with total salary of all departments.


-- 1) Display Total sal from the emp table.
SELECT SUM(sal) FROM emp;

+----------+
| SUM(sal) |
+----------+
| 29025.00 |
+----------+
1 row in set (0.00 sec)

-- 2) display dept wise total sal.

SELECT deptno,SUM(sal)
FROM emp
GROUP BY deptno
ORDER BY deptno;

+--------+----------+
| deptno | SUM(sal) |
+--------+----------+
|     10 |  8750.00 |
|     20 | 10875.00 |
|     30 |  9400.00 |
+--------+----------+
  Total  | 29025.00 |
+----------+--------|
3 rows in set (0.00 sec)


-- My requirement





-- Write a query to display department-wise totals 
--and grand total using GROUP BY WITH ROLLUP.

SELECT deptno,SUM(Sal)
FROM emp
GROUP BY deptno WITH ROLLUP;

+--------+----------+
| deptno | SUM(Sal) |
+--------+----------+
|     10 |  8750.00 |
|     20 | 10875.00 |
|     30 |  9400.00 |
|   NULL | 29025.00 |
+--------+----------+
4 rows in set (0.00 sec)

SELECT IFNULL(deptno,"Total") deptno, SUM(Sal)
FROM emp
GROUP BY deptno WITH ROLLUP;

+--------+----------+
| deptno | SUM(Sal) |
+--------+----------+
| 10     |  8750.00 |
| 20     | 10875.00 |
| 30     |  9400.00 |
| Total  | 29025.00 |
+--------+----------+
4 rows in set, 1 warning (0.00 sec)

-- Write a query to display department, job, employee count, and total salary 
-- grouped by dept as well as job.
SELECT deptno,job,COUNT(empno),SUM(Sal)
FROM emp
GROUP BY deptno,job
ORDER BY deptno;


-- Write a query to display department-job summary using GROUP BY WITH ROLLUP.

SELECT IFNULL(deptno,"deptno") deptno,IFNULL(job,"Job") job,
COUNT(empno),SUM(Sal)
FROM emp
GROUP BY deptno,job WITH ROLLUP;
+--------+-----------+--------------+----------+
| deptno | job       | COUNT(empno) | SUM(Sal) |
+--------+-----------+--------------+----------+
| 10     | CLERK     |            1 |  1300.00 |
| 10     | MANAGER   |            1 |  2450.00 |
| 10     | PRESIDENT |            1 |  5000.00 |
| 10     | Job       |            3 |  8750.00 |
| 20     | ANALYST   |            2 |  6000.00 |
| 20     | CLERK     |            2 |  1900.00 |
| 20     | MANAGER   |            1 |  2975.00 |
| 20     | Job       |            5 | 10875.00 |
| 30     | CLERK     |            1 |   950.00 |
| 30     | MANAGER   |            1 |  2850.00 |
| 30     | SALESMAN  |            4 |  5600.00 |
| 30     | Job       |            6 |  9400.00 |
| deptno | Job       |           14 | 29025.00 |
+--------+-----------+--------------+----------+
13 rows in set, 2 warnings (0.00 sec)

-- Write a query to perform ROLLUP on job first, then department.
SELECT job,deptno,COUNT(empno),SUM(sal)
FROM emp
GROUP BY job,deptno WITH ROLLUP;


--_______________________________________________________
/*
The GROUPING() function is used with ROLLUP 
to tell whether a NULL value in the result is:
a real NULL from the data, or
a NULL added by SQL for subtotal / total rows

 Why do we need it?
When you use ROLLUP, SQL inserts NULL values to represent totals.
But sometimes your actual data may also contain NULL.

So how do you tell the difference?
That’s exactly what GROUPING() solves.

| Value | Meaning                         |
| ----- | ------------------------        |
| 0     | Real value - NULL (from table)  |
| 1     | Generated by ROLLUP        |

*/

-- GROUPING()

SELECT deptno,job,COUNT(empno),SUM(sal)
FROM emp
GROUP BY deptno,job WITH ROLLUP;

SELECT deptno,job,COUNT(empno),SUM(sal),GROUPING(job)
FROM emp
GROUP BY deptno,job WITH ROLLUP;


-- Write a query to show only the sub-totals and grand-total. 
-- Filter out other rows. Hint: GROUPING()
SELECT deptno,job,COUNT(empno),SUM(sal),GROUPING(job)
FROM emp
GROUP BY deptno,job WITH ROLLUP
HAVING GROUPING(job) = 1;

+--------+------+--------------+----------+---------------+
| deptno | job  | COUNT(empno) | SUM(sal) | GROUPING(job) |
+--------+------+--------------+----------+---------------+
|     10 | NULL |            3 |  8750.00 |             1 |
|     20 | NULL |            5 | 10875.00 |             1 |
|     30 | NULL |            6 |  9400.00 |             1 |
|   NULL | NULL |           14 | 29025.00 |             1 |
+--------+------+--------------+----------+---------------+
4 rows in set (0.01 sec)


--____________________REGEXP___________________________

-- REGEXP : stands for Regular Expressions.
-- Used in the WHERE clause to filter the records.
-- Similar to LIKE, used for pattern based filtering (Only for String)

/* USed in many places like 
        Databases :RDBMS, NoSQL 
        Web Programming(html,PHP)  
        Prog languages(java, python) Have built in regexp support 
*/

-- eg: used for email pattern checking, phone number etc.
-- REGEXP allows searching different patterns based on wildcard chars :
-- wildcards : $ ^ . * + [] [^] {} etc
-- every pattern has its own purpose.
-- $  : End of line 
-- ^  : Beginning of line 
-- .  : Any one char
-- [a-z] : denotes the range between a to z
--[a-z0-9] : denotes the range between a to z and 0 to 9
--[^a-z]: excludes the range a to z
--[aiu] : denotes any value  either a, i or u 
--etc



-- using like operator
-- Display all employees whose names start with 'A'
SELECT empno,ename,sal
FROM emp
WHERE ename LIKE 'A%';
--_______________________________________________________________
-- CREATE TABLE (JUNK) with 1 column(col1) - VARCHAR(20)
CREATE TABLE junk(col1 VARCHAR(20));

-- Insert the values in different rows as follows : 
-- this , Biscuit, isnt, tasty, but, that, Cake, is, TOO GOOD.
INSERT INTO junk VALUES('this'),('Biscuit'),('isnt'),('tasty'),('but'),('that'),('cake'),('is'),('TOO'),('Good');

-- Display the table data.
SELECT * FROM junk;

-- Display the values from the table containing "is".
SELECT * FROM junk WHERE col1 REGEXP 'is';

| col1    |
+---------+
| this    |
| Biscuit |
| isnt    |
| is      |
+---------+
-- Display the values from the table starting with "is".
SELECT * FROM junk WHERE col1 REGEXP '^is';
-- ^ denotes beginning with is

+------+
| col1 |
+------+
| isnt |
| is   |
+------+
2 rows in set (0.00 sec)


-- Display all values from the table ending with "is".
SELECT * FROM junk WHERE col1 REGEXP 'is$';
-- $ denotes ending with "is" word
+------+
| col1 |
+------+
| this |
| is   |
+------+
2 rows in set (0.00 sec)


-- Display all values from the table having only 'is'.
SELECT * FROM junk WHERE col1 REGEXP '^is$';
+------+
| col1 |
+------+
| is   |
+------+
1 row in set (0.00 sec)


--____________________________________________________
-- Selections :
-- create a new table as dummy with 1 column(col1) - varchar(20)
CREATE TABLE dummy(col1 VARCHAR(20));

-- insert the below values :
-- bag, beg, big, bog, bug, b*g, bg, xyz
INSERT INTO dummy VALUES('bag'),('beg'),('big'),('bog'),('bug'),('b*g'),('bg'),('xyz');


-- Display the data.

SELECT * FROM dummy;

-- Display the values from the table having any 1 char between 'b' and 'g'
SELECT * FROM dummy WHERE col1 REGEXP 'b.g';
-- . denotes any one char(alphabet,num,special char)

+------+
| col1 |
+------+
| bag  |
| beg  |
| big  |
| bog  |
| bug  |
| b*g  |
+------+
6 rows in set (0.00 sec)

-- Display all the values that have only one alphabet in between 'b' and 'g'.
SELECT * FROM dummy WHERE col1 REGEXP 'b[a-z]g';
/*
[a-z] : denotes any one value between the range of a to z
[0-9] : denotes any one number
[a-z0-9] : denotes any one alphabet or number
*/

+------+
| col1 |
+------+
| bag  |
| beg  |
| big  |
| bog  |
| bug  |
+------+
5 rows in set (0.00 sec)


-- Display all the values having 1 alphabets between b and g 
--out of the chars a,i,u
SELECT * FROM dummy WHERE col1 REGEXP 'b[aiu]g';
+------+
| col1 |
+------+
| bag  |
| big  |
| bug  |
+------+
3 rows in set (0.00 sec)



-- Display all the values having any 1 char 
-- between 'b' and 'g' but not alphabet
SELECT * FROM dummy WHERE col1 REGEXP 'b[^a-z]g';

--[^a-z] : excludes the given range.
-- ^ specifies NOT.
+------+
| col1 |
+------+
| b*g  |
+------+
1 row in set (0.00 sec)

SELECT * FROM dummy WHERE col1 NOT REGEXP 'b[a-z]g';

+------+
| col1 |
+------+
| b*g  |
| bg   |
| xyz  |
+------+
3 rows in set (0.00 sec)


-- Display the word b*g
SELECT * FROM dummy WHERE col1 REGEXP 'b\\*g';
-- \\ is an escape sequence which specifies to consider the '*'
-- as the data and not as the wild card.


--____________________________________________________________
-- * : means 0 or more occurrences of previous char
-- ? : means 0 or 1 occurrence of previous char
-- + : means 1 or more occurrences of previous char
-- {n} : means n occurrences of previous char
--{m,} : means more than m occurrences of previous char
--{m,n} : means m to n occurrences of previous char
-- () : means grouping. Groups multiple chars

-- repetition (checking based on repetitive patterns)

-- Create a table named repetition with 1 column(col1)
CREATE TABLE repetition(col1 VARCHAR(20));


-- insert the values as below :
-- ww, wow, woow, wooow, woooow, wooooow, woooooow, wooooooow

INSERT INTO repetition VALUES('ww'),('wow'),('woow'),('wooow'),
('woooow'),('wooooow'),('woooooow');

-- display the table data.
mysql> SELECT * FROM repetition;
+----------+
| col1     |
+----------+
| ww       |
| wow      |
| woow     |
| wooow    |
| woooow   |
| wooooow  |
| woooooow |
+----------+
7 rows in set (0.00 sec)


-- Display 0 or more occurrences of 'o' from the table.
SELECT * FROM repetition WHERE col1 REGEXP 'wo*w';
-- * denotes 0 or more occurrances of the previous alphabet 'o'.


-- Display 0 or 1 occurrences of 'o' from the table.
SELECT * FROM repetition WHERE col1 REGEXP 'wo?w';
+------+
| col1 |
+------+
| ww   |
| wow  |
+------+
2 rows in set (0.00 sec)


-- Display 1 or more occurrences of 'o' from the table.
SELECT * FROM repetition WHERE col1 REGEXP 'wo+w';

-- Display 4 occurrences of 'o' from the table.
SELECT * FROM repetition WHERE col1 REGEXP 'wo{4}w';

+--------+
| col1   |
+--------+
| woooow |
+--------+
1 row in set (0.00 sec)
-- Display 4 or more occurrences of 'o' from the table.
SELECT * FROM repetition WHERE col1 REGEXP 'wo{4,}w';
+----------+
| col1     |
+----------+
| woooow   |
| wooooow  |
| woooooow |
+----------+
3 rows in set (0.00 sec)


-- Display 3 to 6 occurrences of 'o' from the table.
SELECT * FROM repetition WHERE col1 REGEXP 'wo{3,6}w';
+----------+
| col1     |
+----------+
| wooow    |
| woooow   |
| wooooow  |
| woooooow |
+----------+
4 rows in set (0.00 sec)


--_________________________________________________


-- Pattern checking for valid phone numbers
7057590799 : 10 digit number : [0-9]{10}

07057590799 : 0 may or may not be included before 10 digits :
0?[0-9]{10}

+917057590799 : +91 may or may not be included :
(\\+91)?[0-9]{10}
(0 | \\+91)?[0-9]{10}
--____________________________________________________

--__________________________-- ALTER :___________________
-- ALTER is a DDL command used to change the table structure.

-- create a table emp_backup as a clone of emp.
CREATE TABLE emp_backup SELECT * FROM emp;

-- alter the above emp_backup table and add a column ph_number to it.
ALTER TABLE emp_backup ADD COLUMN ph_number VARCHAR(15);
+-----------+--------------+------+-----+---------+-------+
| Field     | Type         | Null | Key | Default | Extra |
+-----------+--------------+------+-----+---------+-------+
| empno     | int          | YES  |     | NULL    |       |
| ename     | varchar(40)  | YES  |     | NULL    |       |
| job       | varchar(40)  | YES  |     | NULL    |       |
| mgr       | int          | YES  |     | NULL    |       |
| hire      | date         | YES  |     | NULL    |       |
| sal       | decimal(8,2) | YES  |     | NULL    |       |
| comm      | decimal(8,2) | YES  |     | NULL    |       |
| deptno    | int          | YES  |     | NULL    |       |
| ph_number | varchar(15)  | YES  |     | NULL    |       |
+-----------+--------------+------+-----+---------+-------+
9 rows in set (0.00 sec)


-- We can specify where we need to add the new column Last_name.
ALTER TABLE emp_backup ADD COLUMN last_name VARCHAR(20) AFTER ename;

+-----------+--------------+------+-----+---------+-------+
| Field     | Type         | Null | Key | Default | Extra |
+-----------+--------------+------+-----+---------+-------+
| empno     | int          | YES  |     | NULL    |       |
| ename     | varchar(40)  | YES  |     | NULL    |       |
| last_name | varchar(20)  | YES  |     | NULL    |       |
| job       | varchar(40)  | YES  |     | NULL    |       |
| mgr       | int          | YES  |     | NULL    |       |
| hire      | date         | YES  |     | NULL    |       |
| sal       | decimal(8,2) | YES  |     | NULL    |       |
| comm      | decimal(8,2) | YES  |     | NULL    |       |
| deptno    | int          | YES  |     | NULL    |       |
| ph_number | varchar(15)  | YES  |     | NULL    |       |
+-----------+--------------+------+-----+---------+-------+
10 rows in set (0.00 sec)


-- Alter the emp_backup table to modify the column ename to varchar(50) 

ALTER TABLE emp_backup MODIFY COLUMN ename VARCHAR(50);



-- alter table to modify the column job to char(3)
ALTER TABLE emp_backup MODIFY COLUMN job VARCHAR(5);
ERROR 1265 (01000): Data truncated for column 'job' at row 2

ALTER TABLE emp_backup MODIFY COLUMN job VARCHAR(10);


-- drop the column
ALTER TABLE emp_backup DROP COLUMN ph_number;
-- rename the column
-- rename ename to first name
ALTER TABLE emp_backup RENAME COLUMN ename TO first_name;

-- rename the table
ALTER TABLE emp_backup RENAME TO emp_copy;

--OR

RENAME TABLE emp_backup TO emp_copy;
