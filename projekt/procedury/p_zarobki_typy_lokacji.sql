DECLARE @Year INT = 2024;
DECLARE @Month INT = 9;

USE spa;
GO 

CREATE PROCEDURE KosztyZarobkiTypyLokacjiByDate (@Data DATE) 
AS
BEGIN
    SELECT a.fk_nazwa_lokacji AS 'nazwa_lokacji',
        SUM(a.cena) AS 'przychody',
        COUNT(a.id) AS 'ilosc_rezerwacji',
        SUM(b.wskazanie) * 24,7 AS 'zuzycie_pradu',
        SUM(C.wskazanie) * 11.98 AS 'zuzycie_wody'
    FROM t_rezerwacje_lokacje a
        LEFT JOIN t_dzienne_zuzycie_pradu_lokacja b
            ON a.fk_nazwa_lokacji = b.fk_nazwa_lokacji
        LEFT JOIN t_dzienne_zuzycie_wody_lokacja c
            ON a.fk_nazwa_lokacji = c.fk_nazwa_lokacji
    WHERE MONTH(a.poczatek_rezerwacji) = MONTH(@Data) 
        AND YEAR(a.poczatek_rezerwacji) = YEAR(@Data)
    GROUP BY a.fk_nazwa_lokacji
END;