use test_zespoly;

SELECT nazwisko,
    (CONCAT(placa_pod, '-', (placa_pod + COALESCE(placa_dod, 0)))) as pensja
FROM pracownicy