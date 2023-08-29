create database lab3
use lab3
select * from Person
select * from Department
-- 1.
Select Person.PersonName,Department.DepartmentID,DepartmentCode from Person inner join Department
on Person.DepartmentID = Department.DepartmentID
-- 2.
select MAX(Person.Salary)[MAX_Salary],MIN(Person.Salary)[MIN_Salary] ,Department.DepartmentName from Person inner join Department
on Person.DepartmentID = Department.DepartmentID
Group by Department.DepartmentName
--3.
select SUM(Person.Salary)[Sum_Of_Salary],Department.DepartmentName from Person inner join Department
on Person.DepartmentID = Department.DepartmentID
Group by Department.DepartmentName
having SUM(Person.Salary) > 100000
--4.
Select Person.PersonName,Person.Salary,Department.DepartmentName from Person Inner join Department
on Person.DepartmentID = Department.DepartmentID
Where Person.City = 'Jamnagar'
--5.
Select * from Person Left outer join Department
on Person.DepartmentID = Department.DepartmentID
Where Person.DepartmentID is NULL
--6.
Select Department.DepartmentName,COUNT(Department.DepartmentID)[Person count] from Person Left outer join Department
on Person.DepartmentID = Department.DepartmentID
Group by Department.DepartmentName
--7.
Select AVG(Person.Salary)[average_salary_of_ Ahmedabad_city] from Person Left outer join Department
on Person.DepartmentID = Department.DepartmentID
Where Person.City = 'Ahmedabad'
--8.
Select Person.PersonName + 'Earns' + CAST (Salary As varchar) + 'from Department'
from Person Left outer join Department
on Person.DepartmentID = Department.DepartmentID
--9.
Select Department.DepartmentName from Person full outer Join Department
on Person.DepartmentID = Department.DepartmentID
Group by Department.DepartmentName
Having COUNT(Person.DepartmentID)=0