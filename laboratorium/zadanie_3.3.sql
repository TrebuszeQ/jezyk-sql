-- 
USE northwind
GO

EXEC dbo.GetCustomerOrders @CustomerId='VINET';

--
USE northwind
GO

CREATE FUNCTION dbo.GetAverageOrderValue (@CustomerId NVARCHAR(5))
RETURNS FLOAT
WITH EXECUTE AS CALLER
AS
BEGIN
    RETURN (
        SELECT 
    )
END;
