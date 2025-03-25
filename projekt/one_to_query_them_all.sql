--- q_klienci
USE SPA;
GO

WITH rezerwacje AS (
    SELECT imie,
        nazwisko,
        numer_telefonu,
        czas * cena AS 'przychody',
        'lokacje' AS 'zrodlo'
    FROM t_rezerwacje_lokacje

    UNION ALL 

    SELECT imie,
        nazwisko,
        numer_telefonu,
        cena AS 'przychody',
        'zabiegi' AS 'zrodlo'
    FROM t_rezerwacje_zabiegi
)

SELECT imie,
    nazwisko,
    numer_telefonu,
    zrodlo,
    SUM(przychody) AS 'przychody',
    COUNT(zrodlo) AS 'wizyty'
FROM rezerwacje
GROUP BY imie, nazwisko, numer_telefonu, zrodlo;

--- q_koszty_lokacje_lokal
USE spa;
GO 

DECLARE @Data DATE = '2024-09-16';

WITH wskazania_lokal AS (
    SELECT a.fk_nazwa_lokalu AS 'nazwa_lokalu',
        CONVERT(date, a.data_czas) AS 'data',
        a.wskazanie AS 'wskazanie_pradu_lokal',
        b.wskazanie AS 'wskazanie_wody_lokal',
        a.wskazanie * 0.6930 AS 'koszty_pradu_lokal',
        b.wskazanie * 6.00 AS 'koszty_wody_lokal'
    FROM t_dzienne_zuzycie_pradu_lokal a
        FULL OUTER JOIN t_dzienne_zuzycie_wody_lokal b
            ON a.fk_nazwa_lokalu = b.fk_nazwa_lokalu
            AND CONVERT(date, a.data_czas) = CONVERT(date, b.data_czas)
    WHERE YEAR(a.data_czas) = YEAR(@Data)
        AND MONTH(a.data_czas) = MONTH(@Data)
),

agg_wskazania_lokal AS (
    SELECT nazwa_lokalu,
        data,
        SUM(wskazanie_pradu_lokal) AS 'wskazanie_pradu_lokal',
        SUM(wskazanie_wody_lokal) AS 'wskazanie_wody_lokal',
        SUM(koszty_pradu_lokal) AS 'koszty_pradu_lokal',
        SUM(koszty_wody_lokal) AS 'koszty_wody_lokal'
    FROM wskazania_lokal b
    GROUP BY nazwa_lokalu, data
),

agg_koszty_eksploatacyjne AS (
    SELECT fk_nazwa_lokalu AS 'nazwa_lokalu',
        CONVERT(date, data_czas) AS 'data',
        SUM(koszt) AS 'koszty'
    FROM t_dzienne_koszty_eksploatacyjne_inne
    WHERE YEAR(data_czas) = YEAR(@Data)
        AND MONTH(data_czas) = MONTH(@Data)
    GROUP BY fk_nazwa_lokalu, CONVERT(date, data_czas)
),

agg_koszty_lokal AS (
    SELECT c.fk_nazwa_lokalu AS 'nazwa_lokalu',
        CONVERT(date, a.data_czas) AS 'data',
        SUM(a.wskazanie) AS 'wskazanie_pradu',
        SUM(b.wskazanie) AS 'wskazanie_wody',
        SUM(a.wskazanie) * 0.6930 AS 'koszty_pradu',
        SUM(b.wskazanie) * 6.00 AS 'koszty_wody'
    FROM t_dzienne_zuzycie_pradu_lokacja a
        FULL OUTER JOIN t_dzienne_zuzycie_wody_lokacja b
            ON a.fk_nazwa_lokacji = b.fk_nazwa_lokacji
            AND CONVERT(date, a.data_czas) = CONVERT(date, B.data_czas)
        RIGHT JOIN t_lokacje c
                ON a.fk_nazwa_lokacji = c.nazwa
    WHERE YEAR(a.data_czas) = YEAR(@Data)
        AND MONTH(a.data_czas) = MONTH(@Data)
    GROUP BY c.fk_nazwa_lokalu, CONVERT(date, a.data_czas)
),

