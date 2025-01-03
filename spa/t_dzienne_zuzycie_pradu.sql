USE spa;
CREATE TABLE [dbo].[t_dzienne_zuzycie_pradu]
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
