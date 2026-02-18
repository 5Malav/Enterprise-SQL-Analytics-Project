/*
Query 1:- Label each order as 'small','medium' and 'large' based on
sale amount

select o.order_id, s.sale_amount,
    case
        when s.sale_amount < 15000 then 'small'
        when s.sale_amount between 15001 and 35000 then 'medium'
        else 'large'
    end as order_size

from orders o
INNER JOIN sales s on o.order_id=s.order_id ORDER BY o.order_id;

*/

/* 
Query 2:- show orders when sale amount is the highest in the system

select o.order_id,s.sale_amount
from orders o
INNER JOIN sales s on o.order_id=s.order_id
where s.sale_amount = (select max(sale_amount) from sales);
*/

/*
Query 3:- Products with max revenue


select p.product_name,sum(oi.quantity*p.price) as product_revenue
from order_items oi
INNER JOIN products p on oi.product_id=p.product_id
GROUP BY p.product_name having 

product_revenue = (select max(total_revenue) from (

select sum(oi2.quantity*p2.price) as total_revenue
from order_items oi2
inner join products p2 on oi2.product_id=p2.product_id
GROUP by p2.product_name) 
as sub
);

*/

/*

Query 4:- Customer spending above average

SELECT 
    c.customer_name,
    SUM(s.sale_amount) AS total_revenue
FROM customers c
JOIN orders o 
    ON c.customer_id = o.customer_id
JOIN sales s 
    ON o.order_id = s.order_id
GROUP BY c.customer_id, c.customer_name
HAVING SUM(s.sale_amount) >
(
    SELECT AVG(customer_total)
    FROM (
        SELECT SUM(s2.sale_amount) AS customer_total
        FROM customers c2
        JOIN orders o2 ON c2.customer_id = o2.customer_id
        JOIN sales s2 ON o2.order_id = s2.order_id
        GROUP BY c2.customer_id
    ) AS t
);
*/
SELECT *
FROM (
    SELECT 
        c.customer_id,
        c.customer_name,
        o.order_date,
        SUM(s.sale_amount) OVER (PARTITION BY c.customer_id ORDER BY o.order_date) AS cumulative_spent,
        ROW_NUMBER() OVER (PARTITION BY c.customer_id ORDER BY o.order_date) AS rn
    FROM customers c
    JOIN orders o ON c.customer_id = o.customer_id
    JOIN sales s ON o.order_id = s.order_id
) t
WHERE rn >= 2
AND cumulative_spent > LAG(cumulative_spent) OVER (PARTITION BY customer_id ORDER BY order_date);
