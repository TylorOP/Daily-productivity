-- show databases;
-- use shub_123;
-- set global max_allowed_packet = 209715200;

drop table  sales_data_final;


CREATE TABLE sales_data_final (
    order_id VARCHAR(255),
    order_date DATE,
    ship_date DATE,
    ship_mode VARCHAR(255),
    customer_name VARCHAR(255),
    segment VARCHAR(255),
    state VARCHAR(255),
    country VARCHAR(255),
    market VARCHAR(255),
    region VARCHAR(255),
    product_id VARCHAR(255),
    category VARCHAR(255),
    sub_category VARCHAR(255),
    product_name VARCHAR(255),
    sales DECIMAL(10,2),
    quantity INT,
    discount DECIMAL(3,2),
    profit DECIMAL(10,2),
    shipping_cost DECIMAL(10,2),
    order_priority VARCHAR(255),
    year INT
);

CREATE TABLE sales_data_final (
	order_id VARCHAR(35) NOT NULL, 
	order_date VARCHAR(14) NOT NULL, 
	ship_date DATE NOT NULL, 
	ship_mode VARCHAR(14) NOT NULL, 
	customer_name VARCHAR(22) NOT NULL, 
	segment VARCHAR(11) NOT NULL, 
	state VARCHAR(36) NOT NULL, 
	country VARCHAR(32) NOT NULL, 
	market VARCHAR(6) NOT NULL, 
	region VARCHAR(14) NOT NULL, 
	product_id VARCHAR(16) NOT NULL, 
	category VARCHAR(15) NOT NULL, 
	sub_category VARCHAR(11) NOT NULL, 
	product_name VARCHAR(127) NOT NULL, 
	sales DECIMAL(38, 0) NOT NULL, 
	quantity DECIMAL(38, 0) NOT NULL, 
	discount DECIMAL(38, 3) NOT NULL, 
	profit DECIMAL(38, 5) NOT NULL, 
	shipping_cost DECIMAL(38, 2) NOT NULL, 
	order_priority VARCHAR(8) NOT NULL, 
	year DECIMAL(38, 0) NOT NULL
);

set global max_allowed_packet = 2097152000;

load data infile
'/Users/thispc/Desktop/untitled folder/sales_new_df.csv'
into table sales_data_final
fields terminated by ',' 
enclosed by '"'
lines terminated by '\n'
ignore 1 rows
(order_id, order_date, ship_date, ship_mode, customer_name, segment, state, country, market, region, product_id, category, sub_category, product_name, sales, quantity, discount, profit, shipping_cost, order_priority, year);

INSERT INTO sales_data_final 
(order_id, order_date, ship_date, ship_mode, customer_name, segment, state, country, market, region, product_id, category, sub_category, product_name, sales, quantity, discount, profit, shipping_cost, order_priority, year)
VALUES 
('AG-2011-2040', '2011-01-01', '2011-01-06', 'Standard Class', 'Toby Braunhardt', 'Consumer', 'Constantine', 'Algeria', 'Africa', 'Africa', 'OFF-TEN-10000025', 'Office Supplies', 'Storage', 'Tenex Lockers, Blue', 408, 2, 0, 106.14, 35.46, 'Medium', 2011),
('IN-2011-47883', '2011-01-01', '2011-01-08', 'Standard Class', 'Joseph Holt', 'Consumer', 'New South Wales', 'Australia', 'APAC', 'Oceania', 'OFF-SU-10000618', 'Office Supplies', 'Supplies', 'Acme Trimmer, High Speed', 120, 3, 0.1, 36.036, 9.72, 'Medium', 2011);

# all data clean in pandas then using sqlalchemy to dump 51k records in one click

# after cleaning the data in pandas this load data infile works

select * from sales_data_final;

select count(*) from sales_data_final;

DESCRIBE sales_data_final;

select str_to_date(order_date, '%Y-%m-%d') from sales_data_final;

alter table sales_data_final 
add order_date_new date after order_date  ;

update sales_data_final
set order_date_new = str_to_date(order_date, '%Y-%m-%d');

SET SQL_SAFE_UPDATES = 0 ;

select * from sales_data_final;

select order_id,discount, if (discount > 0, 'no', 'yes') as 
discount_flag from sales_data_final;

alter table sales_data_final
add column discount_flag varchar(30)
after discount;


update sales_data_final 
set discount_flag = if (discount > 0,'no','yes');

alter table sales_data_final 
rename column discount_flag to discount_flags;


DELIMITER &&
CREATE procedure SHUB()
BEGIN 
	SELECT * FROM SALES_DATA_FINAL;
END &&


CALL SHUB()


DELIMITER && 
CREATE PROCEDURE AVG_SALES_CATEGORY(IN TEMP VARCHAR(30))
BEGIN
	SELECT CATEGORY,AVG(SALES) FROM SALES_DATA_FINAL  WHERE CATEGORY = TEMP GROUP BY CATEGORY;
END &&


CALL SHUB();

CALL AVG_SALES_CATEGORY('Office Supplies');

CALL AVG_SALES_CATEGORY('Furniture');

