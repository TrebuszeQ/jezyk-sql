USE test_zespoly;
SELECT nazwisko,
    id_prac
FROM pracownicy
WHERE id_szefa IS NULL