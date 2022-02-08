-- TABLE & VIEW
DROP DATABASE naver_db;
CREATE DATABASE naver_db;
USE naver_db;

DROP TABLE IF EXISTS member;
CREATE TABLE member (
	mem_id char(8) primary key not null,
    mem_name varchar(10) not null,
    mem_number tinyint not null,
    addr char(2) not null,
    phone1 char(3) null,
    phone2 char(8) null,
    height tinyint unsigned null,
    debut_date date);

DROP TABLE IF EXISTS buy;
CREATE TABLE buy (
	num int primary key not null auto_increment,
    mem_id char(8) not null,
    prod_name char(6) not null,
    group_name char(4) null,
    price int unsigned not null,
    amount smallint unsigned not null,
    foreign key(mem_id) references member(mem_id));

INSERT INTO member VALUES('TWC', '트와이스', 9, '서울', '02', '11111111', 167, "2015-10-19");
INSERT INTO member VALUES('BLK', '블랙핑크', 4, '경남', '055', '22222222', 163, "2016-08-08");
INSERT INTO member VALUES('WMN', '여자친구', 6, '경기', '031', '33333333', 166, "2015-01-15");
SELECT * FROM member;

INSERT INTO buy VALUES(null, 'BLK', '지갑', null, 30, 2);
INSERT INTO buy VALUES(null, 'BLK', '맥북프로', '디지털', 1000, 1);
-- INSERT INTO buy VALUES(null, 'APN', '아이폰', '디지털', 200, 1); -- error : APN is not exists.
SELECT * FROM buy;

-- 제약조건

-- primary key
DESCRIBE member;
DROP TABLE IF EXISTS buy, member;
CREATE TABLE member (
	mem_id char(8) not null primary key,
	mem_name varchar(10) not null,
    height tinyint unsigned null);

DROP TABLE IF EXISTS member;
CREATE TABLE member (
	mem_id char(8) not null,
	mem_name varchar(10) not null,
    height tinyint unsigned null,
    PRIMARY KEY (mem_id)
);

DROP TABLE IF EXISTS member;
CREATE TABLE member (
	mem_id char(8) not null,
	mem_name varchar(10) not null,
    height tinyint unsigned null
);
ALTER TABLE member ADD CONSTRAINT primary key (mem_id);

DROP TABLE IF EXISTS member;
CREATE TABLE member (
	mem_id char(8) not null,
	mem_name varchar(10) not null,
    height tinyint unsigned null,
    constraint primary key PK_member_mem_id (mem_id)
);
DESCRIBE member;

-- foreign key
DROP TABLE IF EXISTS buy, member;
CREATE TABLE member (
	mem_id char(8) not null primary key,
	mem_name varchar(10) not null,
    height tinyint unsigned null
);
create table buy (
	num int auto_increment not null primary key,
    mem_id char(8) not null,
    prod_name char(6) not null,
    foreign key(mem_id) references member(mem_id)
);

drop table if exists buy;
create table buy (
	num int auto_increment not null primary key,
    mem_id char(8) not null,
    prod_name char(6) not null
);
alter table buy
	add constraint
	foreign key(mem_id)
	references member(mem_id);
	
insert into member values ('BLK', '블랙핑크', 163);
insert into buy values (NULL, 'BLK', '지갑');
insert into buy values (NULL, 'BLK', '맥북');
select M.mem_id, M.mem_name, B.prod_name
	from buy B
	inner join member M
    ON B.mem_id = M.mem_id;    
update member set mem_id = 'PINK' WHERE mem_id = 'BLK'; -- ERROR : cause foreign key
DELETE FROM member WHERE mem_id = 'BLK'; -- ERROR : cause foreign key

drop table if exists buy;
create table buy (
	num int auto_increment not null primary key,
    mem_id char(8) not null,
    prod_name char(6) not null
);
alter table buy
	add constraint
    foreign key(mem_id) references member(mem_id)
    on update cascade
    on delete cascade;
insert into buy values (NULL, 'BLK', '지갑');
insert into buy values (NULL, 'BLK', '맥북');
update member set mem_id = 'PINK' where mem_id = 'BLK';
select M.mem_id, M.mem_name, B.prod_name
	from buy B
    inner join member M
    ON B.mem_id = M.mem_id;
delete from member where mem_id = 'PINK';
select * from buy;

-- unique key
drop table if exists buy, member;
create table member (
	mem_id char(8) not null primary key,
    mem_name varchar(10) not null,
    height tinyint unsigned null,
    email char(30) null unique key
);

insert into member values ('BLK', '블랙핑크', 163, 'pink@gmail.com');
insert into member values ('TWC', '트와이스', 167, NULL);
insert into member values ('APN', '에이핑크', '164', 'pink@gmail.com'); -- ERROR : email(unique key) is distiction.

-- check
drop table if exists member;
create table member ( 
	mem_id char(8) not null primary key,
    mem_name varchar(10) not null,
    height tinyint unsigned null check (height >= 100),
    phone1 char(3) null
);
insert into member values('BLK','블랙핑크',163,null);
insert into member values('TWC','트와이스',167,null);
insert into member values('PINK','에이핑크',99,null);

alter table member
	add constraint
    check (phone1 in ('02', '031', '032', '054', '055',' 061'));

delete from member where mem_id = 'OMY' or mem_id ='PINK';
insert into member values('OMY','오마이걸',167, '02');
insert into member values('PINK','에이핑크',167, '010'); -- ERROR 

-- default value
drop table if exists member;
create table member (
	mem_id char(8) not null primary key,
    mem_name varchar(10) not null,
    height tinyint unsigned null default 160,
    phone1 char(3) null
);
alter table member
	alter column phone1 set default '02';
insert into member values('RED', '레드벨벳', 161, '054');
insert into member values('SPC', '우주소녀', default, default);
select * from member;
insert into member values('RED', '레드벨벳', 161, '054');