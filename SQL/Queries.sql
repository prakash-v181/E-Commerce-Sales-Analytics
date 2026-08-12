-- ============================================================
-- E-COMMERCE SALES ANALYTICS
-- SQL ANALYSIS QUERIES
-- ============================================================

USE ecommerce;


-- ============================================================
-- 1. BASIC BUSINESS KPIs
-- ============================================================

-- 1. Total Sales
SELECT
    SUM(Sales) AS Total_Sales
FROM Orders;


-- 2. Total Profit
SELECT
    SUM(Profit) AS Total_Profit
FROM Orders;


-- 3. Total Orders
SELECT
    COUNT(DISTINCT OrderID) AS Total_Orders
FROM Orders;


-- 4. Total Customers
SELECT
    COUNT(DISTINCT CustomerID) AS Total_Customers
FROM Orders;


-- 5. Total Quantity Sold
SELECT
    SUM(Quantity) AS Total_Quantity
FROM Orders;


-- 6. Average Order Value
SELECT
    ROUND(
        SUM(Sales) / COUNT(DISTINCT OrderID),
        2
    ) AS Average_Order_Value
FROM Orders;


-- 7. Profit Margin
SELECT
    ROUND(
        SUM(Profit) / SUM(Sales) * 100,
        2
    ) AS Profit_Margin_Percentage
FROM Orders;


-- 8. Average Profit per Order
SELECT
    ROUND(
        SUM(Profit) / COUNT(DISTINCT OrderID),
        2
    ) AS Average_Profit_Per_Order
FROM Orders;



-- ============================================================
-- 2. CATEGORY ANALYSIS
-- ============================================================

-- 9. Sales by Category
SELECT
    Category,
    SUM(Sales) AS Total_Sales
FROM Orders
GROUP BY Category
ORDER BY Total_Sales DESC;


-- 10. Profit by Category
SELECT
    Category,
    SUM(Profit) AS Total_Profit
FROM Orders
GROUP BY Category
ORDER BY Total_Profit DESC;


-- 11. Sales and Profit by Category
SELECT
    Category,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    ROUND(
        SUM(Profit) / SUM(Sales) * 100,
        2
    ) AS Profit_Margin
FROM Orders
GROUP BY Category
ORDER BY Total_Sales DESC;


-- 12. Quantity Sold by Category
SELECT
    Category,
    SUM(Quantity) AS Total_Quantity
FROM Orders
GROUP BY Category
ORDER BY Total_Quantity DESC;


-- 13. Categories with Sales Above 500,000
SELECT
    Category,
    SUM(Sales) AS Total_Sales
FROM Orders
GROUP BY Category
HAVING SUM(Sales) > 500000
ORDER BY Total_Sales DESC;



-- ============================================================
-- 3. CUSTOMER ANALYSIS
-- ============================================================

-- 14. Top 10 Customers by Sales
SELECT
    CustomerName,
    SUM(Sales) AS Total_Sales
FROM Orders
GROUP BY CustomerName
ORDER BY Total_Sales DESC
LIMIT 10;


-- 15. Top 10 Customers by Profit
SELECT
    CustomerName,
    SUM(Profit) AS Total_Profit
FROM Orders
GROUP BY CustomerName
ORDER BY Total_Profit DESC
LIMIT 10;


-- 16. Customer Sales and Profit
SELECT
    CustomerName,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM Orders
GROUP BY CustomerName
ORDER BY Total_Sales DESC;


-- 17. Number of Orders per Customer
SELECT
    CustomerName,
    COUNT(DISTINCT OrderID) AS Total_Orders
FROM Orders
GROUP BY CustomerName
ORDER BY Total_Orders DESC;


-- 18. Average Sales per Customer
SELECT
    ROUND(
        SUM(Sales) / COUNT(DISTINCT CustomerName),
        2
    ) AS Average_Sales_Per_Customer
FROM Orders;


-- 19. Customers with Sales Above 10,000
SELECT
    CustomerName,
    SUM(Sales) AS Total_Sales
FROM Orders
GROUP BY CustomerName
HAVING SUM(Sales) > 10000
ORDER BY Total_Sales DESC;



-- ============================================================
-- 4. PRODUCT ANALYSIS
-- ============================================================

