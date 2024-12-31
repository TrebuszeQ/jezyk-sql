-- Write your own SQL object definition here, and it'll be included in your package.
USE spa;
INSERT INTO dbo.t_formy_zatrudnienia (
    nazwa
)
VALUES 
('umowa_o_prace_na_okres_probny'),
('umowa_o_prace_na_czas_okreslony'),
('umowa_o_prace_na_czas_nieokreslony'),
('umowa_o_prace_na_zastepstwo'),
('umowa_zlecenie'),
('umowa_o_dzielo'),
('samozatrudnienie'),
('kontrakt_menadzerski')
