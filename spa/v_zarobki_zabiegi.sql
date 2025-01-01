USE spa;
GO 

CREATE VIEW [dbo].[v_zarobki_zabiegi]
  AS SELECT SUM(cena) AS 'suma'
  FROM t_rezerwacje_zabiegi;
