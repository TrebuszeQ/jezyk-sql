USE spa;

SELECT SUM(a.przychody) AS 'przychody', 
    SUM(a.suma_wynagrodzen) AS 'wynagrodzenia'
    SUM(a.koszt) AS 'koszty_eksploatacyjne'        
FROM v_zarobki_zabiegi a
    LEFT JOIN t_dzienne_koszty_esploatacyjne_inne b
        ON a.


-- UNION ALL

-- SELECT SUM(przychody) AS 'przychody',
--     SUM(zuzycie_pradu) * 0.5 AS 'zuzycie_pradu',
--     SUM(zuzycie_wody) * 0.2 AS 'zuzycie_wody'
-- FROM v_zarobki_lokacje
