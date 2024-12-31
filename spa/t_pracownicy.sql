USE spa;
CREATE TABLE [dbo].[t_pracownicy]
(
  [id] INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
  [imie] VARCHAR(64) NOT NULL,
  [nazwisko] VARCHAR(128) NOT NULL,
  [pesel] VARCHAR(11) UNIQUE NOT NULL,
  [fk_nazwa_zawodu] VARCHAR(64) NOT NULL FOREIGN KEY(fk_nazwa_zawodu) 
    REFERENCES t_zawody(nazwa)
      ON DELETE CASCADE
      ON UPDATE CASCADE,
  [wynagrodzenie_brutto] FLOAT NOT NULL DEFAULT 0.0,
  [fk_nazwa_formy_zatrudnienia] VARCHAR(64) NOT NULL FOREIGN KEY(fk_nazwa_formy_zatrudnienia)
    REFERENCES t_formy_zatrudnienia(nazwa)
      ON DELETE CASCADE
      ON UPDATE CASCADE,
  [poczatek_umowy] DATE NOT NULL,
  [koniec_umowy] DATE NOT NULL,
  [fk_id_przelozonego] INT NOT NULL FOREIGN KEY(fk_id_przelozonego)
    REFERENCES t_pracownicy(id)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  [fk_id_lokalu] INT NOT NULL FOREIGN KEY(fk_id_lokalu)
    REFERENCES t_lokale(id)
      ON DELETE CASCADE
      ON UPDATE CASCADE
)