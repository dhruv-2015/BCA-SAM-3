-- Employees

create database LAB12
use LAB12

CREATE TABLE Employees
(
    Emp_ID int Primary Key,
    Emp_Name varchar(50) NOT NULL,
    Emp_Salary decimal(8,2),
    Department varchar(50) NOT NULL,
    Hire_Date date NOT NULL
)


-- Inserting Data

INSERT INTO Employees (Emp_ID , Emp_Name, Emp_Salary, Department, Hire_Date)
VALUES (1, 'John', 50000.00, 'Sales', '2022-01-15'),
    (2, 'Jane', 60000.00, 'Marketing', '2021-05-10'),
    (3, 'Mike', 75000.00, 'IT', '2020-09-20'),
    (4, 'Emily', 45000.00, 'Finance', '2023-02-28'),
    (5, 'David', 80000.00, 'IT', '2021-11-05');



-- Part – A
-- 1. Create a Stored Procedure to Retrieve Employee Information
CREATE OR ALTER PROCEDURE SP_Employees_Retrieve
AS
begin
    SELECT * FROM Employees
end

-- 2. Create a Stored Procedure to Update Employee Salary.
CREATE OR ALTER PROCEDURE SP_Employees_Update_Salary
    @Emp_ID int,
    @Emp_Salary decimal(8,2)
AS
begin
    UPDATE Employees SET Emp_Salary = @Emp_Salary WHERE Emp_ID = @Emp_ID
end
-- 3. Create a Stored Procedure to Calculate Average Salary in a Department.
CREATE OR ALTER PROCEDURE SP_Employees_Average_Salary_BY_Department
	@Department varchar(50)
AS
begin
    SELECT AVG(Emp_Salary)[Average_Salary] FROM Employees where Department = @Department
end
-- 4. Create a Stored Procedure to Delete Inactive Employees.
CREATE OR ALTER PROCEDURE SP_Employees
AS
begin
delete Employees WHERE DATEDIFF(DAY, Hire_Date,GETDATE()) > 365
END
-- 5. Create a Stored Procedure to Generate Monthly Salary Report.
CREATE OR ALTER PROCEDURE SP_Employees_Monthly_Salary_Report
AS
begin
select FORMAT(Hire_Date, 'MM-yyyy')[S], Emp_Name from  Employees
END
-- Part – B
-- 6. Create a Stored Procedure to Get Highest Paid Employee.
CREATE OR ALTER PROCEDURE SP_Employees_Highest_Paid_Employee
AS
begin
    SELECT * FROM Employees WHERE Emp_Salary = (SELECT MAX(Emp_Salary) FROM Employees )
end
-- 7. Create a Stored Procedure to Get Employees Hired in a Specific Year.
CREATE OR ALTER PROCEDURE SP_Employees_Highest_Get_Employees_By_Specific_Year
	@Date int
AS
begin
    SELECT * FROM Employees WHERE YEAR(Hire_Date) = @Date
end

-- 8. Create a Stored Procedure to Calculate Total Salary Expense.
CREATE OR ALTER PROCEDURE SP_Employees_Total_Salary_Expense
AS
begin
    SELECT SUM(Emp_Salary)[Total_Salary_Expense] FROM Employees
end
-- 9. Create a Stored Procedure to Update Employee Department.
CREATE OR ALTER PROCEDURE SP_Employees_Update_Employee_Department
	@Emp_ID int,
	@Department varchar(50)
AS
begin
    update Employees set Department = @Department where Emp_ID = @Emp_ID
end
-- 10. Create a Stored Procedure to Get Employees with a Specific Salary Range.
CREATE OR ALTER PROCEDURE SP_Employees_Specific_Salary_Rang
	@R1 decimal(8,2),
	@R2 decimal(8,2)
AS
begin
	if(@R1 <= @R2)

		select * from Employees where Emp_Salary >= @R1 and Emp_Salary <= @R2
	
	ELSE
	
		select * from Employees where Emp_Salary <= @R2 and Emp_Salary >= @R1
	
END
-- Part – C
-- 11. Create a Stored Procedure to Get Employees by Name.
CREATE OR ALTER PROCEDURE SP_Employees_Get_Employees_by_Name
	@Emp_Name varchar(50)
AS
begin
	select * from Employees where Emp_Name = @Emp_Name
END
-- 12. Create a Stored Procedure to Get Employees with the Longest Tenure.

CREATE OR ALTER PROCEDURE SP_Employees_Get_Employees_with_the_Longest_Tenure
AS
begin
	-- select * from Employees where Hire_Date = (select MAX(Hire_Date) from Employees)
	-- or 
	select top 1 * from Employees order by Hire_Date desc
END
-- 13. Create a Stored Procedure to Calculate the Total Number of Employees in Each Department.
CREATE OR ALTER PROCEDURE SP_Employees_Get_Total_Number_of_Employees_in_Each_Department
AS
begin
	select COUNT(Emp_ID)[Number_of_Employees], Department from Employees group by Department
END
-- 14. Create a Stored Procedure to Delete Employees by Salary Range.
CREATE OR ALTER PROCEDURE SP_Employees_Delete_Employees_by_Salary_Range
	@R1 decimal(8,2),
	@R2 decimal(8,2)
AS
begin
	if(@R1 <= @R2)
		DELETE Employees where Emp_Salary >= @R1 and Emp_Salary <= @R2
	ELSE
		DELETE Employees where Emp_Salary <= @R2 and Emp_Salary >= @R1
END
-- 15. Create a Stored Procedure to Calculate the Average Salary for Each Department.
CREATE OR ALTER PROCEDURE SP_Employees_Average_Salary
AS
begin
    SELECT AVG(Emp_Salary)[Average_Salary], Department FROM Employees GROUP BY Department
end