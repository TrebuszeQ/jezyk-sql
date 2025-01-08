USE spa;
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
