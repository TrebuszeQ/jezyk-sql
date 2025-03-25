use test_zespoly;

SELECT a.nazwisko,
    a.etat,
    a.id_zesp,
    b.nazwa AS 'nazwa_zespolu'
FROM pracownicy a
FULL OUTER JOIN zespoly b
    ON a.id_zesp = b.id_zesp
WHERE a.placa_pod > 5500