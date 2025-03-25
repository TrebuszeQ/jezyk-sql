USE spa;
GO 

DECLARE @Data DATE = '2024-09-16';

WITH cte AS (
    SELECT a.fk_nazwa_typu_lokacji AS 'typ_lokacji',
    b.fk_nazwa_lokalu AS 'nazwa_lokalu',
    CONVERT(date, a.poczatek_rezerwacji) AS 'data',
    a.cena
    FROM t_rezerwacje_lokacje a
        LEFT JOIN t_lokacje b
            ON a.fk_nazwa_lokacji = b.nazwa
)

SELECT a.typ_lokacji,
    a.nazwa_lokalu,
    SUM(a.cena) as 'przychody',
    COUNT(a.typ_lokacji) as 'ilosc_rezerwacji'
FROM cte a
WHERE MONTH(a.data) = MONTH(@Data) 
    AND YEAR(a.data) = YEAR(@Data)
GROUP BY a.typ_lokacji, a.nazwa_lokalu
ORDER BY przychody DESC;
