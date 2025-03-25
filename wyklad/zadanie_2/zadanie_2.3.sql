USE test_zespoly;
SELECT NAZWISKO
FROM PRACOWNICY 
WHERE (
    LOWER(
        SUBSTRING(
                NAZWISKO, 
                0,
                CEILING(
                    (LEN(NAZWISKO) / 2 + 1)
                )
            )
        )
) LIKE '%l%'