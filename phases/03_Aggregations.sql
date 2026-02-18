/* 
Count(*)
Query 1:- How many orders have been placed in total?

select count(*) Total_Orders from orders;
*/

/*
sum()
Query 2:- What is the total revenue generated from all sales?

select sum(sale_amount) as Total_sale_amount from sales;
*/

/*
avg()
Query 3:- what is the average sales amount per sale?


select avg(sale_amount) as avg_sale_amount from sales;
*/

/*
min()
Query 4:- what is the smallest sale recorded?

select min(sale_amount) as smallest_sale from sales;
*/

/*
max()
Query 5:- what is the maximum sale recorded?

select max(sale_amount) as biggest_sale from sales;
*/

/*

/* 
Group By(orders per customer)

Query 6:- how many orders did each customer place?

select c.customer_name,count(o.order_id) as total_order
from customers c
LEFT JOIN orders o on c.customer_id = o.customer_id
GROUP BY c.customer_name;
*/

/*
Group by + sum(Revenue per customer)

Query 7:- what is the total revenue generated per customer?

select c.customer_name,sum(s.sale_amount) as total_revenue
from customers c
INNER JOIN orders o on c.customer_id = o.customer_id
INNER JOIN sales s on o.order_id = s.order_id
GROUP BY c.customer_name
ORDER BY total_revenue desc;
*/

/*
Group by + abg(avg revenue per customer)

Query 8:- what is the avg revenue generated per customer?

select c.customer_name,avg(s.sale_amount) as avg_revenue
from customers c
INNER JOIN orders o on c.customer_id = o.customer_id
INNER JOIN sales s on o.order_id = s.order_id
GROUP BY c.customer_name
ORDER BY avg_revenue desc;

*/

/*
Query 9:- which employee generated how much total revenue?

select e.emp_name,sum(s.sale_amount) as total_revenue
from employees e
inner join sales s
on e.emp_id = s.emp_id 
GROUP BY e.emp_name ORDER BY total_revenue desc;
*/

/* 
Query 10:- customers with more than 2 orders

select c.customer_name,count(o.order_id) as total_orders
from customers c
INNER JOIN orders o on c.customer_id = o.customer_id
GROUP BY c.customer_name having total_orders>2;
*/

/* 
Query 11:- total quantity solder per product

select p.product_name,sum(oi.quantity) as total_quantity
from order_items oi
INNER JOIN products p on oi.product_id = p.product_id
GROUP BY p.product_name ORDER BY total_quantity desc;
*/

/* 
Query 12:- revenue per product

select p.product_name, sum(oi.quantity*p.price) as total_revenue
from order_items oi
INNER JOIN products p on oi.product_id = p.product_id
GROUP BY p.product_name ORDER BY total_revenue desc;

*/

/*

Query 13:- Employees with revenue >50000

select e.emp_name, sum(s.sale_amount) as total_revenue
from employees e 
INNER JOIN sales s on e.emp_id = s.emp_id
GROUP BY e.emp_name having total_revenue>50000 
ORDER BY total_revenue desc;

*/

/* 
Query 14:- average revenue per product per category

select p.category, sum(oi.quantity*p.price) as total_revenue
from order_items oi
INNER JOIN products p on oi.product_id = oi.product_id
GROUP BY p.category ORDER BY total_revenue desc;
*/


/*
Query 15:- who are the top 5 customers generating highest revenue?

select c.customer_name,sum(s.sale_amount) as revenue
from customers c 
INNER JOIN orders o on c.customer_id = o.customer_id
INNER JOIN sales s on o.order_id = s.order_id
GROUP BY c.customer_name
ORDER BY revenue desc limit 5;
*/

/* 

Query 16:- customers lifetime value

select c.customer_name,
sum(s.sale_amount) as lifetime_value,
avg(s.sale_amount) as avg_order_value,
count(DISTINCT o.order_id) as total_orders
from customers c
inner join orders o on c.customer_id = o.customer_id
inner join sales s on o.order_id = s.order_id
GROUP BY c.customer_name
ORDER BY lifetime_value desc limit 10;


*/

/* 
Query 17:- Top selling product by quantity

select p.product_name, sum(oi.quantity) as total_quantity
from order_items oi
inner join products p on oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_quantity desc limit 5;

*/

/*
Query 18:- Employees with the highest revenue per department

select e.emp_name,e.dept_id,sum(s.sale_amount) as revenue_generated
from employees e
INNER JOIN sales s on e.emp_id = s.emp_id
GROUP BY e.dept_id,e.emp_name ORDER BY revenue_generated desc limit 5;
*/

/*
Query 19 :- Products with above average revnue

select p.product_name, sum(oi.quantity*p.price) as revenue
from order_items oi
INNER JOIN products p on oi.product_id = p.product_id
GROUP BY p.product_name 
HAVING revenue > (select avg(oi2.quantity*p2.price) as average
from order_items oi2 inner join products p2 on 
oi2.product_id = p2.product_id);

*/

/*
Query 20:- Rolling total revenue by order date


select o.order_date,sum(s.sale_amount) as daily_revenue,
sum(sum(s.sale_amount)) over (order by o.order_date) as rolling_revenue
from orders o inner join sales s on o.order_id=s.order_id
GROUP BY o.order_date ORDER BY o.order_date;
*/


/* 
Query 21:- average items order per customer

select c.customer_name, avg(oi.quantity) as avg_items_per_order
from customers c 
inner join orders o on c.customer_id = o.customer_id
inner join order_items oi on o.order_id=oi.order_id
GROUP BY c.customer_name
order by avg_items_per_order desc;
*/
