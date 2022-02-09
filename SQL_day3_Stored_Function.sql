-- stored function
set global log_bin_trust_function_creators = 1;
use market_db;
drop function if exists sumFunc;
delimiter $$
create function sumFunc(number1 INT, number2 int)
	returns int
begin
	return number1 + number2;
end $$
delimiter ;
select sumFunc(100, 200) as '합계';

drop function if exists calcYearFunc;
delimiter $$
create function calcYearFunc(dYear int)
	returns int
begin
	declare runYear int;
    set runYear = year(curdate()) - dYear;
    return runYear;
end $$
delimiter ;
select calcYearFunc(2010) as '활동 햇수';
select calcYearFunc(2007) into @debut2007;
select calcYearFunc(2013) into @debut2013;
select @debut2007-@debut2013 as '2007과 2013 차이';
select mem_id, mem_name, calcYearFunc(YEAR(debut_date)) as '황동 햇수' from member;

show create function calcYearFunc;
drop function calcYearFunc;

-- cursor
drop procedure if exists cursor_proc;
delimiter $$
create procedure cursor_proc()
begin
	declare memNumber int;
    declare cnt int default 0;
    declare totNumber int default 0;
    declare endOfRow boolean default false;
    
    declare memberCursor cursor for
		select mem_number from member;
	
    declare continue handler
		for not found set endOfRow = true;
	
    open memberCursor;
    
    cursor_loop : LOOP
		fetch memberCursor into memNumber;
        
        if endOfRow then
			leave cursor_loop;
		end if;
        
        set cnt = cnt + 1;
        set totNumber = totNumber + memNumber;
	end loop cursor_loop;
    
    select (totNumber/cnt) as '회원의 평균 인원 수';
    
    close memberCursor;
end $$
delimiter ;

call cursor_proc();