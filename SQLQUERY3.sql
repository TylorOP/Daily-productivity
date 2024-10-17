create database prim_for_key;


create table master(
id int not null,
primary key(id)
);
# each table has only one primary key

create table shub_table (

course_id int not null,
course_name varchar(39),
course_status varchar(39),
primary key(course_id,course_name)
);

#i can create combination of primary key

alter table shub_table 
drop primary key;


create table shub_table (
course_id int not null,
course_name varchar(39),
course_status varchar(39),
primary key(course_id)
);

insert into shub_table (course_name,course_id,course_status)
values ('shub',101,'good');

select * from shub_table;

insert into shub_table (course_name,course_id,course_status)
values ('shub',101,'good');

drop table shub_table;

create table shub_table (
course_id int unique not null,
course_name varchar(39),
course_status varchar(39),
primary key(course_id)
);

create table shub_student(
student_id int ,
course_name varchar(60),
student_email varchar(30),
course_id1 int,
foreign key(course_id1) references shub_table(course_id)
);


select * from shub_table;

# so i can only enter the value of id in parent table eg: 101

insert into shub_student values (1,'any','@gmail.com',101);

select * from shub_student;

insert into shub_student values (2,'sdag','@gmail.com',102);
# Error Code: 1452. Cannot add or update a child row: 
-- a foreign key constraint fails (`shub_123`.`shub_student`, CONSTRAINT `shub_student_ibfk_1` FOREIGN KEY (`course_id1`) REFERENCES `shub_table` (`course_id`))



#multiple records is ok and called as one to many relationship
insert into shub_student values (3,'sag','1@gmail.com',101);
insert into shub_student values (4,'sg','2@gmail.com',101);
insert into shub_student values (5,'sdadgg','3@gmail.com',101);

select * from shub_student;

# so if i want to make one to one relation then make primary to child table column

# let's dooooooooo

drop table shub_student;

create table shub_student(
student_id int ,
course_name varchar(60),
student_email varchar(30),
course_id1 int,
primary key(course_id1),
foreign key(course_id1) references shub_table(course_id)
);

insert into shub_student values (3,'sag','1@gmail.com',101);
insert into shub_student values (4,'sg','2@gmail.com',101);
insert into shub_student values (5,'sdadgg','3@gmail.com',101);

# only one record in child see one to one relation

select * from shub_student;

create table class(
course_id int,
class_name varchar(30),
class_topic varchar(30),
primary key(course_id),
foreign key(course_id) references shub_table(course_id)
);


create table parent(
id int,
primary key(id)
);

create table child(
id int,
parent_id int not null ,
foreign key(parent_id) references parent(id)
);

insert into parent values (1);

insert into child values (1,1),(2,2);  # error

insert into child values (101,1),(101,1);

select * from child;

delete from parent where id = 1;

# use on delete cascade

drop table child;


create table child(
id int,
parent_id int not null ,
foreign key(parent_id) references parent(id) on delete cascade on update cascade
);

# so i can now delete and upate as well 
# cascade means update automatically in child table if 
# data deleted or updated in parent table 

insert into child values (101,1),(101,1);

insert into parent values (2);
insert into child values (101,2),(101,2);

select * from child;

delete from parent where id = 1;

select * from child;  # auto deleted from child

update parent
set id = 202
where id = 2;

select * from child; # auto updated in child
