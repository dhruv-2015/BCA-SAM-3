use [LAB 2]

insert into Department values (1, 'Admin', 'Adm', 'A-Block')
insert into Department values (2, 'Computer', 'CE', 'C-Block')
insert into Department values (3, 'Civil', 'CI', 'G-Block')
insert into Department values (4, 'Electrical', 'EE', 'E-Block')
insert into Department values (5, 'Mechanical', 'ME', 'B-Block')


insert into Person values (101, 'Rahul Tripathi', 2, 56000, '2000-01-01', 'Rajkot')
insert into Person values (102, 'Hardik Pandya', 3, 18000, '2001-09-25', 'Ahmedabad')
insert into Person values (103, 'Bhavin Kanani', 4, 25000, '2000-05-14', 'Baroda')
insert into Person values (104, 'Bhoomi Vaishnav', 1, 39000, '2005-02-08', 'Rajkot')
insert into Person values (105, 'Rohit Topiya', 2, 17000, '2001-07-23', 'Jamnagar')
insert into Person values (106, 'Priya Menpara', null, 9000, '2000-10-18', 'Ahmedabad')
insert into Person values (107, 'Neha Sharma', 2, 34000, '2002-12-25', 'Rajkot')
insert into Person values (108, 'Nayan Goswami', 3, 25000, '2001-07-01', 'Rajkot')
insert into Person values (109, 'Mehul Bhundiya', 4, 13500, '2005-01-09', 'Baroda')
insert into Person values (110, 'Mohit Maru', 5, 14000, '2000-05-25', 'Jamnagar')



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


