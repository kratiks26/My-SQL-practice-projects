# Create a database named employee, then import data_science_team.csv proj_table.csv and emp_record_table.csv into the employee database from the given resources.

create database employee;
use employee;

select * from data_science_team;
select * from proj_table;
select* from emp_record_table;
 

# Write a query to fetch EMP_ID, FIRST_NAME, LAST_NAME, GENDER, and DEPARTMENT from the employee record table, and make a list of employees and details of their department.

select emp_id, first_name, last_name, gender, dept from emp_record_table;

# Write a query to fetch EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPARTMENT, and EMP_RATING if the EMP_RATING is: 
# less than two
select EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPT, EMP_RATING FROM EMP_RECORD_TABLE WHERE EMP_RATING < 2;
# greater than four 
select EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPT, EMP_RATING FROM EMP_RECORD_TABLE WHERE EMP_RATING > 4;
# between two and four
select EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPT, EMP_RATING FROM EMP_RECORD_TABLE WHERE EMP_RATING  BETWEEN 2 AND 4;
 
# Write a query to concatenate the FIRST_NAME and the LAST_NAME of employees in the Finance department from the employee table and then give the resultant column alias as NAME.

SELECT CONCAT( FIRST_NAME,' ', LAST_NAME) AS NAME FROM EMP_RECORD_TABLE WHERE DEPT='FINANCE';


# Write a query to list only those employees who have someone reporting to them. Also, show the number of reporters (including the President).

SELECT *,(SELECT COUNT(MANAGER_ID) FROM EMP_RECORD_TABLE) AS NO_OF_REPORTERS FROM EMP_RECORD_TABLE WHERE EMP_ID IN(SELECT MANAGER_ID FROM EMP_RECORD_TABLE);


# Write a query to list down all the employees from the healthcare and finance departments using union. Take data from the employee record table.

select * from emp_record_table where dept = 'healthcare'
union
select * from emp_record_table where dept= 'finance';
 
 
# Write a query to list down employee details such as EMP_ID, FIRST_NAME, LAST_NAME, ROLE, DEPARTMENT, and EMP_RATING grouped by dept. Also include the respective employee rating along with the max emp rating for the department.

select Emp_id,first_name, last_name, role, dept, emp_rating, max(emp_rating) over( partition by dept) as max_rating_in_dept from emp_record_table;

# Write a query to calculate the minimum and the maximum salary of the employees in each role. Take data from the employee record table.

select role, min(salary) over(order by role) as min_salary, max(salary) over (order by role) as max_salary from emp_record_table group by role ;

# Write a query to assign ranks to each employee based on their experience. Take data from the employee record table.

select *,row_number() over(order by exp desc) from emp_record_table;

 
# Write a query to create a view that displays employees in various countries whose salary is more than six thousand. Take data from the employee record table.

create view sal_6k as select * from emp_record_table where salary> 6000;

select * from sal_6k;
 
# Write a nested query to find employees with experience of more than ten years. Take data from the employee record table.

 select * from emp_record_table where exp>=(select exp from emp_record_table where exp>10 order by exp limit 1);


# Write a query to create a stored procedure to retrieve the details of the employees whose experience is more than three years. Take data from the employee record table.

delimiter $$
create procedure exp_3y()
begin 
select * from emp_record_table where exp>3;
end $$
delimiter ; 

call exp_3y; 

# Write a query using stored functions in the project table to check whether the job profile assigned to each employee in the data science team matches the organization’s set standard.
# The standard being
# For an employee with experience less than or equal to 2 years assign 'JUNIOR DATA SCIENTIST',
# For an employee with the experience of 2 to 5 years assign 'ASSOCIATE DATA SCIENTIST',
# For an employee with the experience of 5 to 10 years assign 'SENIOR DATA SCIENTIST',
# For an employee with the experience of 10 to 12 years assign 'LEAD DATA SCIENTIST',
# For an employee with the experience of 12 to 16 years assign 'MANAGER'.


delimiter //
create function org_standard(exp int,role1 varchar(40))
returns varchar(50)
deterministic
begin
declare role2 varchar(20);

if exp<=2 and role1 ='JUNIOR DATA SCIENTIST'then 
set role2 = 'jds match';
elseif exp>=2 and exp<= 5 and role1 ='ASSOCIATE DATA SCIENTIST' then
set role2= 'ads match';
elseif exp>=5 and exp<= 10 and role1 ='SENIOR DATA SCIENTIST' then 
set role2='sds match';
elseif exp>=10 and exp<= 12 and role1 ='LEAD DATA SCIENTIST' then
set role2='lds match';
elseif exp>=12 and exp<= 16 and role1 ='MANAGER' then
set role2 = 'managar match';
else 
set role2='not match';
end if;

return role2; 
end //
delimiter ;

select*, org_standard(exp,role) as organization_standard_match from data_science_team ;



# Create an index to improve the cost and performance of the query to find the employee whose FIRST_NAME is ‘Eric’ in the employee table after checking the execution plan.

select * from emp_record_table where first_name ='eric';

create index Index1
on emp_record_table(emp_id);

select * from emp_record_table where first_name ='eric';
desc emp_record_table;

alter table emp_record_table
drop index index1;
# Write a query to calculate the bonus for all the employees, based on their ratings and salaries (Use the formula: 5% of salary * employee rating).

select *, round(salary * emp_rating * 5 /100)  as bonus from emp_record_table;
 

# Write a query to calculate the average salary distribution based on the continent and country. Take data from the employee record table.
select *,floor(avg(salary) over ( partition by country )) as avg_salary_of_country,floor(avg(salary) over (partition by continent)) as avg_salary_of_continent from emp_record_table;




