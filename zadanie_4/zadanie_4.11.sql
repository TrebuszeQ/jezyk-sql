USE test_zespoly;

SELECT a.nazwisko,
    (
        SELECT COUNT(b.id_prac)
        FROM pracownicy b
        WHERE a.id_prac=b.id_szefa
    ) AS 'liczba_podwladnych'
FROM pracownicy a
WHERE a.id_prac IN (
    SELECT id_szefa
    FROM pracownicy
    WHERE id_zesp IN (
        SELECT id_zesp
        FROM zespoly
        WHERE adres LIKE '%fabryczna%'
    )
)
