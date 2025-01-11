CREATE DATABASE spa;

USE spa;
GO

CREATE TABLE [dbo].[t_formy_zatrudnienia ]
(
  [id] INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
  [nazwa] VARCHAR(64) UNIQUE NOT NULL
)

CREATE TABLE [dbo].[t_lokale]
(
  [id] INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
  [nazwa] VARCHAR(128) UNIQUE NOT NULL,
  [miasto] VARCHAR(128) NOT NULL,
  [ulica] VARCHAR(128) NOT NULL,
  [numer_domu] VARCHAR(8) NOT NULL,
  [kod_pocztowy] VARCHAR(5) NOT NULL
)

CREATE TABLE [dbo].[t_typy_lokacji]
(
  [id] INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
  [nazwa] VARCHAR(64) UNIQUE NOT NULL
)

CREATE TABLE [dbo].[t_typy_zabiegow]
(
  [id] INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
  [nazwa] VARCHAR(64) UNIQUE NOT NULL
)

CREATE TABLE [dbo].[t_zawody]
(
  [id] INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
  [nazwa] VARCHAR(64) UNIQUE NOT NULL, 
  [opis] varchar(128)
)

CREATE TABLE [dbo].[t_zabiegi]
(
  [id] INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
  [nazwa] VARCHAR(64) UNIQUE NOT NULL,
  [cena] MONEY NOT NULL DEFAULT 0,
  [fk_id_typu] INT NOT NULL FOREIGN KEY(fk_id_typu) 
    REFERENCES t_typy_zabiegow(id)
      ON DELETE CASCADE
      ON UPDATE CASCADE
)

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
)

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
)

CREATE TABLE [dbo].[t_dzienne_zuzycie_pradu_lokal]
(
  [id] INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
  [fk_nazwa_lokalu] VARCHAR(128) FOREIGN KEY(fk_nazwa_lokalu)
    REFERENCES t_lokale(nazwa)
      ON DELETE NO ACTION
      ON UPDATE CASCADE,
  [wskazanie] FLOAT NOT NULL,
  [data_czas] DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
)

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
)

CREATE TABLE [dbo].[t_dzienne_zuzycie_wody_lokal]
(
  [id] INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
  [fk_nazwa_lokalu] VARCHAR(128) FOREIGN KEY(fk_nazwa_lokalu)
    REFERENCES t_lokale(nazwa)
      ON DELETE NO ACTION
      ON UPDATE CASCADE,
  [wskazanie] FLOAT NOT NULL,
  [data_czas] DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
)

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
)

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
)


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
)

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
)