USE northwind
GO

IF OBJECT_ID('UpdateStoreStateOnInsert', 'TR') IS NOT NULL
BEGIN
    DROP PROCEDURE UpdateStoreStateOnInsert;
END;
GO

CREATE TRIGGER dbo.UpdateStoreStateOnInsert
ON dbo.[Order Details]
AFTER INSERT
AS 
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRANSACTION;    
            SET NOCOUNT ON;

            UPDATE a
            SET a.UnitsInStock = a.UnitsInStock - b.Quantity,
                a.UnitsOnOrder = COALESCE(b.UnitsOnOrder, 0) + b.Quantity
            FROM Products a
            INNER JOIN INSERTED b
            ON a.ProductID = b.ProductID
            
            COMMIT TRANSACTION;

            END TRY
            BEGIN CATCH
                IF @@TRANCOUNT > 0
                    ROLLBACK TRANSACTION;
                
                DECLARE @ErrorMsg NVARCHAR(4000) = ERROR_MESSAGE();
                RAISERROR(@ErrorMsg, 16, 1);
            END CATCH
    END;
GO
