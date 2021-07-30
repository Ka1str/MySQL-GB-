-- Операторы, фильтрация, сортировка и ограничение
-- task 1

SELECT * FROM users;
UPDATE users
    SET created_at = NULL where id BETWEEN 1 AND 6;
   
UPDATE users
    SET updated_at = NULL where id BETWEEN 1 AND 6;
   
UPDATE users
    SET created_at = NOW() where created_at is NULL;
   
   
-- task 2
   
ALTER TABLE users 
    CHANGE COLUMN `created_at` `created_at` VARCHAR(256) NULL,
    CHANGE COLUMN `updated_at` `updated_at` VARCHAR(256) NULL;

describe users;
SELECT created_at from users;

ALTER TABLE users 
    CHANGE COLUMN `created_at` `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
    CHANGE COLUMN `updated_at` `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

describe users;
SELECT created_at from users;

-- task 3

INSERT INTO
    storehouses_products (storehouse_id, product_id, value)
VALUES
    (1, 1, 5),
    (1, 2, 10),
    (1, 3, 15),
    (1, 4, 0),
    (1, 5, 25);

SELECT value FROM storehouses_products ORDER BY IF(value > 0, 0, 1), value;
   
   
-- task 4
SELECT name, birthday_at FROM users WHERE MONTHNAME(birthday_at) IN ('may', 'august');


-- task 5
SELECT * FROM catalogs WHERE id IN (5, 1, 2) ORDER BY FIELD(id, 5, 1, 2);


-- Агрегация данных
-- task 1
SELECT ROUND(AVG(TIMESTAMPDIFF(YEAR, birthday_at, NOW())), 0) AS Average_Age FROM users;

-- task 2
SELECT
    DAYNAME(CONCAT(YEAR(NOW()), '-', SUBSTRING(birthday_at, 6, 10))) AS week_day,
    COUNT(*) AS amount_of_birthday
FROM
    users
GROUP BY 
    week_day
ORDER BY
	amount_of_birthday DESC;
