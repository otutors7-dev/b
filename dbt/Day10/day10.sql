/*
AGENDA :
  TCL
  Window Functions and CTEs
  Normalization
  

*/


--*************************************************
--__________________________________________________
-- TCL :Transaction Control Language
-- login from sunbeam user under classwork_db.

-- Check the autocommit variable.
mysql> SELECT @@autocommit;
+--------------+
| @@autocommit |
+--------------+
|            1 |
+--------------+
1 row in set (0.00 sec)

 /*
In mysql the predefined variable autocommit is 1 by default.
It means all the DML operations are committed automatically.
We cannot undo the DMLs if wrong.
 */


-- Create a new table accounts with 
--id int, acc_type char(10),balance Decimal(10,2)
CREATE TABLE accounts(id INT,acc_type char(10), balance DECIMAL(10,2));

-- insert few values
/*
    1 'savings' 20000
    2 'savings' 5000
    3 'savings' 1500
    4 'current' 4000
    5 'savings'  10000
*/

INSERT INTO accounts VALUES(1,'savings',20000);
INSERT INTO accounts VALUES(2,'savings',5000);
INSERT INTO accounts VALUES(3,'savings',1500);
INSERT INTO accounts VALUES(4,'current',5000);
INSERT INTO accounts VALUES(5,'savings',10000);

SELECT * FROM accounts;

-- start the transaction
/*
Once we START TRANSACTION, all the DMLs inside this transaction are temporary.
Means we can undo the changes if wrong.
After the DMLs are fired, check the changes. If correct, we can COMMIT
the changes.
Once we fire COMMIT, the transaction is said to be completed.
After that, If we want to execute another set of DMLs we need to 
START TRANSACTION again.

As the DMLS inside the TRANSACTION are temporary, these changes will not
be visible to other users accessing the same data.
Other users will be able to see the old data.
Once the changes are committed, new data is visible to them.
*/


START TRANSACTION;

-- update the accounts table and deduct 1000 from acc 1 and add 1000 to acc 2.


UPDATE accounts SET balance = balance - 1000
WHERE id = 1;

UPDATE accounts SET balance = balance + 1000
WHERE id = 2;

-- check the changes done.

mysql> SELECT * FROM accounts;
+------+----------+----------+
| id   | acc_type | balance  |
+------+----------+----------+
|    1 | savings  | 11000.00 |
|    2 | savings  |  6000.00 |
|    3 | Current  |  6000.00 |
|    4 | savings  |  9000.00 |
+------+----------+----------+
4 rows in set (0.00 sec)

-- If the changes are correct, make the changes permanent.
COMMIT;

-- start the transaction and perform some DMLs.
START TRANSACTION;


-- Assuming the DMLs are wrong, undo the changes.
UPDATE accounts SET balance = balance +5000
WHERE id = 1;

DELETE FROM accounts WHERE id = 2;

mysql> SELECT * FROM accounts;
+------+----------+----------+
| id   | acc_type | balance  |
+------+----------+----------+
|    1 | savings  | 16000.00 |
|    3 | Current  |  6000.00 |
|    4 | savings  |  9000.00 |
+------+----------+----------+
3 rows in set (0.00 sec)


-- Undo the changes :
ROLLBACK;


-- check the changes undone :

mysql> SELECT * FROM accounts;
+------+----------+----------+
| id   | acc_type | balance  |
+------+----------+----------+
|    1 | savings  | 11000.00 |
|    2 | savings  |  6000.00 |
|    3 | Current  |  6000.00 |
|    4 | savings  |  9000.00 |
+------+----------+----------+
4 rows in set (0.00 sec)


-- Rollback is a TCL command used to undo the DMLs fired in the current transaction;
-- The Transaction is said to be complete when we fire a COMMIT or ROLLBACK.


-- What happens if we do not START TRANSACTION :
-- update the accounts table but the updates are wrong
UPDATE accounts SET balance = balance - 3000
WHERE id = 1;

SELECT * FROM accounts;
mysql> SELECT * FROM accounts;
+------+----------+---------+
| id   | acc_type | balance |
+------+----------+---------+
|    1 | savings  | 8000.00 |
|    2 | savings  | 6000.00 |
|    3 | Current  | 6000.00 |
|    4 | savings  | 9000.00 |
+------+----------+---------+
4 rows in set (0.00 sec)

