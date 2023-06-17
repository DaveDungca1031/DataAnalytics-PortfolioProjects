USE BikeStores;

SELECT * 
FROM sales.orders 

--Exploratory Data Analysis (EDA) 
--SEARCHING FOR UNIQUE VALUES 

--revenue per year
WITH orders AS 
(SELECT 
	ord.order_id,
	DATEPART (year, order_date) as order_year_id,
	DATEPART (month, order_date) as order_moth_id,
	DATEPART (day, order_date) as order_day_id
from sales.orders ord
JOIN sales.order_items oi 
ON ord.order_id = oi.order_id)
SELECT 
	order_year_id,
	SUM (quantity*list_price) as revenue
FROM orders o
JOIN sales.order_items oi
ON o.order_id = oi.order_id
GROUP BY order_year_id 

--Revenue per Month for the year 2016 
WITH orders as 
(SELECT
	order_id,
	DATEPART (year, order_date) AS order_year_id,
	DATEPART (month, order_date) AS order_month_id,
	DATEPART (day, order_date) AS order_day_id
FROM sales.orders)
SELECT 
	order_month_id,
SUM (quantity*list_price) as revenue 
FROM orders o
JOIN sales.order_items oi
ON o.order_id = oi.order_id
WHERE order_year_id = 2016
GROUP BY order_month_id
ORDER BY order_month_id 

--Revenue per Month for the year 2017
WITH orders as 
(SELECT
	order_id,
	DATEPART (year, order_date) AS order_year_id,
	DATEPART (month, order_date) AS order_month_id,
	DATEPART (day, order_date) AS order_day_id
FROM sales.orders)
SELECT 
	order_month_id,
SUM (quantity*list_price) as revenue 
FROM orders o
JOIN sales.order_items oi
ON o.order_id = oi.order_id
WHERE order_year_id = 2017
GROUP BY order_month_id
ORDER BY order_month_id 

--Revenue per Month for the year 2018
WITH orders as 
(SELECT
	order_id,
	DATEPART (year, order_date) AS order_year_id,
	DATEPART (month, order_date) AS order_month_id,
	DATEPART (day, order_date) AS order_day_id
FROM sales.orders)
SELECT 
	order_month_id,
SUM (quantity*list_price) as revenue 
FROM orders o
JOIN sales.order_items oi
ON o.order_id = oi.order_id
WHERE order_year_id = 2018
GROUP BY order_month_id
ORDER BY order_month_id 



-- revenue per product category for the year 2016
WITH orders AS 
(SELECT 
	ord.order_id,
	DATEPART (year, order_date) as order_year_id,
	DATEPART (month, order_date) as order_moth_id,
	DATEPART (day, order_date) as order_day_id
from sales.orders ord
JOIN sales.order_items oi 
ON ord.order_id = oi.order_id)
SELECT 
	category_name,
	SUM (oi.quantity*oi.list_price) as revenue
FROM orders o
JOIN sales.order_items oi
ON o.order_id = oi.order_id
JOIN production.products pro 
ON oi.product_id = pro.product_id 
JOIN production.categories cat 
ON pro.category_id = cat.category_id
WHERE order_year_id = 2016
GROUP BY category_name 

-- revenue per product category for the year 2017
WITH orders AS 
(SELECT 
	ord.order_id,
	DATEPART (year, order_date) as order_year_id,
	DATEPART (month, order_date) as order_moth_id,
	DATEPART (day, order_date) as order_day_id
from sales.orders ord
JOIN sales.order_items oi 
ON ord.order_id = oi.order_id)
SELECT 
	category_name,
	SUM (oi.quantity*oi.list_price) as revenue
FROM orders o
JOIN sales.order_items oi
ON o.order_id = oi.order_id
JOIN production.products pro 
ON oi.product_id = pro.product_id 
JOIN production.categories cat 
ON pro.category_id = cat.category_id
WHERE order_year_id = 2017
GROUP BY category_name 

-- revenue per product category for the year 2018
WITH orders AS 
(SELECT 
	ord.order_id,
	DATEPART (year, order_date) as order_year_id,
	DATEPART (month, order_date) as order_moth_id,
	DATEPART (day, order_date) as order_day_id
from sales.orders ord
JOIN sales.order_items oi 
ON ord.order_id = oi.order_id)
SELECT 
	category_name,
	SUM (oi.quantity*oi.list_price) as revenue
FROM orders o
JOIN sales.order_items oi
ON o.order_id = oi.order_id
JOIN production.products pro 
ON oi.product_id = pro.product_id 
JOIN production.categories cat 
ON pro.category_id = cat.category_id
WHERE order_year_id = 2018
GROUP BY category_name 




