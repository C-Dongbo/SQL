drop table student_grade;
create table student_grade(`student_id` int, `student_name` varchar(10), `subject` varchar(20), `score` decimal(3))ENGINE=InnoDB DEFAULT CHARSET=utf8;
insert into student_grade(`student_id`, `student_name`, `subject`, `score`) 
values 
(1, '김철수', '국어', 81), 
(1, '김철수', '영어', 77), 
(1, '김철수', '수학', 93), 
(2, '김영희', '국어', 74),
(2, '김영희', '영어', 82),
(2, '김영희', '수학', 61),
(3, '박민수', '국어', 95),
(3, '박민수', '영어', 81),
(3, '박민수', '수학', 76),
(4, '최민희', '국어', 79),
(4, '최민희', '영어', 81),
(4, '최민희', '수학', 92),
(5, '이영숙', '국어', 64),
(5, '이영숙', '영어', 71),
(5, '이영숙', '수학', 53),
(6, '홍사랑', '국어', 64),
(6, '홍사랑', '영어', 72),
(6, '홍사랑', '수학', 58),
(7, '박지성', '국어', 81),
(7, '박지성', '영어', 82),
(7, '박지성', '수학', 75),
(8, '손흥만', '국어', 59),
(8, '손흥만', '영어', 97),
(8, '손흥만', '수학', 69),
(9, '이강수', '국어', 100),
(9, '이강수', '영어', 72),
(9, '이강수', '수학', 61),
(10, '김광수', '국어', 82),
(10, '김광수', '영어', 81),
(10, '김광수', '수학', 78),
(11, '박석희', '국어', 93),
(11, '박석희', '영어', 88),
(11, '박석희', '수학', 86),
(12, '최수석', '국어', 91),
(12, '최수석', '영어', 100),
(12, '최수석', '수학', 100),
(13, '이상준', '국어', 62),
(13, '이상준', '영어', 67),
(13, '이상준', '수학', 71),
(14, '김상민', '국어', 53),
(14, '김상민', '영어', 62),
(14, '김상민', '수학', 67),
(15, '황희춘', '국어', 71),
(15, '황희춘', '영어', 84),
(15, '황희춘', '수학', 86);

select student_id, student_name, avg(score) 
from student_grade
group by 1,2
;


select 
student_id, student_name,
	case when `subject` = '국어' then score end as subject_of_korean,
    case when `subject` = '영어' then score end as subject_of_english,
    case when `subject` = '수학' then score end as subject_of_math
from student_grade
order by student_id
;


select 
student_id, student_name,
	sum(case when `subject` = '국어' then score end) as subject_of_korean,
    sum(case when `subject` = '영어' then score end) as subject_of_english,
    sum(case when `subject` = '수학' then score end) as subject_of_math
from student_grade
group by student_id, student_name
order by student_id
;