WITH CTE AS (
SELECT id_prac,
id_zesp
FROM pracownicy
WHERE nazwisko LIKE 'bilewicz'
)

SELECT nazwisko,
etat
FROM pracownicy
WHERE id_zesp IN (
SELECT id_zesp
FROM CTE
)
AND id_prac NOT IN (
SELECT id_prac
FROM CTE
);