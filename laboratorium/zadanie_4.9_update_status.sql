USE northwind;
GO

UPDATE dbo.Orders
SET Status =
    CASE
    WHEN ShippedDate IS NULL AND RequiredDate > GETDATE() THEN 'Missing'
    WHEN CAST(ShippedDate AS DATE) = CAST(GETDATE() AS DATE) THEN 'Fresh'
    WHEN ShippedDate IS NOT NULL AND ShippedDate > RequiredDate THEN 'Late'
    WHEN ShippedDate IS NOT NULL AND ShippedDate <= RequiredDate THEN 'Delivered'
    ELSE 'Pending'
END;

GO