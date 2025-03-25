USE spa;
CREATE TABLE [dbo].[t_zabiegi]
(
  [id] INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
  [nazwa] VARCHAR(64) UNIQUE NOT NULL,
  [cena] MONEY NOT NULL DEFAULT 0,
  [fk_id_typu] INT NOT NULL FOREIGN KEY(fk_id_typu) 
    REFERENCES t_typy_zabiegow(id)
      ON DELETE CASCADE
      ON UPDATE CASCADE
)
