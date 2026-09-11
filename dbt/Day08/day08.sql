/*
AGENDA :
- Pending Topics :
    -- Sub-queries in DML
    -- Sub-queries in Projection
    -- Sub-queries in FROM clause
- Procedures
- Functions
- Triggers
- Exception Handling
*/
--___________________________________________
-- Sub-queries in DML
-- Delete emp earning max sal.

-- find the emp earning max sal.
SELECT MAX(sal) FROM emp;

SELECT * FROM emp
WHERE sal = (SELECT MAX(sal) FROM emp);

DELETE FROM emp_copy
WHERE sal = (SELECT MAX(sal) FROM emp_copy);
-- ERROR 1093 (HY000): You can't specify target table 'emp_copy' for update in FROM clause
/*
SELECT clause and DML on the same table is not allowed by mysql.
As this is not allowed, we can use the variable to SELECT and perform DML on the same table.
*/


SET @max_sal = (SELECT MAX(sal) FROM emp_copy);

DELETE FROM emp_copy WHERE sal = @max_sal;

SELECT * FROM emp_copy;
-- King is deleted


--__________________________________________
--delete the dept which has no employee working in it.

-- check the depts from dept table.
SELECT * FROM dept;
+--------+------------+----------+
| deptno | dname      | loc      |
+--------+------------+----------+
|     10 | ACCOUNTING | NEW YORK |
|     20 | RESEARCH   | DALLAS   |
|     30 | SALES      | CHICAGO  |
|     40 | OPERATIONS | BOSTON   |
+--------+------------+----------+
4 rows in set (0.04 sec)


-- check which dept has emps working in it.
SELECT * FROM dept
WHERE deptno =ANY(SELECT DISTINCT deptno FROM emp);

+--------+------------+----------+
| deptno | dname      | loc      |
+--------+------------+----------+
|     10 | ACCOUNTING | NEW YORK |
|     20 | RESEARCH   | DALLAS   |
|     30 | SALES      | CHICAGO  |
+--------+------------+----------+
3 rows in set (0.00 sec)

-- delete the dept which has no emps.

DELETE FROM dept
WHERE deptno NOT IN(SELECT DISTINCT deptno FROM emp);
-- 40 operations deleted.


--___________________________________________
-- Insert JOHN in RESEARCH dept as ANALYST on sal 2800.
-- empno :
-- ename : john
-- deptno : ?? RESEARCH
-- job : ANALYST
-- sal : 2800

SET @dept_no = (SELECT deptno FROM dept WHERE dname = 'RESEARCH');

INSERT INTO emp_copy
(empno,ename,deptno,job,sal) 
VALUES
(1234,'John',@dept_no,'ANALYST',2800);


INSERT INTO emp_copy
(empno,first_name,deptno,job,sal) 
VALUES
(1234,'John',(SELECT deptno FROM dept WHERE dname = 'RESEARCH'),
'ANALYST',2800);

-- 1 row inserted

--______________________________________________________
--INSERT SAM in a SALES dept as Salesman 
-- with sal same as highest sal of salesman
-- keep the empno as max(empno) + 1.
-- ename : SAM
-- deptno : ?? sales  --> dept 
-- job : salesman
-- sal : highest sal of salesman  --> emp
-- empno : max + 1 --> emp


SET @max_empno = (SELECT MAX(empno) FROM emp_copy)+1;
SET @max_Sal = (SELECT MAX(sal) FROM emp_copy WHERE job = 'salesman');

INSERT INTO emp_copy(empno,first_name,deptno,job,sal)
VALUES
(@max_empno,'SAM',(SELECT deptno FROM dept WHERE dname = 'Sales'),'Salesman',@max_Sal);


--*****************************************************
--____________________________________________
--Sub-query in Projection
-- display the deptno and total emps in each dept.
SELECT deptno,COUNT(empno)
FROM emp
GROUP BY deptno;

+--------+--------------+
| deptno | COUNT(empno) |
+--------+--------------+
|     10 |            3 |
|     20 |            5 |
|     30 |            6 |
+--------+--------------+
3 rows in set (0.00 sec)

SELECT COUNT(empno) FROM emp;

+--------------+
| COUNT(empno) |
+--------------+
|           14 |
+--------------+
1 row in set (0.00 sec)



