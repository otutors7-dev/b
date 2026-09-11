-- Write a function to display the experience of emps
-- in months.

DROP FUNCTION IF EXISTS exp_months;

DELIMITER $$

CREATE FUNCTION exp_months(hire_dt DATE)
RETURNS INT
NOT DETERMINISTIC
BEGIN
    DECLARE res INT DEFAULT 0;
    SET res = TIMESTAMPDIFF(MONTH,hire_dt,NOW());
    RETURN res;
END;
$$

DELIMITER ;

-- SOURCE E:/August_2026/PG/AC_DBT/Day08/PSM08.sql
-- SELECT exp_months('2020-03-15');
-- SELECT empno,ename,hire,exp_months(hire) AS exp_in_months FROM emp;


