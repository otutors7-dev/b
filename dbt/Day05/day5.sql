-- Agenda :
-- Table Relations 
-- JOINS
-- joining 2 or more tables.
-- joins with group by , order by
-- Constraints 
--_________________________________________________
-- check all the tables 

-- emps
SELECT * FROM emps;

--depts
SELECT * FROM depts;

-- addr
SELECT * FROM addr;

-- emp_meeting
SELECT * FROM emp_meeting;

-- meeting
SELECT * FROM meeting;

--_____________________________________
-- CROSS JOIN
-- Display all the possible combinations 
--from the emps and depts tables
SELECT ename,dname 
FROM emps CROSS JOIN depts;

SELECT ename,dname,deptno
FROM emps CROSS JOIN depts;
ERROR 1052 (23000): Column 'deptno' in field list is ambiguous


SELECT ename,dname,emps.deptno
FROM emps CROSS JOIN depts;


-- Give an alias to the table name to make the query shorter
-- e is an alias to emps and d is an alias to depts
SELECT e.ename,d.dname,e.deptno
FROM emps e CROSS JOIN depts d;

/*
e and d are the alias given to the table names.
Giving alias with all the columns in the SELECT makes the query more readable.
*/

--__________________________________________________
-- INNER JOIN
-- Display the empno,ename,deptno, deptname for each emp 
-- matching with depts table.

SELECT empno,ename,emps.deptno,dname
FROM emps INNER JOIN depts
ON emps.deptno = depts.deptno;


SELECT e.empno,e.ename,d.deptno,d.dname
FROM emps e INNER JOIN depts d
ON e.deptno = d.deptno;


SELECT e.empno,e.ename,e.deptno,d.dname
FROM emps e INNER JOIN depts d
ON e.deptno = d.deptno;



+-------+--------+--------+-------+
| empno | ename  | deptno | dname |
+-------+--------+--------+-------+
|     1 | Amit   |     10 | DEV   |
|     2 | Rahul  |     10 | DEV   |
|     3 | Nilesh |     20 | QA    |
+-------+--------+--------+-------+
3 rows in set (0.00 sec)

--NON standard Syntax

SELECT empno,ename,emps.deptno,dname
FROM emps INNER JOIN depts
WHERE emps.deptno = depts.deptno;




/*
WHERE clause should be used to filter the rows of the table.
ON clause should be used to give the condition based on joining the tables.
*/


--___________________________________________
-- LEFT OUTER JOIN
-- Display the  ename, dept name for all emps 
-- irrespective of their match in depts.
    
SELECT e.empno,e.ename,e.deptno,d.dname
FROM emps e LEFT OUTER JOIN depts d
ON e.deptno = d.deptno;


SELECT e.empno,e.ename,d.deptno,d.dname
FROM emps e LEFT OUTER JOIN depts d
ON e.deptno = d.deptno;

    
-- OUTER keyword is optional

SELECT e.empno,e.ename,d.deptno,d.dname
FROM emps e LEFT JOIN depts d
ON e.deptno = d.deptno;



--Matching data from both the tables as well as non-matching data From the left table.


--___________________________________________________
-- RIGHT OUTER JOIN
-- Display all the empname and dept name for all the depts
-- irrespective of their match in emp table.
--Matching data from both the tables as well as non-matching data From the Right table.

  SELECT e.empno,e.ename,d.deptno,d.dname
FROM emps e RIGHT OUTER JOIN depts d
ON e.deptno = d.deptno;
  
    

-- As depts table is put to the left side the same output as above can be achieved
-- using LEFT JOIN as well.

SELECT e.empno,e.ename,d.deptno,d.dname
FROM depts d LEFT OUTER JOIN emps e
ON e.deptno = d.deptno;

-- ___________________________________________________


-- FULL JOIN