-- considering the changes to be wrong
-- discard the changes done.
ROLLBACK;

mysql> SELECT * FROM accounts;
+------+----------+---------+
| id   | acc_type | balance |
+------+----------+---------+
|    1 | savings  | 8000.00 |
|    2 | savings  | 6000.00 |
|    3 | Current  | 6000.00 |
|    4 | savings  | 9000.00 |
+------+----------+---------+
4 rows in set (0.00 sec)

-- the above update command is NOT UNDONE by rollback, as it was NOT inside
-- the transaction.
-- ALL the DMLs which are only fired inside the START TRANSACTION can be rolledback.
-- Otherwise the DMLs are permanent.

--___________________________________________________________
-- SAVEPOINT
-- Start the transaction, perform few DML operations. Apply SAvepoints after few DMLS.

START TRANSACTION;
INSERT INTO accounts VALUES(5,'Current',5000);
INSERT INTO accounts VALUES(6,'Savings',15000);
INSERT INTO accounts VALUES(7,'Current',7000);

SAVEPOINT s1;

UPDATE accounts SET balance = balance - 2000
WHERE id = 3;
UPDATE accounts SET balance = balance + 2000
WHERE id = 4;

SAVEPOINT s2;

DELETE FROM accounts WHERE id = 2;
DELETE FROM accounts WHERE id = 3;


SELECT * FROM accounts;

ROLLBACK TO SAVEPOINT s2;
SELECT * FROM accounts;


-- The above INSERT and UPDATE are still temporary. We need to
-- explicitly commit them.

-- ROLLBACK TO savepoint DOES NOT complete the transaction.
-- TRANSACTION is said be complete only with COMMIT or ROLLBACK.

COMMIT;
--_______________________________________________________

-- Start the transaction, perform few DMLs and perform a DDL command after that.

START TRANSACTION;

UPDATE accounts SET balance = balance - 1500
WHERE id = 4;

SELECT * FROM accounts;

DROP TABLE junk;
-- DROP being a DDL command, it is autocommitted.
-- It also commits all the data/ DMLs fired before it.
-- In short , all the temporary data is committed when you fire a DDL command.

-- This rollback will not be able to undo the changes for the above DML.

-- When we fire a DDL inside the transaction, the transaction is completed
-- We have to start a new transaction to fire new DMLs.
--________________________________________________________________

-- to check the autocommit
SELECT @@autocommit;


-- Set autocommit to 0.
SET @@autocommit = 0;

/*
As the autocommit variable is set to 0, all the DMLs are temporary.
We need to explicitly fire commit to make them permanent.
We do not need to START TRANSACTION.
In this each DML is a separate transaction.
We have to fire the commit or rollback to complete that transaction.
If we fire any DDL command after the DML, it internally commits all the 
temporary transactions, hence the ROLLBACK will not undo the changes of the DML
above the DDL.
*/

--________________________________________________________________
/* Login with sunbeam user and root user.
Both the users have the access of classwork_db and accounts table.
under the sunbeam user, start the transaction and update the data from accounts
table.

The updated data is visible to sunbeam user as he has done the changes.
But , if the root user accesses the same accounts table, he will not be able to see the updated changes done by sunbeam user, as the DML is inside the TRANSACTION and hence it is temporary.
the updates need to be made permanent with COMMIT.
After sunbeam user fires COMMIT, the updated data is visible to root user.
*/

-- sunbeam user :
START TRANSACTION;
UPDATE accounts set balance = balance - 1000
WHERE id = 1;
UPDATE accounts set balance = balance + 1000
WHERE id = 2;

-- mgr user :
UPDATE accounts set balance = balance - 2000
WHERE id = 3;
UPDATE accounts set balance = balance + 2000
WHERE id = 4;






-- Table Locking
/*
In mysql , if the table does not have a primary key or index, 
there is a table lock.

Table lock means, when one user is executing any DML inside a transaction,
and the transaction is still ON,
Simultaneously if other user is executing another DML on some other row of the
same table, that transaction is locked for him. He cannot perform any DML
on the entire table.
That lock is released after a specific timeout or if the first user completes
the transaction by firing COMMIT or ROLLBACK.

*/



--______________ROW Locking_________________________
ALTER TABLE accounts ADD PRIMARY KEY(id);

