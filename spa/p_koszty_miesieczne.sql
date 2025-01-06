USE spa;
GO 
    
CREATE PROCEDURE KosztyMiesieczneByDate (@Data DATE)
AS 
BEGIN
    WITH c_wynagrodzenia_lokal AS (
        SELECT  a.nazwa,
            SUM(b.wynagrodzenie_brutto) AS 'wynagrodzenia'
        FROM t_lokale a
        LEFT JOIN t_pracownicy b
            ON a.id = b.fk_id_lokalu
        GROUP BY a.nazwa
    )
    SELECT a.fk_nazwa_lokalu AS 'nazwa_lokalu',
        SUM(a.wskazanie) * 6.00 AS 'koszty_wody',
        SUM(b.wskazanie) * 0.6930 AS 'koszty_pradu',
        SUM(c.koszt) AS 'koszty_eksploatacyjne',
        SUM(d.wynagrodzenia / 20) AS 'wynagrodzenia_dzienne'
    FROM t_dzienne_zuzycie_wody_lokal a
        LEFT JOIN t_dzienne_zuzycie_pradu_lokal b
            ON a.fk_nazwa_lokalu = b.fk_nazwa_lokalu
        LEFT JOIN t_dzienne_koszty_eksploatacyjne_inne c
            ON a.fk_nazwa_lokalu = c.fk_nazwa_lokalu
        LEFT JOIN c_wynagrodzenia_lokal d
            ON a.fk_nazwa_lokalu = d.nazwa
    WHERE MONTH(a.data_czas) = MONTH(@Data)
        AND YEAR(a.data_czas) = YEAR(@Data)        
    GROUP BY a.fk_nazwa_lokalu, a.data_czas
END;