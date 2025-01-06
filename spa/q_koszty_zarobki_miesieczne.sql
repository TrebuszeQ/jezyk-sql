DECLARE @Year INT = 2024;
DECLARE @Month INT = 9;

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
    LEFT JOIN v_wynagrodzenia_lokal d
        ON a.fk_nazwa_lokalu = d.nazwa
WHERE MONTH(a.data_czas) = @Month 
    AND YEAR(a.data_czas) = @Year        
GROUP BY a.fk_nazwa_lokalu, a.data_czas;
