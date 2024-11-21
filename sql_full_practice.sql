create database shubham;

use shubham;


create table if not exists Employee_details ( EmpId int,
	FullName varchar(50),
    ManagerId int,
    DateOfJoining date,
    City varchar(30));
    

    
insert into employee_details values
 (121, 'John Snow', 321, '2024-01-28','Toronto'),
 (321,'Walter White',986	,'2015-01-30','California'),
(421,'Kuldeep Rana',876	,'2016-11-27','New Delhi');

select * from employee_details; 


drop table employee_salary;

create table if not exists employee_salary (
empID int,
project varchar(20),
Salary int,
variable int

);

insert into employee_salary values 
(121	,'P1',8000,500),
(321,'P2',10000,1000),
(421,'P1',12000,0);


select * from employee_salary;

select * from employee_details; 


-- SQL Query to fetch records that are present in one table but not in another table.

select * from employee_details 


;
create table A (Aid int, Name varchar (20)) ;
insert into A values(1,'sam'),(2,'tom'),(3,'harry'),(4,'katich'),(5,'kate');

select * from A;

create table B (Bid int, Name varchar(30), Aidd int);
insert into B values (11,'harry',3),(12,'katisch',4),(13,'Kate',5),(14,'mate',6),(15,'sat',7);

select * from A,B where A.Aid=B.Aidd; -- equi join syntax

select * from A join B on A.Aid = B.Aidd   -- normal join

;
select * from A join B on Aid = Aidd
# here if column is same so A.aid else you can do aid = aidd
# good to use it for clearify
;


select * from B;

select * from A;

SET SQL_SAFE_UPDATES = 0;

select * from A left join B on  a.aid=B.Aidd;

select * from B left join A on b.aidd = a.aid;

select * from B right join A on a.aid = b.aidd;

select * from B full join A ;

select count(*) from B full join A ;

insert into B values (14,'shubham is mad ',6),(15,'shubham is also mad',7);

insert into A values (6,'rahul'),(7,'mehesh');

select * from A left join B on a.aid = b.aidd;

select * from A right join B on a.aid = b.aidd;

select * from A full join B ;

select * from A full join B on a.aid = b.aidd; # we can't do in mysql but in other we can do


CREATE TABLE AA (
    aid INT
);

INSERT INTO AA (aid) VALUES 
(1),
(1),
(1),
(NULL);


select * from AA;


CREATE TABLE BB (
    aidd INT
);

INSERT INTO BB (aidd) VALUES 
(1),
(1),
(1),
(1),
(NULL),
(NULL);


select * from BB;

select * from AA;

select count(*) from AA;
# 4

select Count(*) from BB;
# 6


select * from AA inner join BB on AA.aid=BB.aidd;

select count(*) from AA inner join BB on AA.aid=BB.aidd;
# 12
select * from AA left join BB on AA.aid=BB.aidd;

select count(*) from AA left join BB on AA.aid=BB.aidd;
# 13  left all record + matching right records

select * from AA right join BB on AA.aid=BB.aidd;

select count(*) from AA right join BB on AA.aid=BB.aidd;
# 14 right all record + matching left records


select now();



Create table FirstTable(
FID int,
FirstName varchar(20),
LastName varchar(20),
City varchar(20),
Age int);


select *  from FirstTable;

insert into FirstTable values(1,'Praveen','Patil','Pune',30);

insert into firsttable (fid,firstName) values (1,'shubham');

insert into firsttable values (2,'lucky');  # error as count of records doesn't match columns

create table employee
(EID int,
FirstName varchar(20),
LastName varchar(20),
Loc varchar(20),
Dept varchar(20),
salary int);



