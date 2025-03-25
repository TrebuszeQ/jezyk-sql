USE test_zespoly;
SELECT TOP 1 
    nazwisko,
    etat,
    zatrudniony
FROM pracownicy
WHERE etat LIKE 'kierownik'
ORDER BY zatrudniony ASC