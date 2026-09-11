/* Example 1: Read deptno and dname from dept and insert deptno, 
dname in lower case into results table -- using cursor.
*/

DROP PROCEDURE IF EXISTS dept_cursor;

DELIMITER $$

CREATE PROCEDURE dept_cursor()
BEGIN
    DECLARE v_flag INT DEFAULT 0;
    DECLARE v_deptno INT;
    DECLARE v_name VARCHAR(20);
    -- 1. DECLARE a cursor
    DECLARE v_cur CURSOR FOR SELECT deptno,dname FROM dept;

    -- 2. declare the NOT FOUND handler
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_flag = 1;

    -- 3. Open the cursor
    OPEN v_cur;
    cur_label : LOOP
    -- 4. Fetch the rows one by one
    FETCH v_cur INTO v_deptno,v_name;
        IF v_flag = 1 THEN
            LEAVE cur_label;
        END IF;
    -- 5. Process that row.
    INSERT INTO result VALUES(v_deptno,LOWER(v_name));
   END LOOP;

   -- 6. close the cursor
   CLOSE v_cur;
   SELECT "Data entered into the table." AS msg;
END;
$$
DELIMITER ;

-- SOURCE E:/August_2026/PG/AC_DBT/Day09/PSM05.sql
-- TRUNCATE TABLE result;
-- CALL dept_cursor();