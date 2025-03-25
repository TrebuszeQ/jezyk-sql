USE test_zespoly;

SELECT id_prac,
    nazwisko,
    etat,
    id_zesp
FROM pracownicy
WHERE id_zesp IS NULL;