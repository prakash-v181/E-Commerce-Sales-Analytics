-- ==========================================
-- E-COMMERCE SALES ANALYTICS
-- DATABASE SETUP
-- ==========================================

CREATE DATABASE IF NOT EXISTS ecommerce;

USE ecommerce;

-- Remove table if it already exists
DROP TABLE IF EXISTS Orders;

-- Create Orders table
CREATE TABLE Orders (
    OrderID VARCHAR(30),
    OrderDate DATE,
    CustomerID VARCHAR(30),
    CustomerName VARCHAR(100),
    Category VARCHAR(50),
    SubCategory VARCHAR(50),
    ProductName VARCHAR(255),
    Region VARCHAR(50),
    State VARCHAR(100),
    Segment VARCHAR(50),
    ShipMode VARCHAR(50),
    Quantity INT,
    Sales DECIMAL(12,2),
    Profit DECIMAL(12,2)
);
