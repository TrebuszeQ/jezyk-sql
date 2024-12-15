USE test_zespoly;

SELECT id_prac,
    imie,
    nazwisko,
    etat
FROM pracownicy
WHERE id_prac IN (
    SELECT id_szefa
    FROM pracownicy
    WHERE etat NOT LIKE 'stazysta'
)