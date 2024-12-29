CREATE TABLE [dbo].[t_zawody]
(
  [id] INT NOT NULL PRIMARY KEY,
  [nazwa] VARCHAR(64) UNIQUE NOT NULL, 
  [opis] varchar(128)
)
