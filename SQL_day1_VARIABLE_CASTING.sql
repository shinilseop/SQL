-- VARIABLE
USE market_db;
SET @myVar1 = 5;
SET @myVar2 = 4.25;
SELECT @myVar1;
SELECT @myVar2;

SET @txt = '가수 이름==> ';
SET @height = 166;
SELECT @txt, mem_name FROM member WHERE height > @height;

SET @count = 3;
SELECT mem_name, height FROM member ORDER BY height LIMIT 3; -- @count; -- LIMIT 은 변수 사용 불가
PREPARE mySQL FROM 'SELECT mem_name, height FROM member ORDER BY height LIMIt ?';
EXECUTE mySQL USING @count;

-- CASTING
SELECT AVG(price) '평균 가격' FROM buy;
SELECT CAST(AVG(price) AS SIGNED) '평균 가격' FROM buy;
SELECT CONVERT(AVG(price), SIGNED) '평균 가격' FROM buy;

SELECT CAST('2022$12$12' AS DATE);
SELECT CAST('2022/12/12' AS DATE);
SELECT CAST('2022%12%12' AS DATE);
SELECT CAST('2022@12@12' AS DATE);

SELECT num, CONCAT(CAST(price AS CHAR), 'X', CAST(amount AS CHAR), '=') '가격X수량', price*amount '구매액' FROM buy;

-- AUTO CASTING
SELECT '100'+'200'; -- plus number
SELECT CONCAT('100', '200'); -- add char
SELECT CONCAT(100, 200); -- add char
SELECT CONCAT(current_date()," ",current_time());