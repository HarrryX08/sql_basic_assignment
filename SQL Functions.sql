CREATE DATABASE Student_Performance

Create Table Student_Performance(
student_id INT,
name VARCHAR(50),
course VARCHAR(50),
score INT,
attendance INT,
mentor VARCHAR(50),
join_date DATE,
city VARCHAR(50)
);

Select * from Student_Performance

INSERT INTO student_Performance
(student_id, name, course, score ,attendance, mentor, join_date, city)
values
(101, 'Aarav Mehta', 'Data Science', 88, 92, 'Dr. Sharma', 
'2023-06-12', 'Mumbai'),
 (102, 'Riya Singh', 'Data Science', 76, 85, 'Dr. Sharma', 
'2023-07-01', 'Delhi'),
(103, 'Kabir Khanna', 'Python', 91, 96, 'Ms.Nair', 
'2023-06-20', 'Mumbai'),
(104, 'Tanvi Patel', 'SQL', 84, 89, 'Mr. Iyer', 
'2023-05-30', 'Bengaluru'),
(105, 'Ayesha Khan', 'Python', 67, 81, 'Ms.Nair', 
'2023-07-10', 'Hyderabad'),
(106, 'Dev Sharma', 'SQL', 73, 78, 'Ms.Nair', 
'2023-05-28', 'Pune'),
(107, 'Arjun Verma', 'Tableau', 95, 98, 'Ms.Kapoor', 
'2023-06-10', 'Delhi'),
(108,'Meera Pillai', 'Tableau', 82, 87, 'Ms.Kapoor', 
'2023-06-18', 'Kochi'),
(109, 'Nikhil Rao', 'Data Science', 79, 82, 'Dr.Sharma', 
'2023-07-05', 'Chennai'),
(110, 'Priya Desai', 'SQL', 92, 94, 'Mr.Iyer', 
'2023-05-27', 'Bengalore'),
(111, 'Siddhart Jain', 'Python', 85, 90, 'Ms.Nair', 
'2023-07-02', 'Mumbai'),
(112, 'Sneha Kulkarni', 'Tableau', 74, 83, 'Ms.Kapoor', 
'2023-06-10', 'Pune'),
(113, 'Rohan Gupta', 'SQL', 89, 91, 'Mr.Iyer', 
'2023-05-25', 'Delhi'),
(114, 'Ishita Joshi', 'Data Science', 93, 97, 'Dr.sharma', 
'2023-06-25', 'Bengaluru'),
(115, 'Yuvraj Rao', 'Python', 71, 84, 'Ms.Nair', 
'2023-07-12', 'Hyderabad')

Select * from Student_Performance


-- Q1  Create a ranking of students based on score (highest first).

select 
student_id,
name,
score,
RANK() over (order by score Desc) as score_rank
from Student_Performance

-- Q2  Show each student's score and the previous student’s score (based on score order).

select
student_id,
name,
score,
lag(score) over (order by  score Desc) as previous_score
from Student_Performance

-- Q3  Convert all student names to uppercase and extract the month name from join_date.

select 
UPPER(name) as name,
MONTHNAME (join_date) as join_month
from Student_Performance

-- Q4  Show each student's name and the next student’s attendance (ordered by attendance)

select
name,
attendance,
lead(attendance) over (order by attendance) as nexr_student_attendance
from Student_Performance

-- Q5 Assign students into 4 performance groups using NTILE().

select
name,
score,
NTILE(4) over (order by score desc) as perfomance_group
from student_performance

-- Q6 For each course, assign a row number based on attendance (highest first).

select
name,
attendance,
row_number() over (partition by course order by attendance desc) as  row_num
from Student_performance

-- Q7 Calculate the number of days each student has been enrolled (from join_date to today).
(Assume current date = '2025-01-01')
select
join_date,
DATE '2025-01-01' - join_date as enrolled_days
from Student_performance


-- Q8 Format join_date as “Month Year” (e.g., “June 2023”)

select
name,
DATE_FORMAT(join_date,'%M %Y') as formated_join_date
from Student_performance

-- Q9 Replace the city ‘Mumbai’ with ‘MUM’ for display purposes

Select
name,
REPLACE(city,'Mumbai','MUM') as city_display
from Student_performance

-- Q10 For each course, find the highest score using FIRST_VALUE()

select  distinct
FIRST_VALUE(score) over (partition by course order by score desc)
as highest_score
from Student_performance
