USE spa;
GO 

DECLARE @Data DATE = '2024-09-16';

WITH cte AS (
    SELECT a.fk_nazwa_typu_lokacji AS 'typ_lokacji',
    b.fk_nazwa_lokalu AS 'nazwa_lokalu',
    CONVERT(date, a.poczatek_rezerwacji) AS 'data',
    a.cena
    FROM t_rezerwacje_lokacje a
        LEFT JOIN t_lokacje b
            ON a.fk_nazwa_lokacji = b.nazwa
),

przychody AS (
    SELECT a.typ_lokacji,
        a.nazwa_lokalu,
        SUM(a.cena) as 'przychody',
        COUNT(a.typ_lokacji) as 'ilosc_rezerwacji'
    FROM cte a
    WHERE MONTH(a.data) = MONTH(@Data) 
        AND YEAR(a.data) = YEAR(@Data)
    GROUP BY a.typ_lokacji, a.nazwa_lokalu
),

koszty AS (
    SELECT a.fk_nazwa_typu_lokacji AS 'typ_lokacji',
        c.fk_nazwa_lokalu AS 'nazwa_lokalu',
        SUM(a.wskazanie) AS 'wskazanie_prad',
        SUM(b.wskazanie) AS 'wskazanie_woda',
        SUM(a.wskazanie) * 0.6930 AS 'cena_prad',
        SUM(b.wskazanie) * 6.00 AS 'cena_woda'
    FROM t_dzienne_zuzycie_pradu_lokacja a
        FULL OUTER JOIN t_dzienne_zuzycie_wody_lokacja b
            ON a.fk_nazwa_lokacji = b.fk_nazwa_lokacji
        FULL OUTER JOIN t_lokacje c
                ON a.fk_nazwa_lokacji = c.nazwa
    WHERE MONTH(a.data_czas) = MONTH(@Data) 
        AND YEAR(a.data_czas) = YEAR(@Data)
    GROUP BY a.fk_nazwa_typu_lokacji, c.fk_nazwa_lokalu
),

agg_koszty AS (
    SELECT a.typ_lokacji,
        a.nazwa_lokalu,
        SUM(a.przychody) AS 'przychody',
        SUM(a.ilosc_rezerwacji) AS 'ilosc_rezerwacji',
        SUM(b.wskazanie_prad) AS 'wskazanie_pradu',
        SUM(b.wskazanie_woda) AS 'wskazanie_wody',
        SUM(b.cena_prad) AS 'koszty_pradu',
        SUM(b.cena_woda) AS 'koszty_wody'
    FROM przychody a
        LEFT JOIN koszty b
        ON a.typ_lokacji = b.typ_lokacji
    GROUP BY a.typ_lokacji, a.nazwa_lokalu
)


SELECT typ_lokacji,
        nazwa_lokalu,
        przychody,
        (przychody - (koszty_pradu + koszty_wody)) AS 'rzeczywiste_przychody',
        ilosc_rezerwacji,
        wskazanie_pradu,
        wskazanie_wody,
        koszty_pradu,
        koszty_wody
    FROM agg_koszty a
ORDER BY rzeczywiste_przychody DESC;
