CREATE DATABASE spa;
GO
USE spa

CREATE TABLE [dbo].[t_formy_zatrudnienia ]
(
  [id] INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
  [nazwa] VARCHAR(64) UNIQUE NOT NULL
);

CREATE TABLE [dbo].[t_lokale]
(
  [id] INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
  [nazwa] VARCHAR(128) UNIQUE NOT NULL,
  [miasto] VARCHAR(128) NOT NULL,
  [ulica] VARCHAR(128) NOT NULL,
  [numer_domu] VARCHAR(8) NOT NULL,
  [kod_pocztowy] VARCHAR(5) NOT NULL
);

CREATE TABLE [dbo].[t_typy_lokacji]
(
  [id] INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
  [nazwa] VARCHAR(64) UNIQUE NOT NULL
);

CREATE TABLE [dbo].[t_typy_zabiegow]
(
  [id] INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
  [nazwa] VARCHAR(64) UNIQUE NOT NULL
);

CREATE TABLE [dbo].[t_zawody]
(
  [id] INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
  [nazwa] VARCHAR(64) UNIQUE NOT NULL, 
  [opis] varchar(128)
);

CREATE TABLE [dbo].[t_zabiegi]
(
  [id] INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
  [nazwa] VARCHAR(64) UNIQUE NOT NULL,
  [cena] MONEY NOT NULL DEFAULT 0,
  [fk_id_typu] INT NOT NULL FOREIGN KEY(fk_id_typu) 
    REFERENCES t_typy_zabiegow(id)
      ON DELETE CASCADE
      ON UPDATE CASCADE
);

CREATE TABLE dbo.t_lokacje
(
  [id] INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
  [nazwa] VARCHAR(64) NOT NULL UNIQUE,
  [opis] VARCHAR(256),
  [srednia_temperatura] FLOAT NOT NULL DEFAULT 0,
  [srednia_wilgotnosc] FLOAT NOT NULL DEFAULT 0,
  [maksymalna_ilosc_osob] INT NOT NULL DEFAULT 1,
  [cena_za_godzine] MONEY NOT NULL DEFAULT 0,
  [fk_nazwa_typu_lokacji] VARCHAR(64) NOT NULL FOREIGN KEY(fk_nazwa_typu_lokacji)
    REFERENCES t_typy_lokacji(nazwa)
      ON DELETE CASCADE
      ON UPDATE CASCADE,
  [fk_nazwa_lokalu] VARCHAR(128) NOT NULL FOREIGN KEY(fk_nazwa_lokalu)
    REFERENCES t_lokale(nazwa)
      ON DELETE CASCADE
      ON UPDATE CASCADE
);

