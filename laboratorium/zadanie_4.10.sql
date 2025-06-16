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
    
END;
GO