-- TYPE, SIZE
USE market_db;
CREATE TABLE hongongmember4(
	tinyint_col TINYINT,
    samllint_col SMALLINT,
    int_col INT,
    bigint_col BIGINT);
INSERT INTO hongong4 VALUES(127, 32767, 2147483647, 9223372036854775807);
INSERT INTO hongong4 VALUES(127, 32767, 2147483647, 90000000000000000000); -- Out of range(bigint)

CREATE TABLE member
(	mem_id CHAR(8) NOT NULL PRIMARY KEY,
	mem_name VARCHAR(10) NOT NULL,
    mem_number INT NOT NULL,
    addr CHAR(2) NOT NULL,
    phone1 CHAR(3),
    phone2 CHAR(8),
    height SMALLINT,
    debut_date date
);

CREATE TABLE big_table (
	data1 CHAR(256),
    data2 VARCHAR(16384)); -- ERORR : char size max = 255
    
CREATE DATABASE netflix_db;
USE netflix_db;
CREATE TABLE movie
(	movie_id INT,
	movie_title VARCHAR(30),
    movie_director VARCHAR(20),
    movie_star VARCHAR(20),
    movie_script LONGTEXT, -- 42억 글자
    movie_film LONGBLOB -- MAX 4GB
);

-- FLOAT, DOUBLE, DATE, TIME, DATETIME