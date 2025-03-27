-- 
USE northwind
GO

SELECT *
FROM Customers;

-- 
USE northwind
GO

SELECT *
FROM Orders
WHERE ShipCountry LIKE 'germany';

-- 
USE northwind
GO

SELECT TOP 5 *
FROM Products
ORDER BY UnitPrice DESC;

-- 
USE northwind
GO

SELECT DISTINCT COUNT(CustomerID) as 'ClientsSum',
    ShipCountry
FROM Orders
GROUP BY ShipCountry;

-- 
USE northwind
GO

SELECT *
FROM Orders
WHERE YEAR(OrderDate) = '1997';

-- 
USE northwind
GO

SELECT DISTINCT CustomerID
FROM Customers
WHERE CustomerID NOT IN (
    SELECT DISTINCT CustomerID
    FROM Orders
)

-- 
USE northwind
GO

SELECT AVG(UnitPrice) AS 'AverageUnitPrice'
FROM Products;

-- 
USE northwind
GO

SELECT TOP 1 COUNT(OrderID) 'UniqueOrdersCount',
        CustomerID
    FROM Orders
    GROUP BY CustomerID
    ORDER BY UniqueOrdersCount DESC;

--
USE northwind
GO

SELECT * 
FROM Products
ORDER BY UnitsInStock DESC;

--
USE northwind
GO

SELECT * 
FROM Products
WHERE UnitPrice > (
    SELECT AVG(UnitPrice)
    FROM Products
);
