-- 
USE northwind
GO

CREATE PROCEDURE dbo.MoveOrdersToCustomer 
    @SrcCustomerId NVARCHAR(5), 
    @DstCustomerID NVARCHAR(5)
AS 
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        BEGIN TRANSACTION;

        IF NOT EXISTS (
            SELECT 1 FROM Customers WHERE CustomerID = @DstCustomerId
        )
        BEGIN
            RAISERROR('Klient docelowy nie istnieje.', 16, 1);
            ROLLBACK TRANSACTION;
            RETURN;
        END

        UPDATE dbo.Orders
        SET CustomerID = @DstCustomerId
        WHERE CustomerID = @SrcCustomerId;
        
        COMMIT TRANSACTION;     
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        RAISERROR('Wystapil blad podczas przenoszenia zamiowien.', 16, 1);
    END CATCH
END;
GO