CREATE TABLE [dbo].[t_dzienne_koszty_eksploatacyjne_inne]
(
  [id] INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
  [fk_nazwa_lokalu] VARCHAR(64) FOREIGN KEY(fk_nazwa_lokalu)
    REFERENCES t_lokale(nazwa)
      ON DELETE NO ACTION
      ON UPDATE CASCADE,
  [koszt] MONEY NOT NULL DEFAULT 0
)
