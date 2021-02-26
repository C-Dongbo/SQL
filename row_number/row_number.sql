CREATE TABLE `log_sample` (
  `id` varchar(15) NOT NULL,
  `logtime1` int(11) NOT NULL,
  `logtime2` int(11) NOT NULL,
  `task` varchar(10) NOT NULL,
  `cusno` varchar(20) NOT NULL,
  `date` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;


insert into `log_sample` values ('1234568', '153538', '153941', 'C', '1234', '20210223');
insert into `log_sample` values ('1234569', '153941', '155533', 'B', '1569', '20210223');
insert into `log_sample` values ('1234570', '155533', '160132', 'C', '2346', '20210223');
insert into `log_sample` values ('none', '160132', '160635', '', '1235', '20210223');
insert into `log_sample` values ('1234571', '160635', '162011', 'B', '6345', '20210223');
insert into `log_sample` values ('1234572', '122235', '123049', 'A', '1235', '20210224');
insert into `log_sample` values ('1234573', '123049', '123940', 'B', '6265', '20210224');
insert into `log_sample` values ('1234574', '123940', '125002', 'B', '7395', '20210224');
insert into `log_sample` values ('none', '125002', '130101', '', '2361', '20210224');
insert into `log_sample` values ('1234575', '130101', '140020', 'C', '7485', '20210224');
insert into `log_sample` values ('none', '140020', '142020', '', '2379', '20210224');
insert into `log_sample` values ('1234576', '142020', '143330', 'A', '6324', '20210224');


select * from log_sample;


/* 단순 oracle 혹은 teradata의 row_number 구현 */
select a.*, @row_num := @row_num + 1 as rn from
log_sample as a, (select @row_num := 0) as b
order by `date`, `logtime1`
;

/* row_number의 partition by 역할 구현  */
select 
a.*
, case when @grp = `date` then @row_num := @row_num + 1 else @row_num := 1 end as rn
, (@grp := `date`) as dum
from log_sample as a, (select @row_num := 0, @grp := '') r
order by `date`, `logtime1`
;


/* row_number의 partition by , 조건추가 역할 구현 */
select a.`id`, a.`logtime1`, a.`logtime2`, a.`task`, a.`cusno`, a.`date`, case when id = 'none' then null else a.`rn` end as rn  from(
	select 
	a.*
	, case when @grp = `date` and id <> 'none' then @row_num := @row_num + 1 else @row_num := 1 end as rn
	, (@grp := `date`) as tmp
	from log_sample as a, (select @row_num := 0, @grp := '') r
	order by case when id <> 'none' then 1 else 0 end, `date`, `logtime1`
) a
order by `date`, `logtime1`
;
