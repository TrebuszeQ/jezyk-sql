use test_zespoly;

WITH CTE AS (
    SELECT nazwisko, 
        id_prac
    FROM pracownicy
    WHERE id_prac IN (
        SELECT id_szefa
        FROM pracownicy
    )
);

-- SELECT a.nazwisko,
--     COUNT(b.id_prac) AS 'liczba_podwladnych' 
-- FROM CTE a
-- FULL OUTER JOIN pracownicy b
--     ON a.id_prac=b.id_szefa
-- GROUP BY b.id_szefa

SELECT a.nazwisko,
    (
        SELECT COUNT(b.id_prac)
        FROM pracownicy b
        WHERE a.id_prac=b.id_szefa
    )
FROM CTE a;