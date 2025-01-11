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