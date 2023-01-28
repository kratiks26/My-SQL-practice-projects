create database employee1;
use employee1;

# Write a query to create an employee table with the fields employee id, first name, last name, job id, salary, manager id, and department id.

create table emp(
e_id int,
f_name varchar(15),
l_name varchar(10),
job_id varchar(10),
salary float,
manager_id int,
dept_id int);


# Write a query to insert values into the employee table.

insert into emp values(101,	'ankit','jain','HP124',200000,2,24),
(102,'sarvesh','patel','HP123',	150000,	2,24),
(103,'krishna',	'gee','HP125',500000,	5,44),
(104,'rana','gee','HP122',250000,	3,	54),
(105,'soniya','jain','HP121',400000,1,22),
(106,'nithin','kumar','HP120',300000,4,34),
(107,'karan','patel','HP126',300001,2,34),
(108,'shilpa','jain','HP127',300001,5,24),
(109,'mukesh','singh','HP128',300001,4,44);


# wirte a query to put primary key on e_id;

alter table emp modify e_id int primary key;

# Write a query to find the first name and salary of the employees whose salary is higher than the employee with the last name Kumar from the employee table.

select f_name, salary from emp where salary>(select salary from emp where l_name = 'kumar');

# Write a query to display the employee id and last name of the employees whose salary is greater than the average salary from the employee table.

select e_id, l_name from Emp where salary>(select avg(salary) from Emp);


# Write a query to display the employee id, first name, and salary of the employees who earn a salary that is higher than the salary of the person whose JOB_ID = HP122. Sort the results of the salary in ascending order.

select e_id, f_name, salary from emp where salary>(select salary from emp where job_id='hp122') order by salary asc;

# Write a query to display the first name, employee id, and salary of the first three employees with highest salaries.

select f_name, e_id, salary from emp order by salary desc limit 3;




