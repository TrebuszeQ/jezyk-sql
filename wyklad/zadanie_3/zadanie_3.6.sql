USE test_zespoly;
WITH CTE AS (
    SELECT nazwisko,
        id_prac
    FROM pracownicy
    WHERE etat LIKE 'dyrektor'
    OR etat LIKE 'kierownik'
)

SELECT a.nazwisko,
    a.id_prac,
    a.id_szefa,
    b.nazwisko AS 'nazwisko_szefa'
FROM pracownicy a
RIGHT JOIN CTE b
    ON a.id_szefa=b.id_prac;