USE test_zespoly;
SELECT a.id_zesp, 
        COALESCE(AVG(b.placa_pod), 0) as 'srednia_placa',
        COALESCE(COUNT(b.id_prac), 0) as 'liczba_pracownikow'
FROM zespoly a
LEFT JOIN pracownicy b
    ON a.id_zesp=b.id_zesp
GROUP BY a.id_zesp;