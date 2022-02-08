-- VIEW
USE market_db;
select mem_id, mem_name, addr from member;

create view v_member
as
	select mem_id, mem_name addr from member;
    
select * from v_member;
select mem_name, addr from member where addr in ('서울', '경기');


select B.mem_id, M.mem_name, B.prod_name, M.addr,
			concat(M.phone1, M.phone2) "연락처"
	from buy B
		inner join member M
        ON B.mem_id = M.mem_id;
        
create view v_memberbuy
as
	select B.mem_id, M.mem_name, B.prod_name, M.addr,
				concat(M.phone1, M.phone2) "연락처"
		from buy B
			inner join member M
			ON B.mem_id = M.mem_id;
select * from v_memberbuy where mem_name = '블랙핑크';

create view v_viewtest1
as
	select B.mem_id 'Member ID', M.mem_name 'Member Name',
		B.prod_name "Product Name", concat(M.phone1, M.phone2) "Office Phone"
    from buy B
		inner join member M
		on B.mem_id = M.mem_id;
        
select distinct `Member Id`, `Member Name` FROM v_viewtest1;
alter view v_viewtest1
as 
	select B.mem_id '회원 아이디', M.mem_name '회원 이름',
		B.prod_name '제품 이름', concat(M.phone1, M.phone2) '연락처'
	from buy B
		inner join member M
        on B.mem_id = M.mem_id;
        
select distinct `회원 아이디`, `회원 이름` from v_viewtest1;

drop view v_viewtest1;

create or replace view v_member
as
	select mem_id, mem_name, addr from member;
describe v_viewtest2;
show create view v_viewtest2;

update v_member set addr = '부산' where mem_id = 'BLK';
insert into v_member(mem_id, mem_name, addr) values ('BTS', '방탄소년단', '경기');
select * from v_member;

create view v_height167
as
	select * from member where height >= 167;
select * from v_height167;
delete from v_height167 where height < 167;
insert into v_height167 values('TRA', '티아라', 6, '서울', NULL, NULL, 159, '2005-01-01');
select * from v_height167;

create or replace view v_height167
as
	select * from member where height >= 167
		with check option;

insert into v_height167 values('TOB', '텔레토비', 4, '영국', NULL, NULL, 140, '1995-01-01');

drop table if exists buy, member;
select * from v_height167;

check table v_height167;