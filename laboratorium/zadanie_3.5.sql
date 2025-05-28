-- 
USE northwind
GO

CREATE PROCEDURE dbo.SearchCustomers 
    @CompanyNameFragment NVARCHAR(40)
AS 
BEGIN
    SET NOCOUNT ON
    SELECT * 
    FROM dbo.Customers
    WHERE CompanyName LIKE '%' + @CompanyNameFragment + '%'; 
END;
GO