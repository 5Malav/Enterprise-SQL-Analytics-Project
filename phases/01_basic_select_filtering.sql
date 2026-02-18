
/* Query 1:- Select all records from customer table.

select * from customers;
*/

/* Query 2:- print customer name, email and sign up date from 
customer table

select customer_name,email,signup_date from customers;
*/

/* Query 3:- Print orders with status SHIPPED.

select * from orders where status = 'SHIPPED';
*/ 

/* Query 4:- Filtering with multiple conditions.
status is DELIVERED and order date>= 2024-01-01


select * from orders where status = 'DELIVERED' and order_date>='2024-01-01';
*/

/* Query 5:- Sorting by sign up date. shows latest order first

select * from customers ORDER BY signup_date desc;
*/


/* Query 6:- Limit number of rows. top 5 expensive products

select * from products ORDER BY price desc limit 5;
*/
