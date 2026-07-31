select * from ecommerce_orders;
select customer_name, product, price from ecommerce_orders;
select * from ecommerce_orders
where region = 'south'and price > 500;

select count(*) from ecommerce_orders;
select sum(price * quantity) as total_price from ecommerce_orders;
select avg (price) as avg_price from ecommerce_orders;

select region, sum(price * quantity) as total_revenue 
from ecommerce_orders
group by region;

select order_id, customer_name, price
from ecommerce_orders
order by price desc
limit 10;

create table customers(
customer_name text,
email text,
city text
);

select ecommerce_orders.order_id, ecommerce_orders.customer_name, ecommerce_customers.email, ecommerce_orders.price
from ecommerce_orders
join ecommerce_customers
on ecommerce_orders.customer_name =ecommerce_customers.customer_name;

select order_id, price,
case
    when price > 1000 then 'premium'
    when price between 500 and 1000 then 'mid_range'
    else 'budget'
end as price_category
from ecommerce_orders;

select * from ecommerce_orders
where price > (
	  select avg(price) from ecommerce_orders
);

select region, sum(quantity) as total_items_sold
from ecommerce_orders
group by region
order by total_items_sold desc;

select
     date_format(order_date, '%Y-%m') as month,
     sum(quantity * price) as total_revenue 
from ecommerce_orders
group by month
order by month;

select product,
       sum(quantity) as total_quantity
from ecommerce_orders
group by product
order by total_quantity desc
limit 5;

select category,
       sum(quantity * price) as revenue
from ecommerce_orders
group by category;

select ecommerce_customers.city,
       sum(ecommerce_orders.quantity *ecommerce_orders.price) as revenue
from ecommerce_orders
join 
     ecommerce_customers
	 on ecommerce_orders.customer_name= ecommerce_customers.customer_name
group by city
order by revenue desc;




