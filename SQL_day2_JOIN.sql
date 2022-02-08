-- Inner Join
USE market_db;
SELECT * FROM buy INNER JOIN member ON buy.mem_id = member.mem_id WHERE buy.mem_id = 'GRL';
SELECT * FROM buy INNER JOIN member ON buy.mem_id = member.mem_id;
SELECT mem_id, mem_name, prod_name, addr, CONCAT(phone1, phone2) '연락처' FROM buy INNER JOIN member ON buy.mem_id = member.mem_id;
SELECT B.mem_id, M.mem_name, B.prod_name, M.addr, CONCAT(M.phone1, M.phone2) '연락처' FROM buy B INNER JOIN member M ON B.mem_id = M.mem_id; 
SELECT M.mem_id, M.mem_name, B.prod_name, M.addr FROM buy B INNER JOIN member M ON B.mem_id = M.mem_id ORDER BY M.mem_id;
SELECT DISTINCT M.mem_id, M.mem_name, M.addr FROM buy B INNER JOIN member M ON B.mem_id = M.mem_id ORDER BY M.mem_id;

-- self : INNER JOIN + GROUP BY + SUM
SELECT M.mem_id, M.mem_name, B.prod_name, M.addr, SUM(B.price) FROM buy B INNER JOIN member M ON B.mem_id = M.mem_id GROUP BY B.mem_id ORDER BY M.mem_id;

-- Outer Join
SELECT M.mem_id, M.mem_name, B.prod_name, M.addr FROM member M LEFT OUTER JOIN buy B ON M.mem_id = B.mem_id ORDER BY M.mem_id;
SELECT M.mem_id, M.mem_name, B.prod_name, M.addr FROM buy B RIGHT OUTER JOIN member M ON M.mem_id = B.mem_id ORDER BY M.mem_id;
SELECT DISTINCT M.mem_id, B.prod_name, M.mem_name, M.addr FROM member M LEFT OUTER JOIN buy B ON M.mem_id = b.mem_id WHERE B.prod_name IS NULL ORDER BY M.mem_id;
SELECT DISTINCT M.mem_id, B.prod_name, M.mem_name, M.addr FROM member M LEFT OUTER JOIN buy B ON M.mem_id = b.mem_id ORDER BY M.mem_id;

-- Cross Join
SELECT * FROM buy CROSS JOIN member;
SELECT COUNT(*) "데이터 개수" FROM sakila.inventory CROSS JOIN world.city;
CREATE TABLE cross_table
	SELECT *
		FROM sakila.actor
			CROSS JOIN world.country;
SELECT * FROM cross_table;

-- Self join
CREATE TABLE emp_table (
	emp CHAR(4),
	manager CHAR(4),
    phone VARCHAR(8));
INSERT INTO emp_table VALUES('대표', NULL, '0000');
INSERT INTO emp_table VALUES('영업이사', '대표', '1111');
INSERT INTO emp_table VALUES('관리이사', '대표', '2222');
INSERT INTO emp_table VALUES('정보이사', '대표', '333');
INSERT INTO emp_table VALUES('영업과장', '영업이사', '1111-1');
INSERT INTO emp_table VALUES('경리부장', '관리이사', '2222-1');
INSERT INTO emp_table VALUES('인사부장', '관리이사', '2222-2');
INSERT INTO emp_table VALUES('개발팀장', '정보이사', '3333-1');
INSERT INTO emp_table VALUES('개발주임', '정보이사', '3333-1-1');

SELECT A.emp "직원", B.emp "직속상관", B.phone "직속상관연락처" FROM emp_table A INNER JOIN emp_table B ON A.manager = B.emp WHERE A.emp = '경리부장';