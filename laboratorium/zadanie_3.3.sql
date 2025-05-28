CREATE TRIGGER PreventCustomerDelete
ON dbo.Customers
INSTEAD OF DELETE
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM Orders a
        INNER JOIN deleted b
            ON a.CustomerID = b.CustomerID
        WHERE a.ShippedDate IS NULL
    )
    BEGIN
        RAISERROR('Nie mozna usunac klienta ktory ma aktywne zamowienie.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END

    DELETE 
    FROM Customers
    WHERE CustomerId IN (
        SELECT CustomerID 
        FROM deleted
    );
END