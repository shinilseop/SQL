-- INSERT
USE market_db;
CREATE TABLE hongong1 
(	toy_id INT, 
	toy_name CHAR(4),
	age INT
);
INSERT INTO hongong1 VALUES(1, '우디', 25);
SELECT * FROM hongong1;
INSERT INTO hongong1 (toy_id, toy_name) VALUES (2, '버즈');
SELECT * FROM hongong1;
INSERT INTO hongong1 (toy_name, age, toy_id) VALUES ('제시', 20, 3);
SELECT * FROM hongong1;

-- AUTO_INCREMENT
CREATE TABLE hongong2 (
	toy_id INT AUTO_INCREMENT PRIMARY KEY,
    toy_name CHAR(4),
    age INT);
INSERT INTO hongong2 VALUES (NULL, '보핍', 25);
INSERT INTO hongong2 VALUES (NULL, '슬링키', 22);
INSERT INTO hongong2 VALUES (NULL, '렉스', 21);
SELECT * FROM hongong2;
SELECT last_insert_id();
ALTER TABLE hongong2 AUTO_INCREMENT=100;
INSERT INTO hongong2 VALUES (NULL, '재남', 35);
INSERT INTO hongong2 VALUES (NULL, '재남2', 36);
SELECT * FROM hongong2;

CREATE TABLE hongong3(
	toy_id INT AUTO_INCREMENT PRIMARY KEY,
    toy_name CHAR(4),
    age INT);
ALTER TABLE hongong3 AUTO_INCREMENT=1000;
SHOW GLOBAL variables;
SET @@auto_increment_increment=3;
INSERT INTO hongong3 VALUES (NULL, '토마스', 20);
INSERT INTO hongong3 VALUES (NULL, '제임스', 23);
INSERT INTO hongong3 VALUES (NULL, '고든', 25);
SELECT * FROM hongong3;
INSERT INTO hongong3 VALUES (NULL, '토마스2', 21), (NULL, '제임스2', 24), (NULL, '고든2', 26);
SELECT * FROM hongong3;

-- INSERT INTO ~ SELECT
SELECT COUNT(*) FROM world.city;
DESC world.city;
SELECT * FROM world.city LIMIT 5;
CREATE TABLE city_popul(
	city_name CHAR(35),
    population INT);
INSERT INTO city_popul SELECT Name, Population FROM world.city;
SELECT * FROM city_popul;