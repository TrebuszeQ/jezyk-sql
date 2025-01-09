USE spa;
GO 

DECLARE @Data DATE = '2024-09-16';

WITH cte AS (
    SELECT a.fk_nazwa_lokacji AS 'nazwa_lokacji',
    b.fk_nazwa_lokalu AS 'nazwa_lokalu',
    CONVERT(date, a.poczatek_rezerwacji) AS 'data',
    a.cena
    FROM t_rezerwacje_lokacje a
        LEFT JOIN t_lokacje b
            ON a.fk_nazwa_lokacji = b.nazwa
),

przychody AS (
    SELECT a.nazwa_lokacji,
        a.nazwa_lokalu,
        SUM(a.cena) AS 'przychody',
        COUNT(a.nazwa_lokacji) AS 'ilosc_rezerwacji'
    FROM cte a
    WHERE MONTH(a.data) = MONTH(@Data) 
        AND YEAR(a.data) = YEAR(@Data)
    GROUP BY a.nazwa_lokacji, a.nazwa_lokalu
),

koszty AS (
    SELECT a.fk_nazwa_lokacji AS 'nazwa_lokacji',
        c.fk_nazwa_lokalu AS 'nazwa_lokalu',
        SUM(a.wskazanie) AS 'wskazanie_prad',
        SUM(b.wskazanie) AS 'wskazanie_woda',
        SUM(a.wskazanie) * 0.6930 AS 'cena_prad',
        SUM(b.wskazanie) * 6.00 AS 'cena_woda'
    FROM t_dzienne_zuzycie_pradu_lokacja a
        LEFT JOIN t_dzienne_zuzycie_wody_lokacja b
            ON a.fk_nazwa_lokacji = b.fk_nazwa_lokacji
        LEFT JOIN t_lokacje c
                ON a.fk_nazwa_lokacji = c.nazwa
    WHERE MONTH(a.data_czas) = MONTH(@Data) 
        AND YEAR(a.data_czas) = YEAR(@Data)
    GROUP BY a.fk_nazwa_lokacji, c.fk_nazwa_lokalu
)

SELECT a.nazwa_lokacji,
    a.nazwa_lokalu,
    a.przychody,
    a.ilosc_rezerwacji,
    b.wskazanie_prad,
    b.wskazanie_woda,
    b.cena_prad,
    b.cena_woda
FROM przychody a
    LEFT JOIN koszty b
    ON a.nazwa_lokacji = b.nazwa_lokacji
ORDER BY a.przychody DESC

