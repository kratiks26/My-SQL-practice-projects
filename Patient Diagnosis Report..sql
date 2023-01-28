create database patients;
use patients; 

# Write a query to create a patients table with the fields such as date, patient id, patient name, age, weight, gender, location, phone number, disease, doctor name, and doctor id.

create table patient(
doa date,
p_id varchar(8),
p_name varchar(40),
age int,
weight int,
gender varchar(7),
location varchar(15),
phone_num int,
disease varchar(20),
dr_name varchar(40), 
dr_id int);

select * from patient;

# Write a query to display the total number of patients in the table.

select count(*) from patient;

# Write a query to display the patient id, patient name, gender, and disease of the patient whose age is maximum.

select p_id,p_name,gender,disease from patient where age=(select max(age) from patient);

# Write a query to display patient id and patient name with the current date.

select p_id, p_name, date(now()) as currentdate from patient;

# Write a query to display the old patient’s name and new patient's name in uppercase.


select (select ucase(p_name) from patient where doa in (select min(doa) from patient))as old_patient_ucasename,(select ucase(p_name) from patient where doa in (select max(doa) from patient))as new_patient_ucasename;


# Write a query to display the patient’s name along with the length of their name.

select p_name, length(p_name) as name_length from patient;

# Write a query to display the patient’s name, and the gender of the patient must be mentioned as M or F.

select p_name, mid(gender,1,1) as gender from patient;

# Write a query to combine the names of the patient and the doctor in a new column. 

 select concat(p_name,' ', dr_name) as patient_and_dr from patient;

# Write a query to extract the year from the given date in a separate column.

select year(doa) from patient;

# Write a query to return NULL if the patient’s name and doctor’s name are similar else return the patient’s name.

select if(p_name = dr_name, null,p_name) from patient;

# Write a query to return Yes if the patient’s age is greater than 40 else return No.

select if(age>40,'yes','no') from patient;

# Write a query to display the doctor’s duplicate name from the table.

select dr_name, count(*) from patient group by dr_name having count(*)>1;

