SELECT TOP 1 * FROM Orders;

SELECT TOP 1 o.OrderID
FROM Orders o
JOIN [Order Details] od ON o.OrderID = od.OrderID;

SELECT * FROM [Order Details] WHERE OrderID = 10250;

UPDATE Orders
SET Status = 'Canceled'
WHERE OrderID = 10250;

SELECT * FROM [Order Details] WHERE OrderID = 10250;

INSERT INTO [Order Details] (OrderID, ProductID, UnitPrice, Quantity, Discount)
VALUES (10250, 11, 21.00, 3, 0.00);