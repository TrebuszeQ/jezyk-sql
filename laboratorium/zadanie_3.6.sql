-- 
USE northwind
GO

CREATE FUNCTION dbo.OrdersInYear (@Year INT)
RETURNS TABLE
AS
RETURN
    SELECT YEAR(OrderDate) AS 'rok', 
        (COUNT(OrderID) / 12) AS 'srednia'
    FROM dbo.Orders
    WHERE YEAR(OrderDate) = @Year
    GROUP BY YEAR(OrderDate)
GO