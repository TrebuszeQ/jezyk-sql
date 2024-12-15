USE test_zespoly;
-- SELECT nazwisko,
--     etat,
--     id_prac,
--     id_zesp
-- FROM pracownicy

SELECT id_zesp,
    MIN(zatrudniony) as 'data_zatrudnienia'
FROM pracownicy
GROUP BY id_zesp