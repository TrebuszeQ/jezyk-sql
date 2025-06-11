-- 
USE northwind
GO

CREATE PROCEDURE dbo.BestSellingProducts
    @Count INT
AS
BEGIN
    SET NOCOUNT ON;
    SELECT *
    FROM (
        SELECT a.ProductID,
            COUNT(a.ProductID) AS 'suma_produktow',
            ROW_NUMBER() OVER (ORDER BY COUNT(a.ProductID)) AS 'row_number'
        FROM dbo.Products a
        LEFT JOIN dbo.[Order Details] b
            ON a.ProductID = b.ProductID
        GROUP BY a.ProductID
    ) AS ranked
    WHERE row_number <= @Count
END;
GO