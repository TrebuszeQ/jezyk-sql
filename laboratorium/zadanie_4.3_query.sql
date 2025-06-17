USE northwind
GO

SELECT TOP 1 o.OrderID
FROM Orders o
JOIN [Order Details] od ON o.OrderID = od.OrderID;

USE northwind
GO

SELECT dbo.AverageOrderPrice(10250) AS AvgOrderPrice;

USE northwind
GO

SELECT AVG(UnitPrice * Quantity) AS ManualAverage
FROM [Order Details]
WHERE OrderID = 10250;