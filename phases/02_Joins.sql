
/*
Query 1:- which customer placed which order?

select o.order_id,o.order_date,c.customer_name,c.email
from orders o inner join customers c
on o.customer_id = c.customer_id;

*/

/* 
Query 2:- Show employees even if they have not made any sales.

select e.emp_id,e.emp_name,s.sale_amount

from employees e left join sales s

on e.emp_id=s.emp_id;
*/

/*
Query 3:- Show all order items, even if product details are missing

select p.product_name,oi.quantity

from products p right join order_items oi

on p.product_id=oi.product_id;

*/

/* Query 4:- which products were sold in which order?

select o.order_id,p.product_name,oi.quantity 
from orders o inner join order_items oi on o.order_id=oi.order_id
inner join products p on oi.product_id=p.product_id;
*/

/* Query 5:- Who reports to whom?

select e.emp_name as Employee, e.emp_name as Manager
from employees e left join employees m on e.manager_id = e.emp_id;

*/

/* Query 6:- which customer placed which order and how much
revenue it generated?

select o.order_id,c.customer_name,s.sale_amount
from orders o 
INNER JOIN customers c on o.customer_id=c.customer_id
INNER JOIN sales s on o.order_id = s.order_id;

*/

/* Query 7:- which employess work in which department?

select e.emp_name,d.dept_name 
from employees e 
INNER JOIN departments d on e.dept_id = d.dept_id;
*/

/* Query 8:- show customer even those who never placed an order

select c.customer_id,c.customer_name,o.order_id
from customers c
LEFT JOIN orders o on c.customer_id = o.customer_id;
*/

/* Query 9:- which products were sold in which date?

select p.product_name,o.order_date,oi.quantity
from order_items oi
inner join products p on oi.product_id=p.product_id
INNER JOIN orders o on oi.order_id = o.order_id;

*/

/* Query 10:- which employee handled which order and how much did
it sell for?

select e.emp_name,s.order_id,s.sale_amount
from employees e
INNER JOIN sales s on e.emp_id = s.emp_id
INNER JOIN orders o on s.order_id = o.order_id;
*/
