use [LAB 2 new]

insert into Employee values (1, 'Nick', 'Male', '2013-01-01', 4000, 'London')
insert into Employee values (2, 'Julian', 'Female', '2014-10-01', 3000, 'New YorK')
insert into Employee values (3, 'Roy', 'Male', '2016-6-01', 3500, 'London')
insert into Employee values (4, 'Tom', 'Male', NULL, 4500, 'London')
insert into Employee values (5, 'Jerry', 'Male', '2013-02-01', 4500, 'Sydney')
insert into Employee values (6, 'Philip', 'Male', '2015-02-01', 7000, 'New YorK')
insert into Employee values (7, 'Sara', 'Female', '2017-08-01', 7000, 'Sydney')
insert into Employee values (8, 'Emily', 'Female', '2015-01-01', 5500, 'New York')
insert into Employee values (9, 'Michael', 'Male', Null, 6500, 'London')
insert into Employee values (10, 'John', 'Male', '2015-01-01', 8800, 'London')

select * from Employee


-- 1. Display all the employees whose name starts with “m” and 4th character is “h”.
select * from Employee where EName like 'm__h%'
-- 2. Find the value of 3 raised to 5. Label the column as output.
select POWER(3, 5)[output]
-- 3. Write a query to subtract 20 days from the current date.
select GETDATE() - 20
-- 4. Write a query to display name of employees whose name starts with “j” and contains “n” in their name.
select * from Employee where EName like 'j%n%'
-- 5. Display 2nd to 9th character of the given string “SQL Programming”.
select SUBSTRING('SQL Programming', 2, 8)
-- 6. Display name of the employees whose city name ends with “ney” &contains six characters.
select EName from Employee where City like '___ney'
-- 7. Write a query to convert value 15 to string.
select CONVERT(varchar, 15)
-- 8. Add department column with varchar (20) to Employee table.
alter table Employee add department varchar(20)
-- 9. Set the value of department to Marketing who belongs to London city.
update Employee set department='Marketing' where City = 'London'
-- 10. Display all the employees whose name ends with either “n” or “y”.
select * from Employee where EName like '%n' or EName like '%y'
-- 11. Find smallest integer value that is greater than or equal to 63.1, 63.8 and -63.2.
select round(63.1, 0)[63.1], round(63.8, 0)[63.8], round(-63.2, 0)[-63.2]
select floor(63.1)[63.1], floor(63.8)[63.8], floor(-63.2)[-63.2]
select ceiling(63.1)[63.1], ceiling(63.8)[63.8], ceiling(-63.2)[-63.2]
-- 12. Display all employees whose joining date is not available.
select * from Employee where JoiningDate is null
-- 13. Display name of the employees in capital letters and city in small letters.
select UPPER(EName), LOWER(City) from Employee
-- 14. Change the data type of Ename from varchar (30) to char (30).
alter table Employee alter column Ename char(30)
-- 15. Display city wise maximum salary.
select max(Salary), City from Employee group by City
select Salary from Employee
-- 16. Produce output like <Ename> works at <city> and earns <salary>.
select CONCAT(Ename, 'Works at ', City, ' and earns ', Salary)  [Info] from Employee 
-- or
select Ename + 'Works at ' + City + ' and earns ' + CONVERT(varchar, Salary)  [Info] from Employee 
-- 17. Find total number of employees whose salary is more than 5000.
select COUNT(EID)[Count] from Employee where Salary > 5000
-- 18. Write a query to display first 4 & last 3 characters of all the employees.
select LEFT(EName, 4)[first 4], RIGHT(RTRIM(EName), 3)[last 3] from Employee
-- 19. List the city having total salaries more than 15000 and employees joined after 1st January, 2014.
select City, SUM(Salary)[Salary] from Employee where JoiningDate > '2014-01-01' group by City having SUM(Salary) > 15000
-- 20. Write a query to replace “u” with “oo” in Ename.
select REPLACE(Ename, 'u', 'oo')[Ename] from Employee
-- 21. Display city with average salaries and total number of employees belongs to each city.
select City, avg(Salary)[Average Salaries], count(EID)[Number Of Employees] from Employee group by City
-- 22. Display total salaries paid to female employees.
select sum(Salary)[Total Salaries Paid To Female Employees] from Employee where Gender = 'Female'
-- 23. Display name of the employees and their experience in years.
select EName, DATEDIFF(YEAR, JoiningDate, GETDATE())[Experience] from Employee
-- 24. Remove column department from employee table.
alter table Employee drop column department
-- 25. Update the value of city from syndey to null.
update Employee set City = NULL where City = 'syndey'
-- 26. Retrieve all Employee name, Salary & Joining date.
select EName, Salary, JoiningDate from Employee
-- 27. Find out combine length of Ename & Gender.
select len(Ename)+len(Gender)[Length] from Employee
-- 28. Find the difference between highest & lowest salary
select max(Salary)-MIN(Salary)[Difference] from Employee
-- 29. Rename a column from Ename to FirstName.
sp_rename 'Employee.Ename', 'FirstName', 'column'select * from Employee-- 30. Rename a table from Employee to EmpMaster.sp_rename 'Employee', 'EmpMaster'select * from EmpMaster