-- 20. Top 10 Products by Sales
SELECT
    ProductName,
    SUM(Sales) AS Total_Sales
FROM Orders
GROUP BY ProductName
ORDER BY Total_Sales DESC
LIMIT 10;


-- 21. Top 10 Products by Profit
SELECT
    ProductName,
    SUM(Profit) AS Total_Profit
FROM Orders
GROUP BY ProductName
ORDER BY Total_Profit DESC
LIMIT 10;


-- 22. Bottom 10 Products by Profit
SELECT
    ProductName,
    SUM(Profit) AS Total_Profit
FROM Orders
GROUP BY ProductName
ORDER BY Total_Profit ASC
LIMIT 10;


-- 23. Loss-Making Products
SELECT
    ProductName,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM Orders
GROUP BY ProductName
HAVING SUM(Profit) < 0
ORDER BY Total_Profit ASC;


-- 24. Product Sales and Profit
SELECT
    ProductName,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    SUM(Quantity) AS Total_Quantity
FROM Orders
GROUP BY ProductName
ORDER BY Total_Sales DESC;



-- ============================================================
-- 5. SUBCATEGORY ANALYSIS
-- ============================================================

-- 25. Sales by Subcategory
SELECT
    SubCategory,
    SUM(Sales) AS Total_Sales
FROM Orders
GROUP BY SubCategory
ORDER BY Total_Sales DESC;


-- 26. Profit by Subcategory
SELECT
    SubCategory,
    SUM(Profit) AS Total_Profit
FROM Orders
GROUP BY SubCategory
ORDER BY Total_Profit DESC;


-- 27. Sales and Profit by Subcategory
SELECT
    SubCategory,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    ROUND(
        SUM(Profit) / SUM(Sales) * 100,
        2
    ) AS Profit_Margin
FROM Orders
GROUP BY SubCategory
ORDER BY Total_Sales DESC;



-- ============================================================
-- 6. REGIONAL ANALYSIS
-- ============================================================

-- 28. Sales by Region
SELECT
    Region,
    SUM(Sales) AS Total_Sales
FROM Orders
GROUP BY Region
ORDER BY Total_Sales DESC;


-- 29. Profit by Region
SELECT
    Region,
    SUM(Profit) AS Total_Profit
FROM Orders
GROUP BY Region
ORDER BY Total_Profit DESC;


-- 30. Regional Sales and Profit
SELECT
    Region,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    ROUND(
        SUM(Profit) / SUM(Sales) * 100,
        2
    ) AS Profit_Margin
FROM Orders
GROUP BY Region
ORDER BY Total_Sales DESC;


-- 31. Top 10 States by Sales
SELECT
    State,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM Orders
GROUP BY State
ORDER BY Total_Sales DESC
LIMIT 10;


-- 32. Bottom 10 States by Profit
SELECT
    State,
    SUM(Profit) AS Total_Profit
FROM Orders
GROUP BY State
ORDER BY Total_Profit ASC
LIMIT 10;



-- ============================================================
-- 7. CUSTOMER SEGMENT ANALYSIS
-- ============================================================

-- 33. Sales by Segment
SELECT
    Segment,
    SUM(Sales) AS Total_Sales
FROM Orders
GROUP BY Segment
ORDER BY Total_Sales DESC;


-- 34. Profit by Segment
SELECT
    Segment,
    SUM(Profit) AS Total_Profit
FROM Orders
GROUP BY Segment
ORDER BY Total_Profit DESC;


-- 35. Segment Sales and Profit
SELECT
    Segment,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    ROUND(
        SUM(Profit) / SUM(Sales) * 100,
        2
    ) AS Profit_Margin
FROM Orders
GROUP BY Segment
ORDER BY Total_Sales DESC;



-- ============================================================
-- 8. SHIPPING ANALYSIS
-- ============================================================

-- 36. Orders by Ship Mode
SELECT
    ShipMode,
    COUNT(DISTINCT OrderID) AS Total_Orders
FROM Orders
GROUP BY ShipMode
ORDER BY Total_Orders DESC;


-- 37. Sales by Ship Mode
SELECT
    ShipMode,
    SUM(Sales) AS Total_Sales
