-- Q1: Total sales revenue by product category for each month
select d.year, d.month, d.month_name, p.category, sum(f.total_amount) as total_revenue
from fact_sales f
join dim_date d on f.date_id = d.date_id
join dim_product p on f.product_id = p.product_id
group by d.year, d.month, d.month_name, p.category
order by d.year, d.month, total_revenue desc;

-- Q2: Top 2 performing stores by total revenue
select s.store_name, s.store_city, sum(f.total_amount) as total_revenue
from fact_sales f
join dim_store s on f.store_id = s.store_id
group by s.store_name, s.store_city
order by total_revenue desc
limit 2;

-- Q3: Month-over-month sales trend across all stores
select d.year, d.month, d.month_name, sum(f.total_amount) as monthly_sales
from fact_sales f
join dim_date d on f.date_id = d.date_id
group by d.year, d.month, d.month_name
order by d.year, d.month;