CREATE TABLE [dbo].[t_pracownicy]
(
  [id] INT NOT NULL PRIMARY KEY,
  [imie] VARCHAR(64) NOT NULL,
  [nazwisko] VARCHAR(128) NOT NULL,
  [pesel] VARCHAR(11) UNIQUE NOT NULL,
  [fk_nazwa_zawodu] INT NOT NULL FOREIGN KEY(fk_id_stanowiska) 
    REFERENCES t_zawody(nazwa)
      ON DELETE CASCADE
      ON UPDATE CASCADE,
  [wynagrodzenie_brutto] FLOAT NOT NULL DEFAULT 0.0,
  [fk_nazwa_formy_zatrudnienia] INT NOT NULL FOREIGN KEY(fk_id_formy_zatrudnienia)
    REFERENCES t_formy_zatrudnienia(nazwa)
      ON DELETE CASCADE
      ON UPDATE CASCADE,
  [poczatek_umowy] DATE NOT NULL,
  [koniec_umowy] DATE NOT NULL,
  [fk_id_przelozonego] INT NOT NULL FOREIGN KEY(fk_id_przelozonego)
    REFERENCES t_pracownicy(id)
      ON DELETE CASCADE
      ON UPDATE CASCADE,
  [fk_id_miejsca_pracy] INT NOT NULL FOREIGN KEY(fk_id_miejsca_pracy)
    REFERENCES t_miejsca_pracy(id)
      ON DELETE CASCADE
      ON UPDATE CASCADE
)