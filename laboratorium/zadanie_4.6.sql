USE northwind
GO

IF OBJECT_ID('MoveProductsToSupplier', 'P') IS NOT NULL
BEGIN
    DROP PROCEDURE MoveProductsToSupplier;
END;
GO

CREATE PROCEDURE MoveProductsToSupplier 
    @ProductId INT,
    @NewSupplierId INT
AS 
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRANSACTION;
            IF NOT EXISTS (
                SELECT 1
                FROM dbo.Suppliers
                WHERE SupplierID = @NewSupplierId
            )
            BEGIN
                RAISERROR('Supplier doesnt exists', 16, 1);
                ROLLBACK TRANSACTION;
                RETURN;
            END;

            IF NOT EXISTS (
                SELECT 1
                FROM dbo.Products
                WHERE ProductID = @
            )
            BEGIN
                RAISERROR('Product doesnt exists', 16, 1);
                ROLLBACK TRANSACTION;
                RETURN;            
            END;

            IF OBJECT_ID('tempdb..#MYTEMP') IS NOT NULL
            DROP TABLE #MYTEMP;
            
            SELECT ProductID,
                UnitsInStock,
                UnitsOnOrder
            INTO #MYTEMP
            FROM Products
            WHERE ProductID = @ProductId;


            UPDATE a
            SET a.Supplier = @NewSupplierId
            FROM Products a
            WHERE a.ProductID = @ProductId;

            COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF @@TRANSCOUNT > 0
            ROLLBACK TRANSACTION;
        
        DECLARE @ErrorMsg NVARCHAR(4000) = ERROR_MESSAGE();
        RAISERROR(@ErrorMsg, 16, 1);
    END CATCH
END;
GO