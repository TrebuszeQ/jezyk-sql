USE spa;
CREATE TABLE [dbo].[t_rezerwacje_lokacje]
(
  [id] INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
  [fk_nazwa_lokacji] VARCHAR(64) FOREIGN KEY(fk_nazwa_lokacji)
    REFERENCES t_lokacje(nazwa)
      ON DELETE CASCADE
      ON UPDATE CASCADE,
  [fk_nazwa_typu_lokacji] VARCHAR(64) NOT NULL FOREIGN KEY(fk_nazwa_typu_lokacji)
    REFERENCES t_typy_lokacji(nazwa)
      ON DELETE CASCADE
      ON UPDATE CASCADE,
  [czas] INT NOT NULL DEFAULT 0,
  [poczatek_rezerwacji] DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  [cena] MONEY NOT NULL DEFAULT 0,
  [imie] VARCHAR(64) NOT NULL,
  [nazwisko] VARCHAR(64) NOT NULL,
  [numer_telefonu] VARCHAR(9) NOT NULL
)