-- write a function to add two decimal values.
-- if any input is null, consider it as 0.

DROP FUNCTION IF EXISTS add_num;

DELIMITER $$

CREATE FUNCTION add_num(v_num1 DECIMAL(9,2),v_num2 DECIMAL(9,2))
RETURNS DECIMAL(9,2)
DETERMINISTIC
BEGIN
    DECLARE v_res DECIMAL(9,2) DEFAULT 0;
    SET v_res = IFNULL(v_num1,0.0) + IFNULL(v_num2,0.0);
    RETURN v_res;
END;
$$

DELIMITER ;

--  SOURCE E:/August_2026/PG/AC_DBT/Day08/PSM07.sql

-- SELECT add_num(123.45,456.78) as result;
-- SELECT add_num(123.45,NULL) as result;

-- SELECT empno,ename,sal,comm,add_num(sal,comm) As total_sal
-- FROM emp;


--  SOURCE E:/August_2026/PG/AC_DBT/Day08/PSM07.sql

/*
int addition(int num1,int num2)
{
    int res = num1 + num2;
    return res;
}


*/