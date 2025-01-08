USE spa;
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
