USE spa;
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
