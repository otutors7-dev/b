/*
    Example 2: CONTINUE handler
   Write a procedure to add a dept into dept table.
   if error occurs use continue handler to show appropriate msg. */

   DROP PROCEDURE IF EXISTS dept_entry;

   DELIMITER $$

   CREATE PROCEDURE dept_entry(v_id INT,v_name VARCHAR(20),v_loc CHAR(30))
   BEGIN
        
        DECLARE duplicate_entry CONDITION FOR 1062;
        DECLARE v_flag INT DEFAULT 0;
        DECLARE CONTINUE HANDLER FOR duplicate_entry SET v_flag = 1;
      
        
        INSERT INTO dept VALUES(v_id,v_name,v_loc);

        IF v_flag = 0 THEN 
            SELECT "Row added successfully." AS msg;
        ELSE 
            SELECT "Duplicate Entry for deptno." AS msg;
        END IF;
             
   END;
   $$

   DELIMITER ; 

   -- SOURCE E:/August_2026/PG/AC_DBT/Day09/PSM01.sql