+--------+--------------+
| deptno | COUNT(empno) |Total_emp_count
+--------+--------------+--------------
|     10 |            3 |    14
|     20 |            5 |    14
|     30 |            6 |    14
+--------+--------------+
3 rows in set (0.00 sec)

-- Display the deptno, total number of emps in each dept with 
--total emps from the table 

SELECT deptno,COUNT(empno) deptwise_count,(SELECT COUNT(empno) FROM emp) AS Total_emp_count
FROM emp
GROUP BY deptno;

+--------+----------------+-----------------+
| deptno | deptwise_count | Total_emp_count |
+--------+----------------+-----------------+
|     10 |              3 |              14 |
|     20 |              5 |              14 |
|     30 |              6 |              14 |
+--------+----------------+-----------------+
3 rows in set (0.00 sec)


--____________________________________________________
-- Sub-query in FROM clause
--Display empno along with the category as per sal 
--(if sal > 2500, above avg, else avg).

SELECT empno,IF(sal > 2500,"Above Avg","Avg") AS category
FROM emp;

+-------+-----------+
| empno | category  |
+-------+-----------+
|  7369 | Avg       |
|  7499 | Avg       |
|  7521 | Avg       |
|  7566 | Above Avg |
|  7654 | Avg       |
|  7698 | Above Avg |
|  7782 | Avg       |
|  7788 | Above Avg |
|  7839 | Above Avg |
|  7844 | Avg       |
|  7876 | Avg       |
|  7900 | Avg       |
|  7902 | Above Avg |
|  7934 | Avg       |
+-------+-----------+
14 rows in set (0.01 sec)

-- Requirement

category    Count_of_category
------------------------------
Above_avg      5
Avg            9


-- Display the count of emps in each category

SELECT category, COUNT(empno) emp_count
FROM 
(SELECT empno,IF(sal > 2500,"Above Avg","Avg") AS category FROM emp) AS
emp_category
GROUP BY category;

/*
SELECT category,COUNT(empno)
FROM emp_category
GROUP BY category;
*/

/*
We can consider emp_category as a temp table having 2 columns,
empno and category.
*/


+-----------+-----------+
| category  | emp_count |
+-----------+-----------+
| Avg       |         9 |
| Above Avg |         5 |
+-----------+-----------+
2 rows in set (0.00 sec)



--***************************************************************
--____________________________________________________
-- Stored Procedures :
-- Create a simple stored procedure to display hello world
DELIMITER $$

CREATE PROCEDURE hello()
BEGIN
    SELECT "Hello Everyone" AS msg;
END;
$$

DELIMITER ;

CALL hello();


--____________________________________________________
-- Create a result table with 
-- id - INT, msg - VARCHAR(90)
CREATE TABLE result(id INT,msg VARCHAR(90));


--___________________________________________
--find emp name with max and min sal and store the names into
-- result table with their sal values.

PSM02.sql


--___________________________________________
-- Perform addition of even numbers in a given range 
--(passed as parameter)
-- display the result on the CLI.

PSM03.sql


--________________________________________________
-- Create a procedure to accept a number and print its table
-- using the repeat loop
-- insert the table into the result table.

PSM04.sql


--________________________________________________
-- parameters :
--IN : used to take only input inside the procedure.
-- by DEFAULT every parameter is IN parameter.

-- OUT : used to return the result from the procedure.
-- To define a parameter as "out", we use the "OUT" keyword
-- before that parameter.

-- INOUT : used to take the input into the procedure
-- and the same parameter variable is used to take the output
-- from the procedure
--____________________________________________________
-- Create a procedure to accept a number as parameter 
-- and return the square of that number 
-- from another parameter from the procedure. 
 PSM05.sql



-- create a procedure to accept a number and return the square
-- from the same parameter.

PSM06.sql


--***********************************************************
--____________________________________________________________
-- functions :
/*
Functions
 MySQL Function Types
 DETERMINISTIC
    If input is same, output will remain same ALWAYS.
    Internally MySQL cache input values and corresponding output.
    If same input is given again, directly output may return 
    to speedup the execution.
 NOT DETERMINISTIC
    Even if input is same, output may differ.
    Output also depend on current date-time or state of table 
    or database settings.
    These functions cannot be speedup.
*/