DELIMITER &&
CREATE FUNCTION ADD_TO_COL( A INT)
RETURNS INT
DETERMINISTIC
BEGIN 
	DECLARE B INT;
    SET B = A + 10;
    RETURN B;
END &&

CALL SHUB();

SELECT ADD_TO_COL(sales ) from SALES_DATA_FINAL;


#hard coded value for function

DELIMITER &&
CREATE FUNCTION FINAL_PROFITS(PROFIT INT, DISCOUNT INT)
RETURNS INT
DETERMINISTIC
BEGIN
DECLARE FINAL_PROFIT INT;
SET FINAL_PROFIT = PROFIT - DISCOUNT;
RETURN FINAL_PROFIT;
END &&



SELECT FINAL_PROFITS(PROFIT,DISCOUNT) AS FINAL_PROFIT FROM SALES_DATA_FINAL;

DELIMITER &&
CREATE FUNCTION FINAL_PROFIT_REAL(PROFIT DECIMAL(20,6), DISCOUNT DECIMAL(20,6), SALES DECIMAL(20,6))
RETURNS INT
DETERMINISTIC
BEGIN
DECLARE FINAL_PROFIT INT;
SET FINAL_PROFIT = PROFIT - (SALES * DISCOUNT);
RETURN FINAL_PROFIT;
END &&

CALL SHUB;


SELECT FINAL_PROFIT_REAL(PROFIT, DISCOUNT, SALES) FROM SALES_DATA_FINAL;



DELIMITER &&
CREATE FUNCTION INT_TO_STR (A INT)
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN 
DECLARE B VARCHAR(20);
SET B = A;
RETURN B;
END &&


CALL SHUB;

SELECT * FROM SALES_DATA_FINAL;
COMMIT;

SELECT INT_TO_STR(SALES) FROM SALES_DATA_FINAL;

DESCRIBE SALES_DATA_FINAL;


SELECT INT_TO_STR(ORDER_ID) FROM SALES_DATA_FINAL; #EROR VARCHAR VALUE YOU ARE GIVING



#IF ELSEIF ELSE


-- SALES DO SEGMENTATION


DELIMITER &&
CREATE FUNCTION SALES_SEGMENT( SALES INT)
RETURNS VARCHAR(40)
DETERMINISTIC 
BEGIN 
DECLARE OUTPUT VARCHAR(40);
IF SALES <= 100 THEN
	SET OUTPUT = 'SUPER AFFORDABLE';
ELSEIF SALES >100 AND SALES <= 300 THEN 
	SET OUTPUT = 'AFFORDABLE';
ELSEIF SALES >300 AND SALES <= 600 THEN 
	SET OUTPUT = 'MODERATE';
ELSE 
	SET OUTPUT = 'EXPENSIVE';
SET OUTPUT = SALES;
END IF;
RETURN OUTPUT;
END &&

SELECT SALES_SEGMENT(234);

SELECT SALES, SALES_SEGMENT(SALES) AS SEGMENT FROM SALES_DATA_FINAL;


# LOOPING SO TO CREATE LOOPING WE NEED TO STORE DATA SOMEWERE SO CREATE TABLE

CREATE TABLE LOOP_TABLE(VAL INT);

SET @VAR = 10;
GENERATE_DATA : LOOP
SET @VAR = @VAR + 1;
IF @VAR = 100 THEN
	LEAVE GENERATE_DATA;
END IF;
END LOOP GENERATE_DATA;

-- THIS IS THE LOOP HOW DOES IT WORK ABOVE AND NOW JUST COPY IN FUNCTION THATIT
-- OR MAKE STORE PROCEDURE;


DELIMITER && 
CREATE PROCEDURE SHU2()
BEGIN 
SET @VAR = 10;
GENERATE_DATA : LOOP
INSERT INTO LOOP_TABLE VALUES (@VAR);
SET @VAR = @VAR + 1;
IF @VAR = 100 THEN
	LEAVE GENERATE_DATA;
END IF;
END LOOP GENERATE_DATA;
END &&

SELECT * FROM LOOP_TABLE;

CALL SHU2();

SELECT * FROM LOOP_TABLE;   #99 RECORDS




insert into loop_table (col1, col2) values(101, 201);


CALL SHUB();

SELECT * FROM LOOP_TABLE;

ALTER TABLE LOOP_TABLE 
ADD COLUMN SQUARE_OF_VAL INT AFTER VAL;

TRUNCATE LOOP_TABLE;

DELIMITER &&
CREATE PROCEDURE ADD_SQUARE2()
BEGIN
SET @VAR = 1;
GENERATE_DATA : LOOP
INSERT INTO LOOP_TABLE (VAL,SQUARE_OF_VAL) VALUES (@VAR,@VAR * @VAR);
SET @VAR = @VAR +1;
IF @VAR = 101 THEN
LEAVE GENERATE_DATA;
END IF;
END LOOP GENERATE_DATA;

END &&



CALL ADD_SQUARE2();

SELECT * FROM LOOP_TABLE;



SELECT * FROM SALES_DATA_FINAL ;


SELECT * FROM SALES_DATA_FINAL ORDER BY PROFIT DESC LIMIT 1 OFFSET 4;




