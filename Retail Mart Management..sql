create database SQLbasics;
use sqlbasics;
show tables;

# import data tables by using "table data import wizard".

select * from customer_table;
select * from product_table;
select * from sales_table;


# Write a query to add two new columns such as S_no and categories to the sales table.

alter table sales_table add S_no int auto_increment primary key first,
add categories varchar(50);

# Write a query to change the column type of stock in the product table to varchar.

alter table product_table
modify stock varchar(50);

desc product_table;

# Write a query to change the table name from customer_table-to-customer_details.

alter table customer_table
rename to customer_details;

select* from customer_details;

#Write a query to drop the columns S_no and categories from the sales table.

alter table sales_table
drop column s_no, drop column categories;


# Write a query to display order_no, c_id, order_date, price and quantity from the sales table.

select order_no, c_id, order_date, price, qty from sales_table;

# Write a query to display all the details in the product table if the category is stationary.

select * from Product_table
where category='stationary';

# Write a query to display a unique category from the product table.

select distinct(category) from product_table;

# or 

select category from product_table
group by category;

# Write a query to display the sales details if quantity is greater or equal to than 2 and 
# price is lesser than equals to 500 from the sales table.

select * from sales_table where qty>=2 and price<=500;

# Write a query to display the customer’s name if the name start with 'a'.
select c_name from customer_details where c_name like'a%';

# Write a query to display the customer’s name if the name ends with 'a'.

select c_name from customer_details where c_name like'%a';

# Write a query to display the p_code and category from similar categories 
# that have more then 2 products.

select p_code, category from product_table group by category having count(category)>=2;

# Write a query to display the order number and the customer name to 
# combine the results of the sales and customer tables.

select s.order_no, c.c_name from sales_table as s inner join customer_details as c on c.c_id=s.c_id;