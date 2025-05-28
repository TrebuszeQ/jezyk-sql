-- 
USE northwind
GO

CREATE PROCEDURE dbo.OrdersPerYear
    @Count INT
AS
BEGIN
        SET NOCOUNT ON;
    SELECT CustomerID, 
        suma_zamowien
    FROM (
        SELECT a.CustomerID,
            COUNT(a.OrderID) AS 'suma_zamowien',
            ROW_NUMBER() OVER (ORDER BY COUNT(a.OrderID) DESC) AS 'row_number'
        FROM Customers b
        LEFT JOIN Orders a
            ON a.CustomerID = b.CustomerID
        WHERE a.CustomerID IS NOT NULL 
        GROUP BY a.CustomerID
    ) AS ranked
    WHERE row_number <= @Count
END;
GO