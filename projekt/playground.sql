USE spa;

-- SELECT t_lokale.
--     SUM(przychody) AS 'przychody',
--     SUM(zuzycie_pradu) * 0.5 AS 'zuzycie_pradu',
--     SUM(zuzycie_wody) * 0.2 AS 'zuzycie_wody'
-- FROM v_zarobki_lokale


-- SELECT c.nazwa,
--     SUM(a.wskazanie) AS 'zuzycie_pradu_wskazanie',
--     SUM(d.wskazanie) AS 'zuzycie_wody_wskazanie',
--     a.data_czas
-- FROM t_dzienne_zuzycie_pradu_lokacja a
--     LEFT JOIN t_lokacje b
--         ON a.fk_nazwa_lokacji = b.nazwa
--     LEFT JOIN t_lokale c
--         ON b.fk_nazwa_lokalu = c.nazwa
--     LEFT JOIN t_dzienne_zuzycie_wody_lokacja d
--         ON d.fk_nazwa_lokacji = b.nazwa
-- GROUP BY c.nazwa, a.data_czas;


-- SELECT  a.nazwa,
--     SUM(b.wynagrodzenie_brutto) AS 'wynagrodzenia'
-- FROM t_lokale a
-- LEFT JOIN t_pracownicy b
--     ON a.id = b.fk_id_lokalu
-- GROUP BY a.nazwa;


-- SELECT fk_nazwa_lokalu,
--     SUM(wskazanie) AS 'wskazanie'
-- FROM t_dzienne_zuzycie_wody_lokal
-- GROUP BY fk_nazwa_lokalu;

-- SELECT fk_nazwa_lokalu,
--     SUM(wskazanie) AS 'wskazanie'
-- FROM t_dzienne_zuzycie_pradu_lokal
-- GROUP BY fk_nazwa_lokalu;

-- SELECT fk_nazwa_lokalu,
--     SUM(koszt) AS 'koszt'
-- FROM t_dzienne_koszty_eksploatacyjne_inne
-- GROUP BY fk_nazwa_lokalu;

-- SELECT nazwa,
--     (wynagrodzenia / 20) AS 'wynagrodzenia_dzienne'
-- FROM v_wynagrodzenia_lokal;

-- DECLARE @Year INT = 2024;
-- DECLARE @Month INT = 9;

-- SELECT a.fk_nazwa_lokalu AS 'nazwa_lokalu',
--     SUM(a.wskazanie) * 6.00 AS 'koszty_wody',
--     SUM(b.wskazanie) * 0.6930 AS 'koszty_pradu',
--     SUM(c.koszt) AS 'koszty_eksploatacyjne',
--     SUM(d.wynagrodzenia / 20) AS 'wynagrodzenia_dzienne'
-- FROM t_dzienne_zuzycie_wody_lokal a
--     LEFT JOIN t_dzienne_zuzycie_pradu_lokal b
--         ON a.fk_nazwa_lokalu = b.fk_nazwa_lokalu
--     LEFT JOIN t_dzienne_koszty_eksploatacyjne_inne c
--         ON a.fk_nazwa_lokalu = c.fk_nazwa_lokalu
--     LEFT JOIN v_wynagrodzenia_lokal d
--         ON a.fk_nazwa_lokalu = d.nazwa
-- WHERE MONTH(a.data_czas) = @Month 
--     AND YEAR(a.data_czas) = @Year        
-- GROUP BY a.fk_nazwa_lokalu, a.data_czas;

SELECT * FROM t_pracownicy