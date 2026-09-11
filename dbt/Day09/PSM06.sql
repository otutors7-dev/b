

-- CREATE TABLE t1(col1 CHAR(1));
-- CREATE TABLE t2(col1 CHAR(1));
/*
INSERT INTO t1 VALUES('A');
INSERT INTO t1 VALUES('B');
INSERT INTO t1 VALUES('C');
INSERT INTO t1 VALUES('D');

INSERT INTO t2 VALUES('B');
INSERT INTO t2 VALUES('Z');
INSERT INTO t2 VALUES('A');
INSERT INTO t2 VALUES('C');
*/

 -- SELECT * FROM t1; -- A, B, C, D
-- SELECT * FROM t2; -- B, C, X, Y

DROP PROCEDURE IF EXISTS sp_cursor;   
    DELIMITER $$

    CREATE PROCEDURE sp_cursor()
    BEGIN
        DECLARE v_err INT DEFAULT 0;
        DECLARE v1 CHAR(1);
        DECLARE v2 CHAR(1);
        DECLARE v_cur1 CURSOR FOR SELECT col1 FROM t1; -- cur1 for t1
        DECLARE v_cur2 CURSOR FOR SELECT col1 FROM t2; -- cur2 for t2
        DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_err = 1;
        -- open cur1 and cur2
        OPEN v_cur1;
        OPEN v_cur2;
        findmax: LOOP
            -- get values into variables cur1 -> v1, cur2 -> v2
            FETCH v_cur1 INTO v1;
            IF v_err = 1 THEN
                LEAVE findmax;
            END IF;
            FETCH v_cur2 INTO v2;
            -- compare v1, v2 and write max into the results table
            IF v1 > v2 THEN
                INSERT INTO result VALUES (ASCII(v1), CONCAT('t1 Max - ', v1));
            ELSE
                INSERT INTO result VALUES (ASCII(v2), CONCAT('t2 Max - ', v2));
            END IF;
        END LOOP; -- repeat for all the rows
        -- close cur1 and cur2
        CLOSE v_cur2;
        CLOSE v_cur1;
    END;
    $$

    DELIMITER ;
    -- SOURCE E:/August_2026/PG/AC_DBT/Day09/PSM06.sql
   --  TRUNCATE result;

    -- CALL sp_cursor();

   -- SELECT * FROM result;