koszty_lokal_lokacje AS (
    SELECT a.nazwa_lokalu,
        a.data,
        a.koszty_pradu 'koszty_pradu_lokacje',
        a.koszty_wody AS 'koszty_wody_lokacje',
        b.koszty_pradu_lokal,
        b.koszty_wody_lokal,
        (b.koszty_pradu_lokal - a.koszty_pradu) AS 'roznica_prad',
        (b.koszty_wody_lokal - a.koszty_wody) AS 'roznica_woda'
    FROM agg_koszty_lokal a
        LEFT JOIN agg_wskazania_lokal b
            ON a.nazwa_lokalu = b.nazwa_lokalu
            AND a.data = b.data
)

SELECT * 
FROM koszty_lokal_lokacje
ORDER BY data;

--- q_koszty_lokal
USE spa;
GO 

DECLARE @Data DATE = '2024-09-16';

WITH wskazania_lokal AS (
    SELECT a.fk_nazwa_lokalu AS 'nazwa_lokalu',
        CONVERT(date, a.data_czas) AS 'data',
        a.wskazanie AS 'wskazanie_pradu_lokal',
        b.wskazanie AS 'wskazanie_wody_lokal',
        a.wskazanie * 0.6930 AS 'koszty_pradu_lokal',
        b.wskazanie * 6.00 AS 'koszty_wody_lokal'
    FROM t_dzienne_zuzycie_pradu_lokal a
    LEFT JOIN t_dzienne_zuzycie_wody_lokal b
        ON a.fk_nazwa_lokalu = b.fk_nazwa_lokalu
        AND CONVERT(date, a.data_czas) = CONVERT(date, b.data_czas)
    WHERE YEAR(a.data_czas) = YEAR(@Data)
        AND MONTH(a.data_czas) = MONTH(@Data)
),

agg_wskazania_lokal AS (
    SELECT nazwa_lokalu,
        data,
        SUM(wskazanie_pradu_lokal) AS 'wskazanie_pradu_lokal',
        SUM(wskazanie_wody_lokal) AS 'wskazanie_wody_lokal',
        SUM(koszty_pradu_lokal) AS 'koszty_pradu_lokal',
        SUM(koszty_wody_lokal) AS 'koszty_wody_lokal'
    FROM wskazania_lokal b
    GROUP BY nazwa_lokalu, data
),

agg_koszty_eksploatacyjne AS (
    SELECT fk_nazwa_lokalu AS 'nazwa_lokalu',
        CONVERT(date, data_czas) AS 'data',
        SUM(koszt) AS 'koszty'
    FROM t_dzienne_koszty_eksploatacyjne_inne
    WHERE YEAR(data_czas) = YEAR(@Data)
        AND MONTH(data_czas) = MONTH(@Data)
    GROUP BY fk_nazwa_lokalu, CONVERT(date, data_czas)
)

SELECT a.nazwa_lokalu,
    a.data,
    b.wskazanie_pradu_lokal,
    b.wskazanie_wody_lokal,
    b.koszty_pradu_lokal,
    b.koszty_wody_lokal
FROM agg_koszty_eksploatacyjne a
    FULL OUTER JOIN agg_wskazania_lokal b
        ON a.nazwa_lokalu = b.nazwa_lokalu
        AND a.data = b.data
ORDER BY a.data ASC;

--- q_przychody_lokacje
USE spa;
GO 

DECLARE @Data DATE = '2024-09-16';

WITH cte AS (
    SELECT a.fk_nazwa_lokacji AS 'nazwa_lokacji',
    b.fk_nazwa_lokalu AS 'nazwa_lokalu',
    CONVERT(date, a.poczatek_rezerwacji) AS 'data',
    czas,
    (a.cena * a.czas) AS 'przychody'
    FROM t_rezerwacje_lokacje a
        LEFT JOIN t_lokacje b
            ON a.fk_nazwa_lokacji = b.nazwa
    WHERE MONTH(a.poczatek_rezerwacji) = MONTH(@Data) 
    AND YEAR(a.poczatek_rezerwacji) = YEAR(@Data)
)

