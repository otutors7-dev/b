/*
 Perform addition of even numbers in a given range 
 (passed as parameter)
 display the result on the CLI.
 */

DROP PROCEDURE IF EXISTS sum_even;

DELIMITER $$
 CREATE PROCEDURE sum_even(v_low INT,v_high INT)
 BEGIN
    DECLARE v_i INT DEFAULT v_low; -- Loop variable initialization
    DECLARE v_sum INT DEFAULT 0;

    WHILE v_i <= v_high DO  -- condition check
        IF v_i % 2 = 0 THEN  -- loop body
          SET v_sum = v_sum + v_i;
        END IF;
        SET v_i = v_i + 1;  -- loop variable modification
    END WHILE;

    SELECT v_sum AS result;
 END;
 $$

 DELIMITER ;

 -- SOURCE E:/August_2026/PG/AC_DBT/Day08/PSM03.sql

 -- CALL sum_even(1,10);
 -- CALL sum_even(20,45);