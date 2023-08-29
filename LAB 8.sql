-- 1
print 'Welcome'

-- 2
Declare
@num1 int,
@num2 int,
@sum int;

set
@num1=20;
set
@num2=30;
set @sum=@num1 + @num2

print @sum
print 'sum of two number is ' + cast(@sum as varchar(50))

-- 3
Declare
@num1 int,
@num2 int,
@num3 int;

set
@num1=100;
set
@num2=30;
set
@num3=50;

if(@num1>@num2 and @num1>@num3)
print 'number 1 is max'
else if(@num2>@num1 and @num2>@num3)
print 'number 2 is max'
else if(@num3>@num1 and @num3>@num2)
print 'number 3 is max'

-- 4
Declare
@num int;

set
@num=1;

while(@num<=10)
begin
	print @num
	set @num=@num+1
end

-- 5
Declare
@n int;

set
@n=10;

if(@n%2=0)
	print 'EVEN'
else
	print 'ODD'

-- 6
Declare
@number int;

set
@number=1;

while(@number<=10)
begin
	if(@number%2!=0)
		print @number
	set @number=@number+1
end

-- 7
Declare
@p7 int,
@sum_50 int;

set
@p7=1;
set
@sum_50=0;

while(@p7<=50)
begin
	set @sum_50=@sum_50+@p7
	set @p7=@p7+1
end

print @sum_50

-- 8
Declare
@p8 int,
@p8_sum int;

set
@p8=1;
set
@p8_sum=0;

while(@p8<=20)
begin
	if(@p8%2=0)
		set @p8_sum+=@p8
	set @p8=@p8+1
end
print @p8_sum

-- 9
Declare
@prime_num int,
@i int,
@temp int;

set
@prime_num=25;
set
@i=2;
set
@temp=0;

while(@i<@prime_num)
begin
	if(@prime_num%@i=0)
		set @temp=1;
		break;
	set @i=@i+1;
end
if(@temp=0)
		print 'number is prime'
else
		print 'number is not prime'

	