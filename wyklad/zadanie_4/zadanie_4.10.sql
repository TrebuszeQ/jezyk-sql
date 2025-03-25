USE test_zespoly;

SELECT a.nazwisko,
    b.id_zesp,
    b.nazwa
FROM pracownicy a
LEFT JOIN zespoly b
    ON a.id_zesp=b.id_zesp;