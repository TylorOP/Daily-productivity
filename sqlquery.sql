-- show databases;
-- use shub_db;

-- create table if not exists banking (
-- age int,
-- job varchar(30),
-- marital varchar(30),
-- day varchar(30),
-- balance int,
-- y varchar(30)
-- )

-- alter table banking 
-- add column `default` varchar(30);


-- select * from banking;

-- insert into banking values (12,'IT','married','mon',65434,'yes','yes');

-- select age, job, day from banking;

-- select `default` from banking;

-- select * from banking limit 9;

--  

-- INSERT INTO banking (age, job, marital, day, balance, y)
-- VALUES 
-- (23, 'student', 'single', 'Monday', 200, 'no'),
-- (47, 'management', 'married', 'Tuesday', 2500, 'yes'),
-- (36, 'blue-collar', 'divorced', 'Wednesday', 800, 'no'),
-- (50, 'self-employed', 'married', 'Thursday', 4000, 'yes'),
-- (28, 'unemployed', 'single', 'Friday', 100, 'no'),
-- (39, 'housemaid', 'married', 'Saturday', 1300, 'yes'),
-- (33, 'technician', 'single', 'Sunday', 900, 'no'),
-- (60, 'retired', 'married', 'Monday', 3500, 'yes'),
-- (41, 'services', 'divorced', 'Tuesday', 600, 'no'),
-- (37, 'admin.', 'single', 'Wednesday', 1700, 'yes');


-- select * from banking;

-- select sum(balance) as avg_bal from banking;


-- select * from banking where balance > (select avg(balance) from banking);


-- select count(*),min(balance),max(balance) from banking;

-- select * from banking where `default` = 'yes';


-- select * from banking where `day` = 'WednEsday';


-- select avg(balance),marital from banking where marital = 'married';

-- select * from banking;

-- select max(age),max(job) from banking group by age order by age desc limit 1,100. 
# leaving 1 how many

-- CALL SHUBHAM();

-- DELIMITER &&
-- create procedure marital_avg(in df varchar(30))
-- BEGIN 
-- 	select avg(balance) from banking where marital = df;
-- END &&
# FOR SINGLE VARIABLE

-- call marital_avg('single')


-- DELIMITER &&
-- CREATE PROCEDURE JOB_DEFAULT_BAL_ABOVE_500( IN V1 VARCHAR(30), IN V2 VARCHAR(10) )
-- BEGIN 
-- 	SELECT * FROM BANKING 
-- 	WHERE JOB = V1 AND (BALANCE > 500 OR `DEFAULT` = V2);
-- END &&


-- CALL JOB_DEFAULT_BAL_ABOVE_500('IT','YES
-- ')


CREATE VIEW BANK_SHORT AS SELECT BALANCE,Y,JOB FROM BANKING;


SELECT * FROM BANK_SHORT;


show tables;


create table clone like banking;

select * from banking;

alter table banking
add column dep varchar(30);

update banking b
join clone c
on b.dep = c.job
set b.new_dep = c.new_dep;
