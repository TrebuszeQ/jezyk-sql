--
USE northwind
GO

IF OBJECT_ID('AverageOrderPrice', 'F') IS NOT NULL
BEGIN
    DROP FUNCTION AverageOrderPrice;
END;
GO

CREATE FUNCTION dbo.AverageOrderPrice (@OrderId INT)
RETURNS FLOAT
AS 
BEGIN
    DECLARE @Average FLOAT;

    SELECT @Average = AVG(b.UnitPrice * b.Quantity)
    FROM Orders A
    INNER JOIN dbo.[Order Details] b
        ON a.OrderID = b.OrderID
    WHERE a.OrderID = @OrderId

    RETURN @Average;
END;

GO