insert into employee values (1,'Rohan','Mane','Sangali','HR',15000);
insert into employee values (2,'Sheetal','Chavan','Parbhani','Finance',25000);
insert into employee values (3,'Amit','Patil','Latur','HR',16000);
insert into employee values (4,'Riya','Verma','Pune','Account',20000);
insert into employee values (5,'Sita','Sharma','Patna','HR',15000);
insert into employee values (6,'Kirti','Gold','Solapur','Staffing',35000);
insert into employee values (7,'Sohan','Jadhav','Miraj','Account',45000);
insert into employee values (8,'Priyanka','Sharma','Nagpur','Finance',46000);
insert into employee values (9,'Virat','Patil','Jaipur','Staffing',34000);
insert into employee values (10,'Sohil','Khan','Mumbai','HR',33000);
insert into employee values (11,'Ronit','Patil','Miraj','Admin',NULL);
insert into employee values (12,'Ronit','Patil','Miraj','Admin',NULL);


select * from employee;

insert into employee values (NAN,'Ronit',null,'Miraj','Admin',NULL);



select * from A;

select * from B;

select * from A cross join B;




select * from A left join B on A.AID= B.Aidd;


create table self2(s1 varchar (30),
 game_id varchar(30));



insert into self2 values ('1','A1'),('2','B1'),('3','C2'),('1','B1'),('4','T1'),('2','T1');

select * from self2;

select t1.s1,t2.game_id 
from self2 as t1,self2 as t2 
where t1.s1 = t2.s1 AND t1.game_id <> t2.game_id;
# equi join syntax

#
SELECT DISTINCT t1.s1, t1.game_id
FROM self2 AS t1
INNER JOIN self2 AS t2
ON t1.s1 = t2.s1 AND t1.game_id <> t2.game_id;

show tables;

select * from employee_details;


select *, row_number() over (order by managerID desc) as r_n from employee_details;


select * from employee_salary;

insert into employee_salary values (213,'shub',8999,21),(345,'ram',8966,54),(463,'om',9000,98),(834,'ajay',9000,325);

select * from employee_salary;


select *, row_number() over(order by Salary desc)
as 'row_num' from employee_salary;


select *, row_number() over(order by Salary desc)
as 'row_num' from employee_salary where row_num =2; #error 
#unknown column 


#so use cte


with shub as (select *, row_number() over(order by Salary desc)
as 'row_num' from employee_salary)
select * from shub where row_num =2;


with shub as (select *, row_number() over(order by Salary desc)
as 'row_num' from employee_salary)
select * from shub ;


create table omkar1 (name varchar(30),
id int auto_increment,
adress varchar(30),
mobile_num int, 
salary float,
DOB date,
salary_range varchar(30),
primary key(id,salary))
;


DELIMITER $$


CREATE TRIGGER set_salary_range
BEFORE INSERT ON omkar
FOR EACH ROW
BEGIN
    IF NEW.salary > 500 THEN
        SET NEW.salary_range = 'yes';
    ELSE
        SET NEW.salary_range = 'no';
    END IF;
END$$

DELIMITER ;



INSERT INTO omkar (name, adress, mobile_num, salary, DOB) 
VALUES ('John Doe', '123 Street', 1234567890, 600, '1990-01-01');

INSERT INTO omkar (name, adress, mobile_num, salary, DOB) 
VALUES ('Jane Doe', '456 Street', 1234567891, 400, '1995-05-15');



SELECT * FROM omkar;



create table employee2
(EID int,
FirstName varchar(20),
LastName varchar(20),
Loc varchar(20),
Dept varchar(20),
salary int);

insert into employee2 values (1,'Rohan','Mane','Sangali','HR',15000);
insert into employee2 values (2,'Sheetal','Chavan','Parbhani','Finance',25000);
insert into employee2 values (3,'Amit','Patil','Latur','HR',16000);
insert into employee2 values (4,'Riya','Verma','Pune','Account',20000);
insert into employee2 values (5,'Sita','Sharma','Patna','HR',15000);
insert into employee2 values (6,'Kirti','Gold','Solapur','Staffing',35000);
insert into employee2 values (7,'Sohan','Jadhav','Miraj','Account',45000);
insert into employee2 values (8,'Priyanka','Sharma','Nagpur','Finance',46000);
insert into employee2 values (9,'Virat','Patil','Jaipur','Staffing',34000);
insert into employee2 values (10,'Sohil','Khan','Mumbai','HR',33000);
insert into employee2 values (11,'Ronit','Patil','Miraj','Admin',NULL);

