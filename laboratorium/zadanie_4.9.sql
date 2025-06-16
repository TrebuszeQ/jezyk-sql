USE northwind
GO

IF OBJECT_ID('OrdersRaport', 'P') IS NOT NULL
BEGIN
    DROP PROCEDURE OrdersRaport;
END;
GO

CREATE PROCEDURE OrdersRaport 
    @Status NVARCHAR(40)
AS 
BEGIN
    SELECT a.OrderID,
        a.CustomerID,
        a.EmployeeID,
        a.OrderDate,
        a.RequiredDate,
        a.ShippedDate,
        a.ShipVia,
        a.Freight,
        a.ShipName,
        a.ShipAddress,
        a.ShipRegion,
        a.ShipPostaCode,
        a.ShipCountry,
        b.OrderID,
        b.ProductID,
        b.UnitPrice,
        b.Quantity,
        b.Discount
    FROM dbo.Orders a
    JOIN dbo.[Order Details] b
        ON a.OrderID = b.OrderID
    WHERE a.Status = @Status
END;
GO