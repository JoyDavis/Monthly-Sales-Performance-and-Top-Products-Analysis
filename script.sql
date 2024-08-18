-- 1. Total sales revenue for each month
SELECT 
    'January' AS month, 
    ROUND(SUM(price * quantity), 2) AS total_revenue
FROM 
    JanSales
UNION ALL
SELECT 
    'February' AS month, 
    ROUND(SUM(price * quantity), 2) AS total_revenue
FROM 
    FebSales
UNION ALL
SELECT 
    'March' AS month, 
    ROUND(SUM(price * quantity), 2) AS total_revenue
FROM 
    MarSales
UNION ALL
SELECT 
    'April' AS month, 
    ROUND(SUM(price * quantity), 2) AS total_revenue
FROM 
    AprSales
UNION ALL
SELECT 
    'May' AS month, 
    ROUND(SUM(price * quantity), 2) AS total_revenue
FROM 
    MaySales;

-- 2. Top five best-selling products by revenue from January to May
SELECT 
    Product, 
    ROUND(SUM(price * quantity),2) AS TotalRevenue
FROM (
    SELECT * FROM JanSales
    UNION ALL
    SELECT * FROM FebSales
    UNION ALL
    SELECT * FROM MarSales
    UNION ALL
    SELECT * FROM AprSales
    UNION ALL
    SELECT * FROM MaySales
)
GROUP BY Product
ORDER BY TotalRevenue DESC
LIMIT 5;
