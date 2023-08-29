-- LAB – 9
create database SQL_SP_LAB_9
use SQL_SP_LAB_9

-- Student
CREATE TABLE Student (
	RNo int Primary Key,
	Name varchar(50) NOT NULL,
	Branch varchar(50) NOT NULL
)

-- Result
CREATE TABLE Result(
	RNo int NULL FOREIGN KEY REFERENCES Student(RNo),
	SPI decimal(4,2) NOT NULL
)

-- PART A
-- 1. Both tables Insert.

create procedure PR_Student_Insert
	@RNo 	int,
	@Name	varchar(50),
	@Branch varchar(50)
as
begin
	insert into Student(RNo, Name, Branch) values (@RNo, @Name, @Branch)
End

exec PR_Student_Insert 101, 'Raju', 'CE'
exec PR_Student_Insert 102, 'Amit', 'CE'
exec PR_Student_Insert 103, 'Sanjay', 'ME'
exec PR_Student_Insert 104, 'Neha', 'EC'
exec PR_Student_Insert 105, 'Meera', 'EE'
exec PR_Student_Insert 106, 'Mahesh', 'ME'


create proc SP_Result_Insert
	@RNo int,
	@SPI decimal(4,2)
as
begin 
	insert into Result(RNo, SPI) values (@RNo, @SPI)
End

exec SP_Result_Insert 101, 8.8
exec SP_Result_Insert 102, 9.2
exec SP_Result_Insert 103, 7.6
exec SP_Result_Insert 104, 8.2
exec SP_Result_Insert 105, 7.0
exec SP_Result_Insert 106, 8.9

-- 2. Both tables Update.

create proc SP_Student_Update 
	@RNo 	int,
	@Name	varchar(50),
	@Branch varchar(50)
as
begin
	update Student set Name=@Name, Branch=@Branch where RNo = @RNo
end
exec SP_Student_Update 101 ,'Dhruv', 'CE'

create proc SP_Result_Update 
	@RNo int,
	@SPI decimal(4,2)
as
begin
	update Result set SPI=@SPI where RNo = @RNo
end
exec SP_Result_Update 101, 8.1
-- 3. Both tables Delete.

create proc SP_Student_Delete
	@RNo int
as
begin
	delete Student where RNo = @RNo
end

create proc SP_Result_Delete
	@Rno int
as
Begin
	Delete Result where Rno = @Rno
End

exec SP_Result_Delete 101
exec SP_Student_Delete 101


-- 4. Both tables SelectPK.
create proc SP_Student_SelectPK
	@RNo int
as
begin 
	select * from Student where RNo = @RNo
End

create proc SP_Result_SelectPK
	@RNo int
as
begin 
	select * from Result where RNo = @RNo
End

exec SP_Student_SelectPK 102
exec SP_Result_SelectPK 102
-- 5. Both tables SelectAll.

-- create proc
create procedure PR_Student_SelectAll as
begin
	select * from Student
End
-- exec
execute PR_Student_SelectAll

create proc PR_Result_SelectAll as
begin
	select * from Result
End
exec PR_Result_SelectAll

-- PART B

--6. Create a stored procedure that takes branch as input and returns a table with all the students studying in that department.
create proc SP_Student_Branch 
	@Branch varchar(50)
as
begin
	select * from Student where Branch = @Branch
End

exec SP_Student_Branch 'CE'
--7. Create a stored procedure to display Rno, Name and SPI of first 2 students only.
create proc SP_DisplayFirst2
as
begin
	select top 2 * from Student inner join Result on Student.RNo = Result.RNo
End

exec SP_DisplayFirst2
--8. Create a stored procedure which displays branch wise maximum and minimum SPI.
create proc SP_Display_Max_Min_SPI
as
begin
	select Student.Branch, max(Result.SPI)[maxSPI], min(Result.SPI)[minSPI] from Student inner join Result on Student.RNo = Result.RNo group by Student.Branch
End

exec SP_Display_Max_Min_SPI

-- PART C
-- 9. Create a stored procedure which displays top 5 students based on SPI in descending order.
create proc PC_TOP_5_Student 
as
begin
	select top 5 * from Student inner join Result on Student.RNo = Result.RNo order by SPI desc
End
exec PC_TOP_5_Student 
-- 10. Alter stored procedure of 9th definition to display all the detail in ascending order by student name.
alter proc PC_TOP_5_Student 
as
begin
	select top 5 * from Student inner join Result on Student.RNo = Result.RNo order by SPI
End

exec PC_TOP_5_Student

