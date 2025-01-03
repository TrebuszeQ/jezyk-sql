USE spa;

-- UPDATE t_lokale
-- SET nazwa='Złoty Kwiat'
-- WHERE nazwa LIKE 'Zloty Kwiat';

WITH przychody_zabiegi AS (
    SELECT fk_nazwa_zabiegu AS 'nazwa_zabiegu',
        SUM(cena) AS 'przychody',
        COUNT(id) AS 'ilosc_rezerwacji',
        SUM(czas) AS 'czas'
    FROM t_rezerwacje_zabiegi
    GROUP BY fk_nazwa_zabiegu
),
przychody_lokacje AS (
    SELECT a.nazwa,
    SUM(c.cena) as 'przychody',
    COUNT(c.id) as 'ilosc_rezerwacji'
    FROM t_typy_lokacji a
        FULL OUTER JOIN t_lokacje b
            ON a.id=b.fk_id_typy_lokacji
        FULL OUTER JOIN t_rezerwacje_lokacje c
            ON b.nazwa=c.fk_nazwa_lokacji
    GROUP BY a.nazwa
),
wynagrodzenia AS (
    SELECT fk_nazwa_zawodu AS 'zawod', 
        SUM(wynagrodzenie_brutto) AS 'suma_zarobkow'
    FROM t_pracownicy
    GROUP BY fk_nazwa_zawodu
),
przychody AS (
    SELECT a.nazwa_zabiegu,
        a.przychody,
        a.ilosc_rezerwacji,
        a.czas
    FROM przychody_zabiegi a
)

-- SELECT a.nazwa_zabiegu,
--     a.przychody,
--     a.ilosc_rezerwacji,
--     a.czas
-- FROM przychody_zabiegi a
-- ORDER BY przychody DESC

-- SELECT a.nazwa,
--     a.przychody,
--     a.ilosc_rezerwacji
-- FROM przychody_lokacje a
-- ORDER BY przychody DESC

-- SELECT zawod,
--     suma_zarobkow
-- FROM wynagrodzenia
-- ORDER BY suma_zarobkow DESC;


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
GROUP BY fk_nazwa_zabiegu
