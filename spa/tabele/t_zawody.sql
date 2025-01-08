USE spa;
CREATE TABLE [dbo].[t_zawody]
(
  [id] INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
  [nazwa] VARCHAR(64) UNIQUE NOT NULL, 
  [opis] varchar(128)
)
