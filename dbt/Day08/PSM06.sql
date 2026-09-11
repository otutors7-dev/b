-- create a procedure to accept a number and return the square
-- from the same parameter.

DROP PROCEDURE IF EXISTS new_sqr;

DELIMITER $$


CREATE PROCEDURE new_sqr(INOUT v_res INT)
BEGIN
      SET v_res = v_res * v_res;    
END;
$$

DELIMITER ;

-- SOURCE E:/August_2026/PG/AC_DBT/Day08/PSM06.sql

-- SET @num = 10;

-- CALL new_sqr(@num);

-- SELECT @num;