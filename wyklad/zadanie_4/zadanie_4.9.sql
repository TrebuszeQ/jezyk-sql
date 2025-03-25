USE test_zespoly;

SELECT TOP 1
    id_zesp, 
    SUM((placa_pod + COALESCE(placa_dod, 0))) AS 'suma'
FROM pracownicy
GROUP BY id_zesp
ORDER BY suma DESC;