SELECT a.nazwa_lokacji,
    a.nazwa_lokalu,
    SUM(a.przychody) AS 'przychody',
    SUM(a.czas) AS 'czas',
    COUNT(a.nazwa_lokacji) as 'ilosc_rezerwacji'
FROM cte a
GROUP BY a.nazwa_lokacji, a.nazwa_lokalu
ORDER BY przychody DESC;

--- q_przychody_rezerwacje
USE spa;
GO 

DECLARE @Data DATE = '2024-09-16';

WITH rezerwacje_lokacje AS (
    SELECT a.fk_nazwa_lokacji AS 'nazwa_lokacji',
        b.fk_nazwa_lokalu AS 'nazwa_lokalu',
        CONVERT(date, a.poczatek_rezerwacji) AS 'data',
        (a.cena * a.czas) AS 'przychody'
    FROM t_rezerwacje_lokacje a
        LEFT JOIN t_lokacje b
            ON a.fk_nazwa_lokacji = b.nazwa
),

agg_rezerwacje_lokacje AS (
    SELECT nazwa_lokalu,
        data,
        SUM(przychody) AS 'przychody'
    FROM rezerwacje_lokacje
    GROUP BY nazwa_lokalu, data
),

wskazania_lokal AS (
    SELECT a.fk_nazwa_lokalu AS 'nazwa_lokalu',
        a.data_czas AS 'data',
        a.wskazanie AS 'wskazanie_pradu_lokal',
        b.wskazanie AS 'wskazanie_wody_lokal',
        a.wskazanie * 0.6930 AS 'koszty_pradu_lokal',
        b.wskazanie * 6.00 AS 'koszty_wody_lokal'
    FROM t_dzienne_zuzycie_pradu_lokal a
    LEFT JOIN t_dzienne_zuzycie_wody_lokal b
        ON a.fk_nazwa_lokalu = b.fk_nazwa_lokalu
),

agg_wskazania_lokal AS (
    SELECT nazwa_lokalu,
        data,
        SUM(wskazanie_pradu_lokal) AS 'wskazanie_pradu_lokal',
        SUM(wskazanie_wody_lokal) AS 'wskazanie_wody_lokal',
        SUM(koszty_pradu_lokal) AS 'koszty_pradu_lokal',
        SUM(koszty_wody_lokal) AS 'koszty_wody_lokal'
    FROM wskazania_lokal b
    GROUP BY nazwa_lokalu, data
),

rezerwacje_zabiegi AS (
    SELECT fk_nazwa_lokalu AS 'nazwa_lokalu',
        CONVERT(date, poczatek_rezerwacji) AS 'data',
        cena AS 'przychody'
    FROM t_rezerwacje_zabiegi
),

agg_rezerwacje_zabiegi AS (
    SELECT nazwa_lokalu,
        data,
        SUM(przychody) AS 'przychody'
    FROM rezerwacje_zabiegi
    GROUP BY nazwa_lokalu, data
),

rezerwacje AS (
    SELECT nazwa_lokalu,
        data,
        przychody,
        'lokacje' AS 'zrodlo'
    FROM agg_rezerwacje_lokacje

    UNION ALL 

    SELECT nazwa_lokalu,
        data,
        przychody,
        'zabiegi' AS 'zrodlo' 
    FROM agg_rezerwacje_zabiegi
)

SELECT nazwa_lokalu,
    data,
    SUM(przychody) AS 'przychody',
    zrodlo
FROM rezerwacje
GROUP BY nazwa_lokalu, data, zrodlo
ORDER BY data;

--- q_przychody_typy_lokacji
USE spa;
GO 

DECLARE @Data DATE = '2024-09-16';