/*
As we have added the primary key, there is a row lock manintained across for DMLs
multiple users.
if sunbeam user starts the transaction and performs DML on id 1,
and the root user simultaneously performs DML on id 3,
Those DMLs will be successful in their respective logins as the DMLs are done 
on the different rows.

If the root user performs DML on id 1, and the transaction of sunbeam user
is still ON, that row will be locked for root user. The lock is released
either if the timeout is over of if the sunbeam user completes the transaction
by firing the commit or rollback.

So, in mysql by default there is a table lock.
We need the primary key or index on the table to achieve row locking.
*/

--___________________Pessimistic Locking________________

/*
Optimistic locking : When the table or row is locked for other users
automatically when one user performs the DML, it is called optimistic locking.

Pessimistic locking : When the user explicitly locks particular rows
for other users to perform DML.
the explicit locking can be done with the command below.
SYNTAX : SELECT col1,col2 FROM tab WHERE condition FOR UPDATE.

All the rows satisfying the condition will be locked for DML.
The rows will be released after the user1 completes the transaction with commit 
or rollback.

*/

SELECT * FROM accounts WHERE id = 1 FOR UPDATE;
SELECT * FROM accounts WHERE id = 3 FOR UPDATE;

SELECT * FROM emp WHERE deptno = 30;

SELECT * FROM emp WHERE deptno = 30 FOR UPDATE;
--___________________________________________________________
-- Common Table Expression :

-- 2. Derived Tables

-- Write a query to find the maximum salary in each department.
SELECT deptno,MAX(Sal)
FROM emp
GROUP BY deptno;


-- Write a query to list employees who earn the maximum salary 
--in their respective departments.

-- correlated sub-query 

SELECT empno,ename,sal,deptno
FROM emp e1
WHERE sal = (SELECT MAX(sal) FROM emp e2 WHERE e2.deptno = e1.deptno); 


-- derived table
-- subquery in the from clause

SELECT empno,ename,sal,deptno
FROM emp e1 INNER JOIN
(SELECT deptno,MAX(sal) "max_sal" FROM emp GROUP BY deptno) AS e2
ON e1.deptno = e2.deptno
WHERE e1.sal = e2.max_sal;


-- Common Table Expressions 
/* 
A CTE (Common Table Expression) in MySQL is a temporary result set 
that you define at the start of a query using the WITH clause. 
It makes complex queries easier to read, organize, and reuse.

Syntax :
WITH cte_name AS
(select_query)
main sql_query;
*/
-- Write a query using a CTE to list employees with the maximum salary 
--in each department.

WITH dept_max_sal AS
(SELECT deptno,MAX(sal) AS max_sal
FROM emp
GROUP BY deptno)
SELECT empno,ename,emp.sal,emp.deptno
FROM emp 
INNER JOIN
 dept_max_sal
ON emp.deptno = dept_max_sal.deptno
WHERE emp.sal = max_sal;

-- Find the total salary paid in each department using GROUP BY.
SELECT deptno,SUM(Sal)
FROM emp
GROUP BY deptno;


-- Attempt to find the average of department totals using AVG(SUM()). 
--Is it possible?

SELECT deptno,AVG(SUM(Sal))
FROM emp
GROUP BY deptno;
-- ERROR :Nesting of GROUP functions is Not allowed.


-- Rewrite the same using a CTE named `dept_total`.

WITH dept_total_sal AS
(SELECT deptno,SUM(Sal) "total_sal"
FROM emp
GROUP BY deptno)
SELECT AVG(total_sal)
FROM dept_total_sal;


-- Display each employee’s salary with the average salary of their job type. 


SELECT job,AVG(sal)
FROM emp
GROUP BY job;
+-----------+-------------+
| CLERK     | 1037.500000 |
| SALESMAN  | 1400.000000 |
| MANAGER   | 2758.333333 |
| ANALYST   | 3000.000000 |
| PRESIDENT | 5000.000000 |
+-----------+-------------+

requirement :

ename    job      sal      avg_sal_job
____________________________________
smith    clerk      800      1037
allen    salesman   1600     1400



--Create a derived table/CTE for job averages.**
  -- Output: ename, job, sal, avgsalbyjob

