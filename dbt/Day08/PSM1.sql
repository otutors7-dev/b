-- Create a simple stored procedure to display hello world

DROP PROCEDURE IF EXISTS hello;
DELIMITER $$

CREATE PROCEDURE hello()
BEGIN
    SELECT "Hello Everyone" AS msg;
    SELECT "Good Morning !" As msg;
END;
$$

DELIMITER ;

-- SOURCE E:/August_2026/PG/AC_DBT/Day08/PSM01.sql
-- CALL hello();