/*
By default any user cannot compile the functions. 
It requires SUPER privileges from the root.
1)  Exit from current user.
2) Login through ROOT user.
3) change the settings of the global variable as below
SET GLOBAL log_bin_trust_function_creators = 1;

4) SELECT  @@log_bin_trust_function_creators;
make sure it gives the value 1.

5) Login again through sunbeam user and compile the function.

*/



-- write a function to add two decimal values.
-- if any input is null, consider it as 0.
PSM07.sql



--________________________________________________________________
-- display empno,enaame,hire,exp in terms of months.

SELECT empno,ename,hire,TIMESTAMPDIFF(MONTH,hire,NOW()) AS exp_in_months
FROM emp;


-- Write a function to display the experience of emps
-- in months.
PSM08.sql


--______________________________________________
--************************************************************
--______________________________________________
-- triggers

-- create an accounts table 
--id-int, acc_type-char(20), balance -decimal(9,2)
-- insert few rows.
/*
CREATE TABLE accounts(id INT,
acc_type CHAR(20),
balance DECIMAL(9,2)
);

INSERT INTO accounts VALUES(1,'savings',10000);
INSERT INTO accounts VALUES(2,'savings',5000);
INSERT INTO accounts VALUES(3,'Current',7000);
INSERT INTO accounts VALUES(4,'savings',9000);
*/


/*
 Create a transactions table
 acc_id  INT,
  tran_type  char(20), 
 time  datetime, 
 amount  decimal(9,2)

CREATE TABLE transactions(acc_id INT,tran_type CHAR(20),tran_time datetime, 
amount DECIMAL(9,2));
*/
-- When the insert transaction is done in transactions table, 
--automatically accounts table balance must be modified.

-- INSERT INTO TRANSACTIONS VALUES(1,'WITHDRAW',NOW(),2000);
-- INSERT INTO TRANSACTIONS VALUES(3,'DEPOSIT',NOW(),5000);


/*
When we perform the update operation,
we can access the old and new values of the updated row 
with the NEW and OLD keywords inside the trigger.

When we perform the delete operation,
We can access only old value of the deleted row
with the OLD keyword inside the trigger.

When we perform the insert operation,
We can access only the new values of the inserted row
with the NEW keyword inside the trigger.
*/

-- Check the data from accounts table.

-- Insert the row into transactions table to withdraw some amount.

-- Check the data from accounts again.


-- Insert the row into transactions table to deposit some amount.

-- Check the data from accounts again.

--____________________________________________________________
-- Lab Assignment :
-- Create a trigger for update on emp table.
-- When the sal of emp is updated, 
--insert the old and new sal into result table
-- id--> empno 
-- msg --> old_sal updated to new_sal(1500 updated to 1900)
 
/*

CREATE TRIGGER name
AFTER UPDATE ON emp
FOR EACH ROW
BEGIN

END;



 The trigger is fired for the update on any column in the emp table.
 but the insert in the result table should be done only if the sal is updated.
 for that, inside the trigger check if old sal and new sal
 are not same then only insert into result table.
*/

--_______________________________________________________
--*************************************************************************
--                  Exception Handling
-- Exception : Runtime problems/errors.


/*
* Exception Handling -- Take action upon error.
* When error occurs, handler will be executed (if implemented).

Handler syntax
    DECLARE action HANDLER FOR condition handler_implementation;

    -- action = EXIT or CONTINUE
    -- condition = Error code or Error alias
        -- https://dev.mysql.com/doc/mysql-errors/8.0/en/server-error-reference.html
    -- handler_implementation = Single liner or BEGIN ... END



* Exception handler types/actions to be taken :
    - EXIT handler: after execution of handler, the program stops. Next line not executed.
    - CONTINUE handler: after execution of handler, the next line after the error is executed.

* condition :
    - Error_code :(4 digit number)
    - Error_status :(may be alpha numeric)
    - Error_alias : (readable name - userdefined)

* Handler_implementation :
    Two ways to implement exception handler
    - Single Liner
    - Multi Liner PSM block --> BEGIN ... END


Types of errors :
- 1062 : Duplicate value entered : (primary key violeted)
- 1146 : Table does not exists.
- 1054 : column does not exists
- 1044 : Access denied
- 1452 : Foreign key violation : 


*/
--_____________________________________________________________
/* Example 1: EXIT handler
 Insert a dept into dept table. Get deptno,name and loc as parameter in the procedure.
 If deptno is duplicate, stop the execution and give proper msg.
 */  


PSM10.sql




--_______________________________________________________________