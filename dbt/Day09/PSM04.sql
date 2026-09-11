/*
 Example : Write a procedure to accept age as a parameter and check if age is less than 15 then throw an error else show a msg.
*/


DROP PROCEDURE IF EXISTS chk_age;

DELIMITER $$

CREATE PROCEDURE chk_age(age INT)
BEGIN
    IF age < 15 THEN
         SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Age should be above 15 yrs.';
    ELSE 
        SELECT "Valid Age" AS msg;
    END IF;

END;
$$
DELIMITER ;

-- SOURCE E:/August_2026/PG/AC_DBT/Day09/PSM04.sql
-- CALL chk_age(20);
-- CALL chk_age(13);

