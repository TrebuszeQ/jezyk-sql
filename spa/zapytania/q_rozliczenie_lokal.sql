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
        a.wskazanie AS 'wskazanie_prad_lokal',
        b.wskazanie AS 'wskazanie_wody_lokal',
        a.wskazanie * 0.6930 AS 'koszty_prad_lokal',
        b.wskazanie * 6.00 AS 'koszty_wody_lokal',
        a.data_czas AS 'data'
    FROM t_dzienne_zuzycie_pradu_lokal a
    LEFT JOIN t_dzienne_zuzycie_wody_lokal b
        ON a.fk_nazwa_lokalu = b.fk_nazwa_lokalu
),

agg_wskazania_lokal AS (
    SELECT nazwa_lokalu,
        data,
        SUM(wskazanie_prad_lokal) AS 'wskazanie_prad_lokal',
        SUM(wskazanie_wody_lokal) AS 'wskazanie_wody_lokal',
        SUM(koszty_prad_lokal) AS 'koszty_prad_lokal',
        SUM(koszty_wody_lokal) AS 'koszty_wody_lokal'
    FROM wskazania_lokal b
    GROUP BY nazwa_lokalu, data
),

rezerwacje_zabiegi AS (
    SELECT fk_nazwa_lokalu AS 'nazwa_lokalu',
        cena AS 'przychody',
        CONVERT(date, poczatek_rezerwacji) AS 'data'
    FROM t_rezerwacje_zabiegi
),

agg_rezerwacje_zabiegi AS (
    SELECT nazwa_lokalu,
        data,
        SUM(przychody) AS 'przychody'
    FROM rezerwacje_zabiegi
    GROUP BY nazwa_lokalu, data
)


SELECT a.nazwa AS 'nazwa_lokalu',
    b.data,
    b.przychody AS 'przychody_zabiegi',
    c.przychody AS 'przychody_lokacje'
FROM t_lokale a
    LEFT JOIN agg_rezerwacje_zabiegi b
        ON a.nazwa = b.nazwa_lokalu
    LEFT JOIN agg_rezerwacje_lokacje c
        ON a.nazwa = b.nazwa_lokalu
        AND b.data = c.data
    LEFT JOIN agg

-- SELECT a.nazwa_lokalu,
--     SUM(a.przychody) AS 'przychody_lokacje',
--     SUM(b.przychody) AS 'przychody_zabiegi',
--     SUM(c.wskazanie_prad_lokal) AS 'wskazanie_prad_lokal',
--     SUM(c.wskazanie_wody_lokal) AS 'wskazanie_wody_lokal',
--     SUM(c.koszty_prad_lokal) * 0.6930 AS 'koszty_prad_lokal',
--     SUM(c.koszty_wody_lokal) * 6.00 AS 'koszty_wody_lokal'
-- FROM rezerwacje_lokacje a
--     LEFT JOIN rezerwacje_zabiegi b
--         ON a.nazwa_lokalu = b.nazwa_lokalu
--     LEFT JOIN wskazania_lokal c
--         ON a.nazwa_lokalu = c.nazwa_lokalu
-- WHERE MONTH(a.data) = MONTH(@Data) 
--     AND YEAR(a.data) = YEAR(@Data)
-- GROUP BY a.nazwa_lokalu
-- ORDER BY przychody_lokacje DESC;