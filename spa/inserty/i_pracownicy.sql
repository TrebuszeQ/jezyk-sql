-- Write your own SQL object definition here, and it'll be included in your package.
USE spa;
INSERT INTO t_pracownicy (
    imie,
    nazwisko,
    pesel,
    fk_nazwa_zawodu,
    wynagrodzenie_brutto,
    fk_nazwa_formy_zatrudnienia,
    poczatek_umowy,
    koniec_umowy,
    fk_id_przelozonego,
    fk_id_lokalu
)
VALUES 
-- Prezes
('Jan', 'Kowalski', '80010112345', 'prezes', 20000.00, 'kontrakt_menadzerski', '2020-01-15', NULL, 1, 1),
-- Wiceprezes
('Anna', 'Nowak', '75050554321', 'wice_prezes', 18000.00, 'kontrakt_menadzerski', '2021-03-01', NULL, 1, 1),
-- Dyrektor Finansowy
('Piotr', 'Wiśniewski', '86091298765', 'dyrektor_finansowy', 15000.00, 'umowa_o_prace_na_czas_nieokreslony', '2022-06-10', NULL, 1, 1),
-- Dyrektor technologiczny
('Marcin', 'Piekarz', '90102232165', 'dyrektor_technologiczny', 15000.00, 'umowa_o_prace_na_czas_nieokreslony', '2022-07-12', NULL, 1, 1),
-- Dyrektor do spraw medycznych
('Zofia', 'Pałąk', '90020232173', 'dyrektor_do_spraw_medycznych', 15000.00, 'umowa_o_prace_na_czas_nieokreslony', '2022-06-02', NULL, 1, 1),
-- Dyrektor regionalny
('Marlena', 'Chlebek', '92011032712', 'dyrektor_regionalny', 15000.00, 'umowa_o_prace_na_czas_nieokreslony', '2022-06-07', NULL, 1, 1),
-- Menadżer SPA
('Ewa', 'Dąbrowska', '88042013579', 'menadzer_spa', 10000.00, 'umowa_o_prace_na_czas_okreslony', '2023-01-01', '2025-12-31', 6, 2),
('Agata', 'Krawczyk', '77091563214', 'menadzer_spa', 9000.00, 'umowa_o_prace_na_czas_nieokreslony', '2022-04-01', NULL, 6, 3),
('Bożena', 'Kamińska', '66072185291', 'menadzer_spa', 9200.00, 'umowa_o_prace_na_czas_nieokreslony', '2021-06-10', NULL, 6, 4),
-- Asystent Menadżera SPA
('Dawid', 'Baran', '90122045781', 'asystent_menadzera_spa', 6500.00, 'umowa_o_prace_na_czas_okreslony', '2023-06-15', '2025-06-15', 7, 2),
('Mariusz', 'Błaszczyk', '92051528111', 'asystent_menadzera_spa', 6500.00, 'umowa_o_prace_na_czas_okreslony', '2023-05-10', '2025-05-10', 8, 3),
('Artur', 'Lewandowski', '93011874526', 'asystent_menadzera_spa', 6700.00, 'umowa_o_prace_na_czas_okreslony', '2023-09-01', '2025-09-01', 9, 4),
-- Specjalista ds. Marketingu
('Monika', 'Czerwinska', '82031098523', 'specjalista_do_spraw_marketingu', 7500.00, 'umowa_o_prace_na_czas_nieokreslony', '2021-09-01', NULL, 4, 1),
('Tadeusz', 'Zając', '78110295317', 'specjalista_do_spraw_marketingu', 7700.00, 'umowa_o_prace_na_czas_nieokreslony', '2020-03-15', NULL, 4, 1),
-- Specjalista ds. Finansowych
('Grzegorz', 'Lis', '79062831479', 'specjalista_do_spraw_finansowych', 8000.00, 'umowa_o_prace_na_czas_nieokreslony', '2022-11-15', NULL, 3, 1),
('Helena', 'Gajewska', '69041728643', 'specjalista_do_spraw_finansowych', 8200.00, 'umowa_o_prace_na_czas_nieokreslony', '2023-01-05', NULL, 3, 1),
-- Specjalista ds. Nieruchomości
('Justyna', 'Pawlak', '87010526938', 'specjalista_do_spraw_nieruchomosci', 9500.00, 'umowa_o_prace_na_czas_nieokreslony', '2020-07-01', NULL, 3, 1),
('Kazimierz', 'Orłowski', '72082951738', 'specjalista_do_spraw_nieruchomosci', 9700.00, 'umowa_o_prace_na_czas_nieokreslony', '2022-07-22', NULL, 3, 1),
-- Specjalista ds. Technicznych
('Rafał', 'Górski', '91051287654', 'specjalista_do_spraw_technicznych', 7000.00, 'umowa_o_prace_na_czas_nieokreslony', '2023-03-01', NULL, 6, 2),
('Bogdan', 'Sokołowski', '81021487965', 'specjalista_do_spraw_technicznych', 7200.00, 'umowa_o_prace_na_czas_nieokreslony', '2021-04-01', NULL, 6, 3),
('Irena', 'Szulc', '63060342189', 'specjalista_do_spraw_technicznych', 7100.00, 'umowa_o_prace_na_czas_nieokreslony', '2023-05-18', NULL, 6, 4),
-- Specjalista ds. HR
('Sylwia', 'Adamczyk', '84081859217', 'specjalista_do_spraw_hr', 7800.00, 'umowa_o_prace_na_czas_nieokreslony', '2022-01-10', NULL, 1, 1),
('Jerzy', 'Nowicki', '75071963824', 'specjalista_do_spraw_hr', 8000.00, 'umowa_o_prace_na_czas_nieokreslony', '2020-10-01', NULL, 1, 1),
('Danuta', 'Kozłowska', '68120519473', 'specjalista_do_spraw_hr', 7900.00, 'umowa_o_prace_na_czas_nieokreslony', '2022-02-28', NULL, 1, 1),
-- Specjalista ds. Informatycznych
('Marcin', 'Rutkowski', '96040274185', 'specjalista_do_spraw_informatycznych', 8500.00, 'umowa_o_prace_na_czas_nieokreslony', '2021-05-01', NULL, 4, 1),
('Andrzej', 'Wojciechowski', '97031158269', 'specjalista_do_spraw_informatycznych', 8700.00, 'umowa_o_prace_na_czas_nieokreslony', '2023-07-01', NULL, 4, 1),
('Ewa', 'Kowal', '83092671954', 'specjalista_do_spraw_informatycznych', 8600.00, 'umowa_o_prace_na_czas_nieokreslony', '2021-01-15', NULL, 4, 1),
('Piotr', 'Rutkowski', '71060935821', 'specjalista_do_spraw_informatycznych', 8800.00, 'umowa_o_prace_na_czas_nieokreslony', '2022-08-08', NULL, 4, 1),
-- Specjalista ds. Graficznych
('Natalia', 'Michalak', '81112963872', 'specjalista_do_spraw_graficznych', 6800.00, 'umowa_o_prace_na_czas_nieokreslony', '2023-08-01', NULL, 4, 1),
('Grażyna', 'Stępień', '64111749382', 'specjalista_do_spraw_graficznych', 7000.00, 'umowa_o_prace_na_czas_nieokreslony', '2023-04-25', NULL, 4, 1),
-- Lekarz Fizjoterapeuta
('Łukasz', 'Sikora', '76100812547', 'lekarz_fizjoterapeuta', 11000.00, 'umowa_o_prace_na_czas_nieokreslony', '2022-06-01', NULL, 5, 2),
('Józef', 'Tomaszewski', '79052216497', 'lekarz_fizjoterapeuta', 11200.00, 'umowa_o_prace_na_czas_nieokreslony', '2020-09-01', NULL, 5, 3),
('Wojciech', 'Tomaszewski', '89031329534', 'lekarz_fizjoterapeuta', 11200.00, 'umowa_o_prace_na_czas_nieokreslony', '2019-08-01', NULL, 5, 4),
-- Lekarz Dietetyk
('Karolina', 'Mazurek', '89022278961', 'lekarz_dietetyk', 9000.00, 'umowa_o_prace_na_czas_nieokreslony', '2023-01-15', NULL, 5, 2),
('Maria', 'Michalska', '82070398156', 'lekarz_dietetyk', 9200.00, 'umowa_o_prace_na_czas_nieokreslony', '2022-03-10', NULL, 5, 3),
('Natalia', 'Grabiec', '94102351470', 'lekarz_dietetyk', 9000.00, 'umowa_o_prace_na_czas_nieokreslony', '2020-09-01', NULL, 5, 4),
-- Kosmetolog
('Katarzyna', 'Lewandowska', '95110386421', 'kosmetolog', 6000.00, 'umowa_o_prace_na_czas_nieokreslony', '2023-05-15', NULL, 5, 2),
('Patrycja', 'Grabowska', '92071536489', 'kosmetolog', 6200.00, 'umowa_o_prace_na_czas_nieokreslony', '2022-09-01', NULL, 5, 3),
('Teresa', 'Adamczyk', '67091452831', 'kosmetolog', 6400.00, 'umowa_o_prace_na_czas_nieokreslony', '2021-11-01', NULL, 5, 4),
-- Masażysta
('Michał', 'Wójcik', '89071824680', 'masazysta', 5500.00, 'umowa_zlecenie', '2023-09-01', '2024-03-01', 5, 2),
('Beata', 'Jasińska', '88051942863', 'masazysta', 5800.00, 'umowa_zlecenie', '2023-04-10', '2024-04-10', 5, 2),
('Janina', 'Dudek', '61032879542', 'masazysta', 6000.00, 'umowa_zlecenie', '2023-06-20', '2023-12-20', 5, 2),
('Halina', 'Kruk', '62112398571', 'masazysta', 5600.00, 'umowa_zlecenie', '2020-07-15', '2021-01-15', 5, 2),
('Stanisław', 'Zieliński', '74121538691', 'masazysta', 5900.00, 'umowa_zlecenie', '2022-04-12', '2023-04-12', 5, 3),
('Anna', 'Sikora', '87080295173', 'masazysta', 6100.00, 'umowa_zlecenie', '2020-01-08', '2020-07-08', 5, 3),
('Krystyna', 'Woźniak', '69011942857', 'masazysta', 5800.00, 'umowa_zlecenie', '2023-09-27', '2024-03-27', 5, 3),
('Wojciech', 'Kowalski', '91072563984', 'masazysta', 6200.00, 'umowa_zlecenie', '2021-05-03', '2022-05-03', 5, 4),
('Elżbieta', 'Mazurek', '65051187296', 'masazysta', 5700.00, 'umowa_zlecenie', '2022-12-19', '2023-06-19', 5, 4),
('Marek', 'Jankowski', '77020854139', 'masazysta', 6300.00, 'umowa_zlecenie', '2023-03-07', '2024-03-07', 5, 4),
-- Recepcjonista
('Magdalena', 'Kowalczyk', '91032578912', 'recepcjonista', 4500.00, 'umowa_o_prace_na_okres_probny', '2024-02-01', '2025-05-01', 6, 2),
('Daniel', 'Wieczorek', '94092715396', 'recepcjonista', 4700.00, 'umowa_o_prace_na_okres_probny', '2024-03-01', '2025-06-01', 6, 2),
('Roman', 'Pawlak', '70061739285', 'recepcjonista', 4800.00, 'umowa_o_prace_na_okres_probny', '2024-10-10', '2025-01-10', 6, 2),
('Henryka', 'Lis', '63092158742', 'recepcjonista', 4600.00, 'umowa_o_prace_na_czas_nieokreslony', '2021-08-01', NULL, 6, 3),
('Kazimiera', 'Górska', '59040312968', 'recepcjonista', 4900.00, 'umowa_o_prace_na_czas_okreslony', '2024-06-05', '2025-06-05', 6, 3),
('Tadeusz', 'Dąbrowski', '78011547896', 'recepcjonista', 4700.00, 'umowa_o_prace_na_czas_nieokreslony', '2024-02-15', NULL, 6, 3),
('Bożena', 'Czarnecka', '66122985174', 'recepcjonista', 5000.00, 'umowa_o_prace_na_okres_probny', '2024-03-20', '2025-06-20', 6, 4),
('Andrzej', 'Piotrowski', '72050869312', 'recepcjonista', 4500.00, 'umowa_o_prace_na_czas_nieokreslony', '2022-09-12', NULL, 6, 4),
-- Instruktor Fitness
('Adam', 'Zieliński', '78120935719', 'instruktor_fitness', 7000.00, 'samozatrudnienie', '2022-11-01', NULL, 5, 2),
('Krzysztof', 'Dudek', '75030195172', 'instruktor_fitness', 7200.00, 'samozatrudnienie', '2021-12-01', NULL, 5, 3),
('Mieczysław', 'Wojciechowski', '95101546345', 'instruktor_fitness', 7200.00, 'samozatrudnienie', '2021-12-01', NULL, 5, 4),
-- Elektryk
('Tomasz', 'Szymański', '85062269147', 'elektryk', 5000.00, 'umowa_o_prace_na_czas_nieokreslony', '2023-07-10', NULL, 14, 2),
('Andrzej', 'Jabłoński', '71071268459', 'elektryk', 5200.00, 'umowa_o_prace_na_czas_nieokreslony', '2022-08-01', NULL, 14, 2),
('Zdzisław', 'Mazur', '60081425793', 'elektryk', 5300.00, 'umowa_o_prace_na_czas_nieokreslony', '2021-03-08', NULL, 15, 3),
('Teresa', 'Wójcik', '58022791465', 'elektryk', 5200.00, 'umowa_o_prace_na_czas_nieokreslony', '2023-11-01', NULL, 15, 3),
('Henryk', 'Kowalski', '75100368291', 'elektryk', 5400.00, 'umowa_o_prace_na_czas_nieokreslony', '2022-07-18', NULL, 16, 4),
-- Hydraulik
('Henryk', 'Bąk', '68040932781', 'hydraulik', 5100.00, 'umowa_o_prace_na_czas_nieokreslony', '2023-02-15', NULL, 14, 2),
('Jan', 'Nowak', '79031952846', 'hydraulik', 5200.00, 'umowa_o_prace_na_czas_nieokreslony', '2020-09-21', NULL, 14, 2),
('Maria', 'Wiśniewska', '67061239581', 'hydraulik', 5100.00, 'umowa_o_prace_na_czas_nieokreslony', '2023-05-09', NULL, 15, 3),
('Kazimierz', 'Dąbrowski', '72112876934', 'hydraulik', 5300.00, 'umowa_o_prace_na_czas_nieokreslony', '2022-01-24', NULL, 15, 4),
-- Sprzątaczka
('Barbara', 'Woźniak', '69021547893', 'sprzataczka', 3500.00, 'umowa_o_prace_na_czas_nieokreslony', '2024-01-02', NULL, 6, 2),
('Elżbieta', 'Mazur', '65122189437', 'sprzataczka', 3600.00, 'umowa_o_prace_na_czas_nieokreslony', '2024-01-15', NULL, 6, 2),
('Wanda', 'Lewandowska', '55070148926', 'sprzataczka', 3700.00, 'umowa_o_prace_na_czas_nieokreslony', '2021-12-05', NULL, 6, 2),
('Jadwiga', 'Kamińska', '51092573184', 'sprzataczka', 3600.00, 'umowa_o_prace_na_czas_nieokreslony', '2023-08-14', NULL, 6, 3),
('Edward', 'Zieliński', '73041896257', 'sprzataczka', 3800.00, 'umowa_o_prace_na_czas_nieokreslony', '2020-04-02', NULL, 6, 3),
('Irena', 'Sikorska', '62120951738', 'sprzataczka', 3500.00, 'umowa_o_prace_na_czas_nieokreslony', '2022-05-29', NULL, 6, 3),
('Roman', 'Woźniak', '70032284916', 'sprzataczka', 3900.00, 'umowa_o_prace_na_czas_nieokreslony', '2023-01-17', NULL, 6, 4),
('Danuta', 'Kowalska', '68071539241', 'sprzataczka', 3400.00, 'umowa_o_prace_na_czas_nieokreslony', '2021-09-10', NULL, 6, 4),
-- Ochroniarz
('Stanisław', 'Kaczmarek', '73090351826', 'ochroniarz', 4300.00, 'umowa_o_prace_na_czas_nieokreslony', '2022-05-01', NULL, 6, 2),
('Mieczysław', 'Jankowski', '64090317582', 'ochroniarz', 4400.00, 'umowa_o_prace_na_czas_nieokreslony', '2022-10-26', NULL, 6, 2),
('Helena', 'Kruk', '58061942873', 'ochroniarz', 4300.00, 'umowa_o_prace_na_czas_nieokreslony', '2021-07-09', NULL, 6, 2),
('Władysław', 'Pawlak', '71012265948', 'ochroniarz', 4500.00, 'umowa_o_prace_na_czas_nieokreslony', '2023-03-15', NULL, 6, 3),
('Genowefa', 'Lis', '59110832761', 'ochroniarz', 4200.00, 'umowa_o_prace_na_czas_nieokreslony', '2020-12-01', NULL, 6, 3),
('Stanisław', 'Górski', '76051498237', 'ochroniarz', 4600.00, 'umowa_o_prace_na_czas_nieokreslony', '2022-06-20', NULL, 6, 4),
('Marianna', 'Dąbrowska', '61082754193', 'ochroniarz', 4100.00, 'umowa_o_prace_na_czas_nieokreslony', '2023-09-08', NULL, 6, 4),
-- Obsługa Klienta
('Karolina', 'Jankowska', '93081125874', 'obsluga_klienta', 4000.00, 'umowa_o_prace_na_czas_okreslony', '2023-10-16', '2025-04-16', 6, 2),
('Iwona', 'Kruk', '90061827541', 'obsluga_klienta', 4100.00, 'umowa_o_prace_na_czas_okreslony', '2023-11-01', '2025-11-01', 6, 2),
('Tadeusz', 'Czarnecki', '79021185364', 'obsluga_klienta', 4200.00, 'umowa_o_prace_na_czas_okreslony', '2023-04-19', '2025-10-19', 6, 2),
('Bożena', 'Piotrowska', '65072918472', 'obsluga_klienta', 4000.00, 'umowa_o_prace_na_czas_okreslony', '2023-01-03', '2025-01-03', 6, 3),
('Andrzej', 'Mazur', '72100563918', 'obsluga_klienta', 4300.00, 'umowa_o_prace_na_czas_okreslony', '2023-08-11', '2025-02-11', 6, 3),
('Elżbieta', 'Wójcik', '57031729584', 'obsluga_klienta', 3900.00, 'umowa_zlecenie', '2023-06-26', '2025-06-26', 6, 3),
('Henryk', 'Kowalski', '74062184395', 'obsluga_klienta', 4100.00, 'umowa_zlecenie', '2023-05-17', '2025-11-17', 6, 4),
('Kazimiera', 'Nowak', '69090357128', 'obsluga_klienta', 3800.00, 'umowa_zlecenie', '2023-11-09', '2025-11-09', 6, 4);