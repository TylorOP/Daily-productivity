create database trig;

use trig;

create table test1 (
c1 varchar(40),
c2 date,
c3 int)
;

create table test2 (
c1 varchar(40),
c2 date,
c3 int)
;

create table test3 (
c1 varchar(40),
c2 date,
c3 int)
;


delimiter //
create trigger delete_after_test_ok
after delete on test1 for each row
begin 
	insert into test2 values (old.c1,old.c2,old.c3);
end //


insert into test1 values ('shub',sysdate(),1232452),
('shubham',sysdate(),65434),
('shubham',sysdate(),943534)



select * from test1;

SET SQL_SAFE_UPDATES = 0;

delete from test1 where c1 = 'shubham';

select * from test2;

select * from test1;

create table course(
course_id int,
course_desc varchar(50),
course_mentor varchar(60),
course_discount int,
create_date date
)

delimiter $$ 
create trigger course_before_insert
before insert 
on course for each row
begin 

	set new.create_date = sysdate();
    
end; $$

insert into course (course_id ,
course_desc ,
course_mentor ,
course_discount 
 ) values (101,'something','sudh',98);


select * from course;

insert into course (course_id ,
course_desc ,
course_mentor ,
course_discount 
 ) values (101,'something ok','sudhansu',987);
 
 
 
create table course2(
course_id int,
course_desc varchar(50),
course_mentor varchar(60),
course_discount int,
create_date date,
user_info varchar(50)
)



delimiter $$ 
create trigger course_before_insert3
before insert 
on course2 for each row
begin 
	declare user_val varchar(50);
    set new.create_date = sysdate();
    select user() into user_val;
    set new.user_info = user_val;
    
end; $$


select * from course2;




insert into course2 (course_id ,
course_desc ,
course_mentor ,
course_discount 
 ) values (101,'something ok','sudhansu',987);
  
select * from course2;

# so before update after update before delete after delete before insert after insert

#6 trigger are available


#now case statement

use window_func;


select * from ineuron_students;

alter table ineuron_students add column date_added date;

update ineuron_students 
set date_added = sysdate() 


select * from ineuron_students;

select * , case 
	when student_batch = 'fsda' then 'this is my course'
    else 'not'
    end as statement 
    from ineuron_students;
    
    
update ineuron_students 
set student_batch = case when student_batch = 'fsds' then 'full stack data science'
when student_batch = 'fsde' then 'full stack data engineering'
end

# as not give the other condotion so null updated use widely

select * from ineuron_students;

#solution

update ineuron_students 
set student_batch = case when student_batch = 'fsds' then 'full stack data science'
when student_batch = 'fsde' then 'full stack data engineering'
else student_batch
end

