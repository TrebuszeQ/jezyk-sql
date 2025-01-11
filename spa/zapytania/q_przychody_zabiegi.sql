USE spa;
GO 

DECLARE @Data DATE = '2024-09-16';

SELECT a.fk_nazwa_zabiegu AS 'nazwa_zabiegu',
        a.fk_nazwa_lokalu AS 'nazwa_lokalu',
        SUM(a.cena) AS 'przychody',
        COUNT(a.id) AS 'ilosc_rezerwacji',
        SUM(a.czas) AS 'czas',
        COUNT(b.id) AS 'ilosc_pracownikow'
FROM t_rezerwacje_zabiegi a
    LEFT JOIN t_pracownicy b
        ON a.fk_pesel_pracownika = b.pesel
WHERE MONTH(a.poczatek_rezerwacji) = MONTH(@Data) 
    AND YEAR(a.poczatek_rezerwacji) = YEAR(@Data) 
GROUP BY a.fk_nazwa_zabiegu, a.fk_nazwa_lokalu
ORDER BY przychody DESC