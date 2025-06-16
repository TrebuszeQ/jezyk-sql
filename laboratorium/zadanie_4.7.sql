USE northwind
GO

IF OBJECT_ID('ClientsOrders', 'F') IS NOT NULL
BEGIN
    DROP FUNCTION ClientsOrders;
END;
GO

CREATE FUNCTION dbo.ClientsOrders(@CustomerId NVARCHAR(5))
RETURNS TABLE