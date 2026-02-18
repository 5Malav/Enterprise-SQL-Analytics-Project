
/*
Query 1:- Show total revenue per product category for each month.

select p.category,
date_format(o.order_date,'%y-%m') as month,
sum(oi.quantity*p.price) as revenue
FROM orders o
join order_items oi on o.order_id = oi.order_id
join products p on oi.product_id = p.product_id
GROUP BY month,p.category
ORDER BY month,p.category;

*/

/*
Query 2:- Customer Lifetime Value(LFV)

Total spending of each customer

select c.customer_name,
sum(s.sale_amount) as total_spent
from customers c
join orders o on c.customer_id = o.customer_id
join sales s on o.order_id = s.order_id
GROUP BY c.customer_name
ORDER BY total_spent desc;

*/

/*

Query 3:- Cohort analysis : First order month

Group customers by the month of their first order

-- Count of new customers by the month they made their first order
SELECT 
    DATE_FORMAT(first_order, '%Y-%m') AS first_order_month,
    COUNT(*) AS new_customers
FROM (
    -- Find the first order date per customer
    SELECT 
        c.customer_id,
        MIN(o.order_date) AS first_order
    FROM customers c
    JOIN orders o ON c.customer_id = o.customer_id
    GROUP BY c.customer_id
) AS first_orders
GROUP BY first_order_month
ORDER BY first_order_month;

*/

/*
Churn Customers

Query 4:- Customers who did not order in last 3 months

select c.customer_name
from customers c
WHERE NOT EXISTS(
    select 1 from orders o
    where o.customer_id = c.customer_id
    and o.order_date >=date_sub(CURRENT_DATE(),INTERVAL 3 month)
)

*/

/*

Query 5:- Running total of company revenue

select o.order_date,
sum(s.sale_amount) as daily_revenue,
sum(sum(s.sale_amount)) over (ORDER BY o.order_date) as running_total
from orders o
JOIN sales s on o.order_id = s.order_id
GROUP BY o.order_date
ORDER BY o.order_date;

*/

/*
Query 6:- Average Order Value(AOV) per customer


select c.customer_name,
avg(s.sale_amount) as avg_order_value
from customers c
join orders o on c.customer_id = o.customer_id
join sales s on o.order_id = s.order_id
GROUP BY c.customer_name
ORDER BY avg_order_value desc;
*/

/*
Query 7:- Empolyee contribution per department

select e.emp_name,
sum(s.sale_amount) as total_sales,
round(sum(s.sale_amount)*100.00/
sum(sum(s.sale_amount)) over (partition by e.dept_id),2) as contri_pct
from employees e
join sales s on e.emp_id = s.emp_id
GROUP BY e.dept_id,e.emp_name
ORDER BY e.dept_id,e.emp_name;

*/

/*
Query 8:- Top 3 products per month

select * from(
    select date_format(o.order_date,'%Y-%m') as month,
    p.product_name,
    sum(oi.quantity*p.price) as revenue,
    ROW_NUMBER() over (PARTITION BY date_format(o.order_date,'%Y-%m')
    order by sum(oi.quantity*p.price) desc) as rn
    from order_items oi
    join orders o on oi.order_id = o.order_id
    join products p on oi.product_id =p.product_id
    group by month,p.product_name
) t
where rn<=3;

*/

/*
Query 9:- Revenue growth per category month over month

select month,category,revenue,
revenue - LAG(revenue) over 
(PARTITION BY category order by month)
as revenue_growth
from(
    select date_format(o.order_date,'%Y-%m') as month,
    p.category,
    sum(oi.quantity*p.price) as revenue
    FROM order_items oi
    JOIN orders o ON oi.order_id = o.order_id
    JOIN products p ON oi.product_id = p.product_id
    GROUP BY month, p.category
) t
ORDER BY category, month;

*/

/*
Query 10:- Customers with increasing spending trend


WITH customer_orders AS (
    SELECT 
        c.customer_id,
        c.customer_name,
        o.order_date,
        SUM(s.sale_amount) AS order_total
    FROM customers c
    JOIN orders o ON c.customer_id = o.customer_id
    JOIN sales s ON o.order_id = s.order_id
    GROUP BY c.customer_id, c.customer_name, o.order_date
)
SELECT *,
       order_total - LAG(order_total) OVER (
           PARTITION BY customer_id
           ORDER BY order_date
       ) AS order_growth
FROM customer_orders;

*/

