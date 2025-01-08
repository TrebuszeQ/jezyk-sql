USE SPA
GO

CREATE VIEW [dbo].[v_wynagrodzenia_lokal] AS
    SELECT  a.nazwa,
        SUM(b.wynagrodzenie_brutto) AS 'wynagrodzenia'
    FROM t_lokale a
    LEFT JOIN t_pracownicy b
        ON a.id = b.fk_id_lokalu
    GROUP BY a.nazwa;