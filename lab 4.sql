create database LAB4
use LAB4

insert into Student values (101, 'Raju', 'CE', 8.80, 0)
insert into Student values (102, 'Amit', 'CE', 2.20, 3)
insert into Student values (103, 'Sanjay', 'ME', 1.50, 6)
insert into Student values (104, 'Neha', 'EC', 7.65, 1)
insert into Student values (105, 'Meera', 'EE', 5.52, 2)
insert into Student values (106, 'Mahesh', 'EC', 4.50, 3)


select * from Student


-- RNo Name Branch SPI Bklog

-- 1. Create a view Personal with all columns.
create view Personal as select * from Student
select * from Personal
-- 2. Create a view Student_Details having columns Name, Branch & SPI.
create view Student_Details as select Name, Branch, SPI from Student
select * from Student_Details
-- 3. Create a view Academic having columns RNo, Name, Branch.
create view Academic as select RNo, Name, Branch from Student
select * from Academic
-- 4. Create a view Student_Data having all columns but students whose bklogs are more than 2.
create view Student_Data as select * from Student where Bklog = 2 or Bklog > 2
select * from Student_Data 
-- 5. Create a view Student_Pattern having RNo, Name & Branch columns in which Name consists of four letters.
create view Student_Pattern as select RNo, Name, Branch from Student where Name like '____'
select * from Student_Pattern 
-- 6. Insert a new record to Academic view. (107, Meet, ME). Remaining all columns must be null.
insert into Academic values(107, 'Meet', 'ME')
select * from Academic
-- 7. Update the branch of Amit from CE to ME in Student_Details view.
update Student_Details set Branch = 'ME' where Name = 'Amit'
-- 8. Delete a student whose roll number is 104 from Academic view.
delete Academic where RNo = 104
-- 9. Create a view that displays information of all students whose spi is above 8.5.
create view Above as select * from Student where SPI > 8.5
select * from Above 
-- 10. Create a view that displays 0 backlog students.
create view ZeroBacklog as select * from Student where Bklog = 0
select * from ZeroBacklog

 


-- part 2

insert into Customer values (1, 'John', 'Doe')
insert into Customer values (2, 'Jane', 'Smith')
insert into Customer values (3, 'Michael', 'Johnson')
insert into Customer values (4, 'Mark', 'Wood')
insert into Customer values (5, 'Moin', 'Khan')

select * from Customer 
select * from Account

insert into Account values (101, 1, 5000, 'Current', '2023-01-01')
insert into Account values (102, 1, 8000, 'Saving', '2023-02-25')
insert into Account values (103, 2, 10000, 'Saving', '2023-03-30')
insert into Account values (104, 4, 15000, 'Current', '2020-06-15')
insert into Account values (105, 3, 7500, 'Saving', '2021-11-27')
insert into Account values (106, 5, 13450, 'Current', '2019-10-13')


--  1. Create view that displays all the customers along with their corresponding account balances.
create view allAccounts as select Customer.FirstName, Customer.LastName, Account.Balance from Account left outer join Customer on Account.CustomerID = Customer.CustomerID 
select * from allAccounts
--  2. Create view that displays total balance for each customer.
create view TotalBal as 
select sum(Account.Balance)[TotalBalance] from Account left outer join Customer on Account.CustomerID = Customer.CustomerID Group by Account.CustomerID
select * from TotalBal
--  3. Create view that displays customers who have multiple accounts.
create view MultipleAccounts as 
select Account.CustomerID from Account left outer join Customer on Account.CustomerID = Customer.CustomerID Group by Account.CustomerID Having count(Account.CustomerID) > 1
select * from MultipleAccounts 
--  4. Create a view that displays customer details who have an account created in the last month.
create view LastMonthAccounts as
select Account.CustomerID, Customer.FirstName from Account left outer join Customer on Account.CustomerID = Customer.CustomerID where DATEDIFF(MONTH, Account.CreatedDate, getdate()) <= 1
select * from LastMonthAccounts 
--  5. Create a view that displays customers who have the highest account balance.
create view MaxBalance as
select Customer.CustomerID, Customer.FirstName, Customer.LastName from Account left outer join Customer on Account.CustomerID = Customer.CustomerID where Account.Balance = (select max(Account.Balance)[Balance] from Account left outer join Customer on Account.CustomerID = Customer.CustomerID)

select * from MaxBalance