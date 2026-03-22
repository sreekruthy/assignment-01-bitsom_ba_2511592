-- Q1: List all customers from Mumbai along with their total order value
select c.customer_id, c.customer_name, sum(oi.quantity * p.unit_price) as total_order_value
from customers c
join orders o on c.customer_id = o.customer_id
join order_items oi on o.order_id = oi.order_id
join products p on oi.product_id = p.product_id
where c.customer_city = 'Mumbai'
group by c.customer_id, c.customer_name;

-- Q2: Find the top 3 products by total quantity sold
select p.product_id, p.product_name, sum(oi.quantity) as total_quantity_sold
from products p
join order_items oi on p.product_id = oi.product_id
group by p.product_id, p.product_name
order by total_quantity_sold desc
limit 3;

-- Q3: List all sales representatives and the number of unique customers they have handled
select s.sales_rep_id, s.sales_rep_name, count(distinct o.customer_id) as unique_customers
from sales_reps s
left join orders o on s.sales_rep_id = o.sales_rep_id
group by s.sales_rep_id, s.sales_rep_name
order by unique_customers desc;

-- Q4: Find all orders where the total value exceeds 10,000, sorted by value descending
select o.order_id, sum(oi.quantity * p.unit_price) as order_value
from orders o
join order_items oi on o.order_id = oi.order_id
join products p on oi.product_id = p.product_id
group by o.order_id
having sum(oi.quantity * p.unit_price) > 10000
order by order_value desc;

-- Q5: Identify any products that have never been ordered
select p.product_id, p.product_name
from products p
left join order_items oi on p.product_id = oi.product_id
where oi.product_id is null;
