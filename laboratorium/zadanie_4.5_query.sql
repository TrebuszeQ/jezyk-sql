USE northwind
GO

SELECT TOP 1 OrderID 
FROM Orders 
WHERE OrderDate >= DATEADD(day, -30, GETDATE());

INSERT INTO Orders (CustomerID, EmployeeID, OrderDate, RequiredDate, ShippedDate, ShipVia, Freight)
VALUES ('ALFKI', 1, GETDATE(), GETDATE(), GETDATE(), 1, 10);

SELECT SCOPE_IDENTITY() AS NewOrderID;

SELECT TOP 1 ProductID, UnitPrice FROM Products;

INSERT INTO [Order Details] (OrderID, ProductID, UnitPrice, Quantity, Discount)
VALUES (10290, 1, 18.00, 101, 0.0);

SELECT UnitPrice 
FROM Products 
WHERE ProductID = 1;

UPDATE Products
SET UnitPrice = 18.00
WHERE ProductID = 1;