select * from employee2;




select * from employee2 where firstName like '%L%';


select * from employee2 where eid >2;


select * from employee2 where eid <> 4;


select * from employee2 where EID =5 or salary > 40000 or loc ='Pune';


insert into employee2 values (26,'',NULL,'pune','HR',0);

select * from employee2;

select * from employee2 where eid in (1,3,4,5);
select * from employee2 where eid not in (1,3,4,5);


select * from employee2 where firstname like 'A%' between like 'M%'; # error

SELECT * 
FROM employee2
WHERE left(firstname, 1) BETWEEN 'A' AND 'M'; #substring



select left(firstname,4)  from employee2;

select right(firstname,5) from employee2;


select substring_index(firstname,' ',1) as name_,lastname from employee2;
#substring_index

SET SQL_SAFE_UPDATES = 0;

# your code SQL here

SET SQL_SAFE_UPDATES = 1;

delete from employee2;


select * from employee2 where firstname like 'R%N';


select * from employee2 
where left (firstname,1) between 'A' and 'M';


select substring_index(firstname,' ', 1) as name,lastname from employee2;


select * from employee2;


select *, Monthlyincreament = salary+100 from employee2;  #not working

select *, salary+1000 as increment from employee2;   # alias

select *, salary*12 as LPA from employee2;

select * from employee2 where salary is NULL;

select * from employee2 where salary is not null;

select * from employee2 where firstname = '';


delete from employee2 where firstname = '';

select * from employee2;




create table UPDATE_DELETE (U_ID int, UNAME varchar(20) ,ULOC varchar(20))
;

insert into UPDATE_DELETE values (1,'Sagar','PUNE');
insert into UPDATE_DELETE values (2,'Amit','Sangli');

insert into UPDATE_DELETE values (3,'Sarika','Bijapur');
insert into UPDATE_DELETE values (4,'Rohan','Mumbai');
insert into UPDATE_DELETE values (5,'Amrita','Palampur');


select * from UPDATE_DELETE;


update update_delete 
set uname = 'Amita'
where uname = 'amit';

select * from update_delete;

update update_delete
set uloc ='bihar'
where u_id >= 3;

select * from update_delete;

select * from employee;


alter table employee
add primary key(EID); # error duplicate records


alter table employee
add  column address23 varchar(40),
add column adress_office varchar(30);
#multiple column added


select * from employee;

alter table employee 
drop column adress_office;


alter table employee 
drop column address23,
drop column address,
drop column address2;

select * from employee;

alter table employee 
change loc loc2 varchar(20);

select * from employee;

select * from employee order by salary desc;

select min(salary) from employee;


-- -1.min()
-- --2.max()
-- --3.count()
-- --4.TOP
-- --5.sum()
-- --6.avg()
-- --7.Distinct()

select max(salary)  as max_sal from employee;

select count(*) as cnt from employee;

select count(salary) as cnt from employee;

select count(40);

select Top 3 * from employee; # in mssql

select * from employee limit 3;


SELECT * FROM EMPLOYEE2;

SELECT *,AVG(SALARY) 
FROM EMPLOYEE2
GROUP BY DEPT ;
# * NOT POSIBLE


SELECT DEPT,AVG(SALARY) 
FROM EMPLOYEE2
GROUP BY DEPT ;


# Display the department name with highest salary?

SELECT DEPT,MAX(SALARY) AS MAX_SAL
 FROM EMPLOYEE2
 GROUP BY DEPT;
 
 
 SELECT * FROM EMPLOYEE2;
 
 SELECT DEPT, AVG(SALARY) AS AVG_SAL
 FROM EMPLOYEE2
 WHERE LOC IN ('PUNE','SOLAPUR','PATNA')
 GROUP BY DEPT 
 HAVING AVG(SALARY) BETWEEN 10000 AND 20000 
 ORDER BY AVG_SAL DESC
 LIMIT 3;
 
 This query will return the top 3 departments 
 (from locations 'PUNE', 'SOLAPUR', and 'PATNA') 
 where the average salary is between 10,000 and 20,000, 
 sorted by the average salary in descending order.
 
 How to display the department wise total salary is greater
 than 70000?

