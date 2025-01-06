USE spa;
GO 

CREATE VIEW [dbo].[v_wynagrodzenia_lokal] AS
    SELECT  a.nazwa,
        SUM(b.wynagrodzenie_brutto) AS 'wynagrodzenia'
    FROM t_lokale a
    LEFT JOIN t_pracownicy b
        ON a.id = b.fk_id_lokalu
    GROUP BY a.nazwa;

GO

CREATE VIEW [dbo].[v_zarobki_lokacje] AS
    SELECT b.fk_nazwa_typu_lokacji AS 'nazwa_lokacji',
        SUM(a.cena) AS 'przychody',
        COUNT(a.id) AS 'ilosc_rezerwacji',
        SUM(b.wskazanie) * 24,7 AS 'zuzycie_pradu',
        SUM(C.wskazanie) * 11.98 AS 'zuzycie_wody'
    FROM t_rezerwacje_lokacje a
        LEFT JOIN t_dzienne_zuzycie_pradu_lokacja b
            ON a.fk_nazwa_lokacji = b.fk_nazwa_lokacji
        LEFT JOIN t_dzienne_zuzycie_wody_lokacja c
            ON a.fk_nazwa_lokacji = c.fk_nazwa_lokacji
    WHERE MONTH(a.poczatek_rezerwacji) = '9' 
        AND YEAR(a.poczatek_rezerwacji) = '2024'
    GROUP BY b.fk_nazwa_typu_lokacji;

GO

CREATE VIEW [dbo].[v_zarobki_typy_lokacji] AS
    SELECT a.fk_nazwa_lokacji AS 'nazwa_lokacji',
        SUM(a.cena) AS 'przychody',
        COUNT(a.id) AS 'ilosc_rezerwacji',
        SUM(b.wskazanie) * 24,7 AS 'zuzycie_pradu',
        SUM(C.wskazanie) * 11.98 AS 'zuzycie_wody'
    FROM t_rezerwacje_lokacje a
        LEFT JOIN t_dzienne_zuzycie_pradu_lokacja b
            ON a.fk_nazwa_lokacji = b.fk_nazwa_lokacji
        LEFT JOIN t_dzienne_zuzycie_wody_lokacja c
            ON a.fk_nazwa_lokacji = c.fk_nazwa_lokacji
    WHERE MONTH(a.poczatek_rezerwacji) = '9' 
        AND YEAR(a.poczatek_rezerwacji) = '2024'
    GROUP BY a.fk_nazwa_lokacji

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

GO