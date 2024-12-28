CREATE TABLE [dbo].[t_uslugi]
(
  [id] INT NOT NULL PRIMARY KEY,
  [nazwa] VARCHAR(64) UNIQUE NOT NULL,
  [cena] FLOAT NOT NULL DEFAULT 0.0,
  [fk_id_typu_uslugi] INT NOT NULL FOREIGN KEY (fk_id_typu_uslugi) 
    REFERENCES typy_uslug(id) 
      ON DELETE CASCADE 
      ON UPDATE CASCADE,
  [opis] VARCHAR(256),
  [maksymalna_ilosc_osob] INT NOT NULL DEFAULT 1
)