SELECT DEPT,SUM(SALARY) AS SUM_SAL 
FROM EMPLOYEE2
GROUP BY DEPT
HAVING SUM(SALARY) > 70000;

By Using Group by and Having Clause we can 
identify the duplicate records from table.

SELECT * FROM EMPLOYEE2;

INSERT INTO EMPLOYEE2 VALUES (13,'Ronit','Patil','mumbai','admin',null);

select firstname,count(*) as duplicate
from employee 
group by firstname
having count(*) >1;


select * from employee;

select firstname, loc2,count(*) as duplicate
from employee
group by firstname, loc2
having count(*) > 1;

select * from employee;

delete from employee where firstname in (
select firstname,count(*) as duplicate
from employee
group by firstname
having count(*) > 1)
#error 
 ;
 
 delete from employee where firstname in (
select firstname
from employee
group by firstname
having count(*) > 1)
#error
;
# use cte and window
select * from employee;

drop table employee;

CREATE TABLE employee (
    eid INT PRIMARY KEY,
    firstname VARCHAR(50),
    lastname VARCHAR(50),
    department VARCHAR(50)
);

-- Insert some sample data
INSERT INTO employee (eid, firstname, lastname, department) VALUES
(1, 'John', 'Doe', 'HR'),
(2, 'Jane', 'Smith', 'IT'),
(3, 'John', 'Doe', 'HR'),
(4, 'Michael', 'Johnson', 'Finance'),
(5, 'Jane', 'Smith', 'IT'),
(6, 'Emily', 'Davis', 'Marketing');

INSERT INTO employee (eid, firstname, lastname, department) VALUES
(3, 'John', 'Doe', 'HR')

select * from employee;


WITH CTE AS (
    SELECT eid, firstname, lastname, department,
           ROW_NUMBER() OVER (PARTITION BY firstname, lastname ORDER BY eid) AS rn
    FROM employee
)
DELETE FROM employee
WHERE eid IN (
    SELECT eid FROM CTE WHERE rn > 1
);


SELECT * FROM employee;

with cte as (
select firstname from employee
group by firstname,lastname,department
having count(*) > 1) 
select * from employee where firstname in cte
; #Error

select * from employee;


select count(*) from employee;

create table lucky 
(id varchar(30));

insert into lucky values ('apple'),('banana'),('orange'),(null);

select * from lucky;

select count(*) from lucky;

select count(id) from lucky;

select * from lucky order by id DESC;


--1.Primary Key
--2.Foreign Key
--3.NOT NULL key
--4.Unique Key
--5.Check Key
--6.Default key

drop table sql_is_easy;

# all constraints
create table sql_is_easy (
id int primary key,
name varchar(30),
roll_no int not null,
dept varchar(30) not null ,
salary float unique,
age int check (age > 18),
company_name varchar(40) default 'not in company');

create table sql_is_hard (
hard_id int,
foreign key (hard_id) references sql_is_easy(id));

select * from sql_is_easy;

insert into sql_is_easy values (1,'shubh',32,'HR',23534,17,'IBM');
#check constraint
insert into sql_is_easy values (0,'shubha',332,'HiR',235634,19,'IBM');

insert into sql_is_hard values (1);
	
insert into sql_is_hard values(null);
    

create table set1 (S_ID int ,SNAME varchar(20));

create table set2 (S_ID int ,SNAME varchar(20));

insert into set1 values(1,'A');
insert into set1 values(2,'B');
insert into set1 values(3,'C');
insert into set2 values(4,'D');
insert into set2 values(5,'E');
insert into set2 values(6,'F');
insert into set2 values(7,'G');
insert into set2 values(8,'H');
insert into set2 values(9,'Hamesha');


select * from set1
union 
select * from set2

select * from set1
union all
select * from set2

create table set3(
id int,name varchar(30));

insert into set3 values (32,'shub')
;

