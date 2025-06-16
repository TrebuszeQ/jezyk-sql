USE northwind;
GO

IF NOT EXISTS (
    SELECT 1
    FROM sys.columns
    WHERE Name = 'Status' AND
        Object_ID = Object_ID('dbo.Orders')
)
BEGIN
    ALTER TABLE dbo.Orders
    ADD Status NVARCHAR(40) NULL;

    ALTER TABLE dbo.Orders
    ADD CONSTRAINT DefaultStatus DEFAULT 'Pending' FOR Status;

END;

GO