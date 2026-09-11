DROP TRIGGER IF EXISTS tr1;
-- INSERT INTO TRANSACTIONS VALUES(1,'deposit',NOW(),2000);
DELIMITER $$

CREATE TRIGGER tr1
AFTER INSERT ON TRANSACTIONS
FOR EACH ROW 
BEGIN
    DECLARE v_id INT DEFAULT NEW.acc_id;
    DECLARE v_type CHAR(20) DEFAULT NEW.tran_type;
    DECLARE v_amt DECIMAL(9,2) DEFAULT NEW.amount;

    IF v_type = 'DEPOSIT' THEN
        UPDATE accounts SET balance = balance + v_amt
        WHERE id = v_id;
    ELSE 
        UPDATE accounts SET balance = balance - v_amt
        WHERE id = v_id;
    END IF;
END;
$$
DELIMITER ;

-- SELECT * FROM accounts;
-- SOURCE E:/August_2026/PG/AC_DBT/Day08/PSM09.sql
-- INSERT INTO transactions VALUES(1,'DEPOSIT',NOW(),2000);
-- INSERT INTO transactions VALUES(3,'WITHDRAW',NOW(),1000);