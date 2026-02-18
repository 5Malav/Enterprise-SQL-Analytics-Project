/*
Query 1:- ROW_NUMBER()
Assign a row number to each employee based on total 
revenue (Highest first)

select e.emp_name,sum(s.sale_amount) as total_revenue,
row_number() over (order by sum(s.sale_amount) desc) as emp_rank
from employees e
INNER JOIN sales s on e.emp_id = s.emp_id
GROUP BY e.emp_name;

*/

/*
Query 2:- RANK()
Rank employee by revenue

select e.emp_name,sum(s.sale_amount) as total_revenue,
RANK() over (order by sum(s.sale_amount) desc) as emp_rank
from employees e
INNER JOIN sales s on e.emp_id = s.emp_id
GROUP BY e.emp_name;
*/

/*
Query 3:- DENSE_RANK()
Rank employees without skipping number

select e.emp_name,sum(s.sale_amount) as total_revenue,
DENSE_RANK() over (order by sum(s.sale_amount) desc) as emp_rank
from employees e
INNER JOIN sales s on e.emp_id = s.emp_id
GROUP BY e.emp_name;
*/

/*
Query 4:- Running Total
Show cumulative revenue by order date

select o.order_date,sum(s.sale_amount) as daily_revenue,
sum(sum(s.sale_amount)) over (ORDER BY o.order_date) as running_total
from orders o
INNER JOIN sales s on o.order_id = s.order_id
GROUP BY o.order_date
ORDER BY o.order_date;

*/

/*
Query 5:- Partition BY(Revenue per employee within department)

select e.emp_name,sum(s.sale_amount) as total_revenue,
rank() over (PARTITION BY e.dept_id ORDER BY sum(s.sale_amount) DESC)
as dept_revenue
from employees e
INNER JOIN sales s on e.emp_id = s.emp_id
GROUP BY e.dept_id,e.emp_name;
*/

/*
Query 6:- LAG(Compare with previous day)

Show daily revenue and compare it with previous day's revenue

select o.order_date,sum(s.sale_amount) as daily_revenue,
LAG(sum(s.sale_amount)) over (ORDER BY o.order_date) 
as previous_day_revenue
from orders o
join sales s on o.order_id = s.order_id
GROUP BY o.order_date
ORDER BY o.order_date;
*/

/*
Query 7:- Show revenu difference from previous day

select order_date,daily_revenue,
daily_revenue - LAG(daily_revenue) over (ORDER BY order_date)
as revenue_change FROM
(
select o.order_date,sum(s.sale_amount) as daily_revenue
from orders o JOIN sales s on o.order_id = s.order_id
GROUP BY o.order_date
)t;
*/



/*

Query 8:- LEAD() - Next DAY Revenue

Show today's revenue and next day's revenue

select o.order_date , sum(s.sale_amount) as daily_revenue,
LEAD(sum(s.sale_amount)) over (order by o.order_date) 
as next_day_revenue
from orders o join sales s on o.order_id = s.order_id
GROUP BY o.order_date ORDER BY o.order_date;
*/

/*
Query 9:- Show each employee revenue as percetage of total
company revenue

select e.emp_name,sum(s.sale_amount) as total_revenue,
round(sum(s.sale_amount) * 100.0/sum(sum(s.sale_amount)) over(),2)
as percentage_contribution
from employees e join sales s on e.emp_id =s.emp_id
GROUP BY e.emp_name;

*/

/*
Query 10:- Moving Day(3 Day Average revenue)

Calculate 3 day moving average revenue

select order_date,daily_revenue,
avg(daily_revenue) over (order by order_date
ROWS BETWEEN 2 PRECEDING and CURRENT ROW) as moving_average
FROM(
select o.order_date,sum(s.sale_amount) as daily_revenue
from orders o join sales s on o.order_id = s.order_id
GROUP BY o.order_date
)t;
*/

/*
Query 11:- Top 2 employees per department

select * from
(
    select e.dept_id,e.emp_name,sum(s.sale_amount) as total_revenue,
    ROW_NUMBER() over (PARTITION BY e.dept_id 
    ORDER BY sum(s.sale_amount) desc) as rn
    from employees e join sales s on e.emp_id = s.emp_id
    GROUP BY e.dept_id , e.emp_name
)t where rn<=2;


*/

/*
Query 12:- Detect first sale of each employee

select * from
(
    select e.emp_name,
    o.order_date,
    ROW_NUMBER() over
    (PARTITION BY e.emp_id 
    ORDER BY o.order_date) 
    as rn
    from employees e join sales s on e.emp_id=s.emp_id
    join orders o on s.order_id=o.order_id
)t WHERE rn=1;
*/


/*
Query 13:- Show cumulative revenue inside each department
order by date

select e.dept_id,o.order_date,sum(s.sale_amount)as daily_revenue,
sum(sum(s.sale_amount)) over 
(PARTITION BY e.dept_id
ORDER BY o.order_date) as cumulative_dept_revenue
from employees e join sales s on e.emp_id=s.emp_id
join orders o on s.order_id=o.order_id
GROUP BY o.order_date,e.dept_id
ORDER BY o.order_date,e.dept_id;

*/

/*
Query 14:- Highest sale per employee(without group by)

select * from(
    select e.emp_name,s.sale_amount,
    ROW_NUMBER() over (PARTITION BY e.emp_id
    ORDER BY s.sale_amount desc) as rn
    FROM employees e join sales s on e.emp_id=s.emp_id
)t where rn=1;
*/

/*
Query 15:- Find consecutive sales days
Identify gaps in order dates
with ordered_dates as(
    select order_date,
    ROW_NUMBER() over (ORDER BY order_date) as rn
    from orders
)

select min(order_date) as start_date,
max(order_date) as end_date,
count(*) as streak_length
from ordered_dates
GROUP BY date_sub(order_date,INTERVAL rn day)
order by  start_date;

*/

/*
Qyery 16:- Display employee hierarchy (who report to whom)

with recursive emp_hierarchy as(
    
    -- Top level managers
    select emp_id,emp_name,manager_id, 1 as level
    from employees where manager_id is null

    union all

    -- Recursive part
    select e.emp_id,e.emp_name,e.manager_id,eh.level+1
    from employees e
    join emp_hierarchy eh
    on e.manager_id = eh.emp_id
)
SELECT * 
FROM emp_hierarchy
ORDER BY level, emp_id;
*/

