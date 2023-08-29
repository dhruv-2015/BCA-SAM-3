create database [product info]

use [product info]

create table product_info (
	Pid int,
	Pname Varchar(50),
	Company_name Varchar(50),
	Mfg_date Datetime,
	Expiry_date Datetime,
	Price Decimal(8,2),
	Quantity int,
	Mfg_city Varchar(50)
)

insert into product_info values (101, 'Ipsum', 'Et', '1978-07-27', '1995-11-13', 5.00, 666778, 'North Lois')
insert into product_info values (103, 'Adipisci', 'Quidem', '1996-09-23', '2020-02-02', 1941.40, 17958868, 'South Dustin')
insert into product_info values (108, 'Alias', 'Perspiciatis', '1980-09-04', '1999-08-01', 1.00, 29, 'West Vince')
insert into product_info values (111, 'Ab', 'Labore', '1998-09-06', '1990-05-15', 406829.05, 7, 'Schillerberg')
insert into product_info values (118, 'Perferendis', 'Magnam', '1980-08-02', '2004-12-16', NULL, 102, 'North Rahul')
insert into product_info values (119, 'Sit', 'Quia', '1983-05-01', '1977-02-12', 770.96, 0, 'South Kaycee')
insert into product_info values (125, 'Unde', 'Quidem', '2006-09-30', '2021-08-12', 999999.99, 393363, 'West Rowlandview')
insert into product_info values (130, 'Illum', 'Repellendus', '1993-07-31', '1985-04-27', 1.16, 6220043, 'Lake Arthur')
insert into product_info values (131, 'Ut', 'Eum', '2019-10-05', '2008-01-01', 0.00, 1335521, 'East Santatown')
insert into product_info values (132, 'Quaerat', 'Est', '1986-05-08', '1998-09-06', 999999.99, 1595476, NULL)


select * from product_info


-- •	Retrieve the pname,company_name and sort the price in decending order
select Pname, Company_name, Price from product_info order by Price desc
-- •	Retrieve the average price of the product
select AVG(Price)[Average Price] from product_info
-- •	Retrieve the pname and quantity of the product with the highest price
select Pname, Quantity, Price from product_info 
-- •	Retrieve the pname and mfg_date of the product with the second earliest mfg_date

-- •	Make pname & price NULL, Whose price is 1941.40 & pname is adipisci
update product_info set Pname = NULL, Price = NULL where Price = 1941.40 and Pname = 'adipisci'
-- •	Display all the pname whose name’s second character is vowel
select Pname from [product_info] where Pname like '_[aeiou]%'
-- •	Write a query to convert ‘abc123efg’ to ‘abcXYZefg’ & ‘abcabcabc’ to ‘ab5ab5ab5’ using replace

-- •	Write a query to find out last date of current month

-- •	Calculate your age in years and months

-- •	Combine two strings (Your name & Surname) using + sign as well as CONCAT()

-- •	Display all the pname whose name starts from alphabet A to H

-- •	Display the difference between the highest and AVG price Label the column name to PRI_DIFFERENCE


