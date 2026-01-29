create database sales_project
use sales_project

select * from customers
select *from orders 
select *from products 

--displaying total revenue collection
select  c.customer_id, c.customer_name, o.quantity , p.price,
		o.quantity * p.price as Revenue 
from orders as o
	join customers as c on o.customer_id=c.customer_id
	join products as p on o.product_id = p.product_id

--monthly sales trend 
select month(o.order_date) as month ,
	   sum(o.quantity *p.price ) as monthly_sales
from orders as o 
join products as p on o.product_id = p.product_id
group by month(o.order_date)
order by month 

--top customer by spends
select c.customer_name ,
	   sum(o.quantity * p.price) as total_spent
from orders as o 
join customers as c on o.customer_id = c.customer_id
join products as p on o.product_id = p.product_id
group by c.customer_name 
order by total_spent desc 





