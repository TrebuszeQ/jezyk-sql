USE northwind
GO

IF OBJECT_ID('ChangeProductPrice', 'TR') IS NOT NULL
BEGIN
    DROP TRIGGER ChangeProductPrice;
END;
GO

CREATE TRIGGER ChangeProductPrice
ON dbo.[Order Details]
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;
        IF EXISTS (
            SELECT 1
            FROM inserted
        )
        BEGIN
            UPDATE dbo.Products
            SET UnitPrice=UnitPrice * 1.05
            WHERE ProductID IN (
                SELECT a.ProductID
                FROM dbo.[Order Details] a
                    JOIN dbo.Orders b
                    ON a.OrderID = b.OrderID
                WHERE b.OrderDate >= DATEADD(day, -30, GETDATE())
                GROUP BY a.ProductID
                HAVING SUM(a.Quantity) > 100
            );
        END;
    END;
GO