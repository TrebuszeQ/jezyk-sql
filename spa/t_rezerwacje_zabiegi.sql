USE spa;
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
