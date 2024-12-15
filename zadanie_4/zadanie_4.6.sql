USE test_zespoly

SELECT a.id_prac,
    a.imie,
    a.nazwisko,
    a.etat,
    a.id_szefa,
    a.placa_pod,
    a.placa_dod,
    a.id_zesp
FROM pracownicy a
FULL OUTER JOIN pracownicy b
    ON b.id_prac = a.id_szefa
WHERE a.placa_pod >= (b.placa_pod * 0.75);