
--
USE northwind
GO

CREATE FUNCTION dbo.GetAverageOrderValue (@CustomerId NVARCHAR(5))
RETURNS FLOAT
WITH EXECUTE AS CALLER
AS
BEGIN
    DECLARE @Average FLOAT;

    SELECT @Average = AVG(b.UnitPrice * b.Quantity)
    FROM Orders a
    INNER JOIN [Order Details] b 
        ON a.OrderID = b.OrderID
    WHERE a.CustomerID = @CustomerID

    RETURN @Average;
END;