CREATE TABLE [dbo].[t_dzienne_koszty_eksploatacyjne_inne]
(
  [id] INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
  [id_faktury] VARCHAR(32) NOT NULL UNIQUE,
  [fk_nazwa_lokalu] VARCHAR(128) FOREIGN KEY(fk_nazwa_lokalu)
    REFERENCES t_lokale(nazwa)
      ON DELETE NO ACTION
      ON UPDATE CASCADE,
  [koszt] MONEY NOT NULL DEFAULT 0,
  [data_czas] DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE [dbo].[t_dzienne_zuzycie_pradu_lokacja]
(
  [id] INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
  [fk_nazwa_lokacji] VARCHAR(64) FOREIGN KEY(fk_nazwa_lokacji)
    REFERENCES t_lokacje(nazwa)
      ON DELETE NO ACTION
      ON UPDATE CASCADE,
  [fk_nazwa_typu_lokacji] VARCHAR(64) FOREIGN KEY(fk_nazwa_typu_lokacji)
    REFERENCES t_typy_lokacji(nazwa)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  [wskazanie] FLOAT NOT NULL,
  [data_czas] DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE [dbo].[t_dzienne_zuzycie_pradu_lokal]
(
  [id] INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
  [fk_nazwa_lokalu] VARCHAR(128) FOREIGN KEY(fk_nazwa_lokalu)
    REFERENCES t_lokale(nazwa)
      ON DELETE NO ACTION
      ON UPDATE CASCADE,
  [wskazanie] FLOAT NOT NULL,
  [data_czas] DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE [dbo].[t_dzienne_zuzycie_wody_lokacja]
(
  [id] INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
  [fk_nazwa_lokacji] VARCHAR(64) FOREIGN KEY(fk_nazwa_lokacji)
    REFERENCES t_lokacje(nazwa)
      ON DELETE NO ACTION
      ON UPDATE CASCADE,
  [fk_nazwa_typu_lokacji] VARCHAR(64) FOREIGN KEY(fk_nazwa_typu_lokacji)
    REFERENCES t_typy_lokacji(nazwa)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  [wskazanie] FLOAT NOT NULL DEFAULT 0,
  [data_czas] DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE [dbo].[t_dzienne_zuzycie_wody_lokal]
(
  [id] INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
  [fk_nazwa_lokalu] VARCHAR(128) FOREIGN KEY(fk_nazwa_lokalu)
    REFERENCES t_lokale(nazwa)
      ON DELETE NO ACTION
      ON UPDATE CASCADE,
  [wskazanie] FLOAT NOT NULL,
  [data_czas] DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE [dbo].[t_pracownicy]
(
  [id] INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
  [imie] VARCHAR(64) NOT NULL,
  [nazwisko] VARCHAR(128) NOT NULL,
  [pesel] VARCHAR(11) UNIQUE NOT NULL,
  [fk_nazwa_zawodu] VARCHAR(64) NOT NULL FOREIGN KEY(fk_nazwa_zawodu) 
    REFERENCES t_zawody(nazwa)
      ON DELETE NO ACTION
      ON UPDATE CASCADE,
  [wynagrodzenie_brutto] FLOAT NOT NULL DEFAULT 0.0,
  [fk_nazwa_formy_zatrudnienia] VARCHAR(64) NOT NULL FOREIGN KEY(fk_nazwa_formy_zatrudnienia)
    REFERENCES t_formy_zatrudnienia(nazwa)
      ON DELETE NO ACTION
      ON UPDATE CASCADE,
  [poczatek_umowy] DATE NOT NULL,
  [koniec_umowy] DATE,
  [fk_id_przelozonego] INT NOT NULL FOREIGN KEY(fk_id_przelozonego)
    REFERENCES t_pracownicy(id)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  [fk_id_lokalu] INT NOT NULL FOREIGN KEY(fk_id_lokalu)
    REFERENCES t_lokale(id)
      ON DELETE NO ACTION
      ON UPDATE CASCADE
);


CREATE TABLE [dbo].[t_rezerwacje_lokacje]
(
  [id] INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
  [fk_nazwa_lokacji] VARCHAR(64) FOREIGN KEY(fk_nazwa_lokacji)
    REFERENCES t_lokacje(nazwa)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  [fk_nazwa_typu_lokacji] VARCHAR(64) NOT NULL FOREIGN KEY(fk_nazwa_typu_lokacji)
    REFERENCES t_typy_lokacji(nazwa)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  [czas] INT NOT NULL DEFAULT 0,
  [poczatek_rezerwacji] DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  [cena] MONEY NOT NULL DEFAULT 0,
  [imie] VARCHAR(64) NOT NULL,
  [nazwisko] VARCHAR(64) NOT NULL,
  [numer_telefonu] VARCHAR(9) NOT NULL
);

CREATE TABLE [dbo].[t_rezerwacje_zabiegi]
(
  [id] INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
  [fk_nazwa_lokalu] VARCHAR(128) NOT NULL FOREIGN KEY(fk_nazwa_lokalu)
    REFERENCES t_lokale(nazwa)
      ON DELETE NO ACTION
      ON UPDATE CASCADE,
  [fk_nazwa_zabiegu] VARCHAR(64) FOREIGN KEY(fk_nazwa_zabiegu)
    REFERENCES t_zabiegi(nazwa)
      ON DELETE NO ACTION
      ON UPDATE CASCADE,
  [czas] INT NOT NULL DEFAULT 0,
  [poczatek_rezerwacji] DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  [cena] MONEY NOT NULL DEFAULT 0,
  [imie] VARCHAR(64) NOT NULL,
  [nazwisko] VARCHAR(64) NOT NULL,
  [numer_telefonu] VARCHAR(9) NOT NULL,
  [fk_pesel_pracownika] VARCHAR(11) NOT NULL FOREIGN KEY(fk_pesel_pracownika)
    REFERENCES t_pracownicy(pesel)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

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
('kontrakt_menadzerski');

INSERT INTO dbo.t_lokale (
  nazwa,
  miasto,
  ulica,
  numer_domu,
  kod_pocztowy
)
VALUES
('Biuro', 'Gdańsk', 'ul. Krótki Targ', '27', '80450'),
('Złoty Kwiat', 'Kraków', 'ul. Floriańska', '15', '31019'),
('Relaks', 'Warszawa', 'Al. Jerozolimskie', '100', '00807'),
('Morska Bryza', 'Gdańsk', 'ul. Długi Targ', '44', '80830');

INSERT INTO t_typy_lokacji (
    nazwa
)
VALUES
('laznia_turecka'),
('sauna_finska'),
('sauna_mokra'),
('sauna_parowa'),
('sauna_podczerwona'),
('jacuzzi'),
('teznia_solankowa'),
('kriokomora');

INSERT INTO t_typy_zabiegow (
    nazwa
)
VALUES
('masaz'),
('zabieg_na_twarz'),
('zabieg_na_dlonie'),
('zabieg_na_stopy');

INSERT INTO t_zawody (
    nazwa,
    opis
)
VALUES 
('prezes', NULL),
('wice_prezes', NULL),
('dyrektor_finansowy', NULL),
('dyrektor_technologiczny', NULL),
('dyrektor_do_spraw_medycznych', NULL),
('dyrektor_regionalny', NULL),
('menadzer_spa', NULL),
('asystent_menadzera_spa', NULL),
('specjalista_do_spraw_marketingu', NULL),
('specjalista_do_spraw_finansowych', NULL),
('specjalista_do_spraw_nieruchomosci', NULL),
('specjalista_do_spraw_technicznych', NULL),
('specjalista_do_spraw_hr', NULL),
('specjalista_do_spraw_informatycznych', NULL),
('specjalista_do_spraw_graficznych', NULL),
('lekarz_fizjoterapeuta', NULL),
('lekarz_dietetyk', NULL),
('kosmetolog', NULL),
('instruktor_fitness', NULL),
('masazysta', NULL),
('recepcjonista', NULL),
('elektryk', NULL),
('hydraulik', NULL),
('sprzataczka', NULL),
('ochroniarz', NULL),
('obsluga_klienta', NULL);

INSERT INTO t_zabiegi (
  nazwa,
  cena,
  fk_id_typu
)
VALUES
('masaz_klasyczny', 500, 1),
('masaz_relaksacyjny', 500, 1),
('masaz_goracymi_kamieniami', 600, 1),
('masaz_tkanek_glebokich', 600, 1),
('masaz_shiatsu', 600, 1),
('masaz_tajski', 600, 1),
('masaz_ciazowy', 500, 1),
('masaz_sportowy', 500, 1),
('masaz_czekolada', 700, 1),
('refleksologia', 300, 1),
('radioferencja_mikroiglowa', 500, 2),
('mizoterapia_mikroiglowa', 500, 2),
('oczyszczanie_wodorowe', 500, 2),
('mikrodermabrazja', 500, 2),
('manicure_hybrydowy', 200, 3),
('pedicure_hybrydowy', 200, 4),
('fish_pedicure', 200, 4);

INSERT INTO t_dzienne_koszty_eksploatacyjne_inne (
    id_faktury,
    fk_nazwa_lokalu,
    koszt,
    data_czas
)
VALUES 
('F0001', 'Biuro', 450.00, '2024-09-16 09:00:00'),
('F0002', 'Złoty Kwiat', 125.50, '2024-09-17 13:30:00'),
('F0003', 'Relaks', 580.75, '2024-09-18 08:15:00'),
('F0004', 'Morska Bryza', 650.00, '2024-09-16 17:45:00'),
('F0005', 'Biuro', 275.20, '2024-09-17 10:00:00'),
('F0006', 'Złoty Kwiat', 399.99, '2024-09-18 15:20:00'),
('F0007', 'Relaks', 50.00, '2024-09-16 07:00:00'),
('F0008', 'Morska Bryza', 110.50, '2024-09-17 18:00:00'),
('F0009', 'Biuro', 500.01, '2024-09-18 11:30:00'),
('F0010', 'Złoty Kwiat', 225.00, '2024-09-16 14:45:00'),
('F0011', 'Relaks', 675.00, '2024-09-17 06:00:00'),
('F0012', 'Morska Bryza', 350.00, '2024-09-18 19:00:00'),
('F0013', 'Biuro', 10.00, '2024-09-16 08:30:00'),
('F0014', 'Złoty Kwiat', 490.00, '2024-09-17 15:00:00'),
('F0015', 'Relaks', 210.00, '2024-09-18 10:45:00'),
('F0016', 'Morska Bryza', 50.00, '2024-09-16 12:00:00'),
('F0017', 'Biuro', 320.00, '2024-09-17 07:30:00'),
('F0018', 'Złoty Kwiat', 680.00, '2024-09-18 16:15:00'),
('F0019', 'Relaks', 90.00, '2024-09-16 20:00:00'),
('F0020', 'Morska Bryza', 420.00, '2024-09-17 09:30:00'),
('F0021', 'Relaks', 333.33, '2024-09-17 12:45:00'),
('F0022', 'Morska Bryza', 199.99, '2024-09-18 07:30:00'),
('F0023', 'Biuro', 555.55, '2024-09-16 16:15:00'),
('F0024', 'Złoty Kwiat', 70.00, '2024-09-17 09:15:00'),
('F0025', 'Relaks', 280.00, '2024-09-18 14:00:00'),
('F0026', 'Morska Bryza', 610.00, '2024-09-16 11:30:00'),
('F0027', 'Biuro', 415.00, '2024-09-17 17:45:00'),
('F0028', 'Złoty Kwiat', 160.00, '2024-09-18 06:45:00'),
('F0029', 'Relaks', 590.00, '2024-09-16 19:00:00'),
('F0030', 'Morska Bryza', 30.00, '2024-09-17 11:00:00'),
('F0031', 'Biuro', 690.00, '2024-09-18 18:30:00'),
('F0032', 'Złoty Kwiat', 240.00, '2024-09-16 06:00:00'),
('F0033', 'Relaks', 130.00, '2024-09-17 15:15:00'),
('F0034', 'Morska Bryza', 470.00, '2024-09-18 09:45:00'),
('F0035', 'Biuro', 700.00, '2024-09-16 13:30:00'),
('F0036', 'Złoty Kwiat', 85.00, '2024-09-17 08:00:00'),
('F0037', 'Relaks', 360.00, '2024-09-18 12:15:00'),
('F0038', 'Morska Bryza', 520.00, '2024-09-16 22:00:00'),
('F0039', 'Biuro', 190.00, '2024-09-17 05:30:00'),
('F0040', 'Złoty Kwiat', 630.00, '2024-09-18 17:00:00');

INSERT INTO t_lokacje (
  nazwa,
  opis,
  srednia_temperatura,
  srednia_wilgotnosc,
  maksymalna_ilosc_osob,
  cena_za_godzine,
  fk_nazwa_typu_lokacji,
  fk_nazwa_lokalu
)
VALUES 
('laznia_turecka_1', NULL, 45, 95, 10, 70, 'laznia_turecka', 'Złoty Kwiat'),
('laznia_turecka_2', NULL, 45, 95, 10, 70, 'laznia_turecka', 'Relaks'),
('laznia_turecka_3', NULL, 45, 95, 10, 70, 'laznia_turecka', 'Morska Bryza'),
('sauna_finska_1', NULL, 80, 12, 10, 70, 'sauna_finska', 'Złoty Kwiat'),
('sauna_finska_2', NULL, 80, 12, 10, 70, 'sauna_finska', 'Złoty Kwiat'),
('sauna_finska_3', NULL, 95, 8, 10, 70, 'sauna_finska', 'Relaks'),
('sauna_finska_4', NULL, 110, 5, 20, 70, 'sauna_finska', 'Relaks'),
('sauna_finska_5', NULL, 110, 5, 20, 70, 'sauna_finska', 'Morska Bryza'),
('sauna_finska_6', NULL, 110, 5, 20, 70, 'sauna_finska', 'Morska Bryza'),
('sauna_mokra_1', NULL, 55, 35, 10, 70, 'sauna_mokra', 'Złoty Kwiat'),
('sauna_mokra_2', NULL, 65, 20, 10, 70, 'sauna_mokra', 'Złoty Kwiat'),
('sauna_mokra_3', NULL, 55, 35, 10, 70, 'sauna_mokra', 'Relaks'),
('sauna_mokra_4', NULL, 55, 35, 10, 70, 'sauna_mokra', 'Relaks'),
('sauna_mokra_5', NULL, 55, 35, 10, 70, 'sauna_mokra', 'Morska Bryza'),
('sauna_parowa_1', NULL, 70, 90, 10, 70, 'sauna_parowa', 'Złoty Kwiat'),
('sauna_parowa_2', NULL, 90, 95, 10, 70, 'sauna_parowa', 'Złoty Kwiat'),
('sauna_parowa_3', NULL, 70, 90, 10, 70, 'sauna_parowa', 'Relaks'),
('sauna_parowa_4', NULL, 70, 90, 10, 70, 'sauna_parowa', 'Relaks'),
('sauna_parowa_5', NULL, 70, 90, 10, 70, 'sauna_parowa', 'Morska Bryza'),
('sauna_podczerwona_1', NULL, 50, 20, 6, 70, 'sauna_podczerwona', 'Złoty Kwiat'),
('sauna_podczerwona_2', NULL, 50, 20, 6, 70, 'sauna_podczerwona', 'Relaks'),
('sauna_podczerwona_3', NULL, 50, 20, 6, 70, 'sauna_podczerwona', 'Morska Bryza'),
('jacuzzi_1', NULL, 38, 60, 6, 40, 'jacuzzi', 'Złoty Kwiat'),
('jacuzzi_2', NULL, 38, 60, 4, 40, 'jacuzzi', 'Złoty Kwiat'),
('jacuzzi_3', NULL, 38, 60, 4, 40, 'jacuzzi', 'Relaks'),
('jacuzzi_4', NULL, 38, 60, 4, 40, 'jacuzzi', 'Relaks'),
('jacuzzi_5', NULL, 38, 60, 4, 40, 'jacuzzi', 'Morska Bryza'),
('teznia_solankowa_1', NULL, 36, 80, 8, 30, 'teznia_solankowa', 'Złoty Kwiat'),
('teznia_solankowa_2', NULL, 36, 80, 8, 30, 'teznia_solankowa', 'Złoty Kwiat'),
('teznia_solankowa_3', NULL, 36, 80, 8, 30, 'teznia_solankowa', 'Relaks'),
('teznia_solankowa_4', NULL, 36, 80, 8, 30, 'teznia_solankowa', 'Morska Bryza'),
('kriokomora_1', NULL, -110, 60, 8, 100, 'kriokomora', 'Złoty Kwiat'),
('kriokomora_2', NULL, -110, 60, 8, 100, 'kriokomora', 'Relaks'),
('kriokomora_3', NULL, -110, 60, 8, 100, 'kriokomora', 'Morska Bryza');

INSERT INTO t_dzienne_zuzycie_pradu_lokacja (
  fk_nazwa_lokacji,
  fk_nazwa_typu_lokacji,
  wskazanie,
  data_czas
)
VALUES 
('laznia_turecka_1', 'laznia_turecka', 12.8, '2024-09-16 23:00:00'),
('laznia_turecka_2', 'laznia_turecka', 14.0, '2024-09-16 23:00:00'),
('laznia_turecka_3', 'laznia_turecka', 13.4, '2024-09-16 23:00:00'),
('sauna_finska_1', 'sauna_finska', 18.2, '2024-09-16 23:00:00'),
('sauna_finska_2', 'sauna_finska', 20.4, '2024-09-16 23:00:00'),
('sauna_finska_3', 'sauna_finska', 19.7, '2024-09-16 23:00:00'),
('sauna_finska_4', 'sauna_finska', 17.6, '2024-09-16 23:00:00'),
('sauna_finska_5', 'sauna_finska', 21.5, '2024-09-16 23:00:00'),
('sauna_finska_6', 'sauna_finska', 22.1, '2024-09-16 23:00:00'),
('sauna_mokra_1', 'sauna_mokra', 15.5, '2024-09-16 23:00:00'),
('sauna_mokra_2', 'sauna_mokra', 16.8, '2024-09-16 23:00:00'),
('sauna_mokra_3', 'sauna_mokra', 15.2, '2024-09-16 23:00:00'),
('sauna_mokra_4', 'sauna_mokra', 16.1, '2024-09-16 23:00:00'),
('sauna_mokra_5', 'sauna_mokra', 15.8, '2024-09-16 23:00:00'),
('sauna_parowa_1', 'sauna_parowa', 21.3, '2024-09-16 23:00:00'),
('sauna_parowa_2', 'sauna_parowa', 22.3, '2024-09-16 23:00:00'),
('sauna_parowa_3', 'sauna_parowa', 20.6, '2024-09-16 23:00:00'),
('sauna_parowa_4', 'sauna_parowa', 19.8, '2024-09-16 23:00:00'),
('sauna_parowa_5', 'sauna_parowa', 21.0, '2024-09-16 23:00:00'),
('sauna_podczerwona_1', 'sauna_podczerwona', 17.4, '2024-09-16 23:00:00'),
('jacuzzi_1', 'jacuzzi', 12.7, '2024-09-16 23:00:00'),
('jacuzzi_2', 'jacuzzi', 13.3, '2024-09-16 23:00:00'),
('jacuzzi_3', 'jacuzzi', 12.4, '2024-09-16 23:00:00'),
('jacuzzi_4', 'jacuzzi', 12.0, '2024-09-16 23:00:00'),
('jacuzzi_5', 'jacuzzi', 12.6, '2024-09-16 23:00:00'),
('teznia_solankowa_1', 'teznia_solankowa', 11.7, '2024-09-16 23:00:00'),
('teznia_solankowa_2', 'teznia_solankowa', 13.9, '2024-09-16 23:00:00'),
('teznia_solankowa_3', 'teznia_solankowa', 13.1, '2024-09-16 23:00:00'),
('teznia_solankowa_4', 'teznia_solankowa', 12.5, '2024-09-16 23:00:00'),
('kriokomora_1', 'kriokomora', 30.9, '2024-09-16 23:00:00'),
('kriokomora_2', 'kriokomora', 29.5, '2024-09-16 23:00:00'),
('kriokomora_3', 'kriokomora', 31.2, '2024-09-16 23:00:00'),
('laznia_turecka_1', 'laznia_turecka', 12.5, '2024-09-17 23:00:00'),
('laznia_turecka_2', 'laznia_turecka', 14.0, '2024-09-17 23:00:00'),
('laznia_turecka_3', 'laznia_turecka', 13.8, '2024-09-17 23:00:00'),
('sauna_finska_1', 'sauna_finska', 19.1, '2024-09-17 23:00:00'),
('sauna_finska_2', 'sauna_finska', 21.0, '2024-09-17 23:00:00'),
('sauna_finska_3', 'sauna_finska', 20.2, '2024-09-17 23:00:00'),
('sauna_finska_4', 'sauna_finska', 18.5, '2024-09-17 23:00:00'),
('sauna_finska_5', 'sauna_finska', 20.9, '2024-09-17 23:00:00'),
('sauna_finska_6', 'sauna_finska', 21.3, '2024-09-17 23:00:00'),
('sauna_mokra_1', 'sauna_mokra', 15.4, '2024-09-17 23:00:00'),
('sauna_mokra_2', 'sauna_mokra', 16.6, '2024-09-17 23:00:00'),
('sauna_mokra_3', 'sauna_mokra', 15.0, '2024-09-17 23:00:00'),
('sauna_mokra_4', 'sauna_mokra', 16.4, '2024-09-17 23:00:00'),
('sauna_mokra_5', 'sauna_mokra', 15.7, '2024-09-17 23:00:00'),
('sauna_parowa_1', 'sauna_parowa', 21.8, '2024-09-17 23:00:00'),
('sauna_parowa_2', 'sauna_parowa', 22.0, '2024-09-17 23:00:00'),
('sauna_parowa_3', 'sauna_parowa', 20.6, '2024-09-17 23:00:00'),
('sauna_parowa_4', 'sauna_parowa', 19.7, '2024-09-17 23:00:00'),
('sauna_parowa_5', 'sauna_parowa', 21.5, '2024-09-17 23:00:00'),
('sauna_podczerwona_1', 'sauna_podczerwona', 17.5, '2024-09-17 23:00:00'),
('jacuzzi_1', 'jacuzzi', 13.0, '2024-09-17 23:00:00'),
('jacuzzi_2', 'jacuzzi', 13.7, '2024-09-17 23:00:00'),
('jacuzzi_3', 'jacuzzi', 12.6, '2024-09-17 23:00:00'),
('jacuzzi_4', 'jacuzzi', 12.3, '2024-09-17 23:00:00'),
('jacuzzi_5', 'jacuzzi', 12.8, '2024-09-17 23:00:00'),
('teznia_solankowa_1', 'teznia_solankowa', 11.6, '2024-09-17 23:00:00'),
('teznia_solankowa_2', 'teznia_solankowa', 13.8, '2024-09-17 23:00:00'),
('teznia_solankowa_3', 'teznia_solankowa', 13.5, '2024-09-17 23:00:00'),
('teznia_solankowa_4', 'teznia_solankowa', 12.9, '2024-09-17 23:00:00'),
('kriokomora_1', 'kriokomora', 30.8, '2024-09-17 23:00:00'),
('kriokomora_2', 'kriokomora', 29.2, '2024-09-17 23:00:00'),
('kriokomora_3', 'kriokomora', 31.6, '2024-09-17 23:00:00'),
('laznia_turecka_1', 'laznia_turecka', 12.8, '2024-09-18 23:00:00'),
('laznia_turecka_2', 'laznia_turecka', 14.2, '2024-09-18 23:00:00'),
('laznia_turecka_3', 'laznia_turecka', 13.1, '2024-09-18 23:00:00'),
('sauna_finska_1', 'sauna_finska', 18.4, '2024-09-18 23:00:00'),
('sauna_finska_2', 'sauna_finska', 20.1, '2024-09-18 23:00:00'),
('sauna_finska_3', 'sauna_finska', 19.3, '2024-09-18 23:00:00'),
('sauna_finska_4', 'sauna_finska', 17.6, '2024-09-18 23:00:00'),
('sauna_finska_5', 'sauna_finska', 21.7, '2024-09-18 23:00:00'),
('sauna_finska_6', 'sauna_finska', 22.5, '2024-09-18 23:00:00'),
('sauna_mokra_1', 'sauna_mokra', 15.9, '2024-09-18 23:00:00'),
('sauna_mokra_2', 'sauna_mokra', 16.3, '2024-09-18 23:00:00'),
('sauna_mokra_3', 'sauna_mokra', 14.8, '2024-09-18 23:00:00'),
('sauna_mokra_4', 'sauna_mokra', 16.0, '2024-09-18 23:00:00'),
('sauna_mokra_5', 'sauna_mokra', 15.4, '2024-09-18 23:00:00'),
('sauna_parowa_1', 'sauna_parowa', 21.2, '2024-09-18 23:00:00'),
('sauna_parowa_2', 'sauna_parowa', 22.1, '2024-09-18 23:00:00'),
('sauna_parowa_3', 'sauna_parowa', 20.3, '2024-09-18 23:00:00'),
('sauna_parowa_4', 'sauna_parowa', 19.9, '2024-09-18 23:00:00'),
('sauna_parowa_5', 'sauna_parowa', 21.0, '2024-09-18 23:00:00'),
('sauna_podczerwona_1', 'sauna_podczerwona', 17.2, '2024-09-18 23:00:00'),
('jacuzzi_1', 'jacuzzi', 12.9, '2024-09-18 23:00:00'),
('jacuzzi_2', 'jacuzzi', 13.5, '2024-09-18 23:00:00'),
('jacuzzi_3', 'jacuzzi', 12.3, '2024-09-18 23:00:00'),
('jacuzzi_4', 'jacuzzi', 11.8, '2024-09-18 23:00:00'),
('jacuzzi_5', 'jacuzzi', 12.6, '2024-09-18 23:00:00'),
('teznia_solankowa_1', 'teznia_solankowa', 11.5, '2024-09-18 23:00:00'),
('teznia_solankowa_2', 'teznia_solankowa', 14.3, '2024-09-18 23:00:00'),
('teznia_solankowa_3', 'teznia_solankowa', 13.2, '2024-09-18 23:00:00'),
('teznia_solankowa_4', 'teznia_solankowa', 12.7, '2024-09-18 23:00:00'),
('kriokomora_1', 'kriokomora', 31.4, '2024-09-18 23:00:00'),
('kriokomora_2', 'kriokomora', 29.7, '2024-09-18 23:00:00'),
('kriokomora_3', 'kriokomora', 32.5, '2024-09-18 23:00:00');

INSERT INTO t_dzienne_zuzycie_wody_lokacja (
    fk_nazwa_lokacji,
    fk_nazwa_typu_lokacji,
    wskazanie,
    data_czas
)
VALUES
('laznia_turecka_1', 'laznia_turecka', 150.4, '2024-09-16 23:00:00'),
('laznia_turecka_2', 'laznia_turecka', 175.6, '2024-09-16 23:00:00'),
('laznia_turecka_3', 'laznia_turecka', 160.2, '2024-09-16 23:00:00'),
('sauna_finska_1', 'sauna_finska', 80.1, '2024-09-16 23:00:00'),
('sauna_finska_2', 'sauna_finska', 90.7, '2024-09-16 23:00:00'),
('sauna_finska_3', 'sauna_finska', 85.4, '2024-09-16 23:00:00'),
('sauna_finska_4', 'sauna_finska', 87.9, '2024-09-16 23:00:00'),
('sauna_finska_5', 'sauna_finska', 92.3, '2024-09-16 23:00:00'),
('sauna_finska_6', 'sauna_finska', 88.6, '2024-09-16 23:00:00'),
('sauna_mokra_1', 'sauna_mokra', 65.3, '2024-09-16 23:00:00'),
('sauna_mokra_2', 'sauna_mokra', 68.7, '2024-09-16 23:00:00'),
('sauna_mokra_3', 'sauna_mokra', 70.5, '2024-09-16 23:00:00'),
('sauna_mokra_4', 'sauna_mokra', 71.8, '2024-09-16 23:00:00'),
('sauna_mokra_5', 'sauna_mokra', 72.2, '2024-09-16 23:00:00'),
('sauna_parowa_1', 'sauna_parowa', 130.9, '2024-09-16 23:00:00'),
('sauna_parowa_2', 'sauna_parowa', 140.6, '2024-09-16 23:00:00'),
('sauna_parowa_3', 'sauna_parowa', 135.2, '2024-09-16 23:00:00'),
('sauna_parowa_4', 'sauna_parowa', 138.7, '2024-09-16 23:00:00'),
('sauna_parowa_5', 'sauna_parowa', 141.3, '2024-09-16 23:00:00'),
('sauna_podczerwona_1', 'sauna_podczerwona', 55.2, '2024-09-16 23:00:00'),
('jacuzzi_1', 'jacuzzi', 110.4, '2024-09-16 23:00:00'),
('jacuzzi_2', 'jacuzzi', 120.3, '2024-09-16 23:00:00'),
('jacuzzi_3', 'jacuzzi', 115.8, '2024-09-16 23:00:00'),
('jacuzzi_4', 'jacuzzi', 118.9, '2024-09-16 23:00:00'),
('jacuzzi_5', 'jacuzzi', 116.7, '2024-09-16 23:00:00'),
('teznia_solankowa_1', 'teznia_solankowa', 45.1, '2024-09-16 23:00:00'),
('teznia_solankowa_2', 'teznia_solankowa', 48.6, '2024-09-16 23:00:00'),
('teznia_solankowa_3', 'teznia_solankowa', 50.4, '2024-09-16 23:00:00'),
('teznia_solankowa_4', 'teznia_solankowa', 47.8, '2024-09-16 23:00:00'),
('kriokomora_1', 'kriokomora', 22.5, '2024-09-16 23:00:00'),
('kriokomora_2', 'kriokomora', 24.3, '2024-09-16 23:00:00'),
('kriokomora_3', 'kriokomora', 23.7, '2024-09-16 23:00:00'),
('laznia_turecka_1', 'laznia_turecka', 152.3, '2024-09-17 23:00:00'),
('laznia_turecka_2', 'laznia_turecka', 176.1, '2024-09-17 23:00:00'),
('laznia_turecka_3', 'laznia_turecka', 161.7, '2024-09-17 23:00:00'),
('sauna_finska_1', 'sauna_finska', 82.4, '2024-09-17 23:00:00'),
('sauna_finska_2', 'sauna_finska', 89.6, '2024-09-17 23:00:00'),
('sauna_finska_3', 'sauna_finska', 87.1, '2024-09-17 23:00:00'),
('sauna_finska_4', 'sauna_finska', 88.3, '2024-09-17 23:00:00'),
('sauna_finska_5', 'sauna_finska', 91.8, '2024-09-17 23:00:00'),
('sauna_finska_6', 'sauna_finska', 90.5, '2024-09-17 23:00:00'),
('sauna_mokra_1', 'sauna_mokra', 66.2, '2024-09-17 23:00:00'),
('sauna_mokra_2', 'sauna_mokra', 69.4, '2024-09-17 23:00:00'),
('sauna_mokra_3', 'sauna_mokra', 72.1, '2024-09-17 23:00:00'),
('sauna_mokra_4', 'sauna_mokra', 71.4, '2024-09-17 23:00:00'),
('sauna_mokra_5', 'sauna_mokra', 73.0, '2024-09-17 23:00:00'),
('sauna_parowa_1', 'sauna_parowa', 132.6, '2024-09-17 23:00:00'),
('sauna_parowa_2', 'sauna_parowa', 139.9, '2024-09-17 23:00:00'),
('sauna_parowa_3', 'sauna_parowa', 136.4, '2024-09-17 23:00:00'),
('sauna_parowa_4', 'sauna_parowa', 138.2, '2024-09-17 23:00:00'),
('sauna_parowa_5', 'sauna_parowa', 142.1, '2024-09-17 23:00:00'),
('sauna_podczerwona_1', 'sauna_podczerwona', 54.7, '2024-09-17 23:00:00'),
('jacuzzi_1', 'jacuzzi', 113.5, '2024-09-17 23:00:00'),
('jacuzzi_2', 'jacuzzi', 121.7, '2024-09-17 23:00:00'),
('jacuzzi_3', 'jacuzzi', 116.3, '2024-09-17 23:00:00'),
('jacuzzi_4', 'jacuzzi', 119.5, '2024-09-17 23:00:00'),
('jacuzzi_5', 'jacuzzi', 117.2, '2024-09-17 23:00:00'),
('teznia_solankowa_1', 'teznia_solankowa', 46.5, '2024-09-17 23:00:00'),
('teznia_solankowa_2', 'teznia_solankowa', 49.1, '2024-09-17 23:00:00'),
('teznia_solankowa_3', 'teznia_solankowa', 51.2, '2024-09-17 23:00:00'),
('teznia_solankowa_4', 'teznia_solankowa', 48.3, '2024-09-17 23:00:00'),
('kriokomora_1', 'kriokomora', 21.9, '2024-09-17 23:00:00'),
('kriokomora_2', 'kriokomora', 24.1, '2024-09-17 23:00:00'),
('kriokomora_3', 'kriokomora', 22.8, '2024-09-17 23:00:00'),
('laznia_turecka_1', 'laznia_turecka', 149.7, '2024-09-18 23:00:00'),
('laznia_turecka_2', 'laznia_turecka', 173.2, '2024-09-18 23:00:00'),
('laznia_turecka_3', 'laznia_turecka', 162.4, '2024-09-18 23:00:00'),
('sauna_finska_1', 'sauna_finska', 83.1, '2024-09-18 23:00:00'),
('sauna_finska_2', 'sauna_finska', 88.9, '2024-09-18 23:00:00'),
('sauna_finska_3', 'sauna_finska', 86.5, '2024-09-18 23:00:00'),
('sauna_finska_4', 'sauna_finska', 89.7, '2024-09-18 23:00:00'),
('sauna_finska_5', 'sauna_finska', 91.2, '2024-09-18 23:00:00'),
('sauna_finska_6', 'sauna_finska', 90.4, '2024-09-18 23:00:00'),
('sauna_mokra_1', 'sauna_mokra', 67.4, '2024-09-18 23:00:00'),
('sauna_mokra_2', 'sauna_mokra', 70.8, '2024-09-18 23:00:00'),
('sauna_mokra_3', 'sauna_mokra', 72.5, '2024-09-18 23:00:00'),
('sauna_mokra_4', 'sauna_mokra', 73.1, '2024-09-18 23:00:00'),
('sauna_mokra_5', 'sauna_mokra', 71.6, '2024-09-18 23:00:00'),
('sauna_parowa_1', 'sauna_parowa', 133.8, '2024-09-18 23:00:00'),
('sauna_parowa_2', 'sauna_parowa', 141.5, '2024-09-18 23:00:00'),
('sauna_parowa_3', 'sauna_parowa', 137.7, '2024-09-18 23:00:00'),
('sauna_parowa_4', 'sauna_parowa', 139.3, '2024-09-18 23:00:00'),
('sauna_parowa_5', 'sauna_parowa', 140.7, '2024-09-18 23:00:00'),
('sauna_podczerwona_1', 'sauna_podczerwona', 56.4, '2024-09-18 23:00:00'),
('jacuzzi_1', 'jacuzzi', 114.8, '2024-09-18 23:00:00'),
('jacuzzi_2', 'jacuzzi', 118.6, '2024-09-18 23:00:00'),
('jacuzzi_3', 'jacuzzi', 116.1, '2024-09-18 23:00:00'),
('jacuzzi_4', 'jacuzzi', 119.4, '2024-09-18 23:00:00'),
('jacuzzi_5', 'jacuzzi', 117.9, '2024-09-18 23:00:00'),
('teznia_solankowa_1', 'teznia_solankowa', 47.9, '2024-09-18 23:00:00'),
('teznia_solankowa_2', 'teznia_solankowa', 49.3, '2024-09-18 23:00:00'),
('teznia_solankowa_3', 'teznia_solankowa', 51.7, '2024-09-18 23:00:00'),
('teznia_solankowa_4', 'teznia_solankowa', 50.1, '2024-09-18 23:00:00'),
('kriokomora_1', 'kriokomora', 22.3, '2024-09-18 23:00:00'),
('kriokomora_2', 'kriokomora', 25.1, '2024-09-18 23:00:00'),
('kriokomora_3', 'kriokomora', 23.9, '2024-09-18 23:00:00');

INSERT INTO t_dzienne_zuzycie_pradu_lokal (
  fk_nazwa_lokalu,
  wskazanie,
  data_czas
)
VALUES 
('Biuro',	250.30000000000007, '2024-09-16 23:00:00.000'),
('Morska Bryza',	550.30000000000007, '2024-09-16 23:00:00.000'),
('Relaks',	670.0000000000002,	'2024-09-16 23:00:00.000'),
('Zloty Kwiat',	781.6,	'2024-09-16 23:00:00.000'),
('Biuro',	551.5, '2024-09-17 23:00:00.000'),
('Morska Bryza',	551.5, '2024-09-17 23:00:00.000'),
('Relaks',	675.9999999999999,	'2024-09-17 23:00:00.000'),
('Zloty Kwiat',	786.3999999999999,	'2024-09-17 23:00:00.000'),
('Biuro',	554.50000000000006, '2024-09-18 23:00:00.000'),
('Morska Bryza',	554.50000000000006, '2024-09-18 23:00:00.000'),
('Relaks',	667.3000000000004,	'2024-09-18 23:00:00.000'),
('Zloty Kwiat',	782.7999999999997,	'2024-09-18 23:00:00.000');

INSERT INTO t_dzienne_zuzycie_wody_lokal (
  fk_nazwa_lokalu,
  wskazanie,
  data_czas
)
VALUES 
('Biuro',	89.30000000000007, '2024-09-16 23:00:00.000'),
('Morska Bryza',	2738.4, '2024-09-16 23:00:00.000'),
('Relaks',	3839.5,	'2024-09-16 23:00:00.000'),
('Zloty Kwiat',	3913.1000000000004,	'2024-09-16 23:00:00.000'),
('Biuro',	125.3, '2024-09-17 23:00:00.000'),
('Morska Bryza',	2838.4, '2024-09-17 23:00:00.000'),
('Relaks',	3839.5000000000005,	'2024-09-17 23:00:00.000'),
('Zloty Kwiat',	3713.1000000000004,	'2024-09-17 23:00:00.000'),
('Biuro',	101.2, '2024-09-18 23:00:00.000'),
('Morska Bryza',	2838.4, '2024-09-18 23:00:00.000'),
('Relaks',	3939.4999999999995,	'2024-09-18 23:00:00.000'),
('Zloty Kwiat',	4013.1,	'2024-09-18 23:00:00.000');

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

INSERT INTO t_rezerwacje_lokacje (
    fk_nazwa_lokacji,
    fk_nazwa_typu_lokacji,
    czas,
    poczatek_rezerwacji,
    cena,
    imie,
    nazwisko,
    numer_telefonu
)
VALUES
('laznia_turecka_1', 'laznia_turecka', 2, '2024-09-16 10:00:00', 140.00, 'Jan', 'Kowalski', '123456789'),
('laznia_turecka_2', 'laznia_turecka', 1, '2024-09-16 15:30:00', 70.00, 'Anna', 'Nowak', '987654321'),
('laznia_turecka_3', 'laznia_turecka', 3, '2024-09-16 18:00:00', 210.00, 'Piotr', 'Wiśniewski', '555123789'),
('sauna_finska_1', 'sauna_finska', 1, '2024-09-16 09:00:00', 70.00, 'Ewa', 'Dąbrowska', '600100200'),
('sauna_finska_2', 'sauna_finska', 2, '2024-09-16 14:00:00', 140.00, 'Andrzej', 'Lewandowski', '700800900'),
('sauna_finska_3', 'sauna_finska', 3, '2024-09-16 11:00:00', 210.00, 'Karolina', 'Wójcik', '400500600'),
('sauna_finska_4', 'sauna_finska', 1, '2024-09-16 16:00:00', 70.00, 'Marek', 'Zieliński', '111222333'),
('sauna_finska_5', 'sauna_finska', 2, '2024-09-16 10:30:00', 140.00, 'Katarzyna', 'Szymańska', '444555666'),
('sauna_finska_6', 'sauna_finska', 3, '2024-09-16 19:00:00', 210.00, 'Tomasz', 'Woźniak', '777888999'),
('sauna_mokra_1', 'sauna_mokra', 1, '2024-09-16 12:00:00', 70.00, 'Magdalena', 'Kowalczyk', '999000111'),
('sauna_mokra_2', 'sauna_mokra', 2, '2024-09-16 09:30:00', 140.00, 'Adam', 'Baran', '222333444'),
('sauna_mokra_3', 'sauna_mokra', 3, '2024-09-16 17:30:00', 210.00, 'Natalia', 'Nowicka', '555666777'),
('sauna_mokra_4', 'sauna_mokra', 1, '2024-09-16 14:00:00', 70.00, 'Grzegorz', 'Wróbel', '888999000'),
('sauna_mokra_5', 'sauna_mokra', 2, '2024-09-16 11:00:00', 140.00, 'Patrycja', 'Pawlak', '333444555'),
('sauna_parowa_1', 'sauna_parowa', 3, '2024-09-16 20:00:00', 210.00, 'Damian', 'Michalski', '666777888'),
('sauna_parowa_2', 'sauna_parowa', 1, '2024-09-16 08:00:00', 70.00, 'Kinga', 'Grabowska', '000111222'),
('sauna_parowa_3', 'sauna_parowa', 2, '2024-09-16 15:00:00', 140.00, 'Szymon', 'Kaczmarek', '123987456'),
('sauna_parowa_4', 'sauna_parowa', 3, '2024-09-16 10:00:00', 210.00, 'Alicja', 'Rutkowska', '456123789'),
('sauna_parowa_5', 'sauna_parowa', 1, '2024-09-16 18:30:00', 70.00, 'Filip', 'Jankowski', '789456123'),
('sauna_podczerwona_1', 'sauna_podczerwona', 2, '2024-09-16 13:00:00', 140.00, 'Wiktoria', 'Mazur', '987123654'),
('jacuzzi_1', 'jacuzzi', 3, '2024-09-16 09:00:00', 120.00, 'Hubert', 'Borkowski', '654789321'),
('jacuzzi_2', 'jacuzzi', 1, '2024-09-16 17:00:00', 40.00, 'Julia', 'Sikora', '321987654'),
('jacuzzi_3', 'jacuzzi', 2, '2024-09-16 11:30:00', 80.00, 'Oskar', 'Adamczyk', '741852963'),
('jacuzzi_4', 'jacuzzi', 3, '2024-09-16 19:30:00', 120.00, 'Zuzanna', 'Czarnecka', '963258741'),
('jacuzzi_5', 'jacuzzi', 1, '2024-09-16 14:30:00', 40.00, 'Jakub', 'Dudek', '147258369'),
('teznia_solankowa_1', 'teznia_solankowa', 2, '2024-09-16 08:30:00', 60.00, 'Maja', 'Zając', '369852147'),
('teznia_solankowa_2', 'teznia_solankowa', 3, '2024-09-16 16:30:00', 90.00, 'Krystian', 'Pawłowski', '951753852'),
('teznia_solankowa_3', 'teznia_solankowa', 1, '2024-09-17 10:00:00', 30.00, 'Amelia', 'Krawczyk', '852963741'),
('teznia_solankowa_4', 'teznia_solankowa', 2, '2024-09-17 18:00:00', 60.00, 'Kacper', 'Stępień', '753159864'),
('kriokomora_1', 'kriokomora', 3, '2024-09-17 12:30:00', 300.00, 'Aleksandra', 'Jabłońska', '654258971'),
('kriokomora_2', 'kriokomora', 1, '2024-09-17 09:00:00', 100.00, 'Patryk', 'Malinowski', '555777111'),
('kriokomora_3', 'kriokomora', 2, '2024-09-17 17:00:00', 200.00, 'Emilia', 'Romanowska', '444888222'),
('laznia_turecka_1', 'laznia_turecka', 1, '2024-09-17 11:00:00', 70.00, 'Bożena', 'Lisowska', '741258963'),
('laznia_turecka_2', 'laznia_turecka', 1, '2024-09-17 16:00:00', 70.00, 'Dariusz', 'Kaczmarek', '963147852'),
('laznia_turecka_3', 'laznia_turecka', 1, '2024-09-17 09:30:00', 70.00, 'Renata', 'Rutkowski', '258963147'),
('sauna_finska_1', 'sauna_finska', 1, '2024-09-17 14:30:00', 70.00, 'Czesław', 'Jankowski', '589632147'),
('sauna_finska_2', 'sauna_finska', 1, '2024-09-17 19:00:00', 70.00, 'Elżbieta', 'Mazur', '814759632'),
('sauna_finska_3', 'sauna_finska', 1, '2024-09-17 12:00:00', 70.00, 'Henryk', 'Borkowski', '369528417'),
('sauna_finska_4', 'sauna_finska', 1, '2024-09-17 17:30:00', 70.00, 'Irena', 'Sikorska', '692851743'),
('sauna_finska_5', 'sauna_finska', 1, '2024-09-17 10:30:00', 70.00, 'Janusz', 'Adamczak', '925184673'),
('sauna_finska_6', 'sauna_finska', 1, '2024-09-17 15:30:00', 70.00, 'Grażyna', 'Czarnecki', '158479362'),
('sauna_mokra_1', 'sauna_mokra', 1, '2024-09-17 20:00:00', 70.00, 'Kazimierz', 'Dudek', '481753962'),
('sauna_mokra_2', 'sauna_mokra', 1, '2024-09-17 08:30:00', 70.00, 'Lidia', 'Zając', '714962853'),
('sauna_mokra_3', 'sauna_mokra', 1, '2024-09-17 13:30:00', 70.00, 'Mirosław', 'Pawłowska', '963258147'),
('sauna_mokra_4', 'sauna_mokra', 1, '2024-09-17 18:00:00', 70.00, 'Nina', 'Krawczyk', '258963471'),
('sauna_mokra_5', 'sauna_mokra', 1, '2024-09-17 11:30:00', 70.00, 'Olgierd', 'Stępień', '581479263'),
('sauna_parowa_1', 'sauna_mokra', 1, '2024-09-18 16:30:00', 70.00, 'Paulina', 'Jabłoński', '817459362'),
('sauna_parowa_2', 'sauna_mokra', 1, '2024-09-18 09:00:00', 70.00, 'Robert', 'Malinowska', '369852714'),
('sauna_parowa_3', 'sauna_mokra', 1, '2024-09-18 14:00:00', 70.00, 'Sylwia', 'Romanowski', '692581473'),
('sauna_parowa_4', 'sauna_mokra', 1, '2024-09-18 19:30:00', 70.00, 'Tadeusz', 'Górecka', '925817364'),
('sauna_parowa_5', 'sauna_mokra', 1, '2024-09-18 12:30:00', 70.00, 'Urszula', 'Rutkowski', '158749632'),
('sauna_podczerwona_1', 'sauna_podczerwona', 1, '2024-09-18 17:00:00', 70.00, 'Wacław', 'Michalak', '481963257'),
('jacuzzi_1', 'jacuzzi', 2, '2024-09-18 10:00:00', 80.00, 'Kornelia', 'Lis', '741852963'),
('jacuzzi_2', 'jacuzzi', 1, '2024-09-18 15:00:00', 40.00, 'Ludwik', 'Sadowski', '963741852'),
('jacuzzi_3', 'jacuzzi', 3, '2024-09-18 19:30:00', 120.00, 'Marianna', 'Kowal', '258963147'),
('jacuzzi_4', 'jacuzzi', 1, '2024-09-18 12:00:00', 40.00, 'Nikodem', 'Wiśniewska', '589632741'),
('jacuzzi_5', 'jacuzzi', 2, '2024-09-18 17:30:00', 80.00, 'Otylia', 'Duda', '814759632'),
('teznia_solankowa_1', 'teznia_solankowa', 3, '2024-09-18 10:30:00', 90.00, 'Patryk', 'Kamiński', '369528417'),
('teznia_solankowa_2', 'teznia_solankowa', 1, '2024-09-18 15:30:00', 30.00, 'Regina', 'Lewandowska', '692851743'),
('teznia_solankowa_3', 'teznia_solankowa', 2, '2024-09-18 20:00:00', 60.00, 'Seweryn', 'Zielińska', '925184673'),
('teznia_solankowa_4', 'teznia_solankowa', 1, '2024-09-18 08:30:00', 30.00, 'Teresa', 'Wojciechowska', '158479362'),
('kriokomora_1', 'kriokomora', 3, '2024-09-18 13:30:00', 300.00, 'Walenty', 'Nowakowski', '481753962'),
('kriokomora_2', 'kriokomora', 1, '2024-09-18 18:00:00', 100.00, 'Wiktoria', 'Piotrowska', '714962853'),
('kriokomora_3', 'kriokomora', 2, '2024-09-18 11:30:00', 200.00, 'Xawery', 'Kowalczyk', '963258147'),
('laznia_turecka_1', 'laznia_turecka', 1, '2024-09-18 16:30:00', 70.00, 'Ywona', 'Szymański', '258963471'),
('sauna_finska_1', 'sauna_finska', 3, '2024-09-18 09:00:00', 210.00, 'Zygmunt', 'Woźniak', '581479263'),
('sauna_mokra_1', 'sauna_mokra', 2, '2024-09-18 14:00:00', 140.00, 'Amelia', 'Dąbrowski', '817459362'),
('sauna_parowa_1', 'sauna_parowa', 1, '2024-09-18 19:30:00', 70.00, 'Bruno', 'Jankowska', '369852714'),
('sauna_podczerwona_1', 'sauna_podczerwona', 3, '2024-09-18 12:30:00', 210.00, 'Celina', 'Mazur', '692581473'),
('jacuzzi_1', 'jacuzzi', 2, '2024-09-18 17:00:00', 80.00, 'Daniel', 'Borkowski', '925817364'),
('teznia_solankowa_1', 'teznia_solankowa', 1, '2024-09-18 10:30:00', 30.00, 'Emilia', 'Sikorska', '158749632'),
('kriokomora_1', 'kriokomora', 3, '2024-09-18 15:30:00', 300.00, 'Fabian', 'Adamczak', '481963257'),
('laznia_turecka_2', 'laznia_turecka', 2, '2024-09-18 18:00:00', 140.00, 'Gertruda', 'Czarnecki', '714852963'),
('sauna_finska_2', 'sauna_finska', 1, '2024-09-18 11:30:00', 70.00, 'Hubert', 'Dudek', '963147852'),
('sauna_mokra_2', 'sauna_mokra', 3, '2024-09-18 16:30:00', 210.00, 'Izabela', 'Zając', '258796314'),
('sauna_parowa_2', 'sauna_parowa', 2, '2024-09-18 09:00:00', 140.00, 'Jerzy', 'Pawłowska', '589632147'),
('sauna_podczerwona_1', 'sauna_podczerwona', 1, '2024-09-18 14:00:00', 70.00, 'Krystyna', 'Krawczyk', '814759632'),
('jacuzzi_2', 'jacuzzi', 3, '2024-09-18 19:30:00', 120.00, 'Lech', 'Stępień', '369528417'),
('teznia_solankowa_2', 'teznia_solankowa', 2, '2024-09-18 12:30:00', 60.00, 'Magdalena', 'Jabłoński', '692851743'),
('kriokomora_2', 'kriokomora', 1, '2024-09-18 17:00:00', 100.00, 'Norbert', 'Malinowska', '925184673'),
('laznia_turecka_3', 'laznia_turecka', 3, '2024-09-18 10:30:00', 210.00, 'Oliwia', 'Romanowski', '158479362'),
('sauna_finska_3', 'sauna_finska', 2, '2024-09-18 15:30:00', 140.00, 'Piotr', 'Górecka', '481753962'),
('sauna_mokra_3', 'sauna_mokra', 1, '2024-09-18 20:00:00', 70.00, 'Renata', 'Rutkowski', '714962853'),
('sauna_parowa_3', 'sauna_parowa', 3, '2024-09-18 08:30:00', 210.00, 'Stanisław', 'Michalak', '963258147'),
('sauna_podczerwona_1', 'sauna_podczerwona', 2, '2024-09-18 13:30:00', 140.00, 'Teresa', 'Lis', '258963471'),
('jacuzzi_3', 'jacuzzi', 1, '2024-09-18 18:00:00', 40.00, 'Urszula', 'Sadowski', '581479263'),
('teznia_solankowa_3', 'teznia_solankowa', 3, '2024-09-18 11:30:00', 90.00, 'Wacław', 'Kowal', '817459362'),
('kriokomora_3', 'kriokomora', 2, '2024-09-18 16:30:00', 200.00, 'Wiktoria', 'Wiśniewska', '369852714'),
('laznia_turecka_1', 'laznia_turecka', 1, '2024-09-18 09:00:00', 70.00, 'Xawery', 'Duda', '692581473'),
('sauna_finska_1', 'sauna_finska', 3, '2024-09-18 14:00:00', 210.00, 'Ywona', 'Kamiński', '925817364'),
('sauna_mokra_1', 'sauna_mokra', 2, '2024-09-18 19:30:00', 140.00, 'Zygmunt', 'Lewandowska', '158749632'),
('sauna_parowa_1', 'sauna_parowa', 1, '2024-09-18 12:30:00', 70.00, 'Amelia', 'Zielińska', '481963257');

INSERT INTO t_rezerwacje_zabiegi (
  fk_nazwa_lokalu,
  fk_nazwa_zabiegu,
  czas,
  poczatek_rezerwacji,
  cena,
  imie,
  nazwisko,
  numer_telefonu,
  fk_pesel_pracownika
)
VALUES 
('Złoty Kwiat', 'masaz_klasyczny', 2, '2024-09-16 09:00:00', 500.00, 'Alicja', 'Kamińska', '123654789', '89071824680'),
('Złoty Kwiat', 'masaz_tkanek_glebokich', 2, '2024-09-16 11:30:00', 600.00, 'Katarzyna', 'Wiśniewska', '456321789', '88051942863'),
('Złoty Kwiat', 'masaz_ciazowy', 1, '2024-09-16 14:00:00', 500.00, 'Anna', 'Nowicka', '789456123', '61032879542'),
('Złoty Kwiat', 'masaz_sportowy', 2, '2024-09-16 15:30:00', 500.00, 'Ewelina', 'Zielińska', '963852741', '89071824680'),
('Złoty Kwiat', 'masaz_czekolada', 2, '2024-09-16 18:00:00', 700.00, 'Elżbieta', 'Mazur', '741852963', '88051942863'),
('Złoty Kwiat', 'masaz_klasyczny', 1, '2024-09-16 20:00:00', 500.00, 'Tomasz', 'Wiśniewski', '123789456', '89071824680'),
('Złoty Kwiat', 'masaz_relaksacyjny', 2, '2024-09-16 21:30:00', 500.00, 'Joanna', 'Kamińska', '789123654', '88051942863'),
('Złoty Kwiat', 'masaz_goracymi_kamieniami', 2, '2024-09-16 08:00:00', 600.00, 'Magdalena', 'Zielińska', '321654789', '61032879542'),
('Złoty Kwiat', 'masaz_tkanek_glebokich', 1, '2024-09-16 10:00:00', 600.00, 'Michał', 'Domański', '654789321', '88051942863'),
('Złoty Kwiat', 'masaz_shiatsu', 1, '2024-09-16 12:30:00', 600.00, 'Natalia', 'Kowalska', '456321789', '89071824680'),
('Złoty Kwiat', 'masaz_ciazowy', 2, '2024-09-16 13:30:00', 500.00, 'Anna', 'Kozłowska', '741852963', '61032879542'),
('Złoty Kwiat', 'masaz_shiatsu', 2, '2024-09-16 16:30:00', 600.00, 'Aleksandra', 'Kozłowska', '123987654', '89071824680'),
('Złoty Kwiat', 'refleksologia', 1, '2024-09-16 19:30:00', 300.00, 'Ewelina', 'Nowicka', '456123789', '88051942863'),
('Złoty Kwiat', 'masaz_ciazowy', 2, '2024-09-16 08:30:00', 500.00, 'Maria', 'Jasińska', '789654123', '61032879542'),
('Złoty Kwiat', 'masaz_klasyczny', 2, '2024-09-16 10:30:00', 500.00, 'Katarzyna', 'Nowak', '123456789', '89071824680'),
('Złoty Kwiat', 'masaz_tkanek_glebokich', 1, '2024-09-16 12:00:00', 600.00, 'Monika', 'Kowalska', '987654321', '88051942863'),
('Złoty Kwiat', 'masaz_ciazowy', 1, '2024-09-16 14:30:00', 500.00, 'Ewa', 'Zielinska', '345678912', '61032879542'),
('Złoty Kwiat', 'masaz_relaksacyjny', 1, '2024-09-16 17:30:00', 500.00, 'Alicja', 'Nowicka', '123987456', '89071824680'),
('Złoty Kwiat', 'masaz_tkanek_glebokich', 2, '2024-09-16 19:00:00', 600.00, 'Dorota', 'Kamińska', '987654123', '88051942863'),
('Złoty Kwiat', 'masaz_ciazowy', 2, '2024-09-16 21:00:00', 500.00, 'Zofia', 'Zielińska', '456789321', '61032879542'),
('Złoty Kwiat', 'masaz_tkanek_glebokich', 1, '2024-09-16 22:30:00', 600.00, 'Tomasz', 'Kamiński', '951753852', '89071824680'),
('Złoty Kwiat', 'masaz_goracymi_kamieniami', 2, '2024-09-16 09:00:00', 600.00, 'Janina', 'Zielińska', '753951852', '88051942863'),
('Złoty Kwiat', 'masaz_ciazowy', 2, '2024-09-16 11:30:00', 500.00, 'Barbara', 'Kozłowska', '951258753', '61032879542'),
('Złoty Kwiat', 'masaz_shiatsu', 1, '2024-09-16 14:00:00', 600.00, 'Anna', 'Kozłowska', '741852369', '89071824680'),
('Złoty Kwiat', 'masaz_czekolada', 2, '2024-09-16 15:30:00', 700.00, 'Katarzyna', 'Wiśniewska', '258963147', '61032879542'),
('Złoty Kwiat', 'masaz_tkanek_glebokich', 1, '2024-09-16 18:00:00', 600.00, 'Marta', 'Wiśniewska', '123654987', '89071824680'),
('Złoty Kwiat', 'masaz_relaksacyjny', 2, '2024-09-16 19:30:00', 500.00, 'Karolina', 'Kamińska', '654789123', '88051942863'),
('Złoty Kwiat', 'masaz_ciazowy', 2, '2024-09-16 22:00:00', 500.00, 'Ewa', 'Zielińska', '789321654', '61032879542'),
('Złoty Kwiat', 'masaz_shiatsu', 1, '2024-09-16 08:00:00', 600.00, 'Magdalena', 'Kozłowska', '741258963', '89071824680'),
('Złoty Kwiat', 'masaz_goracymi_kamieniami', 2, '2024-09-16 10:00:00', 600.00, 'Agnieszka', 'Nowicka', '963147852', '88051942863'),
('Złoty Kwiat', 'masaz_tkanek_glebokich', 1, '2024-09-16 12:30:00', 600.00, 'Michał', 'Wiśniewski', '951258753', '89071824680'),
('Złoty Kwiat', 'masaz_ciazowy', 2, '2024-09-16 14:30:00', 500.00, 'Aleksandra', 'Kamińska', '852741963', '61032879542'),
('Złoty Kwiat', 'mikrodermabrazja', 1, '2024-09-16 16:30:00', 500.00, 'Marcin', 'Bąk', '357159486', '95110386421'),
('Złoty Kwiat', 'masaz_shiatsu', 2, '2024-09-16 18:30:00', 600.00, 'Zofia', 'Kozłowska', '789456123', '88051942863'),
('Relaks', 'refleksologia', 1, '2024-09-16 09:00:00', 300.00, 'Wiktoria', 'Leśniewska', '147852369', '74121538691'),
('Relaks', 'manicure_hybrydowy', 2, '2024-09-16 10:30:00', 200.00, 'Sylwia', 'Kowalska', '357951486', '92071536489'),
('Relaks', 'pedicure_hybrydowy', 1, '2024-09-16 13:00:00', 200.00, 'Anna', 'Mazur', '852963741', '92071536489'),
('Relaks', 'masaz_tajski', 2, '2024-09-16 14:30:00', 600.00, 'Patrycja', 'Górska', '951357486', '74121538691'),
('Relaks', 'mikrodermabrazja', 1, '2024-09-16 16:30:00', 500.00, 'Maria', 'Bąk', '357159486', '92071536489'),
('Relaks', 'masaz_tajski', 2, '2024-09-16 18:00:00', 600.00, 'Wiktoria', 'Leśniewska', '159753486', '74121538691'),
('Relaks', 'radioferencja_mikroiglowa', 1, '2024-09-16 20:30:00', 500.00, 'Agnieszka', 'Kowalska', '951357852', '92071536489'),
('Relaks', 'refleksologia', 2, '2024-09-16 21:30:00', 300.00, 'Maria', 'Mazur', '753951486', '74121538691'),
('Relaks', 'mikrodermabrazja', 1, '2024-09-17 09:00:00', 500.00, 'Monika', 'Bąk', '357951258', '92071536489'),
('Relaks', 'manicure_hybrydowy', 2, '2024-09-17 10:30:00', 200.00, 'Patrycja', 'Górska', '456753951', '92071536489'),
('Relaks', 'radioferencja_mikroiglowa', 2, '2024-09-17 13:00:00', 500.00, 'Beata', 'Wiśniewska', '456789123', '92071536489'),
('Relaks', 'manicure_hybrydowy', 1, '2024-09-17 15:30:00', 200.00, 'Marta', 'Nowak', '321654987', '92071536489'),
('Relaks', 'masaz_tajski', 2, '2024-09-17 09:00:00', 600.00, 'Beata', 'Jasińska', '321987654', '74121538691'),
('Relaks', 'masaz_tajski', 2, '2024-09-17 11:30:00', 600.00, 'Karolina', 'Szymańska', '852741963', '74121538691'),
('Relaks', 'masaz_sportowy', 1, '2024-09-17 14:00:00', 500.00, 'Andrzej', 'Mazur', '963258741', '74121538691'),
('Relaks', 'masaz_czekolada', 2, '2024-09-17 15:30:00', 700.00, 'Elżbieta', 'Górska', '147852963', '87080295173'),
('Relaks', 'refleksologia', 1, '2024-09-17 18:00:00', 300.00, 'Mateusz', 'Bąk', '258963147', '87080295173'),
('Relaks', 'radioferencja_mikroiglowa', 2, '2024-09-17 19:30:00', 500.00, 'Beata', 'Nowicka', '741963852', '92071536489'),
('Relaks', 'masaz_shiatsu', 1, '2024-09-17 09:00:00', 600.00, 'Dominika', 'Mazur', '987654123', '87080295173'),
('Relaks', 'radioferencja_mikroiglowa', 2, '2024-09-17 11:30:00', 500.00, 'Magdalena', 'Wójcik', '852963741', '92071536489'),
('Relaks', 'mizoterapia_mikroiglowa', 2, '2024-09-17 13:00:00', 500.00, 'Krystyna', 'Kowalska', '963741852', '87080295173'),
('Relaks', 'oczyszczanie_wodorowe', 1, '2024-09-17 15:30:00', 500.00, 'Barbara', 'Sikora', '456789123', '87080295173'),
('Relaks', 'mizoterapia_mikroiglowa', 1, '2024-09-17 17:00:00', 500.00, 'Joanna', 'Wróbel', '963741852', '87080295173'),
('Relaks', 'masaz_tajski', 2, '2024-09-17 09:00:00', 600.00, 'Agnieszka', 'Wiśniewska', '321789654', '74121538691'),
('Relaks', 'mikrodermabrazja', 2, '2024-09-17 11:30:00', 500.00, 'Klaudia', 'Zielińska', '654123987', '92071536489'),
('Relaks', 'manicure_hybrydowy', 1, '2024-09-17 14:00:00', 200.00, 'Dominika', 'Mazur', '987321456', '92071536489'),
('Relaks', 'masaz_shiatsu', 1, '2024-09-17 15:30:00', 600.00, 'Paweł', 'Wiśniewski', '123987654', '74121538691'),
('Relaks', 'refleksologia', 1, '2024-09-17 17:00:00', 300.00, 'Dorota', 'Kowalska', '654951753', '87080295173'),
('Morska Bryza', 'manicure_hybrydowy', 2, '2024-09-17 09:00:00', 200.00, 'Halina', 'Zawadzka', '951357159', '69011942857'),
('Morska Bryza', 'oczyszczanie_wodorowe', 2, '2024-09-17 11:30:00', 500.00, 'Joanna', 'Zawadzka', '258951753', '69011942857'),
('Morska Bryza', 'fish_pedicure', 1, '2024-09-17 14:00:00', 200.00, 'Katarzyna', 'Kaczmarek', '753951486', '91072563984'),
('Morska Bryza', 'masaz_klasyczny', 2, '2024-09-17 15:30:00', 500.00, 'Tomasz', 'Kowalczyk', '159753486', '69011942857'),
('Morska Bryza', 'masaz_relaksacyjny', 2, '2024-09-17 18:00:00', 500.00, 'Elżbieta', 'Mazur', '951753852', '65051187296'),
('Morska Bryza', 'masaz_czekolada', 1, '2024-09-17 20:00:00', 700.00, 'Martyna', 'Nowicka', '357852963', '77020854139'),
('Morska Bryza', 'masaz_tajski', 2, '2024-09-17 09:00:00', 600.00, 'Klaudia', 'Szymańska', '456951357', '65051187296'),
('Morska Bryza', 'oczyszczanie_wodorowe', 2, '2024-09-18 09:00:00', 500.00, 'Joanna', 'Zawadzka', '789456123', '67091452831'),
('Morska Bryza', 'pedicure_hybrydowy', 1, '2024-09-18 11:00:00', 200.00, 'Sylwia', 'Kaczmarek', '963852741', '69011942857'),
('Morska Bryza', 'fish_pedicure', 2, '2024-09-18 12:30:00', 200.00, 'Martyna', 'Kowalczyk', '741258963', '77020854139'),
('Morska Bryza', 'masaz_relaksacyjny', 1, '2024-09-18 15:00:00', 500.00, 'Julia', 'Mazur', '123654789', '65051187296'),
('Morska Bryza', 'masaz_klasyczny', 2, '2024-09-18 16:00:00', 500.00, 'Eliza', 'Nowicka', '456789123', '69011942857'),
('Morska Bryza', 'mikrodermabrazja', 1, '2024-09-18 18:30:00', 500.00, 'Tomasz', 'Gajewski', '147369258', '67091452831'),
('Morska Bryza', 'manicure_hybrydowy', 1, '2024-09-18 19:30:00', 200.00, 'Sylwia', 'Zielińska', '852963147', '69011942857'),
('Morska Bryza', 'pedicure_hybrydowy', 2, '2024-09-18 08:00:00', 200.00, 'Paulina', 'Kaczmarek', '159753846', '69011942857'),
('Morska Bryza', 'fish_pedicure', 1, '2024-09-18 10:00:00', 200.00, 'Krystyna', 'Kowalczyk', '951753842', '77020854139'),
('Morska Bryza', 'masaz_goracymi_kamieniami', 2, '2024-09-18 14:00:00', 600.00, 'Karolina', 'Kaczmarek', '321654987', '69011942857'),
('Morska Bryza', 'mikrodermabrazja', 1, '2024-09-18 17:00:00', 500.00, 'Natalia', 'Kruk', '852741963', '67091452831'),
('Morska Bryza', 'refleksologia', 1, '2024-09-18 20:00:00', 300.00, 'Halina', 'Jankowska', '741963852', '65051187296'),
('Morska Bryza', 'manicure_hybrydowy', 1, '2024-09-18 21:00:00', 200.00, 'Izabela', 'Zawadzka', '963258741', '69011942857'),
('Morska Bryza', 'fish_pedicure', 2, '2024-09-18 09:00:00', 200.00, 'Julia', 'Nowak', '789123654', '77020854139'),
('Morska Bryza', 'oczyszczanie_wodorowe', 2, '2024-09-18 11:30:00', 500.00, 'Magdalena', 'Sikorska', '789456123', '67091452831'),
('Morska Bryza', 'masaz_relaksacyjny', 1, '2024-09-18 14:00:00', 500.00, 'Eliza', 'Kowalczyk', '963741852', '65051187296'),
('Morska Bryza', 'pedicure_hybrydowy', 1, '2024-09-18 15:30:00', 200.00, 'Izabela', 'Wróbel', '741852963', '69011942857'),
('Morska Bryza', 'masaz_goracymi_kamieniami', 2, '2024-09-18 08:00:00', 600.00, 'Karolina', 'Zawadzka', '852963741', '69011942857'),
('Morska Bryza', 'oczyszczanie_wodorowe', 2, '2024-09-18 10:30:00', 500.00, 'Julia', 'Kaczmarek', '852369741', '67091452831'),
('Morska Bryza', 'masaz_relaksacyjny', 1, '2024-09-18 13:00:00', 500.00, 'Natalia', 'Mazur', '741852963', '65051187296');
