-- LAB – 10
create database LAB_SP_10_NEW
use LAB_SP_10_NEW

-- Department
CREATE TABLE Department
(
    DepartmentID Int Primary Key,
    DepartmentName Varchar(100) Not Null Unique
)

-- Designation
CREATE TABLE Designation
(
    DesignationID Int Primary Key,
    DesignationName Varchar(100) Not Null Unique
)

-- Person
CREATE TABLE Person
(
    WorkerID Int IDENTITY(101,1) PRIMARY KEY,
    FirstName Varchar(100) Not Null,
    LastName Varchar(100) Not Null,
    Salary Decimal(8,2) Not Null,
    JoiningDate Datetime Not Null,
    DepartmentID Int Null FOREIGN KEY REFERENCES Department(DepartmentID),
    DesignationID Int Null FOREIGN KEY REFERENCES Designation(DesignationID)
)

-- Part – A
-- 1. All the tables Insert, Update Delete.
-- Insert
CREATE OR ALTER PROCEDURE SP_Department_Insert
    @DepartmentID Int,
    @DepartmentName Varchar(100)
AS
begin
    INSERT INTO Department
        (DepartmentID, DepartmentName)
    VALUES
        (@DepartmentID, @DepartmentName)
end
EXECUTE SP_Department_Insert 1, 'Admin'
EXECUTE SP_Department_Insert 2, 'IT'
EXECUTE SP_Department_Insert 3, 'HR'
EXECUTE SP_Department_Insert 4, 'Account'


CREATE OR ALTER PROCEDURE SP_Designation_Insert
    @DesignationID Int,
    @DesignationName Varchar(100)
AS
begin
    INSERT INTO Designation
        (DesignationID, DesignationName)
    VALUES
        (@DesignationID, @DesignationName)
end
EXECUTE SP_Designation_Insert 11, 'Jobber'
EXECUTE SP_Designation_Insert 12, 'Welder'
EXECUTE SP_Designation_Insert 13, 'Clerk'
EXECUTE SP_Designation_Insert 14, 'Manager'
EXECUTE SP_Designation_Insert 15, 'CEO'


CREATE OR ALTER PROCEDURE SP_Person_Insert
    @FirstName Varchar(100),
    @LastName Varchar(100),
    @Salary Decimal(8,2),
    @JoiningDate Datetime,
    @DepartmentID Int,
    @DesignationID Int
AS
begin
    INSERT INTO Person
        (FirstName, LastName, Salary, JoiningDate, DepartmentID, DesignationID)
    VALUES
        (@FirstName, @LastName, @Salary, @JoiningDate, @DepartmentID, @DesignationID)
end
EXECUTE SP_Person_Insert 'Rahul', 'Anshu', 56000, '1990-01-01', 1, 12
EXECUTE SP_Person_Insert 'Hardik', 'Hinsu', 18000, '1990-09-25', 2, 11
EXECUTE SP_Person_Insert 'Bhavin', 'Kamani', 25000, '1991-05-14', NULL, 11
EXECUTE SP_Person_Insert 'Bhoomi', 'Patel', 39000, '2014-02-20', 1, 13
EXECUTE SP_Person_Insert 'Rohit', 'Rajgor', 17000, '1990-07-23', 2, 15
EXECUTE SP_Person_Insert 'Priya', 'Mehta', 25000, '1990-10-18', 2, NULL
EXECUTE SP_Person_Insert 'Neha', 'Trivedi', 18000, '2014-02-20', 3, 15



-- Update

CREATE OR ALTER PROCEDURE SP_Department_Update
    @DepartmentID Int,
    @DepartmentName Varchar(100)
AS
BEGIN
    UPDATE Department SET DepartmentName = @DepartmentName where DepartmentID = @DepartmentID
END

CREATE OR ALTER PROCEDURE SP_Designation_Update
    @DesignationID Int,
    @DesignationName Varchar(100)
AS
BEGIN
    UPDATE Designation SET DesignationName = @DesignationName WHERE DesignationID = @DesignationID
END

