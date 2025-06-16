USE northwind
GO

IF NOT EXISTS (
    SELECT *
    FROM sys.tables WHERE name = 'PriceHistory'
    AND schema_id = SCHEMA_ID('dbo')
)
BEGIN
    CREATE TABLE dbo.PriceHistory (
        pk_price_id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
        fk_product_id INT NOT NULL FOREIGN KEY(fk_product_id)
            REFERENCES dbo.Products(ProductID)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION,
        old_price MONEY NOT NULL DEFAULT 0,
        new_price MONEY NOT NULL DEFAULT 0,
        update_date DATETIME NOT NULL DEFAULT GETDATE()
    )
END;
GO

IF OBJECT_ID('SavePriceHistory', 'TR') IS NOT NULL
BEGIN
    DROP TRIGGER SavePriceHistory;
END;
GO

CREATE TRIGGER dbo.SavePriceHistory
ON dbo.[Products]
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    IF UPDATE(UnitPrice)
    BEGIN
        INSERT INTO dbo.PriceHistory (
            fk_product_id,
            old_price,
            new_price,
            update_date
        )
        SELECT
            a.ProductID AS 'fk_product_id',
            a.UnitPrice AS 'old_price',
            b.UnitPrice AS 'new_price',
            GETDATE() AS 'update_date'
        FROM DELETED a
        INNER JOIN INSERTED b
            ON a.ProductID = b.ProductID
        WHERE
            a.UnitPrice <> b.UnitPrice
    END;
END;
GO