alter table set3
change name names varchar(35);

alter table set3
change names name char(20);

select * from set3;
;
select * from set1
union 
select * from set3
;

select * from set1
except 
select * from set3
# all values without intersection
;

select * from set3;
insert into set3 values (5,'lucky'),(5,'lucky')
;

select * from set3 
union 
select * from set3 
#unique values 

select * from employee2;

select * from set3
intersect
select * from set3


select *, dense_rank() over (partition by dept order by salary Desc) as 'd rank'
from employee2
;


with cte as (
select *, dense_rank() over (partition by dept order by salary Desc) as 'd_rank'
from employee2) 
select * from cte where d_rank = 2

;
select *,count(*)
from employee2
group by dept
order by desc
;

select *, sum(salary) over (partition by dept ) as total_sal
from employee2
;

select dept,sum(salary) from 
employee2
group by dept



select * from employee2;

select firstname, lastname,count(*)
from employee2
group by firstname, lastname
having count(*) > 1;


select max(eid)
from employee2
group by firstname, lastname
having count(*) > 1;

delete from employee2 where eid in (
		select max(eid)
		from employee2
		group by firstname, lastname
		having count(*) > 1);
#error so use cte
#this is because the substring is group by i guess
# Error Code: 1093. You can't specify target table 'employee2' 
 # for update in FROM clause



with cte as (select max(eid) as dup_id
from employee2
group by firstname, lastname
having count(*) > 1)		
delete from employee2 where eid in (select dup_id from cte)
#alias must for agg function
;

select * from employee2;


insert into employee2 values (13,'Ronit','Patil','Miraj','Admin',NULL);

select max(eid)
from employee2
group by firstname, lastname
having count(*) > 1;


select * from employee2;

insert into employee2 values (12,'Ronit','Patil','Miraj','HR',null),(13,'Virat','Patil','Miraj','HR',null)
;

select * from employee2;


select * from (
		select *,
		row_number() over (partition by Firstname,lastname) as rn
		from employee2 ) s
where s.rn >1
,

delete from employee2 
where eid in (
		select eid from (
				select *,
				row_number() over (partition by Firstname,lastname) as rn
				from employee2 ) s
		where s.rn >1)

select * from employee2;



insert into employee2 values (12,'Ronit','Patil','Miraj','HR',null),(13,'Virat','Patil','Miraj','HR',null)
;



delete from employee2
where eid not in(
	select min(eid) as mid
	from employee2
	group by firstname,lastname)
# Error Code: 1093. You can't specify target table 'employee2' 
# for update in FROM clause
;

delete from employee2 
where eid not in (
	select * from (
				select min(eid) as mid
				from employee2
				group by firstname,lastname) );
# Error Code: 1248. Every derived table must have its own alias

delete from employee2 
where eid not in (
	select * from (
				select min(eid) as mid
				from employee2
				group by firstname,lastname) s);
                
    
  select * from employee2;  

ALTER TABLE employee2
ADD COLUMN row_id INT AUTO_INCREMENT PRIMARY KEY;



create table employee21
as select distinct * from employee2;

drop table employee21;

select * from employee21;

select distinct * from employee2;

alter table employee2
drop column row_id;
# date and time
select now()
;

# 2024-11-21 20:14:45

SELECT NOW() - 1 as yesteday_date

#20241121201507

select DATEDIFF(year,'1987-09-13','2021-09-13') #not in mysql

select timestampdiff(year,'2002-09-13','2021-10-11') as year

select timestampdiff(month,'2024-10-29','2024-12-21') as mnt

select timestampdiff(day,'2023/01/22','2024/01/22') as dy

select date_add(now(),interval 2 MONTH) as jan_1st

select date_add(now(),interval 2 day) as day_after


# how to calculate your age

select (select timestampdiff(month,'2001-10-11',now()) as age) / 12;


