/* Example 3 : Change the above procedure with Error alias and multi line implimentation.
*/

-- DECLARE EXIT HANDLER FOR 1062 SELECT "duplicate Entry" As msg;

DROP PROCEDURE IF EXISTS dept_no_entry;

DELIMITER $$

CREATE PROCEDURE dept_no_entry(v_id INT,v_name VARCHAR(20),v_loc CHAR(20))
BEGIN
    DECLARE duplicate_entry CONDITION FOR 1062;
    DECLARE EXIT HANDLER FOR duplicate_entry 
    BEGIN
        SELECT "Duplicate Entry" AS msg;
        -- INSERT INTO error_log VALUES(error_code,error_msg);
    END;

    INSERT INTO dept VALUES(v_id,v_name,v_loc);
    SELECT "Row added Successfully." AS msg;


END;


$$
DELIMITER ;

-- SOURCE E:/August_2026/PG/AC_DBT/Day09/PSM02.sql

-- CALL dept_no_entry(70,"sales","Mumbai");