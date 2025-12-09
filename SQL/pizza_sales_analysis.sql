--To obtain the Total Revenue
SELECT 
SUM(total_price) AS otal_Revenue
FROM 
pizza_sales

-- To obtain the Average Order Value
SELECT
SUM(total_price)/COUNT(DISTINCT order_id) AS Avg_Order_Value
FROM 
pizza_sales

--To obtain Total Pizza Sold
SELECT 
SUM(quantity) AS Total_Pizza_Sold
FROM 
pizza_sales

--To obtain the Total Orders
SELECT
COUNT(DISTINCT order_id) AS Total_Orders 
FROM 
pizza_sales

--To determine Daily Trend for Total Orders
SELECT
DATENAME(DW, order_date) AS order_day,
COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY DATENAME(DW, order_date)
ORDER BY total_orders DESC

--To determine Monthly Trend for Orders
SELECT
DATENAME(MONTH, order_date) AS Month_Name,
COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY DATENAME(MONTH, order_date)
ORDER BY total_orders DESC

--To determine % of Sales by Pizza Category
SELECT
pizza_category,
CAST(SUM(total_price) AS DECIMAL(10,2)) AS Total_Revenue,
CAST(SUM(total_price)*100/ (SELECT SUM(total_price) FROM pizza_sales) AS DECIMAL(10,2)) AS pct
FROM pizza_sales
GROUP BY pizza_category
ORDER BY pct DESC

--% of Sales by Pizza Size
SELECT
pizza_size,
CAST(SUM(total_price) AS DECIMAL(10,2)) AS Total_Revenue,
CAST(SUM(total_price)*100/ (SELECT SUM(total_price) FROM pizza_sales) AS DECIMAL(10,2)) AS pct
FROM pizza_sales
GROUP BY pizza_size
ORDER BY pct DESC

--Total Pizza Sold by Pizza Category
SELECT 
pizza_category,
SUM(quantity) AS Total_Quantity_Sold
FROM pizza_sales
GROUP BY pizza_category
ORDER BY Total_Quantity_Sold DESC

--Top 5 Pizzas Sold by Revenue
SELECT
Top 5 pizza_name,
SUM(total_price) AS Total_Reveue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Reveue DESC

--Bottom 5 Pizzas Sold by Revenue
SELECT
Top 5 pizza_name,
SUM(total_price) AS Total_Reveue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Reveue ASC

--Top 5 Pizzas Sold by Quantity
SELECT
Top 5 pizza_name,
SUM(quantity) AS Total_Quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Quantity DESC

--Bottom 5 Pizzas Sold by Quantity
SELECT
Top 5 pizza_name,
SUM(quantity) AS Total_Quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Quantity ASC

--Top 5 Pizzas Sold by Order
SELECT
Top 5 pizza_name,
COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders DESC

--Bottom 5 Pizzas   Sold by Order
SELECT
Top 5 pizza_name,
COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders ASC


--Top 5 Pizzas Sold by Order
SELECT
Top 5 pizza_name,
COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
WHERE pizza_category = 'Classic'
GROUP BY pizza_name
ORDER BY Total_Orders ASC