Create table Account_details (
ACCT_NUMBER int primary key auto_increment,
ACCT_NAME varchar(20),
ACCT_OPEN_DATE date,
BRANCH Varchar(20))
;
insert into Account_details (acct_name,acct_open_date,branch) values ('Shubham','2015/12/09','MUMBAI');
insert into Account_details (acct_name,acct_open_date,branch) values ('Rihan','2016/01/12','Jaipur');
insert into Account_details (acct_name,acct_open_date,branch) values ('Sheetal','2017/08/11','GOA');
insert into Account_details (acct_name,acct_open_date,branch) values ('Priyanka','2017/01/01','Chennai');
insert into Account_details (acct_name,acct_open_date,branch) values ('Manik','2015/01/08','Agra');
insert into Account_details (acct_name,acct_open_date,branch) values ('Veena','2021/01/01','Patna');
insert into Account_details (acct_name,acct_open_date,branch) values ('Rohan','2019/07/01','Pune');
insert into Account_details (acct_name,acct_open_date,branch) values ('Laxmi',now(),'rohatak');
insert into Account_details (acct_name,acct_open_date,branch) values ('Jinal',now(),'Indore');

select * from account_details;


#.What is the age of your bank account 

select *, timestampdiff(year,acct_open_date,now()) as acc_age
from account_details;

# Calculate the no of accounts which is opened during the current year.

select * from (
select *, timestampdiff(year,acct_open_date,now()) as acc_age 
from account_details ) s
where s.acc_age = 0;
# as cte is slightly more good so i will use cte thank you bro subquery


with cte as ( select *, timestampdiff(year,acct_open_date,now()) as acc_age 
from account_details )
select * from cte where acc_age =0;

#
select hour(now());


select minute(now());

select second(now());

select year(now());

select month(now());

select day(now());

select * from Account_details ;

select date_add(now(),interval 3 week) as 3week
;

select timestampdiff(week,now(),'2024-12-30');

select timestampdiff(month,now(),'2024-12-30');

select * from account_details;


select upper(branch)
from account_details;

select *,SUBSTRING(FirstName,2,3) as FisrtLetter from employee
;


SELECT *, 
       SUBSTRING(FirstName, 5) AS FirstLetter, 
       CHAR_LENGTH(FirstName) AS Lengths
FROM employee;



create table length_check (Lid int, Lname char(20));

insert into length_check values(1,'Praveen');
insert into length_check values(2,'Amit');
insert into length_check values(3,'Meena');
insert into length_check values(4,'Sohan');
insert into length_check values(5,'Rajni');


select *,char_length(Lname) 
from length_check;


select *,length(Lname) as datalengths from length_check 
;

select *, concat(lname,' ',lid )
from length_check;

select REVERSE('PUNE');


select trim(lname)
from length_check;



SELECT REPLACE(Lname, Lname, CONCAT(Lname, ' by shub')) AS modified_lname
FROM length_check;


select * from length_check;


select substring_index(lname,' ',1) as firstname 
from length_check;

create table NULL_TEST(NID int, EMP_NAME varchar(20),Manager varchar(20));

insert into NULL_TEST values (1,'Piya','Sohan');
insert into NULL_TEST values (2,'kate',NULL);
insert into NULL_TEST values (3,'meera','aman');
insert into NULL_TEST values (4,'amit',NULL);
insert into NULL_TEST values (5,'sumit','Kiran');

select * from NULL_TEST;


select *, ifnull(manager,'No manager')  as check_manager from null_test;


select * from NULL_TEST;



select NID,EMP_NAME ,
				CASE
				when manager is NULL then 'NO Manager is present'  
				ELSE Manager
				END AS check_
from NULL_TEST
;


SELECT *,
       CASE
           WHEN emp_name IS NULL THEN 'NO Manager is present'
           WHEN emp_name = 'amit' then 'head'
           ELSE 'Standard individual'
       END AS _Status
from null_test
;

delete from null_test

select * from null_test;

select *
from null_test where 
emp_name not in ('a','e','i','o','u','A','E','I','O','U');


# Write SQL query to update all employees’ salary by 10%.


select * from employee2;


