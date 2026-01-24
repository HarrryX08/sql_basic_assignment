CREATE DATABASE Custome

 CREATE TABLE Custome (
   Customer_ID INT,
    Customer_Name varchar(50),
    City varchar(50)
    );
   
 create table Orders (   
order_id int ,
Customer_ide varchar(50),
Order_date date,
Amount int 
);

create table Payment (   
Payment_id Vachar(10) 
Customer_ide varchar(50),
Payment_date date,
Amount int 
);

create table Employ(   
Employee_id int ,
Employee_Name varchar(50),
Manager_id date
);

insert into Custome (Customer_ID, Customer_Name ,City)
values
(1, 'John Smith', 'New York'),
(2, 'Mary jhonshon', 'Chicago'),
(3, 'Peter Adams', 'Los Angeles'),
(4, 'Nancy Miller', 'Houston'),
(5, 'Robert White', 'Miami');

select * from Custome

insert into Orders (Order_ID, Customer_Ide, Order_date,Amount)
values
(101, 1, '2024-10-01', 250),
(102, 2,'2024-10-05', 300),
(103, 1,'2024-10-07', 150),
(104, 3,'2024-10-10', 450),
(105, 5,'2024-10-12', 400);

Select * from Orders

insert into Payment (Payment_ID, Customer_Ide, Payment_date,Amount)
values
(01, 1, '2024-10-02', 250),
(02, 2,'2024-10-06', 300),
(03, 3,'2024-10-11', 450),
(04, 4,'2024-10-15', 200);

Select * from Payment

  insert into Employ (Employee_id, Employee_Name, Manager_id)
values
( 1, 'Alex Green','2024-10-1'),
( 2, 'Brian Lee', '2024-10-2'),
( 3, 'Carol Ray', '2024-10-3'),
( 4, 'David Kim', '2024-10-4'),
 (5, 'Eva Smith', '2024-10-5'); 
 
 
 -- Q1 Retrieve all customers who have placed at least one order.
 
Select Distinct c.*
From custome  c 
inner join orders  o
on c.customer_id = o.customer_ide

-- Q 2 Retrieve all customers and their orders, including customers who have not placed any orders.
 
 select c.customer_id , c.customer_name, 
 o.order_id, o.order_date, o.amount
 from custome c
 left join orders o
on c.customer_id = o.customer_ide
 
 
 -- Q3 Retrieve all orders and their corresponding customers,including orders placed by unknown customers.

select o.order_ID,o.order_date,o.amount,c.customer_name
from orders o
left join custome c
on o.customer_ide = c.customer_id

-- Q4 Display all customers and orders, whether matched or not.

select c.customer_id, c.customer_name, o.order_id,o.order_date,o.amount
from custome c
left join orders o
on  c.customer_id = o.customer_ide
UNION
select c.customer_id, c.customer_name, o.order_id,o.order_date,o.amount
from custome c
right join orders o
on  c.customer_id = o.customer_ide

-- Q 5 Find customers who have not placed any orders.

select c.*
from custome c
left join orders o
on c.customer_ID = o.customer_IDE
where o.order_ID is Null

-- Q6  Retrieve customers who made payments but did not place any orders.

select distinct c.*
from custome c
inner join payment p on c.customer_id = p.customer_ide
left join orders o
on c.customer_id = o.customer_ide
where o.order_id is null

-- Q 7 Generate a list of all possible combinations between Customers and Orders.

select c.customer_name, o.order_id
from custome c cross join orders o

-- Q 8 Show all customers along with order and payment amounts in one table.

select c.customer_name, o.amount as ordersamount, p.amount from custome c
left join orders o on c.customer_id = o.customer_ide 
left join payment p on c.customer_id = o.customer_ide 

-- Q9  Retrieve all customers who have both placed orders and made payments.

select Distinct c.*
from custome c
inner join orders o on c.customer_id = o.customer_ide
inner join Payment p on c.customer_id = p.customer_ide