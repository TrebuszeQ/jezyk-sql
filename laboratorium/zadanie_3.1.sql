-- 
USE northwind
GO

CREATE PROCEDURE dbo.GetCustomerOrders @CustomerId NVARCHAR(5)
AS 
SELECT * 
FROM Orders
WHERE CustomerID = @CustomerId;