select *,salary*1.10 as '10%'
from employee2;

 
 select gender,age, avg(age)
 from table
 group by gender
 having avg(age) >30;
 
 
 find sum of salary of each depat excpt HR
 
 select dept,sum(salary) as total_salary
 from employee2
 where dept not in ('HR')
 group by dept
 
 find avg salary of each deparm from table where avg sal is less than 50000
 
Select dept,avg(salary) as avg_salary
 from employee2
 group by dept
 having avg_salary < 50000
 
 
 # dispaly students name who are out of maharashta and they are using lang English and hindi.
 
 
 CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100),
    location VARCHAR(100),
    languages VARCHAR(255)
);


INSERT INTO students (student_id, student_name, location, languages)
VALUES
(1, 'John Doe', 'Mumbai, Maharashtra', 'English, Hindi'),
(2, 'Jane Smith', 'Pune, Maharashtra', 'English'),
(3, 'Alice Brown', 'Delhi, Delhi', 'English, Hindi'),
(4, 'Bob Johnson', 'Bangalore, Karnataka', 'English, Hindi'),
(5, 'Charlie Lee', 'Chennai, Tamil Nadu', 'English'),
(6, 'David Harris', 'Surat, Gujarat', 'Hindi, Gujarati'),
(7, 'Eve White', 'Nagpur, Maharashtra', 'English, Marathi');
 

 
 # dispaly students name who are out of maharashta and they are using lang English and hindi.
 
 
 
 select * from students;
 
 
 select * 
 from students
 where location not like '%maharashtra%' 
 and languages like '%English%'
 and languages like '%hindi%'


How to calculate count of employee of each dept


select * from employee2;

select dept,count(*) as co_dep
from employee2
group by dept

;
INSERT INTO students (student_id, student_name, location, languages)
VALUES
(11, 'John Doe', 'Mumbai, Maharashtra', 'English, Hindi'),  -- Duplicate
(22, 'Jane Smith', 'Pune, Maharashtra', 'English');          -- Duplicate

# Display duplicate records for Name column


select * from students;


select student_name,count(*)
from students
group by student_name
having count(*) > 1
;

#with cte
with cte as (
	select max(student_id) as dup
from students
group by student_name
having count(*) > 1
)
delete 
from students
where student_id in (select dup from cte)
;


# without cte
delete
 from students
 where student_id in (	    
	select * from (select max(student_id)
	from students
	group by student_name
	having count(*) > 1) temo
        )
        ;
        
        
CREATE TABLE Employee_details2 (
    EmpId INT PRIMARY KEY,
    FullName VARCHAR(100),
    ManagerId INT,
    DateOfJoining DATE,
    City VARCHAR(50)
);


CREATE TABLE Employee_salary2 (
    EmpId INT,
    Project VARCHAR(10),
    Salary INT,
    Variable INT,
    FOREIGN KEY (EmpId) REFERENCES Employee_details2(EmpId)
);


INSERT INTO Employee_details2 (EmpId, FullName, ManagerId, DateOfJoining, City)
VALUES
(121, 'John Snow', 321, '2014-01-31', 'Toronto'),
(321, 'Walter White', 986, '2015-01-30', 'California'),
(421, 'Kuldeep Rana', 876, '2016-11-27', 'New Delhi');


INSERT INTO Employee_salary2 (EmpId, Project, Salary, Variable)
VALUES
(121, 'P1', 8000, 500),
(321, 'P2', 10000, 1000),
(421, 'P1', 12000, 0);


# SQL Query to fetch records that are present in one table but not in another table.

select * from Employee_details2;

select * from Employee_salary2;


# SQL Query to fetch records that are present in one table but not in another table.


select a.* 
from  employee_details2 a
left join employee_salary2 b
on a.empid = b.empid
where b.empid is null;


-- SQL Query to fetch records that are present in one table but not in another table.
-- SQL query to fetch all the employees who are not working on any project.
-- Fetch all employees from EmployeeDetails who have a salary record in EmployeeSalary.
-- Write an SQL query to fetch project-wise count of employees.
-- Fetch employee names and salary even if the salary value is not present for the employee.
-- Write an SQL query to fetch all the Employees who are also managers.

