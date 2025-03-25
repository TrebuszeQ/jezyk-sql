USE spa;
CREATE TABLE [dbo].[t_lokale]
(
  [id] INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
  [nazwa] VARCHAR(128) UNIQUE NOT NULL,
  [miasto] VARCHAR(128) NOT NULL,
  [ulica] VARCHAR(128) NOT NULL,
  [numer_domu] VARCHAR(8) NOT NULL,
  [kod_pocztowy] VARCHAR(5) NOT NULL
)
