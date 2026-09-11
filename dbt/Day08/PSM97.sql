DROP PROCEDURE IF EXISTS degree;
DELIMITER $$
CREATE PROCEDURE DEGREE(n DECIMAL(10,2), d char(1))
BEGIN
	DECLARE C DECIMAL(10,2);
	DECLARE F DECIMAL(10,2);
	IF d = 'c' THEN 
        SET f = (9/5*n) +32;
		SELECT f;
	elSEIF d = 'f' THEN
		SET c = (n-32) * 5/9;
		SELECT c;
    else
        SELECT 'Invalid input';
	END IF;
end;
$$
DELIMITER ;