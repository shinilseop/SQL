-- subquery
SELECT mem_name, height FROM member WHERE height > (SELECT height FROM member WHERE mem_name = '에이핑크');

-- GROUP BY
SELECT mem_id, SUM(price) 합계, AVG(price) 평균, MIN(price) 최소, MAX(price) 최대, COUNT(price) 횟수, COUNT(DISTINCT price) "횟수중복제거" FROM buy GROUP BY mem_id;
SELECT * FROM buy;
SELECT mem_id "회원 아이디", SUM(price*amount) "총 구매 금액" FROM buy GROUP BY mem_id;
SELECT AVG(amount) "평균 구매 개수" FROM buy;
SELECT mem_id, AVG(amount) "평균 구매 개수" FROM buy GROUP BY mem_id;
SELECT COUNT(*) FROM member; -- 10
SELECT COUNT(phone1) "연락처가 있는 회원" FROM member; -- 8
