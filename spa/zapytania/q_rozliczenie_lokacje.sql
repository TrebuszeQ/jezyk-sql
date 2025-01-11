USE spa;
GO 

DECLARE @Data DATE = '2024-09-16';

WITH lokacje AS (
    SELECT a.fk_nazwa_lokacji AS 'nazwa_lokacji',
    b.fk_nazwa_lokalu AS 'nazwa_lokalu',
    CONVERT(date, a.poczatek_rezerwacji) AS 'data',
    a.cena * a.czas AS 'przychody'
    FROM t_rezerwacje_lokacje a
        LEFT JOIN t_lokacje b
            ON a.fk_nazwa_lokacji = b.nazwa
),

przychody AS (
    SELECT a.nazwa_lokacji,
        a.nazwa_lokalu,
        SUM(a.przychody) AS 'przychody',
        COUNT(a.nazwa_lokacji) AS 'ilosc_rezerwacji'
    FROM lokacje a
    WHERE MONTH(a.data) = MONTH(@Data) 
        AND YEAR(a.data) = YEAR(@Data)
    GROUP BY a.nazwa_lokacji, a.nazwa_lokalu
),

koszty AS (
    SELECT a.fk_nazwa_lokacji AS 'nazwa_lokacji',
        c.fk_nazwa_lokalu AS 'nazwa_lokalu',
        SUM(a.wskazanie) AS 'wskazanie_pradu',
        SUM(b.wskazanie) AS 'wskazanie_wody',
        SUM(a.wskazanie) * 0.6930 AS 'koszty_pradu',
        SUM(b.wskazanie) * 6.00 AS 'koszty_wody'
    FROM t_dzienne_zuzycie_pradu_lokacja a
        LEFT JOIN t_dzienne_zuzycie_wody_lokacja b
            ON a.fk_nazwa_lokacji = b.fk_nazwa_lokacji
        LEFT JOIN t_lokacje c
                ON a.fk_nazwa_lokacji = c.nazwa
    GROUP BY a.fk_nazwa_lokacji, c.fk_nazwa_lokalu
)

SELECT a.nazwa_lokacji,
    a.nazwa_lokalu,
    a.przychody,
    (a.przychody - (b.koszty_pradu + b.koszty_wody)) AS 'rzeczywiste_przychody',
    a.ilosc_rezerwacji,
    b.wskazanie_pradu,
    b.wskazanie_wody,
    b.koszty_pradu,
    b.koszty_wody
FROM przychody a
    LEFT JOIN koszty b
    ON a.nazwa_lokacji = b.nazwa_lokacji
ORDER BY rzeczywiste_przychody DESC

