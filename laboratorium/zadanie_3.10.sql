-- 
USE northwind
GO

CREATE PROCEDURE dbo.LateOrders
AS
BEGIN
    SET NOCOUNT ON;
    SELECT *
    FROM Orders
    WHERE ShippedDate > RequiredDate
END;
GO