FROM Orders
GROUP BY ShipMode
ORDER BY Total_Sales DESC;


-- 38. Profit by Ship Mode
SELECT
    ShipMode,
    SUM(Profit) AS Total_Profit
FROM Orders
GROUP BY ShipMode
ORDER BY Total_Profit DESC;



-- ============================================================
-- 9. TIME / DATE ANALYSIS
-- ============================================================

-- 39. Sales by Year
SELECT
    YEAR(OrderDate) AS Order_Year,
    SUM(Sales) AS Total_Sales
FROM Orders
GROUP BY YEAR(OrderDate)
ORDER BY Order_Year;


-- 40. Profit by Year
SELECT
    YEAR(OrderDate) AS Order_Year,
    SUM(Profit) AS Total_Profit
FROM Orders
GROUP BY YEAR(OrderDate)
ORDER BY Order_Year;


-- 41. Sales by Month
SELECT
    YEAR(OrderDate) AS Order_Year,
    MONTH(OrderDate) AS Order_Month,
    SUM(Sales) AS Total_Sales
FROM Orders
GROUP BY
    YEAR(OrderDate),
    MONTH(OrderDate)
ORDER BY
    Order_Year,
    Order_Month;


-- 42. Profit by Month
SELECT
    YEAR(OrderDate) AS Order_Year,
    MONTH(OrderDate) AS Order_Month,
    SUM(Profit) AS Total_Profit
FROM Orders
GROUP BY
    YEAR(OrderDate),
    MONTH(OrderDate)
ORDER BY
    Order_Year,
    Order_Month;


-- 43. Monthly Sales and Profit
SELECT
    YEAR(OrderDate) AS Order_Year,
    MONTH(OrderDate) AS Order_Month,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM Orders
GROUP BY
    YEAR(OrderDate),
    MONTH(OrderDate)
ORDER BY
    Order_Year,
    Order_Month;



-- ============================================================
-- 10. CASE WHEN ANALYSIS
-- ============================================================

-- 44. Classify Products by Profit
SELECT
    ProductName,
    SUM(Profit) AS Total_Profit,

    CASE
        WHEN SUM(Profit) < 0 THEN 'Loss'
        WHEN SUM(Profit) BETWEEN 0 AND 100 THEN 'Low Profit'
        WHEN SUM(Profit) BETWEEN 101 AND 500 THEN 'Medium Profit'
        ELSE 'High Profit'
    END AS Profit_Category

FROM Orders
GROUP BY ProductName
ORDER BY Total_Profit DESC;


-- 45. Classify Orders by Profit
SELECT
    OrderID,
    Sales,
    Profit,

    CASE
        WHEN Profit > 0 THEN 'Profitable'
        WHEN Profit < 0 THEN 'Loss'
        ELSE 'Break Even'
    END AS Profit_Status

FROM Orders;



-- ============================================================
-- 11. SUBQUERY ANALYSIS
-- ============================================================

-- 46. Customers Above Average Sales
SELECT
    CustomerName,
    SUM(Sales) AS Total_Sales
FROM Orders
GROUP BY CustomerName
HAVING SUM(Sales) >
(
    SELECT AVG(CustomerSales)
    FROM
    (
        SELECT
            CustomerName,
            SUM(Sales) AS CustomerSales
        FROM Orders
        GROUP BY CustomerName
    ) AS CustomerSummary
)
ORDER BY Total_Sales DESC;


-- 47. Products Above Average Sales
SELECT
    ProductName,
    SUM(Sales) AS Total_Sales
FROM Orders
GROUP BY ProductName
HAVING SUM(Sales) >
(
    SELECT AVG(ProductSales)
    FROM
    (
        SELECT
            ProductName,
            SUM(Sales) AS ProductSales
        FROM Orders
        GROUP BY ProductName
    ) AS ProductSummary
)
ORDER BY Total_Sales DESC;



-- ============================================================
-- 12. CTE ANALYSIS
-- ============================================================

-- 48. Customer Sales Ranking
WITH CustomerSales AS
(
    SELECT
        CustomerName,
        SUM(Sales) AS Total_Sales
    FROM Orders
    GROUP BY CustomerName
)

