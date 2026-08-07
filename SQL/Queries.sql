-- Total Sales

SELECT SUM(Sales)
FROM Orders;

-- Total Profit

SELECT SUM(Profit)
FROM Orders;

-- Sales by Category

SELECT Category,
SUM(Sales)
FROM Orders
GROUP BY Category;

-- Top Customers

SELECT CustomerName,
SUM(Sales) AS TotalSales
FROM Orders
GROUP BY CustomerName
ORDER BY TotalSales DESC
LIMIT 10;