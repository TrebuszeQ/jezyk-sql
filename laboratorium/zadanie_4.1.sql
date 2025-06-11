USE northwind
GO

CREATE PROCEDURE dbo.UpdateStoreState @OrderId INT
AS 
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRANSACTION;    
            IF NOT EXISTS (
                SELECT 1 FROM Orders
                WHERE OrderID = @OrderId
            )
            BEGIN
                RAISERROR('OrderId not found', 16, 1);
                ROLLBACK TRANSACTION;
                RETURN;
            END

            IF OBJECT_ID('tempdb..#MYTEMP') IS NOT NULL 
                DROP TABLE #MYTEMP;

            SELECT OrderID, ProductID, Quantity
            INTO #MYTEMP
            FROM dbo.[Order Details]
            WHERE OrderID = @OrderId;
            
            UPDATE a
            SET 
                a.UnitsInStock = a.UnitsInStock - b.Quantity,
                a.UnitsInOrder = COALESCE(a.UnitsInOrder, 0) + b.Quantity
            FROM Products a
            INNER JOIN #MYTEMP b 
                ON a.ProductID = b.ProductID;
            
            END TRY
            BEGIN CATCH
                IF @@TRANCOUNT > 0
                    ROLLBACK TRANSACTION;
                
                DECLARE @ErrorMsg NVARCHAR(4000) = ERROR_MESSAGE();
                RAISERROR(@ErrorMsg, 16, 1);
            END CATCH
    END;
GO
