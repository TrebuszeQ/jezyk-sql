USE spa;
GO 

DECLARE @Data DATE = '2024-09-16';

WITH wskazania_lokal AS (
    SELECT a.fk_nazwa_lokalu AS 'nazwa_lokalu',
        CONVERT(date, a.data_czas) AS 'data',
        a.wskazanie AS 'wskazanie_pradu_lokal',
        b.wskazanie AS 'wskazanie_wody_lokal',
        a.wskazanie * 0.6930 AS 'koszty_pradu_lokal',
        b.wskazanie * 6.00 AS 'koszty_wody_lokal'
    FROM t_dzienne_zuzycie_pradu_lokal a
        FULL OUTER JOIN t_dzienne_zuzycie_wody_lokal b
            ON a.fk_nazwa_lokalu = b.fk_nazwa_lokalu
            AND CONVERT(date, a.data_czas) = CONVERT(date, b.data_czas)
    WHERE YEAR(a.data_czas) = YEAR(@Data)
        AND MONTH(a.data_czas) = MONTH(@Data)
),

agg_wskazania_lokal AS (
    SELECT nazwa_lokalu,
        data,
        SUM(wskazanie_pradu_lokal) AS 'wskazanie_pradu_lokal',
        SUM(wskazanie_wody_lokal) AS 'wskazanie_wody_lokal',
        SUM(koszty_pradu_lokal) AS 'koszty_pradu_lokal',
        SUM(koszty_wody_lokal) AS 'koszty_wody_lokal'
    FROM wskazania_lokal b
    GROUP BY nazwa_lokalu, data
),

agg_koszty_eksploatacyjne AS (
    SELECT fk_nazwa_lokalu AS 'nazwa_lokalu',
        CONVERT(date, data_czas) AS 'data',
        SUM(koszt) AS 'koszty'
    FROM t_dzienne_koszty_eksploatacyjne_inne
    WHERE YEAR(data_czas) = YEAR(@Data)
        AND MONTH(data_czas) = MONTH(@Data)
    GROUP BY fk_nazwa_lokalu, CONVERT(date, data_czas)
),

agg_koszty_lokal AS (
    SELECT c.fk_nazwa_lokalu AS 'nazwa_lokalu',
        CONVERT(date, a.data_czas) AS 'data',
        SUM(a.wskazanie) AS 'wskazanie_pradu',
        SUM(b.wskazanie) AS 'wskazanie_wody',
        SUM(a.wskazanie) * 0.6930 AS 'koszty_pradu',
        SUM(b.wskazanie) * 6.00 AS 'koszty_wody'
    FROM t_dzienne_zuzycie_pradu_lokacja a
        FULL OUTER JOIN t_dzienne_zuzycie_wody_lokacja b
            ON a.fk_nazwa_lokacji = b.fk_nazwa_lokacji
            AND CONVERT(date, a.data_czas) = CONVERT(date, B.data_czas)
        RIGHT JOIN t_lokacje c
                ON a.fk_nazwa_lokacji = c.nazwa
    WHERE YEAR(a.data_czas) = YEAR(@Data)
        AND MONTH(a.data_czas) = MONTH(@Data)
    GROUP BY c.fk_nazwa_lokalu, CONVERT(date, a.data_czas)
),

koszty_lokal_lokacje AS (
    SELECT a.nazwa_lokalu,
        a.data,
        a.koszty_pradu 'koszty_pradu_lokacje',
        a.koszty_wody AS 'koszty_wody_lokacje',
        b.koszty_pradu_lokal,
        b.koszty_wody_lokal,
        (b.koszty_pradu_lokal - a.koszty_pradu) AS 'roznica_prad',
        (b.koszty_wody_lokal - a.koszty_wody) AS 'roznica_woda'
    FROM agg_koszty_lokal a
        LEFT JOIN agg_wskazania_lokal b
            ON a.nazwa_lokalu = b.nazwa_lokalu
            AND a.data = b.data
)

SELECT * 
FROM koszty_lokal_lokacje
ORDER BY data