--revenue per product for the year 2016
WITH orders as 
(SELECT order_id,
		DATEPART (year, order_date) as order_year_id 
FROM sales.orders)
SELECT 
	pro.product_name,
	SUM (oi.quantity*oi.list_price) as revenue 
FROM orders o
JOIN sales.order_items oi 
ON o.order_id = oi.order_id 
JOIN production.products pro
ON oi.product_id = pro.product_id 
WHERE order_year_id = 2016
GROUP BY product_name 

--revenue per product for the year 2017
WITH orders AS 
(SELECT order_id,
		DATEPART (year, order_date) as order_year_id
FROM sales.orders)
SELECT	pro.product_name,
		SUM (oi.quantity*oi.list_price) as revenue 
FROM orders o 
JOIN sales.order_items oi
ON o.order_id = oi.order_id 
JOIN production.products pro
ON oi.product_id = pro.product_id 
WHERE order_year_id = 2017
GROUP BY product_name

--revenue per product for the year 2018
WITH orders AS 
(SELECT order_id,
		DATEPART (year, order_date) as order_year_id
FROM sales.orders)
SELECT	pro.product_name,
		SUM (oi.quantity*oi.list_price) as revenue 
FROM orders o 
JOIN sales.order_items oi
ON o.order_id = oi.order_id 
JOIN production.products pro
ON oi.product_id = pro.product_id 
WHERE order_year_id = 2018
GROUP BY product_name





-- revenue per brands for the year 2016 

WITH orders AS 
(SELECT 
	order_id,	
	DATEPART (year, order_date) AS order_year_id
FROM sales.orders) 
SELECT 
	brand_name,
	SUM (oi.quantity*oi.list_price) AS revenue
FROM orders o
JOIN sales.order_items oi 
ON o.order_id = oi.order_id 
JOIN production.products pro
ON oi.product_id = pro.product_id
JOIN production.brands bra
ON pro.brand_id = bra.brand_id 
WHERE order_year_id = 2016
GROUP BY brand_name


-- revenue per brands for the year 2017

WITH orders AS 
(SELECT 
	order_id,	
	DATEPART (year, order_date) AS order_year_id
FROM sales.orders) 
SELECT 
	brand_name,
	SUM (oi.quantity*oi.list_price) AS revenue
FROM orders o
JOIN sales.order_items oi 
ON o.order_id = oi.order_id 
JOIN production.products pro
ON oi.product_id = pro.product_id
JOIN production.brands bra
ON pro.brand_id = bra.brand_id 
WHERE order_year_id = 2017
GROUP BY brand_name

-- revenue per brands for the year 2018

WITH orders AS 
(SELECT 
	order_id,	
	DATEPART (year, order_date) AS order_year_id
FROM sales.orders) 
SELECT 
	brand_name,
	SUM (oi.quantity*oi.list_price) AS revenue
FROM orders o
JOIN sales.order_items oi 
ON o.order_id = oi.order_id 
JOIN production.products pro
ON oi.product_id = pro.product_id
JOIN production.brands bra
ON pro.brand_id = bra.brand_id 
WHERE order_year_id = 2018
GROUP BY brand_name


--revenue per state 
WITH orders AS 
(SELECT 
	order_id,
	customer_id,
	DATEPART (year, order_date) AS order_year_id
FROM sales.orders) 
SELECT 
	state,
	SUM (oi.quantity*oi.list_price) as revenue 
FROM orders o
JOIN sales.customers cus 
ON o.customer_id = cus.customer_id
JOIN sales.order_items oi
ON o.order_id = oi.order_id 
GROUP BY state


-- per store for the year 2016
WITH orders AS 
(SELECT 
	order_id,
	store_id,
	DATEPART (year, order_date) AS order_year_id
FROM sales.orders) 
SELECT 
	store_name,
	SUM (oi.quantity*oi.list_price) AS revenue 
FROM orders o 
JOIN sales.order_items oi
ON o.order_id = oi.order_id 
JOIN sales.stores sto 
ON o.store_id = sto.store_id
WHERE order_year_id = 2016
GROUP BY store_name

-- per store for the year 2017
WITH orders AS 
(SELECT 
	order_id,
	store_id,
	DATEPART (year, order_date) AS order_year_id
FROM sales.orders) 
SELECT 
	store_name,
	SUM (oi.quantity*oi.list_price) AS revenue 
