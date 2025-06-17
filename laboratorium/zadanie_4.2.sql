USE northwind
GO

IF OBJECT_ID('DeleteOrderDetails', 'TR') IS NOT NULL
BEGIN
    DROP TRIGGER DeleteOrderDetails;
END;
GO

CREATE TRIGGER DeleteOrderDetails
ON dbo.Orders
AFTER UPDATE
AS 
BEGIN
    SET NOCOUNT ON;
        IF UPDATE(Status)
        BEGIN
            DELETE a
            FROM dbo.[Order Details] a
            INNER JOIN INSERTED b
                ON a.OrderID = b.OrderID
            WHERE b.Status = 'Canceled'
        END;
    END;
GO