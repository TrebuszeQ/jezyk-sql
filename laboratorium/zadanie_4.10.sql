USE northwind
GO

IF OBJECT_ID('OrderReturn', 'P') IS NOT NULL
BEGIN
    DROP PROCEDURE OrderReturn;
END;
GO

CREATE PROCEDURE OrderReturn 
    @OrderId INT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRANSACTION;
        IF NOT EXISTS (
            SELECT 1
            FROM dbo.Orders
            WHERE OrderID = @OrderId
        )
        BEGIN
            RAISERROR('Order doesnt exists')
            ROLLBACK TRANSACTION;
            RETURN;
        END;

        UPDATE dbo.Orders
        SET Status = 'Canceled'
        WHERE OrderID = @OrderID

        UPDATE b
        SET b.UnitsInStock = b.UnitsInStock + b.Quantity,
            b.UnitsOnOrder = CASE
                                WHEN  b.UnitsOnOrder >= a.Quantity THEN b.UnitsOnOrder - b.Quantity
                                ELSE 0
                            END
        FROM dbo.Products b
        INNER JOIN dbo.[Order Details] a
            ON a.ProductID = b.ProductID
        WHERE a.OrderID = @OrderId

        UPDATE a
        SET a.Quantity = 0
        FROM dbo.[Order Details] a
        WHERE a.OrderID = @OrderId;

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