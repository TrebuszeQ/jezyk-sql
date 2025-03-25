USE test_zespoly;

WITH CTE AS (
    SELECT etat, AVG(placa_pod + COALESCE(placa_dod, 0)) AS 'srednia'
    FROM pracownicy
    GROUP BY etat
)

SELECT a.id_prac,
    a.imie,
    a.nazwisko,
    a.etat,
    a.placa_pod,
    a.placa_dod,
    a.zatrudniony,
    a.id_zesp
FROM pracownicy a
RIGHT JOIN CTE b
    ON a.etat=b.etat
WHERE a.placa_pod > b.srednia;
