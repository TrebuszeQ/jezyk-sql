USE northwind
GO

IF OBJECT_ID('ClientsOrders', 'F') IS NOT NULL
BEGIN
    DROP FUNCTION ClientsOrders;
END;
GO

CREATE FUNCTION dbo.ClientsOrders(@CustomerId NVARCHAR(5))
RETURNS INT
AS
BEGIN
    DECLARE @OrdersCount INT;

    SELECT @OrdersCount = COUNT(OrderID)
    FROM Orders
    WHERE CustomerID = @CustomerId
    
    RETURN @OrdersCount;
END;

GO