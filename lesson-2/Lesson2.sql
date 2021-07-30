-- 1 �������.
-- MySQL ���������. ���� .my.cnf � �������� ����������.

-- 2 �������.
DROP DATABASE IF EXISTS example;
CREATE DATABASE example;
USE example;
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255)
)

-- 3 �������.
-- 'mysqldump example > example.sql'
-- 'mysql sample < example.sql'

-- 4 �������.
-- 'mysqldump mysql help_keyword --where="true limit 100" > dump.sql'