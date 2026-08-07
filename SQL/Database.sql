CREATE DATABASE ecommerce;

USE ecommerce;

CREATE TABLE Orders (
    OrderID INT,
    OrderDate DATE,
    CustomerName VARCHAR(100),
    Category VARCHAR(50),
    Sales DECIMAL(10,2),
    Profit DECIMAL(10,2)
);