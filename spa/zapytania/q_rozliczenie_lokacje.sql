USE spa;
GO 

DECLARE @Data DATE = '2024-09-16';

SELECT b.nazwa AS 'nazwa_lokacji',
    SUM(a.cena) AS 'przychody',
    COUNT(a.id) AS 'ilosc_rezerwacji'
FROM t_rezerwacje_lokacje a
    LEFT JOIN t_typy_lokacji b
        ON a.fk_nazwa_lokacji = b.nazwa
WHERE MONTH(a.poczatek_rezerwacji) = MONTH(@Data) 
    AND YEAR(a.poczatek_rezerwacji) = YEAR(@Data)
GROUP BY b.nazwa, a.poczatek_rezerwacji;