create database std;
 use std;
 
# Write a query to create a students table with appropriate data types for student id, student first name, student last name, class, and age where the student last name, student first name, and student id should be a NOT NULL constraint, and the student id should be in a primary key.

create table Student(
std_id int primary key not null,
std_first_name varchar(20) not null,
std_last_name varchar(20),
class int,
age int);

# Write a query to create a marksheet table that includes score, year, ranking, class, and student id.

create table marksheet(
score int,
year year,
ranking int,
class int,
std_id int);

show tables;
desc marksheet;
desc student;

# Write a query to insert values in students and marksheet tables.

# use "Table Data Import Wizard" to insert table date

# Write a query to display student id and student first name from the student table if the age is greater than or equal to 16 and the student's last name is Kumar.

select std_id, std_first_name from Student where age>=16 and std_last_name= 'kumar';

# Write a query to display all the details from the marksheet table if the score is between 800 and 1000.

select * from marksheet where score between 800 and 1000;

# Write a query to display the marksheet details from the marksheet table by adding 5 to the score and by naming the column as new score.

select *, concat(score+5) as new_score from marksheet;
# or
select *, score+5 as new_score from marksheet;

# Write a query to display the marksheet table in descending order of the  score.

select * from marksheet order by score desc;

# Write a query to display details of the students whose first name starts with a.

select * from student where std_first_name like 'a%';


