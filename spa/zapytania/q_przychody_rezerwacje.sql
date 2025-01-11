USE spa;
GO 

DECLARE @Data DATE = '2024-09-16';

WITH rezerwacje_lokacje AS (
    SELECT a.fk_nazwa_lokacji AS 'nazwa_lokacji',
        b.fk_nazwa_lokalu AS 'nazwa_lokalu',
        CONVERT(date, a.poczatek_rezerwacji) AS 'data',
        (a.cena * a.czas) AS 'przychody'
    FROM t_rezerwacje_lokacje a
        LEFT JOIN t_lokacje b
            ON a.fk_nazwa_lokacji = b.nazwa
),

agg_rezerwacje_lokacje AS (
    SELECT nazwa_lokalu,
        data,
        SUM(przychody) AS 'przychody'
    FROM rezerwacje_lokacje
    GROUP BY nazwa_lokalu, data
),

wskazania_lokal AS (
    SELECT a.fk_nazwa_lokalu AS 'nazwa_lokalu',
        a.data_czas AS 'data',
        a.wskazanie AS 'wskazanie_pradu_lokal',
        b.wskazanie AS 'wskazanie_wody_lokal',
        a.wskazanie * 0.6930 AS 'koszty_pradu_lokal',
        b.wskazanie * 6.00 AS 'koszty_wody_lokal'
    FROM t_dzienne_zuzycie_pradu_lokal a
    LEFT JOIN t_dzienne_zuzycie_wody_lokal b
        ON a.fk_nazwa_lokalu = b.fk_nazwa_lokalu
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

rezerwacje_zabiegi AS (
    SELECT fk_nazwa_lokalu AS 'nazwa_lokalu',
        CONVERT(date, poczatek_rezerwacji) AS 'data',
        cena AS 'przychody'
    FROM t_rezerwacje_zabiegi
),

agg_rezerwacje_zabiegi AS (
    SELECT nazwa_lokalu,
        data,
        SUM(przychody) AS 'przychody'
    FROM rezerwacje_zabiegi
    GROUP BY nazwa_lokalu, data
),

rezerwacje AS (
    SELECT nazwa_lokalu,
        data,
        przychody,
        'lokacje' AS 'zrodlo'
    FROM agg_rezerwacje_lokacje

    UNION ALL 

    SELECT nazwa_lokalu,
        data,
        przychody,
        'zabiegi' AS 'zrodlo' 
    FROM agg_rezerwacje_zabiegi
)

SELECT nazwa_lokalu,
    data,
    SUM(przychody) AS 'przychody',
    zrodlo
FROM rezerwacje
GROUP BY nazwa_lokalu, data, zrodlo
ORDER BY data;