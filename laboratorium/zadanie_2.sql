-- 
USE northwind
GO

WITH CTE AS (
    SELECT COUNT(OrderID) AS 'count'    
    FROM Orders
    GROUP BY CustomerID
)

SELECT AVG(count) AS 'srednia'
FROM CTE

--
USE northwind
GO

SELECT DISTINCT ProductID
FROM Products
WHERE ProductID NOT IN (
    SELECT DISTINCT ProductID
    FROM [Order Details]
)

--
USE northwind
GO

SELECT DISTINCT CustomerID 
FROM Orders
WHERE OrderID IN (
    SELECT DISTINCT OrderID FROM
    [Order Details]
    WHERE ProductID IN (
        SELECT ProductID
        FROM Products
        WHERE UnitPrice IN (
            SELECT MAX(UnitPrice)
            FROM Products
        )
    )
)

--
USE northwind
GO

SELECT DISTINCT ProductID
FROM Products
WHERE ProductID IN (
    SELECT ProductID
    FROM [Order Details]
    WHERE Quantity = 1
)

--
USE northwind
GO

SELECT DISTINCT CustomerID
FROM Customers
WHERE CustomerID NOT IN (
    SELECT CustomerID
    FROM Orders
    WHERE YEAR(OrderDate) = '1997'
)

--
USE northwind
GO

WITH CTE AS (
    SELECT AVG((UnitPrice * Quantity)) AS 'srednia',
    OrderID
    FROM [Order Details]
    GROUP BY OrderID
)

SELECT a.CustomerID, 
    b.srednia
FROM Orders a
    FULL JOIN CTE b
        ON a.OrderID = b.OrderID

--
USE northwind
GO

SELECT UnitPrice,
    ProductID,
    ProductName
FROM Products
WHERE UnitPrice > (
    SELECT AVG(UnitPrice) AS 'srednia_cena'
    FROM Products
)

--
USE northwind
GO

WITH SumyProduktowKategorii AS (
    SELECT CategoryID,
        COUNT(ProductID) 'suma_produktow'
    FROM Products
    GROUP BY CategoryID
),
ZwycieskieKategorie AS (
    SELECT MAX(suma_produktow) AS 'maksimum'
    FROM SumyProduktowKategorii
)

SELECT a.CategoryID,
    a.CategoryName
FROM Categories a
JOIN SumyProduktowKategorii b 
    ON a.CategoryID = b.CategoryID
WHERE b.suma_produktoW = (
    SELECT maksimum
    FROM ZwycieskieKategorie
)

--
USE northwind
GO

WITH SumyPracownikow AS (
    SELECT EmployeeID,
        COUNT(EmployeeID) AS 'suma'
    FROM Orders
    GROUP BY EmployeeID
),
ZwyciezcyPracownicy AS (
    SELECT MAX(suma) AS 'maksimum'
    FROM SumyPracownikow
)
SELECT a.EmployeeID,
    b.suma
FROM Employees a
JOIN SumyPracownikow b
    ON a.EmployeeID = b.EmployeeID
WHERE b.suma = (
    SELECT maksimum 
    FROM ZwyciezcyPracownicy
)

--
USE northwind
GO

WITH SumyProduktow AS (
    SELECT OrderID,
        COUNT(DISTINCT ProductID) AS 'suma_produktow'
    FROM [Order Details]
    GROUP BY OrderID
),
ZwycieskieZamowienia AS (
    SELECT MAX(suma_produktow) AS 'maksimum'
    FROM SumyProduktow
)

SELECT a.OrderID,
    b.suma_produktow
FROM Orders a
JOIN SumyProduktow b
    ON a.OrderID = b.OrderID
WHERE b.suma_produktow = (
    SELECT maksimum
    FROM ZwycieskieZamowienia
)



