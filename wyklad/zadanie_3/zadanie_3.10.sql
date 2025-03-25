USE test_zespoly

SELECT id_zesp,
    nazwa
FROM zespoly
WHERE id_zesp NOT IN (
    SELECT DISTINCT id_zesp
    FROM pracownicy
    WHERE id_zesp IS NOT NULL
);