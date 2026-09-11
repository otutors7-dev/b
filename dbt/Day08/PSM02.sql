-- find emp name with max and min sal and store the names into
-- result table with their sal values.

DROP PROCEDURE IF EXISTS emp_sal;

DELIMITER $$

CREATE PROCEDURE emp_sal()
BEGIN
    DECLARE emp_name VARCHAR(20);
    DECLARE emp_sal DECIMAL(9,2);

    SELECT ename,sal INTO emp_name,emp_sal FROM emp
    ORDER BY sal DESC LIMIT 1;
    INSERT INTO result VALUES(1, CONCAT(emp_name,' - ',emp_sal));

    SELECT ename,sal INTO emp_name,emp_sal FROM emp
    ORDER BY sal ASC LIMIT 1;
    INSERT INTO result VALUES(2,CONCAT(emp_name,' - ',emp_sal));
END;
$$

DELIMITER ;


-- SOURCE E:/August_2026/PG/AC_DBT/Day08/PSM02.sql
-- CALL emp_sal();
-- SELECT * FROM result;
