USE northwind
GO

CREATE TRIGGER DeleteOrderDetails
ON dbo.Orders
INSTEAD OF DELETE
AS 
BEGIN
    SET NOCOUNT ON;
        DELETE FROM dbo.[Order Details]
        WHERE OrderID IN (
            SELECT OrderID
            FROM deleted
        );

        DELETE FROM dbo.Orders
        WHERE OrderID IN (
            SELECT OrderID
            FROM deleted
        );
    END;
GO