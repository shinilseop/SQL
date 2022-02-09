-- trigger
set sql_safe_updates = 0;

use market_db;
create table if not exists trigger_table (id int, txt varchar(10));
insert into trigger_table values(1, '레드벨벳');
insert into trigger_table values(2, '잇지');
insert into trigger_table values(3, '블랙핑크');

drop trigger if exists myTrigger;
delimiter $$
create trigger myTrigger
	after delete
    on trigger_table
    for each row
begin
	set @msg = '가수 그룹이 삭제됨';
end $$
delimiter ;
set @msg = '';
insert into trigger_table values(4, '마마무');
select @msg;
update trigger_table set txt = '블핑' where id = 3;
select @msg;
delete from trigger_table where id = 4;
select @msg;

-- use trigger
use market_db;
create table singer (select mem_id, mem_name, mem_number, addr from member);
select * from singer;
create table backup_singer (
	mem_id char(8) not null,
	mem_name varchar(10) not null,
    mem_number int not null,
    addr char(2) not null,
    modType char(2),
    modDate date,
    modUser varchar(30)
);

drop trigger if exists signer_updateTrg;
delimiter $$
create trigger singer_updateTrg
	after update
	on singer
    for each row
begin
	insert into backup_singer values(old.mem_id, old.mem_name, old.mem_number, old.addr, '수정', curdate(), current_user());
end $$
delimiter ;

drop trigger if exists singer_deleteTrg;
delimiter $$
create trigger singer_deleteTrg
	after delete
	on singer
    for each row
begin
	insert into backup_singer values(old.mem_id, old.mem_name, old.mem_number, old.addr, '삭제', curdate(), current_user());
end $$
delimiter ;

update singer set addr = '영국' where mem_id = 'BLK';
delete from singer where mem_number >= 7;

select * from backup_singer;
select * from singer;

truncate table singer;

select * from backup_singer;