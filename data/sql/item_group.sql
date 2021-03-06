set @bgnDate='2014-11-18 00';
set @endDate='2014-12-17 23';
set @behavior_type='4';

/*
drop table item_group;
create table item_group
(
type varchar(1),
item_id integer,
behavior_type varchar(1),
begin_time varchar(13),
end_time varchar(13),
count integer,
primary key(type, item_id, behavior_type, begin_time, end_time));*/
--conditions

insert into item_group 
select '1' as type, item_id, behavior_type, @bgnDate, @endDate, count(*)
from user where behavior_type = @behavior_type and time between @bgnDate and @endDate
group by item_id, behavior_type;

insert into item_group 
select '2' as type, item_id, behavior_type, @bgnDate, @endDate, count(distinct user_id, substr(time, 1, 10))
from user where behavior_type = @behavior_type and time between @bgnDate and @endDate
group by item_id, behavior_type;

insert into item_group 
select '3' as type, item_id, behavior_type, @bgnDate, @endDate, count(distinct user_id)
from user where behavior_type = @behavior_type and time between @bgnDate and @endDate
group by item_id, behavior_type;
/*
select type, behavior_type, begin_time, end_time, count(*)
from item_group
group by type, behavior_type, begin_time, end_time*/