USE test_zespoly;
SELECT COUNT(ID_PRAC) AS 'SUMA_KIEROWNIKOW'
FROM PRACOWNICY
WHERE ETAT LIKE 'KIEROWNIK'