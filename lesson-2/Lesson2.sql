-- 1 задание.
-- MySQL установен. Файл .my.cnf в домашней директории.

-- 2 задание.
DROP DATABASE IF EXISTS example;
CREATE DATABASE example;
USE example;
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255)
)

-- 3 задание.
-- 'mysqldump example > example.sql'
-- 'mysql sample < example.sql'

-- 4 задание.
-- 'mysqldump mysql help_keyword --where="true limit 100" > dump.sql'