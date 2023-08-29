-- create database  Person_Info324
-- use  Person_Info324
use [LAB 2]

--1. Find all persons with their department name & code. 
select personname,departmentname,departmentcode from person left outer join department 
 on person.DepartmentID = department.DepartmentID

--2. Give department wise maximum & minimum salary with department name.
select max(salary)[max salary],min(salary)[min salary],city from person left outer join department 
 on person.DepartmentID = department.DepartmentID
 group by city

--3. Find all departments whose total salary is exceeding 100000.
select departmentname,sum(salary) from department left outer join person 
 on  department.DepartmentID = person.DepartmentID  
 group by departmentname
 having sum(salary) >100000

--4. Retrieve person name, salary & department name who belongs to Jamnagar city.
select personname,departmentname,salary from person left outer join department 
 on  person.DepartmentID  = department.DepartmentID
 where city = 'jamnagar'



--5. Find all persons who does not belongs to any department.
select personname from person
 where departmentid is null

--6. Find department wise person counts
select departmentname,count(personid) from person left outer join department 
 on  person.DepartmentID = department.DepartmentID 
 group by departmentname



--7. Find average salary of person who belongs to Ahmedabad city.
select avg(salary) from person
 where city =  'ahmedabad'

--8. Produce Output Like: <PersonName> earns <Salary> from department <DepartmentName> monthly.
--(In Single Column)
select personname + 'earns ' + cast(salary as varchar(50)) + 'from department '  + departmentname + ' monthly' from person left outer join department
 on  person.DepartmentID = department.DepartmentID


--9. List all departments who have no persons.
select departmentname from person left outer join department
 on  person.DepartmentID = department.DepartmentID 
 where personname is null


--10. Find city & department wise total, average & maximum salaries.
select departmentname,sum(salary)[total],avg(salary)[avg],max(salary)[max] from person left outer join department
 on  person.DepartmentID = department.DepartmentID 
 group by departmentname,city
--11. Display Unique city names.
select distinct city from person
--12. List out department names in which more than two persons.
select departmentname from department  left outer join person
 on  person.DepartmentID = department.DepartmentID 
group by departmentname
having count(personname) >=2
--13. Combine person name�s first three characters with city name�s last three characters in single --column.
select left(personname,3)+right(rtrim(city),3) from person
--14. Give 10% increment in Computer department employee�s salary.
update person set salary = salary + (salary/10) from person
select salary from person
--15. Display all the person name�s who�s joining dates difference with current date is more than 365 days
select personname from person 
where DATEDIFF(year,joiningdate,getdate())>1