WITH avs AS
(SELECT job, AVG(sal) avg_sal
FROM emp
GROUP BY job)
SELECT ename,emp.job,emp.sal,avg_sal
FROM emp INNER JOIN
avs 
ON emp.job = avs.job
ORDER BY emp.job;

-- Display each employee’s details with the average salary 
-- of their depts. 
--Create a derived table/CTE for dept averages.**

SELECT deptno,AVG(sal)
FROM emp
GROUP BY deptno;
-- display : empno,ename,deptno,sal,avg_sal_dept

WITH deptwise_avg_sal AS
(SELECT deptno,AVG(sal) avg_sal
FROM emp
GROUP BY deptno)
SELECT empno,ename,emp.deptno,emp.sal,avg_sal
FROM emp
INNER JOIN
deptwise_avg_sal 
ON emp.deptno = deptwise_avg_sal.deptno
ORDER BY deptno;



--__________________________________________________________

-- Display each employee’s details with the average salary 
-- of their depts and average salary of their jobs.

empno   ename   sal  deptno  job  avg_sal_dept    avg_sal_job

  /*
  Multiple CTES Syntax
    
    WITH
    cte1 AS (table1-expression),
    cte2 AS (table2-expression),
    cte3 AS (table3-expression)
    main sql query;
    */

WITH
deptwise_sal AS
(SELECT deptno,AVG(sal) dept_avg_sal
FROM emp GROUP BY deptno),

jobwise_sal AS
(SELECT job,AVG(sal) job_avg_sal
FROM emp GROUP BY job)

SELECT empno,ename,emp.sal,emp.deptno,dept_avg_sal,emp.job,job_avg_sal
FROM emp INNER JOIN deptwise_sal 
ON emp.deptno = deptwise_sal.deptno
INNER JOIN jobwise_sal
ON emp.job = jobwise_sal.job
ORDER BY deptno,job;



-- Categorise emps based on their salaries in three types 
--i.e. Below Avg (< 1500), Avg (Between 1500 and 2500), 
--Above Avg (> 2500). 

SELECT empno,ename,sal,
CASE 
WHEN sal < 1500 THEN "Below Avg"
WHEN sal BETWEEN 1500 AND 2500 THEN "Avg"
ELSE "Above Avg" 
END As category
FROM emp;

--Count number of emps in each category.
WITH emp_category AS
(SELECT empno,
CASE 
WHEN sal < 1500 THEN "Below Avg"
WHEN sal BETWEEN 1500 AND 2500 THEN "Avg"
ELSE "Above Avg" 
END As category
FROM emp)
SELECT category,COUNT(empno)
FROM emp_category 
GROUP BY category;



--_________________________________________________
-- ** Recursive CTE **
/*
SYNTAX :
WITH RECURSIVE cte (col1, ...) AS (
  SELECT ... -- starting row (anchor query)
  UNION
  (SELECT ... -- recursive query
  WHERE cond -- cond to stop the recursion
)
main_sql query;

Think of a recursive CTE as a loop with two parts:

Anchor query (base case) → runs once
Recursive query → runs repeatedly using previous results

*/

-- **Write a recursive CTE to print numbers from 1 to 5.**

WITH RECURSIVE seq(n) AS
(
(SELECT 1)   -- ANCHOR query
UNION ALL
(SELECT n+1 FROM seq WHERE n < 5)  -- recursive query
)
SELECT * FROM seq;

-- **Write a recursive CTE to generate years from 1975 to 1985.**

WITH RECURSIVE yrs(n) AS
(
  (SELECT 1975)
  UNION
  (SELECT n+1 FROM yrs WHERE n < 1985)
)
SELECT * FROM yrs;


-- **Write a query to display years from 1975–1985 in which no employee 
--was hired.**

-- check the emps hired in each year
SELECT YEAR(hire)
FROM emp
ORDER BY YEAR(hire);
-- emps hired in 1980,81,82,83


WITH RECURSIVE yrs(n) AS
(
  (SELECT 1975)
  UNION
  (SELECT n+1 FROM yrs WHERE n < 1985)
)
SELECT * FROM yrs
WHERE n NOT IN (SELECT DISTINCT YEAR(hire) FROM emp);

/*
SELECT * FROM yrs
WHERE n NOT IN (1980,1981,1982,1983);
*/


