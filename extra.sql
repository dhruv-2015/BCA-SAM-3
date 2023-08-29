 
-- table 1:-customer
--     CustomerID INT PRIMARY KEY,
--     FirstName NVARCHAR(50),
--     LastName NVARCHAR(50),
--     Email NVARCHAR(100),
--     Phone NVARCHAR(20)

create database extra
use extra

create table customer (
    CustomerID INT PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Email NVARCHAR(100),
    Phone NVARCHAR(20)
)
--     (1, 'John', 'Doe', 'john.doe@example.com', '1234567890'),
--     (2, 'Jane', 'Smith', 'jane.smith@example.com', '9876543210'),
--     (3, 'Mike', 'Johnson', 'mike.johnson@example.com', '1112223333'),
--     (4, 'Emily', 'Williams', 'emily.williams@example.com', '4445556666'),
--     (5, 'David', 'Brown', 'david.brown@example.com', '7778889999');
insert into customer values (1, 'John', 'Doe', 'john.doe@example.com', '1234567890')
insert into customer values (2, 'Jane', 'Smith', 'jane.smith@example.com', '9876543210')
insert into customer values (3, 'Mike', 'Johnson', 'mike.johnson@example.com', '1112223333')
insert into customer values (4, 'Emily', 'Williams', 'emily.williams@example.com', '4445556666')
insert into customer values (5, 'David', 'Brown', 'david.brown@example.com', '7778889999')

-- table 2:-Orders
--     OrderID INT PRIMARY KEY,
--     CustomerID INT foreign key,
--     OrderDate DATE,
--     TotalAmount DECIMAL(10, 2)

--     (1001, 1, '2023-07-01', 100.50),
--     (1002, 1, '2023-07-02', 75.20),
--     (1003, 3, '2023-07-03', 250.75),
--     (1004, 4, '2023-07-04', 50.00),
--     (1005, 5, '2023-07-05', 300.00);
insert into Orders values (1001, 1, '2023-07-01', 100.50)
insert into Orders values (1002, 1, '2023-07-02', 75.20)
insert into Orders values (1003, 3, '2023-07-03', 250.75)
insert into Orders values (1004, 4, '2023-07-04', 50.00)
insert into Orders values (1005, 5, '2023-07-05', 300.00)

-- 	create View to Get All Customers
create view AllCustomer as
select * from customer
-- 	View to Get All Orders
create view AllOrders as
select * from Orders
-- 	View to Get Customers with No Email Addresses
create view CustomerNoEmail as
select CustomerID, FirstName, LastName, Phone from customer
-- 	create view to return total number of Customers as TotalCustomer
create view TotalCustomer as
select COUNT(CustomerID)[TotalCustomer] from customer
-- 	create view to return sum of total ammount of order as totalammount
create view TotalAmmount as
select sum(TotalAmount)[TotalAmmount] from Orders
-- 	insert data into AllOrdersView (1006, 6, '2023-08-01', 25.50)
insert into AllOrders values(1006, 6, '2023-08-01', 25.50)
-- 	View to Get Customers with Their Total Order Amount
create view CustomersWithOrderAmount as
select sum(Orders.TotalAmount)[TotalAmount] from customer inner join Orders on customer.CustomerID = Orders.CustomerID group by Orders.CustomerID
-- 	View to Get Orders with Customer Contact Information
create view OrdersWithCustomerInfo as
select customer.CustomerID, customer.FirstName, customer.LastName, customer.Phone, customer.Email, Orders.OrderDate, Orders.OrderID, Orders.TotalAmount from customer right outer join Orders on customer.CustomerID = Orders.CustomerID
-- 	View to Get Customers with Their Latest Order Date
-- select * from customer inner join Orders on customer.CustomerID = Orders.CustomerID where Orders.OrderDate
create view CustomersWithTheirLatestOrderDate as
select MAX(Orders.OrderDate)[OrderDate] from customer inner join Orders on customer.CustomerID = Orders.CustomerID group by Orders.CustomerID

select * from CustomersWithTheirLatestOrderDate
-- 	View to Get Customers with No Orders
create view CustomersWithNoOrders as
select customer.CustomerID, customer.FirstName, customer.LastName, customer.Phone, customer.Email from customer left outer join Orders on customer.CustomerID = Orders.CustomerID 
where Orders.OrderID is Null
-- 	View to Get Customers with Their Total Number of Orders
create view CustomersWithTheirTotalNumberOfOrders as
select count(Orders.CustomerID)[TotalOrders] from customer full outer join Orders on customer.CustomerID = Orders.CustomerID group by Orders.CustomerID
-- 	Getting Customers with Orders in   Date Range  2023-07-01 to 2023-07-04
create view CustomersWithOrdersInRange as
select customer.CustomerID, customer.FirstName, customer.LastName, customer.Phone, customer.Email,Orders.OrderDate, Orders.OrderID, Orders.TotalAmount  from customer full outer join Orders on customer.CustomerID = Orders.CustomerID where Orders.OrderDate <= '2023-07-01' or Orders.OrderDate >= '2023-07-04'
-- 	Getting Customers with more than 1 order Placed (lakhavani baki)
create view moreThan1Order as
select * from customer where customer.CustomerID = (select CustomerID from Orders where CustomerID = customer.CustomerID  group by CustomerID having COUNT(OrderID) > 1)


-- LAB 7 new lab 2nd, 13th baki
-- 2. Create a view AllOrdersView to Get All Orders with customer name.
-- 13. Create a view to Get Customers with High-Value Orders.