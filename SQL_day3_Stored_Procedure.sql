 -- stored procedure
use market_db;
drop procedure if exists user_proc;
delimiter $$
create procedure user_proc()
begin
	select * from member;
end $$
delimiter ;
call user_proc();
drop procedure user_proc;

drop procedure if exists user_proc1;
delimiter $$
create procedure user_proc1(in userName varchar(10))
begin
	select * from member where mem_name = userName;
end $$
delimiter ;
call user_proc1('에이핑크');

drop procedure if exists user_proc2;
delimiter $$
create procedure user_proc2(in userNumber int, in userHeight int)
begin
	select * from member
		where mem_number > userNumber and height > userHeight;
end $$
delimiter ;
call user_proc2(6, 165);

drop procedure if exists user_proc3;
delimiter $$
create procedure user_proc3(in txtValue char(10), out outValue int)
begin
	insert into noTable values (null, txtValue);
	select max(id) into outValue from noTable;
end $$
delimiter ;
describe noTable;
create table noTable (
	id int auto_increment primary key,
    txt char(10)
);
call user_proc3('테스트1', @myValue);
select concat('입력된 ID 값 ==>', @myValue);

drop procedure if exists ifelse_proc;
delimiter $$
create procedure ifelse_proc(in memName varchar(10))
begin
	declare debutYear int;
	select year(debut_date) into debutYear from member
		where mem_name = memName;
	if(debutYear >= 2015) then
		select '신인 가수네요. 화이팅 하세요.' as '메세지';
	else
		select '고참 가수네요. 그동안 수고하셨어요.' as '메세지';
	end if;
end $$
delimiter ;
call ifelse_proc('오마이걸');

drop procedure if exists while_proc;
delimiter $$
create procedure while_proc()
begin
	declare i int;
    declare sum int;
    set i = 1;
    set sum = 0;
    
    while (i<=100) do
		set sum = sum + i;
        set i = i + 1;
	end while;
    select sum as '1~100 까지의 합계';
end $$
delimiter ;
call while_proc();

drop procedure if exists dynamic_proc;
delimiter $$
create procedure dynamic_proc(in tableName varchar(20))
begin
	set @sqlQuery = concat('select * from ', tableName);
    prepare myQuery from @sqlQuery;
    execute myQuery;
    deallocate prepare myQuery;
end $$
delimiter ;
call dynamic_proc('member');