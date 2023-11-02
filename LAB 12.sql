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

-- Part – A
-- 1. Create a function which displays total number of employees.
create function GetTotalEmployees()
RETURNS INT
AS
BEGIN
	Declare @len int; 
	select @len = count(*) from Employee;
	RETURN @len;
END

select dbo.GetTotalEmployees()[total_employees]
-- 2. Create a function which returns highest salary from Employee table.
create function Get_highest_salary()
RETURNS INT
AS
BEGIN
	Declare @len int; 
	select @len = max(Salary) from Employee;
	RETURN @len;
END
select dbo.Get_highest_salary()
-- 3. Create a function to get the age of the employee based on their joining date.
create or alter function age_of_the_employee_based_on_their_joining_date(@date date)
returns int
as
begin
	declare @exp int;
	set @exp = DATEDIFF(year,@date,GETDATE())
	return @exp;
end;
-- Part – B
-- 4. Create a function to calculate the net sales based on the quantity, price, and discount value.
create function cal_sales()
returns int
as
begin
	declare @totalemp int;
	select @totalemp = count(*) from Employee;
	return @totalemp;
end;

select dbo.cal_sales() as total
-- 5. Create a function that calculates the factorial of a given number.
create function factorial(@num int)
returns int
as
begin
	declare @sum int;
	SET @sum = 1;

	WHILE @num > 1
	BEGIN 	
		SET @sum = @sum * @num
		SET @num = @num - 1;
	END
	return @sum;
end;

select dbo.factorial(3)[Fac]
-- Part – C
-- 6. Create a function which returns minimum salary of female employee.
create or alter function  minimum_salary_of_female_employee()
returns int
as
begin
	declare @min int;
		select @min = min(Salary) from Employee
	return @min;
end;

select dbo.minimum_salary_of_female_employee()[MinSalary]
-- 7. Create a function which count unique city from employee table.
create or alter function unique_city()
returns int
as
begin
	declare @city int;
		select @city = count(DISTINCT City) from Employee
	return @city;
end;
select dbo.unique_city()[unique city]
-- 8. Create a Scalar-valued function that returns the name combined with salary of an employee based on their employee id and displayed output like ‘Roy having 3500 salary’.

create or alter function salary_of_an_employee(@id int)
returns varchar(100)
as
begin
	return (select EName + ' having ' + Cast(Salary as varchar(10)) + ' Salary.' from Employee where EID = @id)
end;
select dbo.salary_of_an_employee(3)[salary_of_an_employee]




-- Table Valued Functions
-- Part – A
-- 1. Create a function which retrieve the data of Employee table.
CREATE FUNCTION GetEmployee()
RETURNS TABLE
AS
BEGIN
	return (select * from Employee)
END;
-- 2. Create a function which returns an Employee table with city wise total salary.
-- 3. Create a function which returns an Employee table with gender wise maximum, minimum, total and average salaries.
-- Part – B
-- 4. Create a function which return an Employee table with details of employee whose name starts with J.
-- 5. Create a function to get all the male employees.
-- Part – C
-- 6. Create a function to get employees from a given city.
-- 7. Create a function that displays employees with a salary greater than a specified amount.
-- 8. Create a function to get employees who joined after a given specified date.
