USE test_zespoly;
WITH CTE AS (
    SELECT AVG(a.placa_pod) AS 'SREDNIA',
        b.nazwa,
        b.adres,
        b.id_zesp
    FROM pracownicy a LEFT JOIN zespoly b
        ON a.id_zesp = b.id_zesp
    GROUP BY b.ID_ZESP, b.ADRES, b.NAZWA
): 
SELECT * FROM CTE
WHERE ID_ZESP <> 10
AND SREDNIA < 5000