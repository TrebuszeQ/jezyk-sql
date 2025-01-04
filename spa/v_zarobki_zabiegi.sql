USE spa;
GO 

CREATE VIEW [dbo].[v_zarobki_zabiegi] AS
  SELECT a.fk_nazwa_zabiegu AS 'nazwa_zabiegu',
          SUM(a.cena) AS 'przychody',
          COUNT(a.id) AS 'ilosc_rezerwacji',
          SUM(a.czas) AS 'czas',
          SUM(b.wynagrodzenie_brutto) AS 'suma_wynagrodzen',
          COUNT(b.id) AS 'ilosc_pracownikow'
  FROM t_rezerwacje_zabiegi a
      LEFT JOIN t_pracownicy b
          ON a.fk_pesel_pracownika = b.pesel
  WHERE MONTH(a.poczatek_rezerwacji) = '9' 
      AND YEAR(a.poczatek_rezerwacji) = '2024'
  GROUP BY fk_nazwa_zabiegu;