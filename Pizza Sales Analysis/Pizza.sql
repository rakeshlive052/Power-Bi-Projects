select * from pizza_sales

select SUM(total_price) as [Total Revenue] from pizza_sales

select SUM(total_price)/ COUNT (distinct order_id) as [Avg Order Value] from pizza_sales

select SUM(quantity) [Total Pizza Sold] from pizza_sales

select count(distinct order_id) [Total Orders] from pizza_sales


select cast(cast (SUM(quantity) as decimal(10,2)) / 
cast (COUNT (distinct order_id) as decimal (10,2)) as decimal(10,2)) as "Avg Pizza Per Order" from pizza_sales


select * from pizza_sales
select DATENAME(DW, order_date) as "Order Day",
COUNT (distinct order_id) "Total Orders"
from pizza_sales group by DATENAME(DW, order_date)

select * from pizza_sales
select DATENAME(MONTH, order_date) as "Month Name",
COUNT (distinct order_id) "Total Orders"
from pizza_sales group by DATENAME(MONTH, order_date)
order by "Total Orders" desc

select * from pizza_sales

select pizza_category, cast(SUM(total_price) as decimal(10,2))as "Total Sales",cast (SUM(total_price)*100/ 
(select SUM(total_price) from pizza_sales where MONTH(order_date)=1) as decimal(10,2) )"PCT" 
from pizza_sales 
where MONTH(order_date)=1
group by pizza_category


select pizza_size, cast(SUM(total_price) as decimal(10,2))as "Total Sales", cast (SUM(total_price)*100/ 
(select SUM(total_price) from pizza_sales  where datepart(quarter, order_date)=1 )as decimal(10,2)) "PCT" 
from pizza_sales 
where datepart(quarter, order_date)=1
group by pizza_size
order by PCT desc



select * from pizza_sales

select top 5 pizza_name, SUM(total_price) "Total Revenue"from pizza_sales
group by pizza_name order by "Total Revenue" --- Bottom in respect to price


select top 5 pizza_name, SUM(total_price) "Total Revenue"from pizza_sales
group by pizza_name order by "Total Revenue" desc ---Top in respect to price


select top 5 pizza_name, SUM(quantity) "Total Quantity" from pizza_sales
group by pizza_name order by "Total Quantity" desc--- Top in respect to quantity

select top 5 pizza_name, SUM(quantity) "Total Quantity" from pizza_sales
group by pizza_name order by "Total Quantity" -- Bottom in respect to quantity


select top 5 pizza_name, SUM(quantity) "Total Quantity" from pizza_sales
group by pizza_name order by "Total Quantity" desc--- Top in respect to quantity

select top 5 pizza_name, count (distinct order_id) "Total Orders" from pizza_sales
group by pizza_name order by "Total Orders" -- Bottom in respect to Orders

select top 5 pizza_name, count (distinct order_id) "Total Orders" from pizza_sales
group by pizza_name order by "Total Orders" desc-- Top in respect to Orders
