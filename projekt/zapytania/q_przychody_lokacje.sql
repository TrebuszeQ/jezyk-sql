USE spa;
GO 

DECLARE @Data DATE = '2024-09-16';

WITH cte AS (
    SELECT a.fk_nazwa_lokacji AS 'nazwa_lokacji',
    b.fk_nazwa_lokalu AS 'nazwa_lokalu',
    CONVERT(date, a.poczatek_rezerwacji) AS 'data',
    czas,
    (a.cena * a.czas) AS 'przychody'
    FROM t_rezerwacje_lokacje a
        LEFT JOIN t_lokacje b
            ON a.fk_nazwa_lokacji = b.nazwa
    WHERE MONTH(a.poczatek_rezerwacji) = MONTH(@Data) 
    AND YEAR(a.poczatek_rezerwacji) = YEAR(@Data)
)

SELECT a.nazwa_lokacji,
    a.nazwa_lokalu,
    SUM(a.przychody) AS 'przychody',
    SUM(a.czas) AS 'czas',
    COUNT(a.nazwa_lokacji) as 'ilosc_rezerwacji'
FROM cte a
GROUP BY a.nazwa_lokacji, a.nazwa_lokalu
ORDER BY przychody DESC;
