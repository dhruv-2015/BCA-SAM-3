create database dhruv_22030401031
use dhruv_22030401031

-- query

-- 1.
select Name from Student where sem in(3, 5)
-- or
select Name from Student where sem = 3 or sem = 5

-- 2.
select Name, EnorlmentNo from Student where StuID <= 105 and StuID >= 101

-- 3.
select Name, EnorlmentNo, Email from Student where Sem = 5

-- 4.
select top(3) * from Student

-- 5.
select TOP 30 PERCENT Name, EnorlmentNo from Student where ContectNo like '%3'

-- 6.
select DISTINCT Sem from Student

-- 7.
select * from Student where EnorlmentNo != ''

-- 8.
select * from Student where Name not like 'V%'

-- 9.
select * from Student where Email like '%3@g%' and Email like '______'

-- 10.
select * from Student where Name like 'F_r%'

-- 11.
select * from Student where ContectNo like '%877%'

-- 12.
select Name from Student where Sem = 3 and ContectNo not like '%8%' and ContectNo not like '%9%'

-- 13.
select * from Student where BirthDate > '1990-01-01'

-- 14.
update Student set Division = 'BCX-5', Sem = 5 where StuID = 102

-- 15.
update Student set Name = 'Firoz Sherasiya' where Email = 'Firoz.me@gmail.com' and ContectNo = '1234567892'

-- 16.
alter table Student add City VARCHAR(50)

-- 17.
delete from Student where Division = 'BCX-3'

-- 18.
sp_rename 'Student.Email', 'EmailAddress', 'column'

-- 19.
truncate table Student

-- 20.
select * into Student_New from Student
