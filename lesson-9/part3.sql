-- task 1
DROP PROCEDURE IF EXISTS hello;
delimiter //
CREATE PROCEDURE hello()
BEGIN
	IF(CURTIME() BETWEEN '06:00:00' AND '12:00:00') THEN
		SELECT 'Good morning';
	ELSEIF(CURTIME() BETWEEN '12:00:00' AND '18:00:00') THEN
		SELECT 'Good afternoon';
	ELSEIF(CURTIME() BETWEEN '18:00:00' AND '00:00:00') THEN
		SELECT 'Good evening';
	ELSE
		SELECT 'Good night';
	END IF;
END //
delimiter ;

CALL hello();

-- task 2
DROP TRIGGER IF EXISTS nullTrigger;
delimiter //
CREATE TRIGGER nullTrigger BEFORE INSERT ON products
FOR EACH ROW
BEGIN
	IF(ISNULL(NEW.name) AND ISNULL(NEW.description)) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'NULL in both fields';
	END IF;
END //
delimiter ;