/*
The above query gives error as mysql does not support FULL JOIN.
To achieve the output of FULL JOIN we can use the SET operators like UNION.
*/
-- UNION ALL (includes duplicates)
(SELECT e.empno,e.ename,e.deptno,d.dname
FROM emps e LEFT OUTER JOIN depts d
ON e.deptno = d.deptno)
UNION ALL
(SELECT e.empno,e.ename,e.deptno,d.dname
FROM emps e RIGHT OUTER JOIN depts d
ON e.deptno = d.deptno);

-------+--------+--------+-------+
| empno | ename  | deptno | dname |
+-------+--------+--------+-------+
|     1 | Amit   |     10 | DEV   |
|     2 | Rahul  |     10 | DEV   |
|     3 | Nilesh |     20 | QA    |
|     4 | Nitin  |     50 | NULL  |
|     5 | Sarang |     50 | NULL  |
|     2 | Rahul  |     10 | DEV   |
|     1 | Amit   |     10 | DEV   |
|     3 | Nilesh |     20 | QA    |
|  NULL | NULL   |   NULL | OPS   |
|  NULL | NULL   |   NULL | ACC   |
+-------+--------+--------+-------+




-- UNION (removes duplicates)

(SELECT e.empno,e.ename,e.deptno,d.dname
FROM emps e LEFT OUTER JOIN depts d
ON e.deptno = d.deptno)
UNION
(SELECT e.empno,e.ename,e.deptno,d.dname
FROM emps e RIGHT OUTER JOIN depts d
ON e.deptno = d.deptno);

+-------+--------+--------+-------+
| empno | ename  | deptno | dname |
+-------+--------+--------+-------+
|     1 | Amit   |     10 | DEV   |
|     2 | Rahul  |     10 | DEV   |
|     3 | Nilesh |     20 | QA    |
|     4 | Nitin  |     50 | NULL  |
|     5 | Sarang |     50 | NULL  |
|  NULL | NULL   |   NULL | OPS   |
|  NULL | NULL   |   NULL | ACC   |
+-------+--------+--------+-------+
7 rows in set (0.00 sec)

--____________________________________
-- SELF JOIN
-- Display the names of all the employees with the names of all their managers.
SELECT   E.ename emp_name , M.ename mgr_name
FROM emps E INNER JOIN emps M
ON E.mgr = M.empno;

+----------+----------+
| emp_name | mgr_name |
+----------+----------+
| Rahul    | Nilesh   |
| Nilesh   | Nitin    |
| Amit     | Nitin    |
| Nitin    | Sarang   |
+----------+----------+
4 rows in set (0.00 sec)


-- To view all the emps irrespective of not having manager :
SELECT   E.ename emp_name , M.ename mgr_name
FROM emps E LEFT OUTER JOIN emps M
ON E.mgr = M.empno;

+----------+----------+
| emp_name | mgr_name |
+----------+----------+
| Amit     | Nitin    |
| Rahul    | Nilesh   |
| Nilesh   | Nitin    |
| Nitin    | Sarang   |
| Sarang   | NULL     |
+----------+----------+

--_______________________________________
-- understanding equi join and non-equi join.

-- equi join : When we give equality condition for the join
-- ON e.deptno = d.deptno :
-- ON e.mgr = m.empno

-- non - equi join : < , > , != conditon for the joins

-- ______________________________________
-- USING clause

SELECT e.empno,e.ename,e.deptno,d.dname
FROM emps e INNER JOIN depts d 
ON e.deptno = d.deptno;


SELECT e.empno,e.ename,e.deptno,d.dname
FROM emps e INNER JOIN depts d 
USING(deptno);
-- internally it does : ON e.deptno = d.deptno

/*
USING clause is another syntax we can use as an option for the ON clause.
But it can be used only when the condition is based on equality
and if the column name in both the tables to be joined is SAME.

*/

-- ________________________________________
-- NON-standard way of join syntax for inner join:
SELECT e.empno,e.ename,e.deptno,d.dname
FROM emps e INNER JOIN depts d 
ON e.deptno = d.deptno;

-- Works but Not recommended. Non Standard syntax
SELECT e.empno,e.ename,e.deptno,d.dname
FROM emps e, depts d 
WHERE e.deptno = d.deptno;




