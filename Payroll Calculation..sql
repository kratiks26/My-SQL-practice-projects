create database payroll_calculation;
use payroll_calculation;

# Write a query to create an employee table and a department table.

create table dept( 
dept_id int,
dept_name varchar(20),
location varchar(20),
manager_id int,
elocation_id int);

create table emp(
emp_id int,
f_name varchar(15),
l_name varchar(10),
job_id varchar(10),
salary float,
manager_id int,
dept_id int);

select * from dept;
select * from emp;

# Write a query to create a HR view of the employee and department tables.

create view hr as select e.emp_id, e.f_name, e.l_name, e.job_id, e.salary, e.manager_id, e.dept_id, d.dept_name, d.location from emp e join dept d on e.dept_id=d.dept_id;

select * from hr;

# Write a query to display first name and last name of the employees from the employee table and an HR view table if the employee’s salary in the HR table is greater than the salary in the employee table.

select distinct  e.f_name,e.l_name from emp e, hr h where e.salary<>h.salary;


# Write a query to change the delimiter to //.

delimiter //

# Write a query to create a stored procedure using an employee table if the salary is greater than or equal to 250000.

delimiter //

create procedure sal()
begin 
select * from emp where salary>=250000;
end//

delimiter ;

# Write a query to execute the stored procedure.

call sal;

# Write a query to create a stored procedure with one parameter using ORDER BY salary in descending order, and execute the stored procedure.

delimiter //

create procedure sal_desc( lim int)
begin 
select * from emp order by salary desc limit lim;
end//
delimiter ;

call sal_desc(6);


