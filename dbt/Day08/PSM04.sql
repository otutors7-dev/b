-- Create a procedure to accept a number and print its table
-- using the repeat loop
-- insert the table into the result table.

DROP PROCEDURE IF EXISTS num_table;

DELIMITER $$


CREATE PROCEDURE num_table(v_num INT)
BEGIN
    DECLARE v_i INT DEFAULT 1;

    REPEAT 
        INSERT INTO result VALUES(v_num,CONCAT(v_num,' * ',v_i,' = ',v_num*v_i));
        SET v_i = v_i + 1;
        UNTIL v_i > 10
    END REPEAT;
END;
$$

DELIMITER ;

-- SOURCE E:/August_2026/PG/AC_DBT/Day08/PSM04.sql
-- TRUNCATE result;
-- CALL num_table(5);

-- SELECT * FROM result;

-- TRUNCATE result;
-- CALL num_table(15);

-- SELECT * FROM result;
