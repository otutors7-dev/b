-- Generic Handler 

DROP PROCEDURE IF EXISTS gen_handler;

DELIMITER $$


CREATE PROCEDURE gen_handler(v_id INT,v_name VARCHAR(20))
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION SELECT "Something Went Wrong." AS msg;

    INSERT INTO dept(deptno,dname) VALUES(v_id,v_name);

    SELECT "Row Added Successfully." AS msg;


END;

$$
DELIMITER ;

-- SOURCE E:/August_2026/PG/AC_DBT/Day09/PSM03.sql
-- CALL gen_handler(30,"sales");