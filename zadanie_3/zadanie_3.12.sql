USE test_zespoly;

SELECT a.id_prac,
    a.imie,
    a.nazwisko,
    a.etat,
    a.id_szefa,
    a.zatrudniony,
    a.placa_pod,
    a.placa_dod,
    a.id_zesp,
    b.nazwa,
    b.adres
FROM pracownicy a
FULL OUTER JOIN zespoly b
    ON a.id_zesp = b.id_zesp;
