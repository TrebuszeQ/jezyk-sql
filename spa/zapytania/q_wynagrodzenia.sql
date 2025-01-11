USE spa;
GO 

DECLARE @Data DATE = '2024-09-16';

SELECT a.imie,
    a.nazwisko,
    a.pesel,
    a.fk_nazwa_zawodu AS 'zawod',
    a.wynagrodzenie_brutto,
    a.fk_nazwa_formy_zatrudnienia AS 'formy_zatrudnienia',
    a.poczatek_umowy,
    a.koniec_umowy
FROM t_pracownicy a
WHERE a.koniec_umowy >= @Data 
    AND a.poczatek_umowy <= @Data
    OR a.koniec_umowy IS NULL
ORDER BY koniec_umowy DESC;