--_________________________________________
-- joining 3 tables
-- Display empname, deptname and dist of all the employees

-- emps, depts, addr

SELECT e.ename, d.dname, a.dist
FROM emps e INNER JOIN depts d
ON e.deptno = d.deptno
INNER JOIN addr a
ON e.empno = a.empno;
+--------+-------+----------+
| ename  | dname | dist     |
+--------+-------+----------+
| Amit   | DEV   | Kolhapur |
| Rahul  | DEV   | Satara   |
| Nilesh | QA    | Pune     |
+--------+-------+----------+
3 rows in set (0.00 sec)

SELECT e.ename, d.dname, a.dist
FROM emps e LEFT OUTER JOIN depts d
ON e.deptno = d.deptno
INNER JOIN addr a
ON e.empno = a.empno;

--------+-------+----------+
| ename  | dname | dist     |
+--------+-------+----------+
| Amit   | DEV   | Kolhapur |
| Rahul  | DEV   | Satara   |
| Nilesh | QA    | Pune     |
| Nitin  | NULL  | Satara   |
| Sarang | NULL  | Satara   |
+--------+-------+----------+
5 rows in set (0.00 sec)

--________________________________________
-- Display the emp name and the meeting topic for all the emps.
SELECT E.ename, M.topic
FROM emp_meeting EM INNER JOIN emps E
ON EM.empno =  E.empno
INNER JOIN meeting M
ON EM.meetno = M.meetno;

+--------+-------------+
| ename  | topic       |
+--------+-------------+
| Amit   | App Design  |
| Amit   | Annual meet |
| Rahul  | App Design  |
| Rahul  | Annual meet |
| Nilesh | Annual meet |
| Nilesh | Scheduling  |
| Nitin  | App Design  |
| Nitin  | Annual meet |
| Nitin  | Scheduling  |
| Sarang | Annual meet |
+--------+-------------+
10 rows in set (0.00 sec)


-- _____________________________________
-- Display the emp name, meeting topic and their dist for all emps.
-- emps, meeting, emp_meeting, addr
SELECT e.ename,m.topic,a.dist
FROM emp_meeting em INNER JOIN emps e
ON e.empno = em.empno
INNER JOIN meeting m 
ON em.meetno = m.meetno
INNER JOIN addr a 
ON e.empno = a.empno;

+--------+-------------+----------+
| ename  | topic       | dist     |
+--------+-------------+----------+
| Amit   | Annual meet | Kolhapur |
| Amit   | App Design  | Kolhapur |
| Rahul  | Annual meet | Satara   |
| Rahul  | App Design  | Satara   |
| Nilesh | Scheduling  | Pune     |
| Nilesh | Annual meet | Pune     |
| Nitin  | Scheduling  | Satara   |
| Nitin  | Annual meet | Satara   |
| Nitin  | App Design  | Satara   |
| Sarang | Annual meet | Satara   |
+--------+-------------+----------+
10 rows in set (0.00 sec)

--____________________________________________
-- Display the emp name, meeting topic, dist and their dept name.
-- emps, meeting,emp_meeting,addr,depts

SELECT e.ename,m.topic,a.dist,d.dname
FROM emp_meeting em INNER JOIN emps e
ON e.empno = em.empno
INNER JOIN meeting m 
ON em.meetno = m.meetno
INNER JOIN addr a 
ON e.empno = a.empno
INNER JOIN depts d
ON e.deptno = d.deptno;


+--------+-------------+----------+-------+
| ename  | topic       | dist     | dname |
+--------+-------------+----------+-------+
| Amit   | App Design  | Kolhapur | DEV   |
| Amit   | Annual meet | Kolhapur | DEV   |
| Rahul  | App Design  | Satara   | DEV   |
| Rahul  | Annual meet | Satara   | DEV   |
| Nilesh | Annual meet | Pune     | QA    |
| Nilesh | Scheduling  | Pune     | QA    |
+--------+-------------+----------+-------+
6 rows in set (0.00 sec)


