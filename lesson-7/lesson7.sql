-- task 1

-- вставим отсутствующие данные
--
-- INSERT into orders(user_id)
-- VALUES
-- 	(1), -- Геннадий
-- 	(3), -- Александр
-- 	(5); -- Иван
--
-- -- товары заказанные Геннадием
-- INSERT into orders_products(order_id, product_id)
-- VALUES
-- 	(1, 1),
-- 	(1, 2);
-- 
-- -- товары заказанные Александром
-- INSERT into orders_products(order_id, product_id)
-- VALUES
-- 	(2, 1),
-- 	(2, 2);
-- 
-- -- товары заказанные Иваном
-- INSERT INTO orders_products(order_id, product_id, total)
-- VALUES
-- 	(3, 1, 1),
-- 	(3, 4, 3),
-- 	(3, 5, 2);

SELECT 
	u.id AS user_id, u.name AS user_name,
	op.order_id AS order_id,
	op.product_id AS product_id,
	(SELECT name FROM products WHERE id = op.product_id) AS product_name,
	op.total
FROM 
	users AS u
RIGHT JOIN
	orders AS o 
ON
	u.id = o.user_id
RIGHT JOIN
	orders_products AS op
ON
	o.id = op.order_id
ORDER BY u.name, op.order_id;


-- task 2
SELECT 
	p.id, p.name, p.price,
	c.id AS cat_id,
	c.name AS catalog
FROM
	products AS p
JOIN
	catalogs AS c
ON 
	p.catalog_id = c.id;
	

-- task 3
-- создаем таблицы и вставляем данные
-- 
-- CREATE TABLE IF NOT EXISTS flights(
-- 	id SERIAL PRIMARY KEY,
-- 	`from` VARCHAR(50) NOT NULL COMMENT 'en', 
-- 	`to` VARCHAR(50) NOT NULL COMMENT 'en'
-- );
-- 
-- CREATE TABLE  IF NOT EXISTS cities(
-- 	label VARCHAR(50) PRIMARY KEY COMMENT 'en', 
-- 	name VARCHAR(50) COMMENT 'ru'
-- );
-- 
-- ALTER TABLE flights
-- ADD CONSTRAINT fk_from_label
-- FOREIGN KEY(`from`)
-- REFERENCES cities(label);
-- 
-- ALTER TABLE flights
-- ADD CONSTRAINT fk_to_label
-- FOREIGN KEY(`to`)
-- REFERENCES cities(label);
-- 
-- INSERT INTO cities VALUES
-- 	('Moscow', 'Москва'),
-- 	('Saint Petersburg', 'Санкт-Петербург'),
-- 	('Omsk', 'Омск'),
-- 	('Tomsk', 'Томск'),
-- 	('Ufa', 'Уфа');
-- 
-- INSERT INTO flights VALUES
-- 	(NULL, 'Moscow', 'Saint Petersburg'),
-- 	(NULL, 'Saint Petersburg', 'Omsk'),
-- 	(NULL, 'Omsk', 'Tomsk'),
-- 	(NULL, 'Tomsk', 'Ufa'),
-- 	(NULL, 'Ufa', 'Moscow');
	

SELECT
	id AS flight_id,
	(SELECT name FROM cities WHERE label = `from`) AS `from`,
	(SELECT name FROM cities WHERE label = `to`) AS `to`
FROM
	flights
ORDER BY
	flight_id;