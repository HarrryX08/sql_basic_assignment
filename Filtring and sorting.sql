CREATE DATABASE Employe

-- Q1 Create the following dummy table in MySQL Workbench using CREATE FUNCTION-
 
 create table Employe (   
emp_id int ,
empname varchar(50),
city varchar(50),
department varchar(50),
salary int,
hire_date date 
);

Select * from employe

insert into employe ( emp_id, empname, city, department, salary, hire_date)
values
(101, 'Rahul Mehta' ,'Delhi','sales', 55000, '2020-4-12'),
(102, 'Priya Sharma' , 'Mumabi', 'HR', 62000, '2019-9-25'),
(103, 'Aman Singh' ,  'Banglore','IT', 72000, '2021-3-10'),
(104, 'Neha Patel' ,  'Delhi','sales', 48000, '2022-1-14'),
(105, 'karan Joshi' ,  'Pune','Marketing', 45000, '2018-7-22'),
(106, 'Divya Nair' ,  'Chennai','IT', 81000, '2019-12-11'),
(107, 'Raj Kumar' ,  'Delhi','HR', 68000, '2020-5-28'),
(108, 'Simran Kaur' ,  'Mumabi','Finance', 50000, '2021-8-03'),
(109, 'Arjun reddy' ,  'Hyderabad','IT', 70000, '2022-2-18'),
(110, 'Anil Das' ,  'Kolkata','sales', 51000, '2023-1-15');

select * from employe

-- Q2 Show employees working in either the ‘IT’ or ‘HR’ departments.
 select *
 from employe where department in ('IT' , 'HR')

-- Q3 Retrieve employees whose department is in ‘Sales’, ‘IT’, or ‘Finance’.

SELECT *
FROM employe
WHERE department IN ('sales', 'IT', 'Finance')

-- Q4  Display employees whose salary is between ₹50,000 and ₹70,000.

select *
from employe where salary between 50000 and 70000

-- Q4  List employees whose names start with the letter ‘A’.

select*
from employe where empname like 'A%'

-- Q6 Show employees who are from ‘Delhi’ or ‘Mumbai’ and earn more than ₹55,000.

select *
from employe where city in ('Delhi', 'Mumbai')
and salary < 55000

-- Q5 Find employees whose names contain the substring ‘an'

select *
from employe where empname like '%an%'

-- Q7  Display all employees except those from the ‘HR’ department

select *
from employee where TRIM(department) not in ('HR')

-- Q8 Get all employees hired between 2019 and 2022, ordered by HireDate (oldest first).

select *
from employe where hire_date between '2019-01-01' and '2022-12-31'
order by hire_date desc