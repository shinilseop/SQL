-- Index
USE market_db;
create table table1 (
	col1 int primary key,
    col2 int,
    col3 int
);
show index from table1;

create table table2 (
	col1 int primary key,
    col2 int unique key,
    col3 int unique key
);
show index from table2;

drop table if exists buy, member;
create table member (
	mem_id char(8),
    mem_name varchar(10),
    mem_number int,
    addr char(2)
);
insert into member values('TWC', '트와이스', 9, '서울');
insert into member values('BLK', '블랙핑크', 4, '경남');
insert into member values('WMN', '여자친구', 6, '경기');
insert into member values('OMY', '오마이걸', 7, '서울');
select * from member;
alter table member
	add constraint
    primary key(mem_id);
select * from member;
alter table member drop primary key;
alter table member
	add constraint
    primary key(mem_name);
select * from member;
insert into member values('GRL', '소녀시대', 8, '서울');
select * from member;


-- sub index
drop table if exists member;
create table member ( 
	mem_id char(8),
    mem_name varchar(10),
    mem_number int,
    addr char(2)
);
insert into member values('TWC', '트와이스', 9, '서울');
insert into member values('BLK', '블랙핑크', 4, '경남');
insert into member values('WMN', '여자친구', 6, '경기');
insert into member values('OMY', '오마이걸', 7, '서울');
select * from member;
alter table member
	add constraint
    unique (mem_id);
select * from member;
alter table member
	add constraint
    unique key (mem_name);
select * from member;
insert into member values('GRL', '소녀시대', 8, '서울');
select * from member;

-- index structure
create table cluster (
	mem_id char(8),
	mem_name varchar(10)
);
insert into cluster values ('TWC', '트와이스');
insert into cluster values ('BLK', '블랙핑크');
insert into cluster values ('WMN', '여자친구');
insert into cluster values ('OMY', '오마이걸');
insert into cluster values ('GRL', '소녀시대');
insert into cluster values ('ITZ', '잇지');
insert into cluster values ('RED', '레드벨벳');
insert into cluster values ('APN', '에이핑크');
insert into cluster values ('SPC', '우주소녀');
insert into cluster values ('MMU', '마마무');
select * from cluster;
alter table cluster
	add constraint
    primary key (mem_id);
select * from cluster;

create table second (
	mem_id char(8),
	mem_name varchar(10)
);
insert into second values ('TWC', '트와이스');
insert into second values ('BLK', '블랙핑크');
insert into second values ('WMN', '여자친구');
insert into second values ('OMY', '오마이걸');
insert into second values ('GRL', '소녀시대');
insert into second values ('ITZ', '잇지');
insert into second values ('RED', '레드벨벳');
insert into second values ('APN', '에이핑크');
insert into second values ('SPC', '우주소녀');
insert into second values ('MMU', '마마무');
select * from second;
alter table second
	add constraint
    unique key (mem_id);
select * from second;

-- index use
use market_db;
select * from member;
show index from member;
show table status like 'member';

create index idx_member_add
	on member(addr);
show index from member;
show table status like 'member';
analyze table member;
show table status like 'member';

create unique index idx_member_mem_number
	on member(mem_number); -- error : distinct can't unique
    
create unique index idx_member_mem_name
	on member(mem_name);
show index from member;
insert into member values ('MOO', '마마무', 2, '태국', '001', '12341234', 155, '2020.10.10'); -- Error : duplicate entry

analyze table member;
show index from member;
select * from member;
select mem_id, mem_name, addr from member;
select mem_id, mem_name, addr from member where mem_name = '에이핑크';

create index idx_member_mem_number
	on member (mem_number);
analyze table member;

select mem_name, mem_number from member where mem_number >= 7;
select mem_name, mem_number from member where mem_number >= 1;
select mem_name, mem_number from member where mem_number*2 >= 14;
select mem_name, mem_number from member where mem_number >= 14/2;

-- index remove
show index from member;
drop index idx_member_mem_name on member;
drop index idx_member_addr on member;
drop index idx_member_mem_number on member;
alter table member drop primary key;

select table_name, constraint_name
	from information_schema.referential_constraints
	where constraint_schema = 'market_db';

alter table buy drop foreign key buy_ibfk_1;
alter table member drop primary key;
show index from member;