FROM orders o 
JOIN sales.order_items oi
ON o.order_id = oi.order_id 
JOIN sales.stores sto 
ON o.store_id = sto.store_id
WHERE order_year_id = 2017
GROUP BY store_name

-- revenue per store for the year 2018
WITH orders AS 
(SELECT 
	order_id,
	store_id,
	DATEPART (year, order_date) AS order_year_id
FROM sales.orders) 
SELECT 
	store_name,
	SUM (oi.quantity*oi.list_price) AS revenue 
FROM orders o 
JOIN sales.order_items oi
ON o.order_id = oi.order_id 
JOIN sales.stores sto 
ON o.store_id = sto.store_id
WHERE order_year_id = 2018
GROUP BY store_name



--top staff for the year 2016
WITH orders AS 
(SELECT 
	order_id,
	staff_id,
	DATEPART (year, order_date) AS order_year_id
FROM sales.orders) 
SELECT 
	CONCAT(first_name,' ',last_name) as staff_name,
	SUM (oi.quantity*list_price) AS revenue 
FROM orders o
JOIN sales.order_items oi
ON o.order_id = oi.order_id 
JOIN sales.staffs sta
ON o.staff_id = sta.staff_id 
WHERE order_year_id = 2016
GROUP BY CONCAT(first_name,' ',last_name)
ORDER BY revenue desc

--top staff for the year 2017
WITH orders AS 
(SELECT 
	order_id,
	staff_id,
	DATEPART (year, order_date) AS order_year_id
FROM sales.orders) 
SELECT 
	CONCAT(first_name,' ',last_name) as staff_name,
	SUM (oi.quantity*list_price) AS revenue 
FROM orders o
JOIN sales.order_items oi
ON o.order_id = oi.order_id 
JOIN sales.staffs sta
ON o.staff_id = sta.staff_id 
WHERE order_year_id = 2017
GROUP BY CONCAT(first_name,' ',last_name)
ORDER BY revenue desc

--top staff for the year 2018
WITH orders AS 
(SELECT 
	order_id,
	staff_id,
	DATEPART (year, order_date) AS order_year_id
FROM sales.orders) 
SELECT 
	CONCAT(first_name,' ',last_name) as staff_name,
	SUM (oi.quantity*list_price) AS revenue 
FROM orders o
JOIN sales.order_items oi
ON o.order_id = oi.order_id 
JOIN sales.staffs sta
ON o.staff_id = sta.staff_id 
WHERE order_year_id = 2018
GROUP BY CONCAT(first_name,' ',last_name)
ORDER BY revenue desc

-- top 10 customers for the year 2016

WITH orders AS 
(SELECT 
	order_id,
	customer_id,
	DATEPART (year, order_date) AS order_year_id
FROM sales.orders) 
SELECT 
	CONCAT(first_name,' ',last_name) AS customer_name,
	SUM (oi.quantity*oi.list_price) as revenue 
FROM orders o 
JOIN sales.customers cust
ON o.customer_id = cust.customer_id 
JOIN sales.order_items oi 
ON o.order_id = oi.order_id 
WHERE order_year_id = 2016 
GROUP BY CONCAT(first_name,' ',last_name)
ORDER BY SUM (oi.quantity*oi.list_price) desc

-- top 10 customers for the year 2017

WITH orders AS 
(SELECT 
	order_id,
	customer_id,
	DATEPART (year, order_date) AS order_year_id
FROM sales.orders) 
SELECT 
	CONCAT(first_name,' ',last_name) AS customer_name,
	SUM (oi.quantity*oi.list_price) as revenue 
FROM orders o 
JOIN sales.customers cust
ON o.customer_id = cust.customer_id 
JOIN sales.order_items oi 
ON o.order_id = oi.order_id 
WHERE order_year_id = 2017
GROUP BY CONCAT(first_name,' ',last_name)
ORDER BY SUM (oi.quantity*oi.list_price) desc

-- top 10 customers for the year 2018

WITH orders AS 
(SELECT 
	order_id,
	customer_id,
	DATEPART (year, order_date) AS order_year_id
FROM sales.orders) 
SELECT 
	CONCAT(first_name,' ',last_name) AS customer_name,
	SUM (oi.quantity*oi.list_price) as revenue 
FROM orders o 
JOIN sales.customers cust
ON o.customer_id = cust.customer_id 
JOIN sales.order_items oi 
ON o.order_id = oi.order_id 
WHERE order_year_id = 2018
GROUP BY CONCAT(first_name,' ',last_name)
ORDER BY SUM (oi.quantity*oi.list_price) desc