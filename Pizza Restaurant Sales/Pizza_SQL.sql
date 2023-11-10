select * from [PizzaDB].[dbo].[Pizza_Sales];

select sum(total_price) as Total_Revenue from [PizzaDB].[dbo].[Pizza_Sales];

select sum(total_price)/count(distinct order_id) as Average_Order_Value from [PizzaDB].[dbo].[Pizza_Sales];

select sum(quantity) as Total_Pizza_Sold from [PizzaDB].[dbo].[Pizza_Sales];

select count(distinct order_id) as Total_Orders from [PizzaDB].[dbo].[Pizza_Sales];

select cast(cast(sum(quantity) 
as decimal(10, 2)) / cast(count(distinct order_id) 
as decimal(10, 2)) as decimal(10, 2)) 
from [PizzaDB].[dbo].[Pizza_Sales];


/* Daily Trends for Total Orders... */
select DATENAME(DW, order_date) as order_day, 
count(distinct order_id) as Total_Orders 
from [PizzaDB].[dbo].[Pizza_Sales]
group by DATENAME(DW, order_date);


/* Monthly Trend for Total Orders... */

select DATENAME(MONTH, order_date) as Month_Name, count(distinct order_id) as Total_Orders
from [PizzaDB].[dbo].[Pizza_Sales]
group by DateName(Month, order_date)
order by Total_orders desc;


/* Percentage of sales by Pizza Category */

select pizza_category, sum(total_price) as Total_Price, sum(total_price)*100 / (select sum(total_price) from [PizzaDB].[dbo].[Pizza_Sales]) as Percentage_Sales 
from [PizzaDB].[dbo].[Pizza_Sales] 
group by pizza_category
order by Percentage_Sales desc;



/* For a specific month... */

select pizza_category, sum(total_price) as Total_Price, sum(total_price)*100 / (select sum(total_price) from [PizzaDB].[dbo].[Pizza_Sales] where MONTH(order_date) = 1) as Percentage_Sales 
from [PizzaDB].[dbo].[Pizza_Sales] 
where MONTH(order_date) = 1  
group by pizza_category  
order by Percentage_Sales desc;



/* Percentage of Sales by Pizza Size */

select pizza_size, cast(sum(total_price) as decimal(10, 2)) as Total_Price, sum(total_price)*100 / (select sum(total_price) from [PizzaDB].[dbo].[Pizza_Sales]) as Percentage_Sales
from [PizzaDB].[dbo].[Pizza_Sales] 
group by pizza_size;



/* For a first quater... */
select pizza_size, cast(sum(total_price) as decimal(10, 2)) as Total_Price, 
cast(sum(total_price)*100 / (select sum(total_price) 
from [PizzaDB].[dbo].[Pizza_Sales] 
where datepart(QUARTER, order_date) = 1) as decimal(10,2)) 
as Percentage_Sales
from [PizzaDB].[dbo].[Pizza_Sales] 
where Datepart(QUARTER, order_date) = 1
group by pizza_size
order by Percentage_Sales desc;



 
 /* Top 5 best pizza by revenue, total quantity and total orders */

select top 5 pizza_name, sum(total_price) as Total_Revenue
from [PizzaDB].[dbo].[Pizza_Sales]
group by pizza_name
order by Total_Revenue desc;


/* bottom 5*/
select top 5 pizza_name, sum(total_price) as Total_Revenue
from [PizzaDB].[dbo].[Pizza_Sales]
group by pizza_name
order by Total_Revenue asc;


select top 5 pizza_name, sum(quantity) as Total_Quantity
from [PizzaDB].[dbo].[Pizza_Sales]
group by pizza_name
order by Total_Quantity asc;



select top 5 pizza_name, count(distinct order_id) as Total_Orders
from [PizzaDB].[dbo].[Pizza_Sales]
group by pizza_name
order by Total_Orders desc;



