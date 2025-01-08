USE spa;
CREATE TABLE [dbo].[t_typy_zabiegow]
(
  [id] INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
  [nazwa] VARCHAR(64) UNIQUE NOT NULL
)
