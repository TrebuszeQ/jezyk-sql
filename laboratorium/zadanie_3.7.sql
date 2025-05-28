-- 
USE northwind
GO

CREATE PROCEDURE dbo.OrdersPerYear 
AS
BEGIN
    SET NOCOUNT ON;
    SELECT YEAR(OrderDate) AS 'rok',
        COUNT(OrderID) AS 'liczba_zamowien'
    FROM ORDERS
    GROUP BY YEAR(OrderDate);
END;
GO