WITH cte AS (
    SELECT a.fk_nazwa_typu_lokacji AS 'typ_lokacji',
    b.fk_nazwa_lokalu AS 'nazwa_lokalu',
    CONVERT(date, a.poczatek_rezerwacji) AS 'data',
    a.cena
    FROM t_rezerwacje_lokacje a
        LEFT JOIN t_lokacje b
            ON a.fk_nazwa_lokacji = b.nazwa
)

SELECT a.typ_lokacji,
    a.nazwa_lokalu,
    SUM(a.cena) as 'przychody',
    COUNT(a.typ_lokacji) as 'ilosc_rezerwacji'
FROM cte a
WHERE MONTH(a.data) = MONTH(@Data) 
    AND YEAR(a.data) = YEAR(@Data)
GROUP BY a.typ_lokacji, a.nazwa_lokalu
ORDER BY przychody DESC;

--- q_przychody_zabiegi
USE spa;
GO 

DECLARE @Data DATE = '2024-09-16';

SELECT a.fk_nazwa_zabiegu AS 'nazwa_zabiegu',
        a.fk_nazwa_lokalu AS 'nazwa_lokalu',
        SUM(a.cena) AS 'przychody',
        COUNT(a.id) AS 'ilosc_rezerwacji',
        SUM(a.czas) AS 'czas',
        COUNT(b.id) AS 'ilosc_pracownikow'
FROM t_rezerwacje_zabiegi a
    LEFT JOIN t_pracownicy b
        ON a.fk_pesel_pracownika = b.pesel
WHERE MONTH(a.poczatek_rezerwacji) = MONTH(@Data) 
    AND YEAR(a.poczatek_rezerwacji) = YEAR(@Data) 
GROUP BY a.fk_nazwa_zabiegu, a.fk_nazwa_lokalu
ORDER BY przychody DESC

--- q_rozliczenie_lokacje
USE spa;
GO 

DECLARE @Data DATE = '2024-09-16';

WITH lokacje AS (
    SELECT a.fk_nazwa_lokacji AS 'nazwa_lokacji',
    b.fk_nazwa_lokalu AS 'nazwa_lokalu',
    CONVERT(date, a.poczatek_rezerwacji) AS 'data',
    a.cena * a.czas AS 'przychody'
    FROM t_rezerwacje_lokacje a
        LEFT JOIN t_lokacje b
            ON a.fk_nazwa_lokacji = b.nazwa
),

przychody AS (
    SELECT a.nazwa_lokacji,
        a.nazwa_lokalu,
        SUM(a.przychody) AS 'przychody',
        COUNT(a.nazwa_lokacji) AS 'ilosc_rezerwacji'
    FROM lokacje a
    WHERE MONTH(a.data) = MONTH(@Data) 
        AND YEAR(a.data) = YEAR(@Data)
    GROUP BY a.nazwa_lokacji, a.nazwa_lokalu
),

koszty AS (
    SELECT a.fk_nazwa_lokacji AS 'nazwa_lokacji',
        c.fk_nazwa_lokalu AS 'nazwa_lokalu',
        SUM(a.wskazanie) AS 'wskazanie_pradu',
        SUM(b.wskazanie) AS 'wskazanie_wody',
        SUM(a.wskazanie) * 0.6930 AS 'koszty_pradu',
        SUM(b.wskazanie) * 6.00 AS 'koszty_wody'
    FROM t_dzienne_zuzycie_pradu_lokacja a
        LEFT JOIN t_dzienne_zuzycie_wody_lokacja b
            ON a.fk_nazwa_lokacji = b.fk_nazwa_lokacji
        LEFT JOIN t_lokacje c
                ON a.fk_nazwa_lokacji = c.nazwa
    GROUP BY a.fk_nazwa_lokacji, c.fk_nazwa_lokalu
)

SELECT a.nazwa_lokacji,
    a.nazwa_lokalu,
    a.przychody,
    (a.przychody - (b.koszty_pradu + b.koszty_wody)) AS 'rzeczywiste_przychody',
    a.ilosc_rezerwacji,
    b.wskazanie_pradu,
    b.wskazanie_wody,
    b.koszty_pradu,
    b.koszty_wody
