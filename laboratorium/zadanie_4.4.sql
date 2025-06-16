USE northwind
GO

IF OBJECT_ID('UpdateClientsData', 'P') IS NOT NULL
BEGIN
    DROP PROCEDURE UpdateClientsData;
END;
GO

GO
CREATE PROCEDURE dbo.UpdateClientsData @CustomerId NCHAR(5), 
    @NewAddress NVARCHAR(60), 
    @NewPhone nvarchar(24)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRANSACTION;
            IF NOT EXISTS (
                SELECT 1 
                FROM dbo.Customers
                WHERE CustomerID = @CustomerId
            )
            BEGIN 
                RAISERROR('Customer doesnt exists', 16, 1);
                ROLLBACK TRANSACTION;
                RETURN;
        END

        IF LEN(@NewPhone) <> 24
        BEGIN
            RAISERROR('Phone number must be exactly 24 characters', 16, 1);
            ROLLBACK TRANSACTION;
            RETURN;
        END;

        UPDATE a
        SET a.Address = @NewAddress,
            a.Phone = @NewPhone
        FROM dbo.Customers a
        WHERE a.CustomerID = @CustomerId;
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