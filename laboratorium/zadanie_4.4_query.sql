USE northwind
GO

SELECT TOP 1 CustomerID, Address, Phone
FROM Customers;

EXEC dbo.UpdateClientsData 
    @CustomerId = 'ALFKI',
    @NewAddress = '123 New Street, Berlin',
    @NewPhone = '123-456-7890123456789012';

SELECT TOP 1 CustomerID, Address, Phone
FROM Customers
WHERE CustomerID = 'ALFKI';