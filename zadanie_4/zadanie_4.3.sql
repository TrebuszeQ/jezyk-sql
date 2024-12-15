USE test_zespoly;

WITH CTE AS (
    SELECT id_zesp,
    MIN(zatrudniony) AS 'zatrudniony'
        FROM pracownicy
    WHERE id_zesp IS NOT NULL
    GROUP BY id_zesp 
)

SELECT a.id_prac,
    a.imie,
    a.nazwisko,
    b.id_zesp,
    a.zatrudniony
FROM pracownicy a
RIGHT JOIN CTE b
    ON a.id_zesp=b.id_zesp
WHERE a.zatrudniony=b.zatrudniony
ORDER BY a.zatrudniony ASC;