FROM przychody a
    LEFT JOIN koszty b
    ON a.nazwa_lokacji = b.nazwa_lokacji
ORDER BY rzeczywiste_przychody DESC;

--- q_rozliczenie_typy_lokacji
USE spa;
GO 

DECLARE @Data DATE = '2024-09-16';

WITH cte AS (
    SELECT a.fk_nazwa_typu_lokacji AS 'typ_lokacji',
    b.fk_nazwa_lokalu AS 'nazwa_lokalu',
    CONVERT(date, a.poczatek_rezerwacji) AS 'data',
    a.cena
    FROM t_rezerwacje_lokacje a
        LEFT JOIN t_lokacje b
            ON a.fk_nazwa_lokacji = b.nazwa
),

przychody AS (
    SELECT a.typ_lokacji,
        a.nazwa_lokalu,
        SUM(a.cena) as 'przychody',
        COUNT(a.typ_lokacji) as 'ilosc_rezerwacji'
    FROM cte a
    WHERE MONTH(a.data) = MONTH(@Data) 
        AND YEAR(a.data) = YEAR(@Data)
    GROUP BY a.typ_lokacji, a.nazwa_lokalu
),

koszty AS (
    SELECT a.fk_nazwa_typu_lokacji AS 'typ_lokacji',
        c.fk_nazwa_lokalu AS 'nazwa_lokalu',
        SUM(a.wskazanie) AS 'wskazanie_prad',
        SUM(b.wskazanie) AS 'wskazanie_woda',
        SUM(a.wskazanie) * 0.6930 AS 'cena_prad',
        SUM(b.wskazanie) * 6.00 AS 'cena_woda'
    FROM t_dzienne_zuzycie_pradu_lokacja a
        FULL OUTER JOIN t_dzienne_zuzycie_wody_lokacja b
            ON a.fk_nazwa_lokacji = b.fk_nazwa_lokacji
        FULL OUTER JOIN t_lokacje c
                ON a.fk_nazwa_lokacji = c.nazwa
    WHERE MONTH(a.data_czas) = MONTH(@Data) 
        AND YEAR(a.data_czas) = YEAR(@Data)
    GROUP BY a.fk_nazwa_typu_lokacji, c.fk_nazwa_lokalu
),

agg_koszty AS (
    SELECT a.typ_lokacji,
        a.nazwa_lokalu,
        SUM(a.przychody) AS 'przychody',
        SUM(a.ilosc_rezerwacji) AS 'ilosc_rezerwacji',
        SUM(b.wskazanie_prad) AS 'wskazanie_pradu',
        SUM(b.wskazanie_woda) AS 'wskazanie_wody',
        SUM(b.cena_prad) AS 'koszty_pradu',
        SUM(b.cena_woda) AS 'koszty_wody'
    FROM przychody a
        LEFT JOIN koszty b
        ON a.typ_lokacji = b.typ_lokacji
    GROUP BY a.typ_lokacji, a.nazwa_lokalu
)


SELECT typ_lokacji,
        nazwa_lokalu,
        przychody,
        (przychody - (koszty_pradu + koszty_wody)) AS 'rzeczywiste_przychody',
        ilosc_rezerwacji,
        wskazanie_pradu,
        wskazanie_wody,
        koszty_pradu,
        koszty_wody
    FROM agg_koszty a
ORDER BY rzeczywiste_przychody DESC;

--- q_wynagrodzenia
USE spa;
GO 

DECLARE @Data DATE = '2024-09-16';

SELECT a.imie,
    a.nazwisko,
    a.pesel,
    a.fk_nazwa_zawodu AS 'zawod',
    a.wynagrodzenie_brutto,
    a.fk_nazwa_formy_zatrudnienia AS 'formy_zatrudnienia',
    a.poczatek_umowy,
    a.koniec_umowy
FROM t_pracownicy a
WHERE a.koniec_umowy >= @Data 
    AND a.poczatek_umowy <= @Data
    OR a.koniec_umowy IS NULL
ORDER BY koniec_umowy DESC;