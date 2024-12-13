use test_zespoly;

WITH CTE AS (
    SELECT id_zesp 
    FROM ZESPOLY 
    WHERE adres LIKE 'piotrkowska%'
)
SELECT id_prac,
    nazwisko,
    id_zesp 
    FROM pracownicy
WHERE id_zesp IN ( SELECT * FROM CTE)
ORDER BY nazwisko 