+------+
| n    |
+------+
| 1975 |
| 1976 |
| 1977 |
| 1978 |
| 1979 |
| 1984 |
| 1985 |
+------+
7 rows in set (0.01 sec)


-- Employee Hierarchy Using Recursive CTE
-- **Write a query to display all employees ordered by manager ID.**


SELECT empno,ename,mgr
FROM emp
ORDER BY mgr;


-- **Write a recursive CTE to print the employee hierarchy 
-- starting from the top-level manager.**
-- Display empno,ename,mgr,lvl(extra column to show lvl of hierarcy)

WITH RECURSIVE emp_hierarchy(empno,ename,mgr,lvl) AS
(
  (SELECT empno,ename,mgr,0
  FROM emp WHERE mgr IS NULL)

  UNION ALL

  (SELECT emp.empno,emp.ename,emp.mgr, eh.lvl+1
  FROM emp  INNER JOIN emp_hierarchy eh
  ON emp.mgr = eh.empno
  )
) 
SELECT * FROM emp_hierarchy;

-- **Modify the above query to show only employees at level 2.**


WITH RECURSIVE emp_hierarchy(empno,ename,mgr,lvl) AS
(
  (SELECT empno,ename,mgr,0
  FROM emp WHERE mgr IS NULL)

  UNION ALL

  (SELECT emp.empno,emp.ename,emp.mgr, eh.lvl+1
  FROM emp  INNER JOIN emp_hierarchy eh
  ON emp.mgr = eh.empno
  )
) 
SELECT * FROM emp_hierarchy
WHERE lvl = 2;


--___________________WINDOW   FUNCTIONS________________________
/*
 **7. Window Functions**

Window Functions -- Operations to be performed on Set of rows 
defined by the Window.
Aggregate/Group Functions - e.g. SUM(), AVG(), MAX(), MIN(), COUNT(), ...
Performs aggregation on set rows without loosing individual row details.
Other Window Functions - e.g. RANK(), DENSE_RANK(), LEAD(), LAG(), ...

- Window -- Set of rows to be processed.

  May have all the rows -- OVER ()
  May have multiple partitions in Window based on some column(s)
    `OVER (PARTITION BY deptno)` -- partitioned by deptno (p1-10, p2-20, p3-30)
    `OVER (PARTITION BY job)` -- partitioned by job (p1-ANALYST, p2-CLERK, p3-MANAGER, p4-PRESIDENT, p5-SALESMAN)
    `OVER (PARTITION BY deptno, job)` -- partitioned by deptno and sub-partitioned by job (9 partitions)
  Rows in Window/Partition may be arranged in sorted order by some column.
    `OVER (ORDER BY sal)` -- all emps sorted by sal in asc
    `OVER (PARTITION BY deptno ORDER BY sal)` -- partitioned by deptno and emps sorted by sal in each dept partition.
    `OVER (PARTITION BY job ORDER BY ename DESC)` -- partitioned by job and emps sorted by ename in desc order in each dept partition.


*/
-- Basic Window Aggregates**

-- **Display employee info along with total company salary.**
SELECT empno,ename,sal,SUM(Sal)
FROM emp;
-- error

SELECT SUM(Sal)
FROM emp;


SELECT empno,ename,sal,SUM(Sal) OVER()
FROM emp;


-- Display employee info along with department-wise total salary 
--using PARTITION BY deptno.

SELECT deptno,SUM(Sal)
FROM emp
GROUP BY deptno;


SELECT empno,ename,sal,deptno,SUM(sal) OVER(PARTITION BY deptno) "deptwise_sal"
FROM emp;



-- **Count number of emps in each dept for each job. 

SELECT deptno,job,COUNT(empno)
FROM emp
GROUP BY deptno,job;


--Display along with empno, ename and sal.**
SELECT empno,ename,sal,deptno,job,COUNT(empno) OVER(PARTITION BY deptno,job) AS count_emp
FROM emp;

--________________________________________________________________
-- ** Row Number, Rank, Dense Rank**
-- ROW_NUMBER() assigns a unique sequential number to each row in the result set.

-- RANK() is used to assign a ranking number to rows based on a specified order.

-- DENSE_RANK() assigns ranks to rows based on a specified order, 
-- without skipping any rank numbers.

-- **Assign a sequential row number to all employees.**
SELECT ROW_NUMBER() OVER() AS sr_no,empno,ename,sal
FROM emp;