CREATE OR ALTER PROCEDURE SP_Person_Update
    @WorkerID int,
    @FirstName Varchar(100),
    @LastName Varchar(100),
    @Salary Decimal(8,2),
    @JoiningDate Datetime,
    @DepartmentID Int,
    @DesignationID Int
AS
BEGIN
    UPDATE Person SET FirstName = @FirstName, LastName = @LastName, Salary = @Salary, JoiningDate = @JoiningDate, DepartmentID = @DepartmentID, DesignationID = @DesignationID where WorkerID = @WorkerID
END


exec SP_Department_Update 3, 'Hc'
select * from Department
exec SP_Department_Update 3, 'HR'


exec SP_Designation_Update 15, 'CCEO'
select * from Designation
exec SP_Designation_Update 15, 'CEO'

exec SP_Person_Update 101, 'Rahul new', 'Anshu new', 56000, '1990-01-01', 1, 12
select * from Person
exec SP_Person_Update 101, 'Rahul', 'Anshu', 56000, '1990-01-01', 1, 12


-- delete


CREATE PROCEDURE SP_Department_Delete
    @DepartmentID Int
AS
BEGIN
    DELETE Department WHERE DepartmentID = @DepartmentID
END

CREATE PROCEDURE SP_Designation_Delete
    @DesignationID Int
AS
BEGIN
    DELETE Designation WHERE DesignationID = @DesignationID
END

CREATE PROCEDURE SP_Person_Delete
    @WorkerID Int
AS
BEGIN
    DELETE Person WHERE WorkerID = @WorkerID
END

EXEC SP_Person_Delete 107
EXEC SP_Department_Delete 3

EXEC SP_Designation_Delete 16


-- 2. Create a stored procedure that takes department name as an input and returns a table with all workers working in that department.

CREATE PROCEDURE SP_Person_Get_From_DepartmentName 
    @DepartmentName Varchar(100)
AS
BEGIN
select * from Department INNER JOIN Person ON Department.DepartmentID = Person.DepartmentID WHERE DepartmentName = @DepartmentName
END
exec SP_Person_Get_From_DepartmentName 'IT'




-- Part – B
-- 3. Create procedure that takes department name & designation name as input and returns a table with worker’s first name, salary, joining date & department name.
CREATE PROCEDURE SP_Person_From_DepartmentName_AND_DesignationName
    @DepartmentName Varchar (100), 
    @DesignationName Varchar (100)
AS
BEGIN
select * from Person INNER JOIN Department ON Person.DepartmentID = Department.DepartmentID INNER JOIN Designation on Person.DesignationID = Designation.DesignationID WHERE DepartmentName = @DepartmentName and DesignationName = @DesignationName
END

exec SP_Person_From_DepartmentName_AND_DesignationName 'IT', 'CEO'
-- 4. Create a Procedure that takes the first name as an input parameter and display all the details of the worker with their department & designation name.
CREATE PROCEDURE SP_Person_From_PersonName
    @Name Varchar (100)
AS
BEGIN
select * from Person INNER JOIN Department ON Person.DepartmentID = Department.DepartmentID INNER JOIN Designation on Person.DesignationID = Designation.DesignationID where FirstName = @Name
END

EXEC SP_Person_From_PersonName 'Rohit'
-- Part – C
-- 5. Create Procedure which displays department wise maximum, minimum & total salaries.
CREATE PROCEDURE SP_Persion_Department_Salary AS
BEGIN
select Department.DepartmentName, min(Person.Salary)[MinSalary], max(Person.Salary)[MaxSalary] from Person INNER JOIN Department ON Person.DepartmentID = Department.DepartmentID group by Department.DepartmentName
END

exec SP_Persion_Department_Salary

-- 6. Create Procedure which displays designation wise maximum, minimum & total salaries.
CREATE PROCEDURE SP_Persion_Designation_Salary AS
BEGIN
select Designation.DesignationName, min(Person.Salary)[MinSalary], max(Person.Salary)[MaxSalary] from Person INNER JOIN Designation ON Person.DesignationID = Designation.DesignationID group by Designation.DesignationName
END

EXEC SP_Persion_Designation_Salary