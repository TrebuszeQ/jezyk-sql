CREATE TABLE [dbo].[t_miejsca_pracy]
(
  [id] INT NOT NULL PRIMARY KEY,
  [miasto] VARCHAR(128) NOT NULL,
  [ulica] VARCHAR(128) NOT NULL,
  [numer_domu] VARCHAR(8) NOT NULL,
  [kod_pocztowy] VARCHAR(5) NOT NULL,
  [nazwa] VARCHAR(128) UNIQUE NOT NULL
)
