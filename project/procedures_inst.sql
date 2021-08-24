USE instagram;

-- Процедура предложения подписки на новых пользователей или на друзей друзей
drop procedure if exists follow_offers;

delimiter //
create procedure follow_offers(in for_user_id INT)
  begin
	select u2.id
	from users u1
	join users u2 
	    on (YEAR(u2.signed_up_at) > 2015)
	where u1.id = for_user_id 
	    and u2.id <> for_user_id 
	
		
		union 


	select fr3.target_user_id	
	from follow_requests fr1
		join follow_requests fr2 
		    on (fr1.target_user_id = fr2.initiator_user_id 
		        or fr1.initiator_user_id = fr2.target_user_id)
		join follow_requests fr3 
		    on (fr3.target_user_id = fr2.initiator_user_id 
		        or fr3.initiator_user_id = fr2.target_user_id)
	where (fr1.initiator_user_id = for_user_id or fr1.target_user_id = for_user_id)
	 	and fr2.status = 'approved'
	 	and fr3.status = 'approved'
		and fr3.target_user_id <> for_user_id
	
	order by rand()
	limit 5;
  END//
DELIMITER ;

CALL follow_offers(101);

-- Процедура добавления нового пользователя
DROP PROCEDURE IF EXISTS sp_add_user;
DELIMITER //
CREATE PROCEDURE sp_add_user(username VARCHAR(50),
							 email VARCHAR(100),
							 phone_number BIGINT,
							 password_hash VARCHAR(100),
							 OUT u_in_status VARCHAR(200))
BEGIN
	DECLARE _rollback BOOL DEFAULT 0;
	DECLARE code VARCHAR(100);
	DECLARE error_string VARCHAR(100);
	DECLARE last_user_id INT;

	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
		BEGIN
			SET _rollback = 1;
			GET STACKED DIAGNOSTICS CONDITION 1
				code = RETURNED_SQLSTATE, error_string = MESSAGE_TEXT;
			SET u_in_status := concat('Aborted. Error code: ', code, '. Text: ', error_string);
		END;

	START TRANSACTION;
	INSERT INTO users
		(username, email, phone_number, password_hash)
	VALUES
		(username, email, phone_number, password_hash);

	SELECT last_insert_id() INTO @last_user_id;

	INSERT INTO profiles
		(user_id)
	VALUES
		(@last_user_id);

	IF _rollback THEN
		ROLLBACK;
	ELSE
		SET u_in_status := 'OK';
		COMMIT;
	END IF;

END //
DELIMITER ;

CALL sp_add_user('alexey',
				 'alexey@gmail.com',
				 '48484841',
				 'asd48qwe484edqw',
				 @u_in_status);
SELECT @u_in_status;

-- Триггер для проверки даты регистрации пользователя 
DELIMITER //

CREATE TRIGGER check_user_signed_up BEFORE UPDATE ON users
FOR EACH ROW
begin
    IF NEW.YEAR(signed_up_at) <= 2005 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Update Canceled. Signed up must be after 2005!';
    END IF;
END//

DELIMITER ;