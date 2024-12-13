WITH CTE AS (
    SELECT etat, MIN(placa_pod) as pensja_min
    FROM pracownicy
    GROUP BY etat
)

SELECT a.nazwisko, 
    a.etat,
    a.placa_pod,
    b.pensja_min
FROM pracownicy a
RIGHT JOIN cte b
    ON a.etat=b.etat
        AND a.placa_pod=b.pensja_min