--__________________________________________
-- Display the dept name and number of emps working in that dept
SELECT dname FROM depts;

+-------+
| dname |
+-------+
| DEV   |
| QA    |
| OPS   |
| ACC   |
+-------+
4 rows in set (0.00 sec)

SELECT deptno,COUNT(empno)
FROM emps
GROUP BY deptno;

+--------+--------------+
| deptno | COUNT(empno) |
+--------+--------------+
|     10 |            2 |
|     20 |            1 |
|     50 |            2 |
+--------+--------------+
3 rows in set (0.01 sec)


SELECT d.dname,COUNT(e.empno)
FROM emps e INNER JOIN depts d 
ON e.deptno = d.deptno
GROUP BY d.dname;

+-------+----------------+
| dname | COUNT(e.empno) |
+-------+----------------+
| DEV   |              2 |
| QA    |              1 |
+-------+----------------+

SELECT d.dname,COUNT(e.empno)
FROM emps e RIGHT OUTER JOIN depts d 
ON e.deptno = d.deptno
GROUP BY d.dname;

+-------+----------------+
| dname | COUNT(e.empno) |
+-------+----------------+
| DEV   |              2 |
| QA    |              1 |
| OPS   |              0 |
| ACC   |              0 |
+-------+----------------+
4 rows in set (0.00 sec)

--_______________________________________
-- Display the dept name and count of emps in desc order of count

SELECT d.dname,COUNT(e.empno) as emp_count
FROM emps e RIGHT OUTER JOIN depts d 
ON e.deptno = d.deptno
GROUP BY d.dname
ORDER BY emp_count DESC;


-- _____________________________________
-- Display the dept with highest count of emps 
SELECT d.dname,COUNT(e.empno) as emp_count
FROM emps e RIGHT OUTER JOIN depts d 
ON e.deptno = d.deptno
GROUP BY d.dname
ORDER BY emp_count DESC
LIMIT 1;

+-------+-----------+
| dname | emp_count |
+-------+-----------+
| DEV   |         2 |
+-------+-----------+
1 row in set (0.00 sec)

-- ________________________________________
-- Display dept name and clerk count having highest number of clerks
-- Use emp and dept tables

SELECT deptno,job,COUNT(job)
FROM emp
WHERE job = 'clerk'
GROUP BY deptno,job;

+--------+-------+------------+
| deptno | job   | COUNT(job) |
+--------+-------+------------+
|     20 | CLERK |          2 |
|     30 | CLERK |          1 |
|     10 | CLERK |          1 |
+--------+-------+------------+
3 rows in set (0.01 sec)


SELECT d.dname, COUNT(e.job)
FROM emp e INNER JOIN dept d 
ON e.deptno = d.deptno
WHERE job = 'clerk'
GROUP BY d.dname
ORDER BY COUNT(e.job) DESC
LIMIT 1;


+----------+--------------+
| dname    | COUNT(e.job) |
+----------+--------------+
| RESEARCH |            2 |
+----------+--------------+
1 row in set (0.00 sec)



--_________________________________
-- Display the emp name and their meeting count in desc order
-- use emps and emp_meeting
-- emps, meetin,emp_meeting

SELECT e.ename, COUNT(m.meetno)
FROM emps e INNER JOIN emp_meeting m 
ON e.empno = m.empno
GROUP BY e.ename
ORDER BY COUNT(m.meetno) DESC;

+--------+-----------------+
| ename  | COUNT(m.meetno) |
+--------+-----------------+
| Nitin  |               3 |
| Nilesh |               2 |
| Amit   |               2 |
| Rahul  |               2 |
| Sarang |               1 |
+--------+-----------------+
5 rows in set (0.00 sec)


/* Final Sequence :
SELECT col1,col2..
FROM table 1 JOIN tb2
ON join_condition
WHERE condition for row
GROUP BY col
HAVING condition for group
ORDER BY col ASC/DESC
LIMIT m,n;

*/  

