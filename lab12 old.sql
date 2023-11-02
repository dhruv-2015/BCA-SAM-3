create database lab12
use lab12

-- Employee
CREATE TABLE Employee(
EID int Primary Key,
EName varchar(100),
Gender varchar(100),
JoiningDate date,
Salary decimal(8,2),
City varchar(100))
-- Inserting Data

INSERT INTO Employee (EID, EName, Gender, JoiningDate, Salary, City)
VALUES
	 (1, 'Nick', 'Male', '01-JAN-13', 4000, 'London'),
	 (2, 'Julian', 'Female', '01-OCT-14', 3000, 'New York'),
	 (3, 'Roy', 'Male', '01-JUN-16', 3500, 'London'),
	 (4, 'Tom', 'Male', NULL, 4500,'London'),
	 (5, 'Jerry', 'Male', '01-FEB-13', 2800, 'Sydney'),
	 (6, 'Philip', 'Male', '01-JAN-15', 7000, 'New York'),
	 (7, 'Sara', 'Female', '01-AUG-17', 4800, 'Sydney'),
	 (8, 'Emily', 'Female', '01-JAN-15', 5500, 'New York'),
	 (9, 'Michael', 'Male', NULL, 6500, 'London'),
	 (10, 'John', 'Malev', '01-JAN-15', 8800, 'London');

	select * from Employee

--Scalar Valued Functions
--Part � A
--1. Create a function which displays total number of employees.
create function gettotalemp()
returns int
as
begin
	declare @totalemp int;
	select @totalemp = count(*) from Employee;
	return @totalemp;
end;

select dbo.gettotalemp() as total
--2. Create a function which returns highest salary from Employee table.
create function maxsalary()
returns int
as
begin
	declare @maxsal decimal(8,2)
	select @maxsal = max(Salary) from Employee;
	return @maxsal;
end;

select dbo.maxsalary() as maxsalary
--3. Create a function to get the age of the employee based on their joining date.
create or alter function expofemp(@date date)
returns int
as
begin
	declare @exp int;
	set @exp = DATEDIFF(year,@date,GETDATE())
	return @exp;
end;
select  dbo.expofemp (JoiningDate) from Employee


--Part � B
--4. Create a function to calculate the net sales based on the quantity, price, and discount value.
create function cal_sales()
returns int
as
begin
	declare @totalemp int;
	select @totalemp = count(*) from Employee;
	return @totalemp;
end;

select dbo.gettotalemp() as total
--5. Create a function that calculates the factorial of a given number.
--Part � C
--6. Create a function which returns minimum salary of female employee.
--7. Create a function which count unique city from employee table.
--8. Create a Scalar-valued function that returns the name combined with salary of an employee based on 
--their employee id and displayed output like �Roy having 3500 salary�.

--Table Valued Functions
--Part � A
--1. Create a function which retrieve the data of Employee table.
create function getalldata()
returns table
as
	return 
	select * from Employee


select * from  getalldata()
--2. Create a function which returns an Employee table with city wise total salary. 
create or alter function citywise_sal()
returns table
as
	return 
	select city,sum(Salary) as salary from Employee group by City


select * from  citywise_sal()
--3. Create a function which returns an Employee table with gender wise maximum, minimum, total and average salaries.
create or alter function gender_wise()
returns table
as
	return 
	select Gender,MAX(Salary) as maxsal,MIN(Salary) as minsal ,sum(Salary) as totalsal,AVG(Salary) as avgsal from Employee group by Gender

	select * from  gender_wise()
--Part � B
--4. Create a function which return an Employee table with details of employee whose name starts with J.
create or alter function name_startwith_j()
returns table
as
	return 
	select EName from Employee where EName like 'j%'

	select * from name_startwith_j()
--5. Create a function to get all the male employees.
create or alter function male_emp()
returns table
as
	return 
	select EName from Employee where Gender = 'male'

	select * from male_emp()
--Part � C
--6. Create a function to get employees from a given city.
create or alter function emp_from_city(@emp varchar(50))
returns table
	as
	return 
	select EName from Employee where city = @emp

	select * from emp_from_city('London') 
--7. Create a function that displays employees with a salary greater than a specified amount.
--8. Create a function to get employees who joined after a given specified date.
