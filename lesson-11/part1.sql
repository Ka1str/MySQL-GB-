-- task 1
-- create table
DROP TABLE IF EXISTS logs;
CREATE TABLE logs (
	tablename VARCHAR(255),
	extenal_id BIGINT(20),
	name VARCHAR(255),
	created_at DATETIME default CURRENT_TIMESTAMP
) ENGINE = ARCHIVE;

-- create triggers
DROP TRIGGER IF EXISTS log_users;
delimiter //
CREATE TRIGGER log_users AFTER INSERT ON users
FOR EACH ROW
BEGIN
	INSERT INTO logs (tablename, extenal_id, name, created_at)
	VALUES ('users', NEW.id, NEW.name, NOW());
END //
delimiter ;

DROP TRIGGER IF EXISTS log_catalogs;
delimiter //
CREATE TRIGGER log_catalogs AFTER INSERT ON catalogs
FOR EACH ROW
BEGIN
	INSERT INTO logs (tablename, extenal_id, name, created_at)
	VALUES ('catalogs', NEW.id, NEW.name, NOW());
END //
delimiter ;

DROP TRIGGER IF EXISTS log_products;
delimiter //
CREATE TRIGGER log_products AFTER INSERT ON products
FOR EACH ROW
BEGIN
	INSERT INTO logs (tablename, extenal_id, name, created_at)
	VALUES ('products', NEW.id, NEW.name, NOW());
END //
delimiter ;

-- checking triggers
INSERT INTO users (name, birthday_at) VALUES ('Tom', '1993-05-02');

SELECT * FROM users;
SELECT * FROM logs;

INSERT INTO catalogs (name) VALUES ('Keyboard');

SELECT * FROM catalogs;
SELECT * FROM logs;

INSERT INTO products (name, description, price, catalog_id)
VALUES ('Asus ROG Strix Scope', 'ASUS keyboard', 25000, 12);

SELECT * FROM products;
SELECT * FROM logs;


-- task 2
DROP TABLE IF EXISTS users_test; 
CREATE TABLE users_test (
	id SERIAL PRIMARY KEY,
	name VARCHAR(255),
	birthday_at DATE,
	`created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
 	`updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

INSERT INTO users_test (name, birthday_at)
VALUES ('Tom', '1993-05-02'),
		('Alex', '1975-02-05'),
		('Rey', '1993-05-02'),
		('Tia', '1975-02-05'),
		('Jen', '1993-05-02'),
		('Don', '1975-02-05'),
		('Heralt', '1993-05-02'),
		('John', '1975-02-05'),
		('Rick', '1993-05-02'),
		('Morty', '1975-02-05');

select count(*) from 
		users_test as one,
		users_test as two,
		users_test as thr,
		users_test as four,
		users_test as five,
		users_test as six;
		
insert into users_test (name, birthday_at)
select one.name, one.birthday_at
from users_test as one,
		users_test as two,
		users_test as thr,
		users_test as four,
		users_test as five,
		users_test as six;