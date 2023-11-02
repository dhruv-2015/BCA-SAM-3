-- LAB – 13
CREATE DATABASE LAB13
USE LAB13
-- Employee_

CREATE TABLE Employee_
(
    Employee_ID int PRIMARY KEY,
    First_Name varchar(100),
    Last_Name varchar(50),
    Age int,
    Department varchar(50)
)

-- Inserting data

INSERT INTO Employee_
    (Employee_ID, First_Name, Last_Name, Age, Department)
VALUES
    (1, 'John', 'Doe', 30, 'HR'),
    (2, 'Jane', 'Smith', 25, 'Finance'),
    (3, 'Michael', 'Johnson', 35, 'IT'),
    (4, 'Emily', 'Williams', 28, 'Marketing'),
    (5, 'Robert', 'Brown', 22, 'IT');



-- From the above given table perform the following queries:
-- Part – A
-- 1. Create UDF to get the full name of an employee.
CREATE OR ALTER FUNCTION name_of_an_employee(@id int)
RETURNS VARCHAR(100)
AS
BEGIN
    return (select First_Name + ' ' + Last_Name
    from Employee_
    where Employee_ID = @id)
END

select dbo.name_of_an_employee(1)
-- 2. Create UDF to calculate the age of an employee based on the birth year.
CREATE OR ALTER FUNCTION age_of_an_employee(@id int)
RETURNS int
AS
BEGIN
    return (select YEAR(getdate()) - Age
    from Employee_
    where Employee_ID = @id)
END

select dbo.age_of_an_employee(2)[Year]
-- 3. Create UDF to get the number of employees in a specific department.
CREATE OR ALTER FUNCTION number_of_employees_in_a_specific_department(@department VARCHAR(100))
RETURNS int
AS
BEGIN
    return (select COUNT(*)
    from Employee_
    where department = @department)
END

select dbo.number_of_employees_in_a_specific_department('IT')[number_of_employees]
-- 4. Create UDF to concatenate the first name and last name with a custom separator.
CREATE OR ALTER FUNCTION first_name_and_last_name_with_a_custom_separator(@id int, @separator VARCHAR(10))
RETURNS VARCHAR(100)
AS
BEGIN
    return (select First_Name + @separator + Last_Name
    from Employee_
    where Employee_ID = @id)
END

select dbo.first_name_and_last_name_with_a_custom_separator(1, ', ')[Name]
-- 5. Create UDF to check if an employee is part of the IT department.
CREATE OR ALTER FUNCTION employee_is_part(@id int)
RETURNS INT
AS
BEGIN
    DECLARE @dep VARCHAR(100);

    (select @dep = Department from Employee_ where Employee_ID = @id)

    IF @dep = 'it'
        RETURN 1
    RETURN 0
END

select dbo.employee_is_part(1)

-- Part – B
-- 6. Create UDF to convert age into a friendly message.
-- 7. Create UDF to get the first initial of an employee's first name.
-- 8. Create UDF to find the average age of employees in a department.
-- 9. Create UDF to check if an employee exists in the table.
-- 10. Create UDF to get the last name in uppercase.
-- Part – C
-- 11. Create UDF to get the full name and department of an employee
-- 12. Create UDF to check if an employee is older than a specific age.
-- 13. Create UDF to get the number of employees older than a specific age.
-- 14. Create UDF to check if an employee's first name starts with a specific letter.
-- 15. Create UDF to calculate the years of experience based on the current year and an employee's starting year.
