USE test_zespoly;
---zakladam ze kierownik tez jest pracownikiem
SELECT id_prac,
    imie,
    nazwisko,
    etat
FROM pracownicy
WHERE placa_pod > (
    SELECT MAX(placa_pod) AS 'pensja'
    FROM pracownicy
    WHERE id_zesp=20
);