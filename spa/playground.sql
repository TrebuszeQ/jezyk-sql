USE spa;

-- UPDATE t_lokale
-- SET nazwa='Złoty Kwiat'
-- WHERE nazwa LIKE 'Zloty Kwiat';

-- WITH przychody_zabiegi AS (
--     SELECT fk_nazwa_zabiegu AS 'nazwa_zabiegu',
--         SUM(cena) AS 'przychody',
--         COUNT(id) AS 'ilosc_rezerwacji',
--         SUM(czas) AS 'czas'
--     FROM t_rezerwacje_zabiegi
--     GROUP BY fk_nazwa_zabiegu
-- )

-- SELECT a.nazwa_zabiegu,
--     a.przychody,
--     a.ilosc_rezerwacji,
--     a.czas
-- FROM przychody_zabiegi a
-- ORDER BY przychody DESC

-- WITH  przychody_lokacje AS (
--     SELECT a.nazwa,
--     SUM(c.cena) as 'przychody',
--     COUNT(c.id) as 'ilosc_rezerwacji'
--     FROM t_typy_lokacji a
--         FULL OUTER JOIN t_lokacje b
--             ON a.id=b.fk_id_typy_lokacji
--         FULL OUTER JOIN t_rezerwacje_lokacje c
--             ON b.nazwa=c.fk_nazwa_lokacji
--     GROUP BY a.nazwa
-- )

-- SELECT a.nazwa,
--     a.przychody,
--     a.ilosc_rezerwacji
-- FROM przychody_lokacje a
-- ORDER BY przychody DESC