-- **Assign row numbers partitioned by department.**
SELECT ROW_NUMBER() OVER(PARTITION BY deptno) AS sr_no,empno,ename,deptno,sal
FROM emp;

-- **Assign row numbers partitioned by job role.**
SELECT ROW_NUMBER() OVER(PARTITION BY job) AS sr_no,empno,ename,deptno,sal
FROM emp;


-- **Assign rank based on salary in desc order across all employees.**
SELECT RANK()OVER(ORDER BY sal DESC) AS rnk,empno,ename,sal
FROM emp;

-- **Assign rank based on salary within each department.**

SELECT RANK()OVER(PARTITION BY deptno ORDER BY sal DESC) AS rnk,empno,ename,deptno,sal FROM emp;

-- **Display row number, rank, and dense rank partitioned by department 
-- ordered by salary.**

SELECT ROW_NUMBER() OVER(PARTITION BY deptno ORDER BY sal DESC) AS sr_no,
RANK() OVER(PARTITION BY deptno ORDER BY sal DESC) AS rnk,
DENSE_RANK() OVER(PARTITION BY deptno ORDER BY sal DESC) AS dn_rnk,
empno,ename,sal,deptno
FROM emp;


-- **Use WINDOW specification/clause to define 
--(PARTITION BY deptno ORDER BY sal).**
SELECT ROW_NUMBER() OVER(w1) AS "sr_no",
RANK() OVER(w1) AS "rnk",
DENSE_RANK() OVER(w1) AS "dn_rnk", 
empno,ename,sal
FROM emp
WINDOW w1 AS (PARTITION BY deptno ORDER BY sal DESC);


-- **Use WINDOW specification/clause to define 
-- (PARTITION BY job ORDER BY sal DESC).**


--_______________________________________________________________
--  **FIRST_VALUE and LAST_VALUE**
/*
 FIRST_VALUE() returns the first value from a set of rows based 
 on the specified ordering in a window.
LAST_VALUE() returns the last value in a window (set of rows) 
based on the specified ordering in a window.
*/

-- **Find the first employee name in each department (no ORDER BY).**
SELECT ROW_NUMBER() OVER(w1) AS "sr_no",
FIRST_VALUE(ename) OVER(w1) AS "frst_ename",
empno,ename,sal,deptno
FROM emp
WINDOW w1 AS(PARTITION BY deptno);



-- **Find the first employee by salary within each department.**
SELECT ROW_NUMBER() OVER(w1) AS "sr_no",
FIRST_VALUE(ename) OVER(w1) AS "fname",
empno,ename,deptno,sal
FROM emp
WINDOW w1 AS(PARTITION BY deptno ORDER BY sal ASC);


-- **Find the employee with the highest salary per department using 
-- ORDER BY DESC.**
SELECT ROW_NUMBER() OVER(w1) AS "sr_no",
FIRST_VALUE(ename) OVER(w1) AS "fname",
empno,ename,deptno,sal
FROM emp
WINDOW w1 AS(PARTITION BY deptno ORDER BY sal DESC);


-- **Find both first and last employee names using FIRST_VALUE and LAST_VALUE, 
-- and analyze behavior.**

SELECT ROW_NUMBER() OVER(w1) AS "sr_no",
FIRST_VALUE(ename) OVER(w1) AS "fname",
LAST_VALUE(ename) OVER(w1 ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS "lname",
empno,ename,deptno,sal
FROM emp
WINDOW w1 AS(PARTITION BY deptno ORDER BY sal DESC);



/*
Data is split department-wise
Inside each department:
  Lowest salary comes first
  Highes salary comes last

LAST_VALUE() Actual Behaviour says : 
RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
This Means :
For each row:
Window starts from first row of partition
Window ends at current row
So the window is growing row by row
LAST_VALUE() = the default frame ends at the current row
hence it gives value of current row (by default)

We can fix this by giving the range :
ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
*/

--_____________________________________________________________
--  **LEAD(next value) and LAG(previous value) **
-- **Show each employee’s next employee salary using LEAD.**
SELECT empno,ename,sal,LEAD(sal) OVER()
FROM emp;


-- **Show previous salary using LAG.**
SELECT empno,ename,sal,LAG(sal) OVER()
FROM emp;

