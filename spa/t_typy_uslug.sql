CREATE TABLE [dbo].[t_typy_uslug]
(
  [id] INT NOT NULL PRIMARY KEY,
  [nazwa] VARCHAR(64) UNIQUE NOT NULL
)
