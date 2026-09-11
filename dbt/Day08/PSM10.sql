/* Example 1: EXIT handler
 Insert a dept into dept table. Get deptno,name and loc as parameter in the procedure.
 If deptno is duplicate, stop the execution and give proper msg.
 */

 DROP PROCEDURE IF EXISTS emp_dept;

 DELIMITER $$

 CREATE PROCEDURE emp_dept(v_deptno INT,v_dname VARCHAR(20),v_loc VARCHAR(20))
 BEGIN
    DECLARE EXIT HANDLER FOR 1062 SELECT "Duplicate deptno" AS msg;

    INSERT INTO dept VALUES(v_deptno,v_dname,v_loc);
    SELECT "Dept Inserted successfully." AS msg;
 END;
$$

DELIMITER ;

-- SOURCE E:/August_2026/PG/AC_DBT/Day08/PSM10.sql
-- CALL emp_dept(40,'Training','Mumbai');
-- SELECT * FROM dept;
-- CALL emp_dept(10,'HR','Mumbai');
