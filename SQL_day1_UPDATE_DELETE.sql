-- UPDATE
USE market_db;
SET SQL_SAFE_UPDATES = 0;
UPDATE city_popul SET city_name = '서울' WHERE city_name = 'Seoul';
SELECT * FROM city_popul WHERE city_name = '서울';
UPDATE city_popul SET city_name ='뉴욕', population = 0 WHERE city_name = 'New York';
SELECT * FROM city_popul WHERE city_name = '뉴욕';
UPDATE city_popul SET population = population/10000;
SELECT * FROM city_popul LIMIT 5;

-- DELETE
DELETE FROM city_popul WHERE city_name LIKE 'NEW%';
DELETE FROM city_popul WHERE city_name LIKE 'NEW%' LIMIT 5;
-- BIG DATA DELETE
CREATE TABLE big_table1 (SELECT * FROM world.city, sakila.country);
CREATE TABLE big_table2 (SELECT * FROM world.city, sakila.country);
CREATE TABLE big_table3 (SELECT * FROM world.city, sakila.country);
SELECT COUNT(*) FROM big_table1;
DELETE FROM big_table1;
DROP TABLE big_table2;
TRUNCATE TABLE big_table3;