-- task 1
DROP USER IF EXISTS 'shop_user'@'localhost';
CREATE USER 'shop_user'@'localhost' IDENTIFIED WITH sha256_password BY '123456';
GRANT SELECT ON shop.* TO 'shop_user'@'localhost';

DROP USER IF EXISTS 'shop_superuser'@'localhost';
CREATE USER 'shop_superuser'@'localhost' IDENTIFIED WITH sha256_password BY '123456';
GRANT ALL ON shop.* TO 'shop_superuser'@'localhost';
GRANT GRANT OPTION ON shop.* TO 'shop_superuser'@'localhost';

-- task 2
DROP TABLE IF EXISTS accounts;
CREATE TABLE accounts (
	id SERIAL PRIMARY KEY,
	name VARCHAR(255),
	password VARCHAR(255)
);

INSERT INTO accounts VALUES
	(NULL, 'igor', '123456'),
	(NULL, 'vlad', '123456'),
	(NULL, 'kate', '123456');

CREATE OR REPLACE VIEW username(user_id, user_name) AS 
	SELECT id, name FROM accounts;

SELECT * FROM username;

DROP USER IF EXISTS 'user_read'@'localhost';
CREATE USER 'user_read'@'localhost' IDENTIFIED WITH sha256_password BY '123456';
GRANT SELECT ON shop.username TO 'user_read'@'localhost';