SELECT
    CustomerName,
    Total_Sales,
    RANK() OVER (
        ORDER BY Total_Sales DESC
    ) AS Sales_Rank
FROM CustomerSales
ORDER BY Sales_Rank;


-- 49. Product Sales Ranking
WITH ProductSales AS
(
    SELECT
        ProductName,
        SUM(Sales) AS Total_Sales
    FROM Orders
    GROUP BY ProductName
)

SELECT
    ProductName,
    Total_Sales,
    RANK() OVER (
        ORDER BY Total_Sales DESC
    ) AS Sales_Rank
FROM ProductSales
ORDER BY Sales_Rank;


-- 50. Category Performance
WITH CategoryPerformance AS
(
    SELECT
        Category,
        SUM(Sales) AS Total_Sales,
        SUM(Profit) AS Total_Profit
    FROM Orders
    GROUP BY Category
)

SELECT
    Category,
    Total_Sales,
    Total_Profit,
    ROUND(
        Total_Profit / Total_Sales * 100,
        2
    ) AS Profit_Margin
FROM CategoryPerformance
ORDER BY Total_Sales DESC;



-- ============================================================
-- 13. SALES CONTRIBUTION ANALYSIS
-- ============================================================

-- 51. Category Contribution to Total Sales
SELECT
    Category,
    SUM(Sales) AS Total_Sales,

    ROUND(
        SUM(Sales) /
        (SELECT SUM(Sales) FROM Orders) * 100,
        2
    ) AS Sales_Contribution_Percentage

FROM Orders
GROUP BY Category
ORDER BY Total_Sales DESC;


-- 52. Region Contribution to Total Sales
SELECT
    Region,
    SUM(Sales) AS Total_Sales,

    ROUND(
        SUM(Sales) /
        (SELECT SUM(Sales) FROM Orders) * 100,
        2
    ) AS Sales_Contribution_Percentage

FROM Orders
GROUP BY Region
ORDER BY Total_Sales DESC;



-- ============================================================
-- 14. LOSS / PROFIT ANALYSIS
-- ============================================================

-- 53. Total Loss-Making Orders
SELECT
    COUNT(DISTINCT OrderID) AS Loss_Making_Orders
FROM Orders
WHERE Profit < 0;


-- 54. Total Profitable Orders
SELECT
    COUNT(DISTINCT OrderID) AS Profitable_Orders
FROM Orders
WHERE Profit > 0;


-- 55. Loss-Making Products
SELECT
    ProductName,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM Orders
GROUP BY ProductName
HAVING SUM(Profit) < 0
ORDER BY Total_Profit ASC;


-- 56. Loss-Making Categories
SELECT
    Category,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM Orders
GROUP BY Category
HAVING SUM(Profit) < 0
ORDER BY Total_Profit ASC;



-- ============================================================
-- 15. DATA QUALITY CHECKS
-- ============================================================

-- 57. Total Records
SELECT
    COUNT(*) AS Total_Records
FROM Orders;


-- 58. NULL Value Check
SELECT
    COUNT(*) AS Missing_Values
FROM Orders
WHERE
    OrderID IS NULL
    OR OrderDate IS NULL
    OR CustomerName IS NULL
    OR Category IS NULL
    OR Sales IS NULL
    OR Profit IS NULL;


-- 59. Check Duplicate Order IDs
SELECT
    OrderID,
    COUNT(*) AS Record_Count
FROM Orders
GROUP BY OrderID
HAVING COUNT(*) > 1
ORDER BY Record_Count DESC;


-- 60. Check Negative Sales
SELECT
    COUNT(*) AS Negative_Sales_Records
FROM Orders
WHERE Sales < 0;


-- 61. Check Negative Profit
SELECT
    COUNT(*) AS Negative_Profit_Records
FROM Orders
WHERE Profit < 0;



-- ============================================================
-- 16. INDEXING
-- ============================================================

-- Create indexes only when they are useful for frequent
-- filtering, joining or searching.

CREATE INDEX idx_order_date
ON Orders(OrderDate);

CREATE INDEX idx_customer_id
ON Orders(CustomerID);

CREATE INDEX idx_category
ON Orders(Category);

CREATE INDEX idx_region
ON Orders(Region);
